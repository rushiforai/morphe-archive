package app.afterglow.extension.downloads;

import android.content.Context;

import java.io.File;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.nio.file.Files;
import java.util.Arrays;
import java.util.UUID;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.TimeUnit;

/** Executes the real manager with only platform and unrelated media work stubbed. */
public final class DownloadManagerCleanupTest {
    private static int checks;
    private static void check(boolean value,String message) {
        checks++;if(!value)throw new AssertionError(message);
    }
    private static File write(DownloadStorage storage,String name,String contents) throws Exception {
        File file=DownloadStorage.child(storage.work,name);Files.writeString(file.toPath(),contents);return file;
    }
    private static DownloadManager open(File root) throws Exception {
        Constructor<DownloadManager> constructor=DownloadManager.class.getDeclaredConstructor(Context.class);
        constructor.setAccessible(true);DownloadManager manager=constructor.newInstance(new Context(root));
        check(manager.awaitLoaded(5000),"manager initialization finishes");
        check(manager.recoveryMessage().isEmpty(),"manager opens a valid queue");return manager;
    }
    private static void close(DownloadManager manager) throws Exception {
        for(String name:Arrays.asList("control","transfer","inspect")) {
            Field field=DownloadManager.class.getDeclaredField(name);field.setAccessible(true);
            ExecutorService executor=(ExecutorService)field.get(manager);executor.shutdownNow();
            if(!executor.awaitTermination(5,TimeUnit.SECONDS))throw new AssertionError("manager worker did not stop");
        }
    }
    private static QueueRecord record(String id,DownloadJob.State state) {
        QueueRecord record=new QueueRecord();record.id=id;record.request=new DownloadRequest("abcdefghijk");
        record.state=state;record.created=record.updated=1700000000000L;record.ordinal=1;return record;
    }
    public static void main(String[] args) throws Exception {
        File root=new File(args[0]);directCleanup(new File(root,"direct"));startupCleanup(new File(root,"startup"));
        System.out.println(checks+" actual download manager cleanup checks passed (queue files, library rollback/import ownership, startup recovery)");
    }
    private static void directCleanup(File root) throws Exception {
        DownloadManager manager=open(root);
        try {
            DownloadStorage storage=new DownloadStorage(new File(root,"afterglow-vault"));
            String id=UUID.randomUUID().toString(),other=UUID.randomUUID().toString();
            String[] owned={"-0.part","-0.part.identity","-1.part","-1.part.identity","-2.part","-2.part.identity",".assembled"};
            String[] preserved={".trash",".import",".other","-0.part.backup","-3.part","-unrelated.part"};
            for(String suffix:owned)write(storage,id+suffix,"queue bytes");
            for(String suffix:preserved)write(storage,id+suffix,"library bytes");
            File unrelated=write(storage,other+"-0.part","other job");
            Method cleanup=DownloadManager.class.getDeclaredMethod("cleanWork",String.class);cleanup.setAccessible(true);
            cleanup.invoke(manager,id);
            for(String suffix:owned)check(!new File(storage.work,id+suffix).exists(),"queue cleanup removes "+suffix);
            for(String suffix:preserved)check(Files.readString(new File(storage.work,id+suffix).toPath()).equals("library bytes"),"queue cleanup preserves "+suffix);
            check(Files.readString(unrelated.toPath()).equals("other job"),"queue cleanup preserves another job");
            // A failed library index commit must still be able to restore its original file.
            File restored=DownloadStorage.child(storage.media,id+".mp4");
            Files.move(new File(storage.work,id+".trash").toPath(),restored.toPath());
            check(Files.readString(restored.toPath()).equals("library bytes"),"library rollback remains possible after concurrent queue cleanup");
            cleanup.invoke(manager,id);
            check(Files.readString(restored.toPath()).equals("library bytes"),"repeated cleanup does not touch media");
        }finally {close(manager);}
    }
    private static void startupCleanup(File root) throws Exception {
        DownloadStorage storage=new DownloadStorage(new File(root,"afterglow-vault"));
        String abandoned=UUID.randomUUID().toString(),paused=UUID.randomUUID().toString(),finished=UUID.randomUUID().toString();
        storage.saveQueue(Arrays.asList(record(paused,DownloadJob.State.PAUSED),record(finished,DownloadJob.State.SUCCEEDED)));
        File abandonedPart=write(storage,abandoned+"-0.part","abandoned"),abandonedIdentity=write(storage,abandoned+"-0.part.identity","identity");
        File orphanTrash=write(storage,abandoned+".trash","rollback"),orphanImport=write(storage,abandoned+".import","import");
        File pausedPart=write(storage,paused+"-0.part","partial"),finishedPart=write(storage,finished+"-1.part","finished");
        File finishedTrash=write(storage,finished+".trash","rollback finished");
        DownloadManager manager=open(root);
        try {
            check(!abandonedPart.exists()&&!abandonedIdentity.exists(),"startup removes abandoned queue bytes and identity");
            check(!finishedPart.exists(),"startup removes terminal queue bytes");
            check(Files.readString(pausedPart.toPath()).equals("partial"),"startup preserves paused partial bytes");
            check(Files.readString(orphanTrash.toPath()).equals("rollback"),"startup leaves orphan rollback to the library");
            check(Files.readString(orphanImport.toPath()).equals("import"),"startup leaves import files to the library");
            check(Files.readString(finishedTrash.toPath()).equals("rollback finished"),"startup leaves terminal item rollback to the library");
        }finally {close(manager);}
    }
}
