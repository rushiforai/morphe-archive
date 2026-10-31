package com.amplitude;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.HardwareRenderer;
import android.graphics.Picture;
import android.graphics.PorterDuff;
import android.graphics.RecordingCanvas;
import android.graphics.RenderNode;
import android.hardware.HardwareBuffer;
import android.media.Image;
import android.media.ImageReader;
import android.os.Build;
import java.util.ArrayList;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class J implements E {

    /* renamed from: a, reason: collision with root package name */
    public final String f20281a;

    /* renamed from: b, reason: collision with root package name */
    public final int f20282b;

    /* renamed from: c, reason: collision with root package name */
    public final int f20283c;

    /* renamed from: d, reason: collision with root package name */
    public final long f20284d;

    /* renamed from: e, reason: collision with root package name */
    public final int f20285e;

    /* renamed from: f, reason: collision with root package name */
    public final int f20286f;

    /* renamed from: g, reason: collision with root package name */
    public final ArrayList f20287g;

    /* renamed from: h, reason: collision with root package name */
    public String f20288h;

    public J(Q compositionData, K3 logger) {
        Canvas canvasBeginRecording;
        Intrinsics.g(compositionData, "compositionData");
        Intrinsics.g(logger, "logger");
        this.f20281a = compositionData.f20362a;
        int i5 = compositionData.f20363b;
        this.f20282b = i5;
        int i11 = compositionData.f20364c;
        this.f20283c = i11;
        this.f20284d = compositionData.f20367f;
        float f11 = 0.4f;
        int i12 = (int) (i5 * 0.4f);
        this.f20285e = i12;
        int i13 = (int) (i11 * 0.4f);
        this.f20286f = i13;
        this.f20287g = new ArrayList();
        if (i12 <= 0 || i13 <= 0) {
            return;
        }
        float f12 = compositionData.f20369h;
        ArrayList arrayList = compositionData.f20368g;
        int size = arrayList.size();
        float f13 = f12;
        int i14 = 0;
        while (i14 < size) {
            int i15 = i14 + 1;
            C0387b1 c0387b1 = (C0387b1) arrayList.get(i14);
            if (c0387b1.f20498b != null) {
                h2.c cVarD = z2.r1.d(c0387b1.f20497a.f20464a.f98179b);
                int i16 = (int) ((cVarD.f59020c - cVarD.f59018a) * f11);
                int i17 = (int) ((cVarD.f59021d - cVarD.f59019b) * f11);
                ArrayList arrayList2 = this.f20287g;
                Picture picture = new Picture();
                if (compositionData.f20370i) {
                    Canvas canvasBeginRecording2 = picture.beginRecording(i16, i17);
                    Intrinsics.f(canvasBeginRecording2, "beginRecording(...)");
                    canvasBeginRecording = new Y0(canvasBeginRecording2);
                } else {
                    canvasBeginRecording = picture.beginRecording(i16, i17);
                }
                Intrinsics.d(canvasBeginRecording);
                Canvas canvas = i2.c.f61100a;
                i2.b bVar = new i2.b();
                bVar.f61095a = canvasBeginRecording;
                C0391c c0391c = new C0391c(new C0360a(compositionData.f20365d, compositionData.f20366e, bVar, cVarD.c()));
                c0391c.f20505e *= f13;
                f11 = 0.4f;
                bVar.scale(0.4f, 0.4f);
                try {
                    c0387b1.f20498b.draw(c0391c);
                } catch (Exception e3) {
                    logger.b(new I(e3));
                }
                picture.endRecording();
                arrayList2.add(new E1(picture, cVarD.d()));
            } else {
                i2.a0 a0Var = c0387b1.f20497a.f20467d;
                if (a0Var != null) {
                    f13 *= ((i2.s0) a0Var).f61152d;
                }
            }
            i14 = i15;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:62:0x013c A[Catch: all -> 0x0038, TRY_ENTER, TryCatch #6 {all -> 0x0038, blocks: (B:3:0x0010, B:5:0x0014, B:7:0x001c, B:10:0x0025, B:12:0x0029, B:17:0x003b, B:19:0x0042, B:21:0x0052, B:23:0x0076, B:26:0x00b1, B:28:0x00b6, B:29:0x00b9, B:30:0x00ba, B:40:0x00f9, B:62:0x013c, B:64:0x0141, B:66:0x0146, B:68:0x014b, B:69:0x014e, B:70:0x0151, B:72:0x0159, B:74:0x0177, B:76:0x01ab, B:78:0x01b3, B:79:0x01b6, B:80:0x01b7, B:75:0x0183, B:25:0x008a), top: B:105:0x0010, inners: #1, #5 }] */
    /* JADX WARN: Removed duplicated region for block: B:64:0x0141 A[Catch: all -> 0x0038, TryCatch #6 {all -> 0x0038, blocks: (B:3:0x0010, B:5:0x0014, B:7:0x001c, B:10:0x0025, B:12:0x0029, B:17:0x003b, B:19:0x0042, B:21:0x0052, B:23:0x0076, B:26:0x00b1, B:28:0x00b6, B:29:0x00b9, B:30:0x00ba, B:40:0x00f9, B:62:0x013c, B:64:0x0141, B:66:0x0146, B:68:0x014b, B:69:0x014e, B:70:0x0151, B:72:0x0159, B:74:0x0177, B:76:0x01ab, B:78:0x01b3, B:79:0x01b6, B:80:0x01b7, B:75:0x0183, B:25:0x008a), top: B:105:0x0010, inners: #1, #5 }] */
    /* JADX WARN: Removed duplicated region for block: B:66:0x0146 A[Catch: all -> 0x0038, TryCatch #6 {all -> 0x0038, blocks: (B:3:0x0010, B:5:0x0014, B:7:0x001c, B:10:0x0025, B:12:0x0029, B:17:0x003b, B:19:0x0042, B:21:0x0052, B:23:0x0076, B:26:0x00b1, B:28:0x00b6, B:29:0x00b9, B:30:0x00ba, B:40:0x00f9, B:62:0x013c, B:64:0x0141, B:66:0x0146, B:68:0x014b, B:69:0x014e, B:70:0x0151, B:72:0x0159, B:74:0x0177, B:76:0x01ab, B:78:0x01b3, B:79:0x01b6, B:80:0x01b7, B:75:0x0183, B:25:0x008a), top: B:105:0x0010, inners: #1, #5 }] */
    /* JADX WARN: Removed duplicated region for block: B:68:0x014b A[Catch: all -> 0x0038, TryCatch #6 {all -> 0x0038, blocks: (B:3:0x0010, B:5:0x0014, B:7:0x001c, B:10:0x0025, B:12:0x0029, B:17:0x003b, B:19:0x0042, B:21:0x0052, B:23:0x0076, B:26:0x00b1, B:28:0x00b6, B:29:0x00b9, B:30:0x00ba, B:40:0x00f9, B:62:0x013c, B:64:0x0141, B:66:0x0146, B:68:0x014b, B:69:0x014e, B:70:0x0151, B:72:0x0159, B:74:0x0177, B:76:0x01ab, B:78:0x01b3, B:79:0x01b6, B:80:0x01b7, B:75:0x0183, B:25:0x008a), top: B:105:0x0010, inners: #1, #5 }] */
    /* JADX WARN: Removed duplicated region for block: B:85:0x01cb  */
    @Override // com.amplitude.E
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final String a(u4 viewCache, K3 logger) {
        Bitmap bitmapA;
        ArrayList arrayList;
        ImageReader imageReaderNewInstance;
        ImageReader imageReader;
        HardwareBuffer hardwareBuffer;
        HardwareRenderer hardwareRendererF;
        Image image;
        Intrinsics.g(viewCache, "viewCache");
        Intrinsics.g(logger, "logger");
        try {
            if (this.f20288h != null || this.f20287g.isEmpty()) {
                bitmapA = null;
                this.f20287g.clear();
                if (bitmapA != null) {
                    ((D) viewCache.f20782d.getValue()).a(bitmapA);
                }
            } else {
                int i5 = Build.VERSION.SDK_INT;
                int i11 = 0;
                if (i5 >= 29 && i5 >= 29 && ((arrayList = this.f20287g) == null || !arrayList.isEmpty())) {
                    int size = arrayList.size();
                    int i12 = 0;
                    while (i12 < size) {
                        Object obj = arrayList.get(i12);
                        i12++;
                        if (((E1) obj).f20221a.requiresHardwareAcceleration()) {
                            logger.a(new F(this));
                            ez.a.k();
                            RenderNode renderNodeG = ez.a.g(this.f20281a);
                            renderNodeG.setPosition(0, 0, this.f20285e, this.f20286f);
                            RecordingCanvas recordingCanvasBeginRecording = renderNodeG.beginRecording();
                            ArrayList arrayList2 = this.f20287g;
                            int size2 = arrayList2.size();
                            while (i11 < size2) {
                                Object obj2 = arrayList2.get(i11);
                                i11++;
                                E1 e12 = (E1) obj2;
                                Intrinsics.d(recordingCanvasBeginRecording);
                                int iSave = recordingCanvasBeginRecording.save();
                                try {
                                    long jH = h2.b.h(0.4f, h2.b.f(e12.f20222b, this.f20284d));
                                    recordingCanvasBeginRecording.translate(Float.intBitsToFloat((int) (jH >> 32)), Float.intBitsToFloat((int) (jH & 4294967295L)));
                                    recordingCanvasBeginRecording.drawPicture(e12.f20221a);
                                    recordingCanvasBeginRecording.restoreToCount(iSave);
                                } catch (Throwable th2) {
                                    recordingCanvasBeginRecording.restoreToCount(iSave);
                                    throw th2;
                                }
                            }
                            renderNodeG.endRecording();
                            try {
                                imageReaderNewInstance = ImageReader.newInstance(this.f20285e, this.f20286f, 1, 1, 768L);
                                try {
                                    ez.a.B();
                                    hardwareRendererF = ez.a.f();
                                    hardwareRendererF.setSurface(imageReaderNewInstance.getSurface());
                                    hardwareRendererF.setContentRoot(renderNodeG);
                                    hardwareRendererF.createRenderRequest().setWaitForPresent(true).syncAndDraw();
                                } catch (Throwable th3) {
                                    th = th3;
                                    imageReader = imageReaderNewInstance;
                                    hardwareBuffer = null;
                                    hardwareRendererF = null;
                                    image = null;
                                    if (hardwareBuffer != null) {
                                        hardwareBuffer.close();
                                    }
                                    if (image != null) {
                                        image.close();
                                    }
                                    if (hardwareRendererF != null) {
                                        hardwareRendererF.destroy();
                                    }
                                    if (imageReader != null) {
                                        imageReader.close();
                                    }
                                    renderNodeG.discardDisplayList();
                                    throw th;
                                }
                            } catch (Throwable th4) {
                                th = th4;
                                imageReaderNewInstance = null;
                            }
                            try {
                                Image imageAcquireNextImage = imageReaderNewInstance.acquireNextImage();
                                if (imageAcquireNextImage == null) {
                                    throw new RuntimeException("No Image");
                                }
                                try {
                                    HardwareBuffer hardwareBuffer2 = imageAcquireNextImage.getHardwareBuffer();
                                    if (hardwareBuffer2 == null) {
                                        throw new RuntimeException("No HardwareBuffer");
                                    }
                                    try {
                                        Bitmap bitmapWrapHardwareBuffer = Bitmap.wrapHardwareBuffer(hardwareBuffer2, null);
                                        if (bitmapWrapHardwareBuffer == null) {
                                            throw new RuntimeException("Create Bitmap Failed");
                                        }
                                        this.f20288h = B.a(bitmapWrapHardwareBuffer);
                                        hardwareBuffer2.close();
                                        imageAcquireNextImage.close();
                                        hardwareRendererF.destroy();
                                        imageReaderNewInstance.close();
                                        renderNodeG.discardDisplayList();
                                        bitmapA = null;
                                        this.f20287g.clear();
                                        if (bitmapA != null) {
                                        }
                                    } catch (Throwable th5) {
                                        th = th5;
                                        image = imageAcquireNextImage;
                                        imageReader = imageReaderNewInstance;
                                        hardwareBuffer = hardwareBuffer2;
                                        if (hardwareBuffer != null) {
                                        }
                                        if (image != null) {
                                        }
                                        if (hardwareRendererF != null) {
                                        }
                                        if (imageReader != null) {
                                        }
                                        renderNodeG.discardDisplayList();
                                        throw th;
                                    }
                                } catch (Throwable th6) {
                                    th = th6;
                                    image = imageAcquireNextImage;
                                    imageReader = imageReaderNewInstance;
                                    hardwareBuffer = null;
                                }
                            } catch (Throwable th7) {
                                th = th7;
                                imageReader = imageReaderNewInstance;
                                hardwareBuffer = null;
                                image = null;
                                if (hardwareBuffer != null) {
                                }
                                if (image != null) {
                                }
                                if (hardwareRendererF != null) {
                                }
                                if (imageReader != null) {
                                }
                                renderNodeG.discardDisplayList();
                                throw th;
                            }
                        }
                    }
                }
                char c11 = ' ';
                logger.a(new G(this));
                bitmapA = viewCache.a(this.f20285e, this.f20286f);
                Canvas canvas = new Canvas(bitmapA);
                ArrayList arrayList3 = this.f20287g;
                int size3 = arrayList3.size();
                int i13 = 0;
                while (i13 < size3) {
                    Object obj3 = arrayList3.get(i13);
                    i13++;
                    E1 e13 = (E1) obj3;
                    int iSave2 = canvas.save();
                    try {
                        long jH2 = h2.b.h(0.4f, h2.b.f(e13.f20222b, this.f20284d));
                        char c12 = c11;
                        int i14 = size3;
                        canvas.translate(Float.intBitsToFloat((int) (jH2 >> c12)), Float.intBitsToFloat((int) (jH2 & 4294967295L)));
                        canvas.drawPicture(e13.f20221a);
                        canvas.restoreToCount(iSave2);
                        size3 = i14;
                        c11 = c12;
                    } catch (Throwable th8) {
                        canvas.restoreToCount(iSave2);
                        throw th8;
                    }
                }
                this.f20288h = B.a(bitmapA);
                canvas.drawColor(0, PorterDuff.Mode.CLEAR);
                this.f20287g.clear();
                if (bitmapA != null) {
                }
            }
        } catch (Throwable th9) {
            try {
                logger.a(th9, H.f20257a);
            } finally {
                this.f20287g.clear();
            }
        }
        return this.f20288h;
    }
}
