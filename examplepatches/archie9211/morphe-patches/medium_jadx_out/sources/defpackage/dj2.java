package defpackage;

import android.util.StatsEvent;
import android.util.StatsLog;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class dj2 {
    public static void a(long j, int i, int i2, int i3, int i4, int i5, int i6, int i7, int i8, int i9, int i10, int i11, int i12, int i13) {
        StatsEvent.Builder builderNewBuilder = StatsEvent.newBuilder();
        builderNewBuilder.setAtomId(762);
        builderNewBuilder.writeLong(j);
        builderNewBuilder.writeInt(i);
        builderNewBuilder.writeInt(i2);
        builderNewBuilder.writeInt(i3);
        builderNewBuilder.writeInt(i4);
        builderNewBuilder.writeInt(i5);
        builderNewBuilder.writeInt(i6);
        builderNewBuilder.writeInt(i7);
        builderNewBuilder.writeInt(i8);
        builderNewBuilder.writeInt(i9);
        builderNewBuilder.writeInt(i10);
        builderNewBuilder.writeInt(i11);
        builderNewBuilder.writeInt(i12);
        builderNewBuilder.writeInt(i13);
        builderNewBuilder.addBooleanAnnotation((byte) 1, true);
        builderNewBuilder.usePooledBuffer();
        StatsLog.write(builderNewBuilder.build());
    }

    public static void b(long j, int i, int i2, int i3, int i4, int i5, long j2, int i6, int i7, int i8, int i9, int i10, int i11, int i12, int i13, int i14, int i15, int i16, int i17, int i18, String str, int i19) {
        StatsEvent.Builder builderNewBuilder = StatsEvent.newBuilder();
        builderNewBuilder.setAtomId(704);
        builderNewBuilder.writeLong(j);
        builderNewBuilder.writeInt(i);
        builderNewBuilder.writeInt(i2);
        builderNewBuilder.writeInt(i3);
        builderNewBuilder.writeInt(i4);
        builderNewBuilder.writeInt(i5);
        builderNewBuilder.writeLong(j2);
        builderNewBuilder.writeInt(i6);
        builderNewBuilder.writeInt(i7);
        builderNewBuilder.writeBoolean(false);
        builderNewBuilder.writeBoolean(false);
        builderNewBuilder.writeInt(i8);
        builderNewBuilder.writeInt(i9);
        builderNewBuilder.writeInt(i10);
        builderNewBuilder.writeLong(-1L);
        builderNewBuilder.writeLong(-1L);
        builderNewBuilder.writeInt(i11);
        builderNewBuilder.writeInt(i12);
        builderNewBuilder.writeInt(i13);
        builderNewBuilder.writeInt(i14);
        builderNewBuilder.writeInt(i15);
        builderNewBuilder.addBooleanAnnotation((byte) 1, true);
        builderNewBuilder.writeInt(0);
        builderNewBuilder.writeInt(0);
        builderNewBuilder.writeInt(i16);
        builderNewBuilder.writeInt(i17);
        builderNewBuilder.writeInt(i18);
        builderNewBuilder.writeString(str);
        builderNewBuilder.writeInt(i19);
        builderNewBuilder.writeLong(-1L);
        builderNewBuilder.writeLong(-1L);
        builderNewBuilder.writeLong(-1L);
        builderNewBuilder.writeLong(-1L);
        builderNewBuilder.usePooledBuffer();
        StatsLog.write(builderNewBuilder.build());
    }

    public static void c(long j, int i, int i2, int i3, int i4, int i5, boolean z, int i6, boolean z2, boolean z3, String str, int i7, int i8, int i9, int i10, int i11, int i12, int i13, int i14, int i15, int i16, int i17, int i18, int i19, int i20, int i21, int i22, int i23, int i24, int i25, int i26, int i27, long j2, int i28) {
        StatsEvent.Builder builderNewBuilder = StatsEvent.newBuilder();
        builderNewBuilder.setAtomId(703);
        builderNewBuilder.writeLong(j);
        builderNewBuilder.writeInt(i);
        builderNewBuilder.writeInt(i2);
        builderNewBuilder.writeInt(i3);
        builderNewBuilder.writeInt(i4);
        builderNewBuilder.writeInt(i5);
        builderNewBuilder.writeBoolean(false);
        builderNewBuilder.writeBoolean(z);
        builderNewBuilder.writeInt(i6);
        builderNewBuilder.writeBoolean(z2);
        builderNewBuilder.writeBoolean(z3);
        builderNewBuilder.writeBoolean(false);
        builderNewBuilder.writeInt(0);
        builderNewBuilder.writeString(str);
        builderNewBuilder.writeInt(i7);
        builderNewBuilder.writeInt(i8);
        builderNewBuilder.writeInt(i9);
        builderNewBuilder.writeInt(i10);
        builderNewBuilder.writeInt(i11);
        builderNewBuilder.writeInt(i12);
        builderNewBuilder.writeInt(i13);
        builderNewBuilder.writeInt(i14);
        builderNewBuilder.writeInt(i15);
        builderNewBuilder.writeInt(i16);
        builderNewBuilder.writeInt(i17);
        builderNewBuilder.writeInt(i18);
        builderNewBuilder.writeInt(i19);
        builderNewBuilder.writeInt(i20);
        builderNewBuilder.writeInt(i21);
        builderNewBuilder.writeInt(i22);
        builderNewBuilder.writeInt(i23);
        builderNewBuilder.writeInt(i24);
        builderNewBuilder.writeInt(i25);
        builderNewBuilder.writeInt(i26);
        builderNewBuilder.writeInt(i27);
        builderNewBuilder.writeLong(j2);
        builderNewBuilder.writeInt(i28);
        builderNewBuilder.addBooleanAnnotation((byte) 1, true);
        builderNewBuilder.usePooledBuffer();
        StatsLog.write(builderNewBuilder.build());
    }
}
