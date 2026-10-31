package com.dhuadapter.core;

import android.os.Build;
import android.util.Log;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.zip.CRC32;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;

import top.canyie.pine.Pine;

/**
 * Pine LibLoader for the Morphe build. The Morphe patcher merges only the
 * extension DEX into the app, so libpine.so is shipped as an APK asset
 * (assets/dhu-adapter/lib/&lt;abi&gt;/libpine.so) instead of lib/&lt;abi&gt;/.
 * That keeps the app's native-lib ABI selection and extractNativeLibs mode
 * untouched (adding a new lib/arm64-v8a dir to an armeabi-v7a-only app would
 * flip its primary ABI and break its own libraries).
 *
 * On first use the matching ABI is copied once to code_cache/dhu-adapter/ and
 * loaded with System.load. If the app already ships libpine.so in lib/, that
 * one is used.
 */
public final class AssetLibLoader implements Pine.LibLoader {

    private static final String TAG = HookEnv.TAG;
    private static final String LIB_NAME = "libpine.so";
    private static final String ASSET_DIR = "assets/dhu-adapter/lib/";

    private final String apkPath;
    private final String dataDir;

    public AssetLibLoader(String apkPath, String dataDir) {
        this.apkPath = apkPath;
        this.dataDir = dataDir;
    }

    @Override
    public void loadLib() {
        try {
            System.loadLibrary("pine");
            return;
        } catch (Throwable ignored) {
            // not bundled in lib/ — extract it from the assets below
        }
        if (apkPath == null || dataDir == null) {
            throw new UnsatisfiedLinkError("DhuAdapter: no apk/data dir to extract " + LIB_NAME);
        }
        try (ZipFile zf = new ZipFile(apkPath)) {
            for (String abi : processAbis()) {
                ZipEntry e = zf.getEntry(ASSET_DIR + abi + "/" + LIB_NAME);
                if (e == null) continue;
                File out = new File(dataDir, "code_cache/dhu-adapter/" + abi + "/" + LIB_NAME);
                if (!isSame(out, e)) {
                    extract(zf, e, out);
                }
                System.load(out.getAbsolutePath());
                Log.i(TAG, "libpine loaded from assets (" + abi + ")");
                return;
            }
        } catch (UnsatisfiedLinkError e) {
            throw e;
        } catch (Throwable t) {
            UnsatisfiedLinkError err = new UnsatisfiedLinkError("DhuAdapter: failed to extract " + LIB_NAME);
            err.initCause(t);
            throw err;
        }
        throw new UnsatisfiedLinkError("DhuAdapter: no " + LIB_NAME + " for this process ABI");
    }

    // The ABI of the instruction set ART itself runs on: the device's first ABI of
    // the process bitness (translated ABIs are listed after it). Pine patches ART
    // method entry points, so a library loaded through a native bridge (an ARM-only
    // app translated on an x86 device, where os.arch even reports aarch64) must
    // never be used: it crashes natively.
    private static String[] processAbis() {
        String[] abis = android.os.Process.is64Bit()
                ? Build.SUPPORTED_64_BIT_ABIS : Build.SUPPORTED_32_BIT_ABIS;
        return abis.length > 0 ? new String[]{abis[0]} : abis;
    }

    private static boolean isSame(File f, ZipEntry e) {
        if (!f.isFile() || f.length() != e.getSize()) return false;
        try (InputStream in = new FileInputStream(f)) {
            return crc(in) == e.getCrc();
        } catch (Throwable t) {
            return false;
        }
    }

    private static void extract(ZipFile zf, ZipEntry e, File out) throws Exception {
        File dir = out.getParentFile();
        if (dir != null && !dir.isDirectory() && !dir.mkdirs()) {
            throw new IllegalStateException("cannot create " + dir);
        }
        File tmp = new File(dir, LIB_NAME + ".tmp");
        try (InputStream in = zf.getInputStream(e); FileOutputStream os = new FileOutputStream(tmp)) {
            byte[] buf = new byte[16384];
            int n;
            while ((n = in.read(buf)) > 0) os.write(buf, 0, n);
            os.getFD().sync();
        }
        if (!tmp.renameTo(out)) {
            throw new IllegalStateException("cannot move " + tmp + " to " + out);
        }
    }

    private static long crc(InputStream in) throws Exception {
        CRC32 c = new CRC32();
        byte[] buf = new byte[16384];
        int n;
        while ((n = in.read(buf)) > 0) c.update(buf, 0, n);
        return c.getValue();
    }
}
