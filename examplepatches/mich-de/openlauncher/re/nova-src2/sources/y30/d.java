package y30;

import java.io.RandomAccessFile;
import kotlin.UByte;
import kotlin.jvm.internal.Intrinsics;
import r70.j;
import r70.k;

/* loaded from: classes.dex */
public final class d implements c {

    /* renamed from: a, reason: collision with root package name */
    public final a f96630a;

    public d(RandomAccessFile randomAccessFile) {
        this.f96630a = new a(randomAccessFile);
    }

    @Override // y30.c
    public final b G(String packageName, String activityName) {
        Intrinsics.g(packageName, "packageName");
        Intrinsics.g(activityName, "activityName");
        a aVar = this.f96630a;
        if (!aVar.f96623b) {
            aVar.b();
        }
        int i5 = a.f96621g;
        UByte uByteA = aVar.a(v30.e.r(aVar.f96625d, packageName));
        int i11 = aVar.f96625d + 1;
        while (true) {
            byte b11 = (byte) 255;
            UByte.Companion companion = UByte.f71693b;
            if (uByteA == null || uByteA.f71694a != b11) {
                break;
            }
            int i12 = a.f96621g;
            int i13 = i11 + 1;
            UByte uByteA2 = aVar.a(v30.e.r(i11, packageName));
            i11 = i13;
            uByteA = uByteA2;
        }
        b bVar = uByteA != null ? (b) kotlin.collections.c.E0(uByteA.f71694a & 255, b.values()) : null;
        return (bVar == null && (k.K0(activityName, "Unity", false) || j.I0(activityName, "com.apportable.", false) || j.I0(activityName, "com.epicgames.", false) || j.I0(activityName, "org.cocos2dx.", false) || activityName.equals("android.app.NativeActivity") || j.I0(activityName, "org.renpy.", false) || j.A0(packageName, ".humble", true) || j.I0(packageName, "com.gameloft.", false) || j.I0(activityName, "com.ansca.corona.", false) || j.I0(activityName, "com.toast.gamebase.", false) || j.I0(activityName, "com.gamesalad.", false))) ? b.f96628a : bVar;
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
        this.f96630a.close();
    }
}
