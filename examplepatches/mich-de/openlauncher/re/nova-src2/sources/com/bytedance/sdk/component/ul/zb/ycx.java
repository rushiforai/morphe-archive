package com.bytedance.sdk.component.ul.zb;

import a2.c;
import android.text.TextUtils;
import android.util.Log;
import b.c0;
import com.amplitude.core.events.Identify;
import com.bytedance.sdk.component.zb.ycx.ea;
import com.bytedance.sdk.component.zb.ycx.lt;
import com.bytedance.sdk.component.zb.ycx.ok;
import com.bytedance.sdk.component.zb.ycx.syc;
import com.bytedance.sdk.component.zb.ycx.xkz;
import com.bytedance.sdk.openadsdk.TTAdConstant;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.RandomAccessFile;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;
import java.util.zip.GZIPInputStream;
import kotlinx.serialization.json.internal.ReaderJsonLexerKt;

/* loaded from: classes2.dex */
public class ycx extends sya {

    /* renamed from: ea, reason: collision with root package name */
    private volatile boolean f24090ea;
    public File ycx;

    /* renamed from: zb, reason: collision with root package name */
    public File f24091zb;

    public ycx(ea eaVar) {
        super(eaVar);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void jc() {
        try {
            this.ycx.delete();
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE4IUtGZe9iiWFqhm1Q==", "f+E6mw+zaMOlUtJemQWvOg==", "X+shkBe5T86MT+BViR+FOknhPw==", 540);
        }
        try {
            this.f24091zb.delete();
        } catch (Throwable th3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE4IUtGZe9iiWFqhm1Q==", "f+E6mw+zaMOlUtJemQWvOg==", "X+shkBe5T86MT+BViR+FOknhPw==", 544);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static long lt(Map<String, String> map) {
        String str = map.containsKey("content-length") ? map.get("content-length") : map.containsKey("Content-Length") ? map.get("Content-Length") : null;
        if (!TextUtils.isEmpty(str) && str != null) {
            try {
                return Long.valueOf(str).longValue();
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE4IUtGZe9iiWFqhm1Q==", "f+E6mw+zaMOlUtJemQWvOg==", "XOs5tgyyfcKOXvtYgha0IA==", 518);
            }
        }
        return 0L;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static boolean lud(Map<String, String> map) {
        if (TextUtils.equals(map.get("Accept-Ranges"), "bytes") || TextUtils.equals(map.get("accept-ranges"), "bytes")) {
            return true;
        }
        String str = map.get("Content-Range");
        if (TextUtils.isEmpty(str)) {
            str = map.get("content-range");
        }
        return str != null && str.startsWith("bytes");
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static boolean ul(Map<String, String> map) {
        return TextUtils.equals(map.get("Content-Encoding"), "gzip");
    }

    public void ycx(String str, String str2) {
        File file = new File(str);
        if (file.isFile()) {
            file.delete();
        }
        if (!file.exists()) {
            file.mkdirs();
        }
        this.ycx = new File(str, str2);
        this.f24091zb = new File(str, c0.E(str2, ".temp"));
    }

    @Override // com.bytedance.sdk.component.ul.zb.sya
    public void zb() {
        this.f24090ea = true;
        super.zb();
    }

    @Override // com.bytedance.sdk.component.ul.zb.sya
    public void ycx(final com.bytedance.sdk.component.ul.ycx.ycx ycxVar) {
        File file = this.ycx;
        if (file == null || this.f24091zb == null) {
            if (ycxVar != null) {
                ycxVar.ycx(this, new IOException("File info is null, please exec setFileInfo(String dir, String fileName)"));
                return;
            }
            return;
        }
        if (file.exists() && this.ycx.length() != 0 && ycxVar != null) {
            long jCurrentTimeMillis = System.currentTimeMillis();
            com.bytedance.sdk.component.ul.zb zbVar = new com.bytedance.sdk.component.ul.zb(true, 200, "Success", null, null, jCurrentTimeMillis, jCurrentTimeMillis);
            zbVar.ycx(this.ycx);
            ycxVar.ycx(this, zbVar);
            return;
        }
        long length = this.f24091zb.length();
        final long j11 = length >= 0 ? length : 0L;
        ok.ycx ycxVar2 = new ok.ycx();
        ycxVar2.ycx((Object) dj());
        ycx(ycxVar2);
        zb("Range", c.i(j11, Identify.UNSET_VALUE, new StringBuilder("bytes=")));
        if (TextUtils.isEmpty(this.fby)) {
            ycxVar.ycx(this, new IOException("Url is Empty"));
            return;
        }
        try {
            ycxVar2.zb(this.fby);
            if (!TextUtils.isEmpty(this.lud)) {
                ycxVar2.ycx(this.lud);
            }
            int i5 = this.f24086lt;
            if (i5 > 0) {
                ycxVar2.ycx(i5);
            }
            zb(ycxVar2);
            com.bytedance.sdk.component.zb.ycx.zb zbVarYcx = this.sya.ycx(ycxVar2.ycx().zb());
            if (zbVarYcx == null) {
                ycxVar.ycx(this, new IOException("new call error"));
            } else {
                zbVarYcx.ycx(new com.bytedance.sdk.component.zb.ycx.sya() { // from class: com.bytedance.sdk.component.ul.zb.ycx.1
                    @Override // com.bytedance.sdk.component.zb.ycx.sya
                    public void ycx(com.bytedance.sdk.component.zb.ycx.zb zbVar2, IOException iOException) {
                        com.bytedance.sdk.component.ul.ycx.ycx ycxVar3 = ycxVar;
                        if (ycxVar3 != null) {
                            ycxVar3.ycx(ycx.this, iOException);
                        }
                        ycx.this.jc();
                    }

                    /* JADX WARN: Multi-variable type inference failed */
                    /* JADX WARN: Removed duplicated region for block: B:158:0x01b9 A[SYNTHETIC] */
                    /* JADX WARN: Removed duplicated region for block: B:159:0x01c1 A[SYNTHETIC] */
                    /* JADX WARN: Removed duplicated region for block: B:55:0x0167 A[Catch: all -> 0x0172, TryCatch #0 {all -> 0x0172, blocks: (B:53:0x0161, B:55:0x0167, B:57:0x016b, B:60:0x0176, B:61:0x017e, B:63:0x0189, B:65:0x0197, B:69:0x01a4, B:70:0x01ae, B:73:0x01b9, B:74:0x01c0, B:76:0x01c3, B:79:0x01ce, B:84:0x01e0, B:86:0x01ea, B:88:0x01f6, B:90:0x0202, B:91:0x0211, B:92:0x021e, B:96:0x023a), top: B:137:0x0161 }] */
                    /* JADX WARN: Removed duplicated region for block: B:63:0x0189 A[Catch: all -> 0x0172, TryCatch #0 {all -> 0x0172, blocks: (B:53:0x0161, B:55:0x0167, B:57:0x016b, B:60:0x0176, B:61:0x017e, B:63:0x0189, B:65:0x0197, B:69:0x01a4, B:70:0x01ae, B:73:0x01b9, B:74:0x01c0, B:76:0x01c3, B:79:0x01ce, B:84:0x01e0, B:86:0x01ea, B:88:0x01f6, B:90:0x0202, B:91:0x0211, B:92:0x021e, B:96:0x023a), top: B:137:0x0161 }] */
                    /* JADX WARN: Removed duplicated region for block: B:72:0x01b6 A[LOOP:1: B:61:0x017e->B:72:0x01b6, LOOP_END] */
                    /* JADX WARN: Type inference failed for: r11v8, types: [java.lang.String] */
                    @Override // com.bytedance.sdk.component.zb.ycx.sya
                    /*
                        Code decompiled incorrectly, please refer to instructions dump.
                    */
                    public void ycx(com.bytedance.sdk.component.zb.ycx.zb zbVar2, xkz xkzVar) throws IOException {
                        syc sycVar;
                        long j12;
                        RandomAccessFile randomAccessFile;
                        syc sycVar2;
                        long j13;
                        syc sycVar3;
                        InputStream inputStream;
                        InputStream inputStreamSya;
                        byte[] bArr;
                        long j14;
                        int i11;
                        int i12;
                        boolean z11;
                        long j15;
                        ?? r11;
                        if (ycxVar == null) {
                            return;
                        }
                        HashMap map = new HashMap();
                        if (xkzVar == null) {
                            return;
                        }
                        ycx.this.ycx(xkzVar.jw());
                        lt ltVarUl = xkzVar.ul();
                        if (ltVarUl != null) {
                            for (int i13 = 0; i13 < ltVarUl.ycx(); i13++) {
                                map.put(ltVarUl.ycx(i13), ltVarUl.zb(i13));
                            }
                        }
                        com.bytedance.sdk.component.ul.zb zbVar3 = new com.bytedance.sdk.component.ul.zb(xkzVar.dj(), xkzVar.sya(), xkzVar.lud(), map, null, xkzVar.zb(), xkzVar.ycx());
                        if (xkzVar.dj()) {
                            syc sycVarLt = xkzVar.lt();
                            if (sycVarLt == null) {
                                ycxVar.ycx(ycx.this, new IOException(xkzVar.lud()));
                                ycx.this.jc();
                                return;
                            }
                            long jYcx = sycVarLt.ycx();
                            if (jYcx <= 0) {
                                jYcx = ycx.lt(map);
                            }
                            boolean zLud = ycx.lud(map);
                            if (zLud) {
                                jYcx += j11;
                                String str = (String) map.get("Content-Range");
                                if (!TextUtils.isEmpty(str)) {
                                    String str2 = "bytes " + j11 + Identify.UNSET_VALUE + (jYcx - 1);
                                    if (TextUtils.indexOf(str, str2) == -1) {
                                        ycx.this.jc();
                                        com.bytedance.sdk.component.ul.ycx.ycx ycxVar3 = ycxVar;
                                        ycx ycxVar4 = ycx.this;
                                        StringBuilder sbW = c0.w("The Content-Range Header is invalid Assume[", str2, "] vs Real[", str, "], please remove the temporary file [");
                                        sbW.append(ycx.this.f24091zb);
                                        sbW.append("].");
                                        ycxVar3.ycx(ycxVar4, new IOException(sbW.toString()));
                                        return;
                                    }
                                }
                            }
                            if (jYcx > 0 && ycx.this.f24091zb.exists() && ycx.this.f24091zb.length() == jYcx) {
                                ycx ycxVar5 = ycx.this;
                                if (!ycxVar5.f24091zb.renameTo(ycxVar5.ycx)) {
                                    ycxVar.ycx(ycx.this, new IOException("Rename fail"));
                                    return;
                                } else {
                                    zbVar3.ycx(ycx.this.ycx);
                                    ycxVar.ycx(ycx.this, zbVar3);
                                    return;
                                }
                            }
                            try {
                                r11 = "rw";
                                randomAccessFile = new RandomAccessFile(ycx.this.f24091zb, "rw");
                            } catch (Throwable th2) {
                                th = th2;
                                sycVar = sycVarLt;
                                j12 = jYcx;
                                randomAccessFile = null;
                            }
                            try {
                            } catch (Throwable th3) {
                                th = th3;
                                sycVar = r11;
                                com.bytedance.sdk.openadsdk.oty.sya.ycx(th, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE4IUtGZe9iiWFqhm1Q==", "f+E6mw+zaMOlUtJemQWvOh+/", "VOAfkBCsZsmTTw==", 195);
                                sycVar2 = sycVar;
                                j13 = 0;
                                sycVar3 = sycVar2;
                                try {
                                    inputStreamSya = sycVar3.sya();
                                    try {
                                        if (ycx.ul(map)) {
                                        }
                                        bArr = new byte[ReaderJsonLexerKt.BATCH_SIZE];
                                        long j16 = j13;
                                        j14 = 0;
                                        i11 = 0;
                                        while (true) {
                                            i12 = inputStreamSya.read(bArr, i11, 16384 - i11);
                                            long j17 = j14;
                                            if (i12 != -1) {
                                            }
                                            j14 = j15;
                                        }
                                    } catch (Throwable th4) {
                                        th = th4;
                                        inputStream = inputStreamSya;
                                        try {
                                            com.bytedance.sdk.openadsdk.oty.sya.ycx(th, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE4IUtGZe9iiWFqhm1Q==", "f+E6mw+zaMOlUtJemQWvOh+/", "VOAfkBCsZsmTTw==", 247);
                                            ycxVar.ycx(ycx.this, new IOException(th.getMessage()));
                                            if (!zLud) {
                                                ycx.this.jc();
                                            }
                                            if (inputStream != null) {
                                                try {
                                                    inputStream.close();
                                                } catch (Throwable th5) {
                                                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th5, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE4IUtGZe9iiWFqhm1Q==", "f+E6mw+zaMOlUtJemQWvOh+/", "VOAfkBCsZsmTTw==", 259);
                                                }
                                            }
                                            try {
                                                randomAccessFile.close();
                                                return;
                                            } catch (Throwable th6) {
                                                com.bytedance.sdk.openadsdk.oty.sya.ycx(th6, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE4IUtGZe9iiWFqhm1Q==", "f+E6mw+zaMOlUtJemQWvOh+/", "VOAfkBCsZsmTTw==", 265);
                                                return;
                                            }
                                        } finally {
                                        }
                                    }
                                } catch (Throwable th7) {
                                    th = th7;
                                    inputStream = null;
                                }
                            }
                            if (zLud) {
                                sycVar3 = sycVarLt;
                                j12 = jYcx;
                                randomAccessFile.seek(j11);
                                j13 = j11;
                                inputStreamSya = sycVar3.sya();
                                if (ycx.ul(map) && !(inputStreamSya instanceof GZIPInputStream)) {
                                    inputStreamSya = new GZIPInputStream(inputStreamSya);
                                }
                                bArr = new byte[ReaderJsonLexerKt.BATCH_SIZE];
                                long j162 = j13;
                                j14 = 0;
                                i11 = 0;
                                while (true) {
                                    i12 = inputStreamSya.read(bArr, i11, 16384 - i11);
                                    long j172 = j14;
                                    if (i12 != -1) {
                                        i11 += i12;
                                        long j18 = j172 + i12;
                                        if (j18 % 16384 != 0) {
                                            j15 = j18;
                                            if (j15 == j12 - j11) {
                                            }
                                            if (!ycx.this.f24090ea) {
                                                throw new IOException("net is cancel");
                                            }
                                            j14 = j15;
                                        } else {
                                            j15 = j18;
                                        }
                                        randomAccessFile.seek(j162);
                                        randomAccessFile.write(bArr, 0, i11);
                                        j162 += i11;
                                        i11 = 0;
                                        if (!ycx.this.f24090ea) {
                                        }
                                    } else {
                                        if (i11 != 0) {
                                            randomAccessFile.seek(j162);
                                            z11 = false;
                                            randomAccessFile.write(bArr, 0, i11);
                                        } else {
                                            z11 = false;
                                        }
                                        long length2 = !zLud ? ycx.this.f24091zb.length() : j12;
                                        if (length2 > 0 && ycx.this.f24091zb.exists() && ycx.this.f24091zb.length() == length2) {
                                            ycx ycxVar6 = ycx.this;
                                            if (!ycxVar6.f24091zb.renameTo(ycxVar6.ycx)) {
                                                ycxVar.ycx(ycx.this, new IOException("Rename fail"));
                                            } else {
                                                zbVar3.ycx(ycx.this.ycx);
                                                ycxVar.ycx(ycx.this, zbVar3);
                                            }
                                        } else {
                                            com.bytedance.sdk.component.ul.ycx.ycx ycxVar7 = ycxVar;
                                            ycx ycxVar8 = ycx.this;
                                            StringBuilder sb2 = new StringBuilder(" tempFile.length() == fileSize is");
                                            sb2.append(ycx.this.f24091zb.length() == length2 ? true : z11);
                                            ycxVar7.ycx(ycxVar8, new IOException(sb2.toString()));
                                        }
                                        try {
                                            inputStreamSya.close();
                                        } catch (Throwable th8) {
                                            com.bytedance.sdk.openadsdk.oty.sya.ycx(th8, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE4IUtGZe9iiWFqhm1Q==", "f+E6mw+zaMOlUtJemQWvOh+/", "VOAfkBCsZsmTTw==", 259);
                                        }
                                        try {
                                            randomAccessFile.close();
                                            return;
                                        } catch (Throwable th9) {
                                            com.bytedance.sdk.openadsdk.oty.sya.ycx(th9, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE4IUtGZe9iiWFqhm1Q==", "f+E6mw+zaMOlUtJemQWvOh+/", "VOAfkBCsZsmTTw==", 265);
                                            return;
                                        }
                                    }
                                }
                            } else {
                                sycVar2 = sycVarLt;
                                j12 = jYcx;
                                randomAccessFile.setLength(0L);
                                j13 = 0;
                                sycVar3 = sycVar2;
                                inputStreamSya = sycVar3.sya();
                                if (ycx.ul(map)) {
                                    inputStreamSya = new GZIPInputStream(inputStreamSya);
                                }
                                bArr = new byte[ReaderJsonLexerKt.BATCH_SIZE];
                                long j1622 = j13;
                                j14 = 0;
                                i11 = 0;
                                while (true) {
                                    i12 = inputStreamSya.read(bArr, i11, 16384 - i11);
                                    long j1722 = j14;
                                    if (i12 != -1) {
                                    }
                                    j14 = j15;
                                }
                            }
                        } else {
                            ycxVar.ycx(ycx.this, zbVar3);
                        }
                    }
                });
            }
        } catch (IllegalArgumentException e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE4IUtGZe9iiWFqhm1Q==", "f+E6mw+zaMOlUtJemQWvOg==", "XuA8gAapbO6OXtJPghCs", 106);
            ycxVar.ycx(this, new IOException("Url is not a valid HTTP or HTTPS URL"));
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:101:0x01f3, code lost:
    
        if (r11 == 0) goto L103;
     */
    /* JADX WARN: Code restructure failed: missing block: B:102:0x01f5, code lost:
    
        r5.seek(r6);
        r5.write(r0, 0, r10);
     */
    /* JADX WARN: Code restructure failed: missing block: B:104:0x01fe, code lost:
    
        if (r18 == false) goto L107;
     */
    /* JADX WARN: Code restructure failed: missing block: B:106:0x0202, code lost:
    
        if (r25 != 0) goto L108;
     */
    /* JADX WARN: Code restructure failed: missing block: B:107:0x0204, code lost:
    
        r14 = r27.f24091zb.length();
     */
    /* JADX WARN: Code restructure failed: missing block: B:109:0x020c, code lost:
    
        if (r14 <= 0) goto L139;
     */
    /* JADX WARN: Code restructure failed: missing block: B:111:0x0214, code lost:
    
        if (r27.f24091zb.exists() == false) goto L139;
     */
    /* JADX WARN: Code restructure failed: missing block: B:113:0x021e, code lost:
    
        if (r27.f24091zb.length() != r14) goto L139;
     */
    /* JADX WARN: Code restructure failed: missing block: B:115:0x0228, code lost:
    
        if (r27.f24091zb.renameTo(r27.ycx) == false) goto L199;
     */
    /* JADX WARN: Code restructure failed: missing block: B:116:0x022a, code lost:
    
        r12.ycx(r27.ycx);
     */
    /* JADX WARN: Code restructure failed: missing block: B:117:0x022f, code lost:
    
        r13.close();
     */
    /* JADX WARN: Code restructure failed: missing block: B:119:0x0233, code lost:
    
        r0 = move-exception;
     */
    /* JADX WARN: Code restructure failed: missing block: B:121:0x0236, code lost:
    
        com.bytedance.sdk.openadsdk.oty.sya.ycx(r0, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE4IUtGZe9iiWFqhm1Q==", "f+E6mw+zaMOlUtJemQWvOg==", "XvYolhaobO6OXtJPghCs", 468);
     */
    /* JADX WARN: Code restructure failed: missing block: B:128:0x0244, code lost:
    
        r13.close();
     */
    /* JADX WARN: Code restructure failed: missing block: B:130:0x0248, code lost:
    
        r0 = move-exception;
     */
    /* JADX WARN: Code restructure failed: missing block: B:132:0x024b, code lost:
    
        com.bytedance.sdk.openadsdk.oty.sya.ycx(r0, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE4IUtGZe9iiWFqhm1Q==", "f+E6mw+zaMOlUtJemQWvOg==", "XvYolhaobO6OXtJPghCs", 468);
     */
    /* JADX WARN: Code restructure failed: missing block: B:139:0x0259, code lost:
    
        r27.f24091zb.length();
     */
    /* JADX WARN: Code restructure failed: missing block: B:140:0x025e, code lost:
    
        r13.close();
     */
    /* JADX WARN: Code restructure failed: missing block: B:142:0x0262, code lost:
    
        r0 = move-exception;
     */
    /* JADX WARN: Code restructure failed: missing block: B:144:0x0265, code lost:
    
        com.bytedance.sdk.openadsdk.oty.sya.ycx(r0, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE4IUtGZe9iiWFqhm1Q==", "f+E6mw+zaMOlUtJemQWvOg==", "XvYolhaobO6OXtJPghCs", 468);
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:227:0x01f3 A[EDGE_INSN: B:227:0x01f3->B:101:0x01f3 BREAK  A[LOOP:1: B:89:0x01bb->B:98:0x01e8], SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:56:0x0150 A[PHI: r14
      0x0150: PHI (r14v3 long) = (r14v2 long), (r14v7 long) binds: [B:49:0x0115, B:51:0x0124] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:83:0x01a6 A[Catch: all -> 0x01b1, TryCatch #9 {all -> 0x01b1, blocks: (B:81:0x01a0, B:83:0x01a6, B:85:0x01aa, B:88:0x01b4, B:89:0x01bb, B:91:0x01c6, B:93:0x01d4, B:96:0x01e4, B:99:0x01eb, B:100:0x01f2, B:95:0x01da, B:102:0x01f5, B:110:0x020e, B:112:0x0216, B:114:0x0220, B:116:0x022a, B:139:0x0259, B:107:0x0204), top: B:208:0x01a0 }] */
    /* JADX WARN: Removed duplicated region for block: B:91:0x01c6 A[Catch: all -> 0x01b1, TryCatch #9 {all -> 0x01b1, blocks: (B:81:0x01a0, B:83:0x01a6, B:85:0x01aa, B:88:0x01b4, B:89:0x01bb, B:91:0x01c6, B:93:0x01d4, B:96:0x01e4, B:99:0x01eb, B:100:0x01f2, B:95:0x01da, B:102:0x01f5, B:110:0x020e, B:112:0x0216, B:114:0x0220, B:116:0x022a, B:139:0x0259, B:107:0x0204), top: B:208:0x01a0 }] */
    /* JADX WARN: Type inference failed for: r13v10 */
    /* JADX WARN: Type inference failed for: r13v3 */
    /* JADX WARN: Type inference failed for: r13v4, types: [java.io.InputStream] */
    /* JADX WARN: Type inference failed for: r5v11, types: [java.io.RandomAccessFile] */
    /* JADX WARN: Type inference failed for: r5v17, types: [java.io.RandomAccessFile] */
    /* JADX WARN: Type inference failed for: r5v27 */
    /* JADX WARN: Type inference failed for: r5v28 */
    @Override // com.bytedance.sdk.component.ul.zb.sya
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public com.bytedance.sdk.component.ul.zb ycx() throws IOException {
        com.bytedance.sdk.component.ul.zb zbVar;
        com.bytedance.sdk.component.ul.zb zbVar2;
        HashMap map;
        com.bytedance.sdk.component.ul.zb zbVar3;
        com.bytedance.sdk.component.ul.zb zbVar4;
        long j11;
        ?? r52;
        ?? r13;
        InputStream inputStreamSya;
        InputStream gZIPInputStream;
        byte[] bArr;
        int i5;
        int i11;
        long j12;
        ?? randomAccessFile;
        File file = this.ycx;
        com.bytedance.sdk.component.ul.zb zbVar5 = null;
        if (file == null || this.f24091zb == null) {
            return null;
        }
        if (file.exists() && this.ycx.length() != 0) {
            long jCurrentTimeMillis = System.currentTimeMillis();
            com.bytedance.sdk.component.ul.zb zbVar6 = new com.bytedance.sdk.component.ul.zb(true, 200, "Success", null, null, jCurrentTimeMillis, jCurrentTimeMillis);
            zbVar6.ycx(this.ycx);
            return zbVar6;
        }
        long length = this.f24091zb.length();
        if (length < 0) {
            length = 0;
        }
        ok.ycx ycxVar = new ok.ycx();
        ycxVar.ycx((Object) dj());
        ycx(ycxVar);
        zb("Range", c.i(length, Identify.UNSET_VALUE, new StringBuilder("bytes=")));
        if (TextUtils.isEmpty(this.fby)) {
            Log.e("DownloadExecutor", "execute: Url is Empty");
            return null;
        }
        try {
            ycxVar.zb(this.fby);
            zb(ycxVar);
            try {
                com.bytedance.sdk.component.zb.ycx.zb zbVarYcx = this.sya.ycx(ycxVar.ycx().zb());
                if (zbVarYcx == null) {
                    return null;
                }
                xkz xkzVarZb = zbVarYcx.zb();
                if (xkzVarZb != null) {
                    ycx(xkzVarZb.jw());
                }
                if (xkzVarZb == null || !xkzVarZb.dj()) {
                    return null;
                }
                HashMap map2 = new HashMap();
                lt ltVarUl = xkzVarZb.ul();
                if (ltVarUl != null) {
                    int i12 = 0;
                    while (i12 < ltVarUl.ycx()) {
                        zbVar = zbVar5;
                        try {
                            map2.put(ltVarUl.ycx(i12), ltVarUl.zb(i12));
                            i12++;
                            zbVar5 = zbVar;
                        } catch (IOException e3) {
                            e = e3;
                            com.bytedance.sdk.openadsdk.oty.sya.ycx(e, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE4IUtGZe9iiWFqhm1Q==", "f+E6mw+zaMOlUtJemQWvOg==", "XvYolhaobO6OXtJPghCs", 480);
                            jc();
                            return zbVar;
                        }
                    }
                }
                zbVar = zbVar5;
                zbVar2 = new com.bytedance.sdk.component.ul.zb(xkzVarZb.dj(), xkzVarZb.sya(), xkzVarZb.lud(), map2, null, xkzVarZb.zb(), xkzVarZb.ycx());
                syc sycVarLt = xkzVarZb.lt();
                if (sycVarLt != null) {
                    long jYcx = sycVarLt.ycx();
                    if (jYcx <= 0) {
                        jYcx = lt(map2);
                    }
                    long length2 = this.f24091zb.length();
                    boolean zLud = lud(map2);
                    if (zLud) {
                        jYcx += length2;
                        String str = (String) map2.get("Content-Range");
                        if (TextUtils.isEmpty(str)) {
                            map = map2;
                        } else {
                            map = map2;
                            if (TextUtils.indexOf(str, "bytes " + length2 + Identify.UNSET_VALUE + (jYcx - 1)) == -1) {
                                Objects.toString(this.f24091zb);
                                jc();
                                return zbVar;
                            }
                        }
                    }
                    if (jYcx > 0 && this.f24091zb.exists() && this.f24091zb.length() == jYcx) {
                        if (!this.f24091zb.renameTo(this.ycx)) {
                            return zbVar;
                        }
                        zbVar2.ycx(this.ycx);
                        return zbVar2;
                    }
                    try {
                        randomAccessFile = new RandomAccessFile(this.f24091zb, "rw");
                        try {
                        } catch (Throwable th2) {
                            th = th2;
                            zbVar3 = randomAccessFile;
                            com.bytedance.sdk.openadsdk.oty.sya.ycx(th, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE4IUtGZe9iiWFqhm1Q==", "f+E6mw+zaMOlUtJemQWvOg==", "XvYolhaobO6OXtJPghCs", TTAdConstant.DEEPLINK_FALLBACK_CODE);
                            zbVar4 = zbVar3;
                            j11 = 0;
                            r52 = zbVar4;
                            try {
                                inputStreamSya = sycVarLt.sya();
                                try {
                                    gZIPInputStream = inputStreamSya;
                                    if (ul(map)) {
                                    }
                                    bArr = new byte[ReaderJsonLexerKt.BATCH_SIZE];
                                    i5 = 0;
                                    long j13 = 0;
                                    while (true) {
                                        i11 = gZIPInputStream.read(bArr, i5, 16384 - i5);
                                        j12 = length;
                                        if (i11 == -1) {
                                        }
                                        length = j12;
                                    }
                                } catch (Throwable th3) {
                                    th = th3;
                                    r13 = inputStreamSya;
                                    try {
                                        com.bytedance.sdk.openadsdk.oty.sya.ycx(th, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE4IUtGZe9iiWFqhm1Q==", "f+E6mw+zaMOlUtJemQWvOg==", "XvYolhaobO6OXtJPghCs", 456);
                                        if (!zLud) {
                                            jc();
                                        }
                                        if (r13 != 0) {
                                            try {
                                                r13.close();
                                            } catch (Throwable th4) {
                                                com.bytedance.sdk.openadsdk.oty.sya.ycx(th4, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE4IUtGZe9iiWFqhm1Q==", "f+E6mw+zaMOlUtJemQWvOg==", "XvYolhaobO6OXtJPghCs", 468);
                                            }
                                        }
                                        try {
                                            r52.close();
                                        } catch (Throwable th5) {
                                            com.bytedance.sdk.openadsdk.oty.sya.ycx(th5, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE4IUtGZe9iiWFqhm1Q==", "f+E6mw+zaMOlUtJemQWvOg==", "XvYolhaobO6OXtJPghCs", 474);
                                        }
                                        return zbVar;
                                    } finally {
                                    }
                                }
                            } catch (Throwable th6) {
                                th = th6;
                                r13 = zbVar;
                            }
                        }
                    } catch (Throwable th7) {
                        th = th7;
                        zbVar3 = zbVar;
                    }
                    if (zLud) {
                        randomAccessFile.seek(length);
                        j11 = length;
                        r52 = randomAccessFile;
                        inputStreamSya = sycVarLt.sya();
                        gZIPInputStream = inputStreamSya;
                        if (ul(map)) {
                            boolean z11 = inputStreamSya instanceof GZIPInputStream;
                            gZIPInputStream = inputStreamSya;
                            if (!z11) {
                                gZIPInputStream = new GZIPInputStream(inputStreamSya);
                            }
                        }
                        bArr = new byte[ReaderJsonLexerKt.BATCH_SIZE];
                        i5 = 0;
                        long j132 = 0;
                        while (true) {
                            i11 = gZIPInputStream.read(bArr, i5, 16384 - i5);
                            j12 = length;
                            if (i11 == -1) {
                                break;
                            }
                            i5 += i11;
                            j132 += i11;
                            if (j132 % 16384 == 0 || j132 == jYcx - j12) {
                                r52.seek(j11);
                                r52.write(bArr, 0, i5);
                                j11 += i5;
                                i5 = 0;
                            }
                            if (this.f24090ea) {
                                throw new IOException("net is cancel");
                            }
                            length = j12;
                        }
                    } else {
                        randomAccessFile.setLength(0L);
                        zbVar4 = randomAccessFile;
                        j11 = 0;
                        r52 = zbVar4;
                        inputStreamSya = sycVarLt.sya();
                        gZIPInputStream = inputStreamSya;
                        if (ul(map)) {
                        }
                        bArr = new byte[ReaderJsonLexerKt.BATCH_SIZE];
                        i5 = 0;
                        long j1322 = 0;
                        while (true) {
                            i11 = gZIPInputStream.read(bArr, i5, 16384 - i5);
                            j12 = length;
                            if (i11 == -1) {
                            }
                            length = j12;
                        }
                    }
                } else {
                    throw new IOException("response body is null");
                }
            } catch (IOException e11) {
                e = e11;
                zbVar = zbVar5;
            }
        } catch (IllegalArgumentException e12) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e12, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE4IUtGZe9iiWFqhm1Q==", "f+E6mw+zaMOlUtJemQWvOg==", "XvYolhaobO6OXtJPghCs", 325);
            Log.e("DownloadExecutor", "execute: Url is not a valid HTTP or HTTPS URL");
            return null;
        }
        return zbVar;
        try {
            r52.close();
        } catch (Throwable th8) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th8, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE4IUtGZe9iiWFqhm1Q==", "f+E6mw+zaMOlUtJemQWvOg==", "XvYolhaobO6OXtJPghCs", 474);
        }
        return zbVar;
        try {
            r52.close();
        } catch (Throwable th9) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th9, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE4IUtGZe9iiWFqhm1Q==", "f+E6mw+zaMOlUtJemQWvOg==", "XvYolhaobO6OXtJPghCs", 474);
        }
        return zbVar;
        return zbVar;
        try {
            r52.close();
        } catch (Throwable th10) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th10, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE4IUtGZe9iiWFqhm1Q==", "f+E6mw+zaMOlUtJemQWvOg==", "XvYolhaobO6OXtJPghCs", 474);
        }
        return zbVar2;
        return zbVar2;
    }
}
