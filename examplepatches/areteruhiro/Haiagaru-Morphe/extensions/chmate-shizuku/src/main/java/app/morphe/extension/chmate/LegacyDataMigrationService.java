package app.morphe.extension.chmate;

import android.content.Context;
import android.os.ParcelFileDescriptor;
import android.os.Process;
import android.os.RemoteException;
import android.system.Os;
import android.system.StructStat;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;

/** One-shot Shizuku UserService used by separately packaged Haiagaru builds. */
public final class LegacyDataMigrationService extends ILegacyDataMigrationService.Stub {
    private static final String LEGACY_EXTERNAL_DATA =
            "/storage/emulated/0/Android/data/jp.co.airfront.android.a2chMate";
    private static final String ANDROID_DATA_ROOT = "/storage/emulated/0/Android/data";
    private final String expectedDestination;
    private final int appUid;

    public LegacyDataMigrationService() {
        expectedDestination = null;
        appUid = -1;
    }

    /** Shizuku v13 constructor. Kept by the extension's ProGuard rules. */
    public LegacyDataMigrationService(Context context) {
        expectedDestination = ANDROID_DATA_ROOT + "/" + context.getPackageName();
        appUid = context.getApplicationInfo().uid;
    }

    @Override
    public String[] listChildren(String relativePath) throws RemoteException {
        try {
            File source = resolveSource(relativePath);
            File[] children = source.listFiles();
            if (children == null) throw new IOException("Unable to list " + source);
            String[] names = new String[children.length];
            for (int index = 0; index < children.length; index++) {
                names[index] = children[index].getName();
            }
            Arrays.sort(names);
            return names;
        } catch (Throwable error) {
            throw new RemoteException(error.toString());
        }
    }

    @Override
    public boolean isDirectory(String relativePath) throws RemoteException {
        try {
            return resolveSource(relativePath).isDirectory();
        } catch (Throwable error) {
            throw new RemoteException(error.toString());
        }
    }

    @Override
    public ParcelFileDescriptor openFile(String relativePath) throws RemoteException {
        try {
            File source = resolveSource(relativePath);
            if (!source.isFile()) throw new IOException("Not a regular file: " + source);
            return ParcelFileDescriptor.open(source, ParcelFileDescriptor.MODE_READ_ONLY);
        } catch (Throwable error) {
            throw new RemoteException(error.toString());
        }
    }

    @Override
    public long lastModified(String relativePath) throws RemoteException {
        try {
            return resolveSource(relativePath).lastModified();
        } catch (Throwable error) {
            throw new RemoteException(error.toString());
        }
    }

    @Override
    public void repairDestinationOwnership(String destinationPath) throws RemoteException {
        try {
            if (Process.myUid() != 0) return;
            if (expectedDestination == null || appUid < 0) {
                throw new SecurityException("UserService package context is unavailable");
            }
            File destination = new File(destinationPath).getCanonicalFile();
            if (!expectedDestination.equals(destination.getPath())) {
                throw new SecurityException("Unexpected migration destination");
            }
            if (!destination.isDirectory()) return;
            StructStat destinationStat = Os.stat(destination.getPath());
            repairOwnershipRecursively(destination, appUid, destinationStat.st_gid);
        } catch (Throwable error) {
            throw new RemoteException(error.toString());
        }
    }

    @Override
    public void destroy() {
        System.exit(0);
    }

    private static File resolveSource(String relativePath) throws IOException {
        File root = new File(LEGACY_EXTERNAL_DATA).getCanonicalFile();
        if (!root.isDirectory()) {
            throw new IOException("Legacy ChMate external-data folder was not found");
        }
        File source = relativePath == null || relativePath.isEmpty()
                ? root
                : new File(root, relativePath).getCanonicalFile();
        String rootPrefix = root.getPath() + File.separator;
        if (!source.getPath().equals(root.getPath())
                && !source.getPath().startsWith(rootPrefix)) {
            throw new SecurityException("Unexpected migration source");
        }
        return source;
    }

    private static void repairOwnershipRecursively(File path, int uid, long gid)
            throws Exception {
        Os.chown(path.getPath(), uid, (int) gid);
        if (!path.isDirectory()) return;
        File[] children = path.listFiles();
        if (children == null) throw new IOException("Unable to list " + path);
        for (File child : children) {
            repairOwnershipRecursively(child, uid, gid);
        }
    }
}
