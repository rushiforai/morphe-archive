package e.e.a;

import java.io.*;
import java.net.*;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.*;
import java.util.concurrent.*;
import java.util.concurrent.atomic.AtomicInteger;

public final class PerformanceTest {
    static void check(boolean result, String message) { if (!result) throw new AssertionError(message); }
    static class Connection extends HttpURLConnection {
        int reads; boolean refreshDuringRead; volatile boolean disconnected;
        byte[] data = "<meta name=\"server-response\" content=\"{}\">".getBytes(StandardCharsets.UTF_8);
        Connection(String url) throws Exception { super(new URL(url)); }
        public InputStream getInputStream() { reads++; if (refreshDuringRead) { refreshDuringRead = false; PageCache.refresh(); } return new ByteArrayInputStream(data); }
        public void disconnect() { disconnected = true; }
        public void connect() { }
        public boolean usingProxy() { return false; }
    }
    static byte[] read(InputStream input) throws Exception {
        try (InputStream in = input; ByteArrayOutputStream out = new ByteArrayOutputStream()) {
            byte[] buffer = new byte[8192]; for (int n; (n = in.read(buffer)) != -1;) out.write(buffer, 0, n); return out.toByteArray();
        }
    }
    public static void main(String[] args) throws Exception {
        PageCache.refresh(); Connection a = new Connection("https://www.nicovideo.jp/search/a?page=1&sort=date");
        check(Arrays.equals(read(PageCache.input(a)), a.data), "original page preserved");
        check(Arrays.equals(read(PageCache.input(a)), a.data) && a.reads == 1, "repeat page avoids network");
        Connection page2 = new Connection("https://www.nicovideo.jp/search/a?page=2&sort=date");
        read(PageCache.input(page2)); check(page2.reads == 1, "pages have separate keys");
        check(PageCache.lookup(a.getURL().toString(), System.nanoTime()+PageCache.TTL_NANOS+1) == null, "30s expiry");
        read(PageCache.input(a)); check(a.reads == 2, "expired page refetched");
        PageCache.refresh(); read(PageCache.input(a)); check(a.reads == 3, "manual refresh bypasses cache");
        PageCache.refresh(); a.refreshDuringRead = true; read(PageCache.input(a)); read(PageCache.input(a)); check(a.reads == 5, "refresh prevents in-flight stale cache repopulation");
        Connection invalid = new Connection("https://www.nicovideo.jp/search/invalid"); invalid.data = "maintenance page".getBytes(StandardCharsets.UTF_8);
        read(PageCache.input(invalid)); read(PageCache.input(invalid)); check(invalid.reads == 2, "error pages not cached");
        PageCache.refresh(); for (int n=0;n<10;n++) read(PageCache.input(new Connection("https://www.nicovideo.jp/search/"+n)));
        check(PageCache.lookup("https://www.nicovideo.jp/search/0",System.nanoTime())==null, "bounded page count");
        File parent = Files.createTempDirectory("nicoid-images-").toFile();
        try {
            ImageDiskCache disk = new ImageDiskCache(parent); byte[] data = "encoded-image".getBytes(StandardCharsets.UTF_8);
            String url="https://example.com/thumb?size=large"; disk.put(url,data);
            check(Arrays.equals(disk.get(url),data), "disk cache hit");
            check(disk.get("https://example.com/thumb?size=small")==null, "image variants separated");
            File dir = new File(parent,"nicoid-thumbnails");
            for(File file:dir.listFiles()) { check(!file.getName().contains("example"),"opaque disk names");file.setLastModified(System.currentTimeMillis()-8L*24*60*60*1000); }
            check(disk.get(url)==null,"image expiry");
            byte[] big = new byte[8*1024*1024]; for(int n=0;n<5;n++) disk.put("https://example.com/"+n,big);
            long bytes=0;for(File file:dir.listFiles()){check(file.getName().endsWith(".img"),"atomic write leaves no temporary files");bytes+=file.length();}
            check(bytes<=32L*1024*1024,"disk limit"); disk.remove("https://example.com/4"); check(disk.get("https://example.com/4")==null,"invalid image removal");
        } finally { for(File dir:parent.listFiles()){for(File file:dir.listFiles())file.delete();dir.delete();}parent.delete(); }
        ExecutorService workers = Executors.newSingleThreadExecutor();
        try {
            NetworkTask cancelled = new NetworkTask(); cancelled.cancel(); AtomicInteger runs = new AtomicInteger();
            cancelled.start(workers,runs::incrementAndGet); workers.submit(()->{}).get(); check(runs.get()==0,"cancelled task never starts");
            NetworkTask running=new NetworkTask(); Connection connection=new Connection("https://example.com/"); check(running.bind(connection),"active connection bound");
            running.cancel(); long until=System.nanoTime()+TimeUnit.SECONDS.toNanos(3);
            while(!connection.disconnected && System.nanoTime()<until) Thread.yield();
            check(connection.disconnected && running.cancelled(),"running connection closed on cancellation");
            Connection late = new Connection("https://example.com/late"); check(!running.bind(late)&&late.disconnected,"late connection cannot survive cancellation");
        } finally {workers.shutdownNow();}
        System.out.println("Performance policies verified: page hits/expiry/refresh races, disk image variants/expiry/bounds, queued and running request cancellation");
    }
}
