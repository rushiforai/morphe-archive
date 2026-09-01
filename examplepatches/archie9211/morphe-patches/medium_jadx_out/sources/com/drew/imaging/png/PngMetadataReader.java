package com.drew.imaging.png;

import com.drew.lang.Charsets;
import com.drew.lang.StreamReader;
import com.drew.metadata.ErrorDirectory;
import com.drew.metadata.Metadata;
import com.drew.metadata.file.FileSystemMetadataReader;
import j$.util.DesugarCollections;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class PngMetadataReader {
    private static Set<PngChunkType> _desiredChunkTypes;
    private static Charset _latin1Encoding = Charsets.ISO_8859_1;
    private static Charset _utf8Encoding = Charsets.UTF_8;

    static {
        HashSet hashSet = new HashSet();
        hashSet.add(PngChunkType.IHDR);
        hashSet.add(PngChunkType.PLTE);
        hashSet.add(PngChunkType.tRNS);
        hashSet.add(PngChunkType.cHRM);
        hashSet.add(PngChunkType.sRGB);
        hashSet.add(PngChunkType.gAMA);
        hashSet.add(PngChunkType.iCCP);
        hashSet.add(PngChunkType.bKGD);
        hashSet.add(PngChunkType.tEXt);
        hashSet.add(PngChunkType.zTXt);
        hashSet.add(PngChunkType.iTXt);
        hashSet.add(PngChunkType.tIME);
        hashSet.add(PngChunkType.pHYs);
        hashSet.add(PngChunkType.sBIT);
        hashSet.add(PngChunkType.eXIf);
        _desiredChunkTypes = DesugarCollections.unmodifiableSet(hashSet);
    }

    /* JADX WARN: Removed duplicated region for block: B:118:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:121:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:56:0x0258  */
    /* JADX WARN: Removed duplicated region for block: B:76:0x0328  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private static void processChunk(com.drew.metadata.Metadata r18, com.drew.imaging.png.PngChunk r19) throws java.lang.Throwable {
        /*
            Method dump skipped, instruction units count: 1162
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.drew.imaging.png.PngMetadataReader.processChunk(com.drew.metadata.Metadata, com.drew.imaging.png.PngChunk):void");
    }

    public static Metadata readMetadata(InputStream inputStream) throws Throwable {
        Iterable<PngChunk> iterableExtract = new PngChunkReader().extract(new StreamReader(inputStream), _desiredChunkTypes);
        Metadata metadata = new Metadata();
        Iterator it2 = ((ArrayList) iterableExtract).iterator();
        while (it2.hasNext()) {
            try {
                processChunk(metadata, (PngChunk) it2.next());
            } catch (Exception e) {
                metadata.addDirectory(new ErrorDirectory("Exception reading PNG chunk: " + e.getMessage()));
            }
        }
        return metadata;
    }

    public static Metadata readMetadata(File file) throws IOException {
        FileInputStream fileInputStream = new FileInputStream(file);
        try {
            Metadata metadata = readMetadata(fileInputStream);
            fileInputStream.close();
            new FileSystemMetadataReader().read(file, metadata);
            return metadata;
        } catch (Throwable th) {
            fileInputStream.close();
            throw th;
        }
    }
}
