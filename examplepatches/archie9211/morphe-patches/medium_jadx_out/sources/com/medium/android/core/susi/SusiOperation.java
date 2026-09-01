package com.medium.android.core.susi;

import defpackage.g04;
import defpackage.m3d;
import defpackage.rv8;
import kotlin.Metadata;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0010\u000e\n\u0002\b\u000b\b\u0087\u0081\u0002\u0018\u0000 \t2\b\u0012\u0004\u0012\u00020\u00000\u0001:\u0001\nB\u0011\b\u0002\u0012\u0006\u0010\u0003\u001a\u00020\u0002¢\u0006\u0004\b\u0004\u0010\u0005R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0006\u001a\u0004\b\u0007\u0010\bj\u0002\b\u000bj\u0002\b\f¨\u0006\r"}, d2 = {"Lcom/medium/android/core/susi/SusiOperation;", "", "", "value", "<init>", "(Ljava/lang/String;ILjava/lang/String;)V", "Ljava/lang/String;", "getValue", "()Ljava/lang/String;", "Companion", "m3d", "LOGIN", "REGISTER", "core_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class SusiOperation {
    private static final /* synthetic */ g04 $ENTRIES;
    private static final /* synthetic */ SusiOperation[] $VALUES;
    public static final m3d Companion;
    public static final SusiOperation LOGIN = new SusiOperation("LOGIN", 0, "login");
    public static final SusiOperation REGISTER = new SusiOperation("REGISTER", 1, "register");
    private final String value;

    private static final /* synthetic */ SusiOperation[] $values() {
        return new SusiOperation[]{LOGIN, REGISTER};
    }

    static {
        SusiOperation[] susiOperationArr$values = $values();
        $VALUES = susiOperationArr$values;
        $ENTRIES = rv8.x(susiOperationArr$values);
        Companion = new m3d();
    }

    private SusiOperation(String str, int i, String str2) {
        this.value = str2;
    }

    public static g04 getEntries() {
        return $ENTRIES;
    }

    public static SusiOperation valueOf(String str) {
        return (SusiOperation) Enum.valueOf(SusiOperation.class, str);
    }

    public static SusiOperation[] values() {
        return (SusiOperation[]) $VALUES.clone();
    }

    public final String getValue() {
        return this.value;
    }
}
