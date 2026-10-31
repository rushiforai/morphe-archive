package io.github.emotionbug.patches.adot.security;

import io.github.emotionbug.patches.adot.PatchFiles;
import java.io.*;
import java.nio.file.*;
import java.util.*;
import java.util.zip.*;

/** Owns a private immutable-by-convention copy; never hashes an APKM container as its base. */
public final class OriginalApkSnapshot {
    private static final long MAX_FILE=1024L*1024*1024;
    private OriginalApkSnapshot() {}
    public static Path create(String selected,Path workspace) throws IOException {
        if(selected==null || selected.trim().isEmpty()) throw new IOException("Select the exact original APK or APKM in Original APK or APKM");
        if(selected.startsWith("content://")) throw new IOException("Original APK or APKM needs a local filesystem path. Copy the original to local storage, then select its local path (not content://).");
        Path source=Paths.get(selected);
        String name=source.getFileName().toString().toLowerCase(Locale.ROOT);
        if(!(name.endsWith(".apk") || name.endsWith(".apkm")) || !Files.isRegularFile(source) || !Files.isReadable(source))
            throw new IOException("Original APK or APKM must be a readable local .apk or .apkm file");
        Files.createDirectories(workspace);
        Path own=Files.createTempDirectory(workspace,"adot-original-");
        Path snapshot=own.resolve(name.endsWith(".apkm")?"original.apkm":"base.apk");
        try(InputStream in=Files.newInputStream(source)) {copy(in,snapshot,MAX_FILE);}
        validateArchive(snapshot);
        if(name.endsWith(".apkm")) {
            try(ZipFile zip=new ZipFile(snapshot.toFile())) {
                ZipEntry base=zip.getEntry("base.apk");
                if(base==null || base.isDirectory()) throw new IOException("Unsupported APKM: exactly one root base.apk is required; do not select a rebuilt/merged APK");
                Path extracted=own.resolve("base.apk");
                try(InputStream in=zip.getInputStream(base)) {copy(in,extracted,MAX_FILE);}
                snapshot=extracted;
            }
            validateArchive(snapshot);
        }
        try(ZipFile zip=new ZipFile(snapshot.toFile())) {
            if(zip.getEntry("AndroidManifest.xml")==null || zip.getEntry("classes.dex")==null)
                throw new IOException("Original input is not a base APK with AndroidManifest.xml and classes.dex");
        }
        return snapshot;
    }
    private static void validateArchive(Path path) throws IOException {
        try(ZipFile zip=new ZipFile(path.toFile())) {
            Set<String> names=new HashSet<>();long expanded=0;int count=0;
            var entries=zip.entries();
            while(entries.hasMoreElements()) {
                var e=entries.nextElement();String name=e.getName();
                if(++count>100000 || name.isEmpty() || name.startsWith("/") || name.contains("\\") || name.contains(":") || name.indexOf('\0')>=0
                    || Arrays.asList(name.split("/",-1)).contains("..") || !names.add(name)) throw new IOException("Unsafe or duplicate original archive entry: "+name);
                if(e.getSize()<0 || e.getSize()>MAX_FILE || (expanded+=e.getSize())>8*MAX_FILE)
                    throw new IOException("Original archive exceeds bounded size limits");
            }
        }
    }
    private static void copy(InputStream input,Path output,long limit) throws IOException {
        try(OutputStream out=Files.newOutputStream(output,StandardOpenOption.CREATE_NEW)) {
            byte[] buffer=new byte[65536];long copied=0;
            for(int n;(n=input.read(buffer))!=-1;) {
                PatchFiles.checkInterrupted();
                if((copied+=n)>limit) throw new IOException("Original file exceeds 1 GiB limit");
                out.write(buffer,0,n);
            }
        }
    }
}
