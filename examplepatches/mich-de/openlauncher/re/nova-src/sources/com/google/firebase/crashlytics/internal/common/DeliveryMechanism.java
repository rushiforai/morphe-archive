package com.google.firebase.crashlytics.internal.common;

/* loaded from: classes.dex */
public enum DeliveryMechanism {
    DEVELOPER(1),
    USER_SIDELOAD(2),
    TEST_DISTRIBUTION(3),
    APP_STORE(4);


    /* renamed from: id, reason: collision with root package name */
    private final int f34698id;

    DeliveryMechanism(int i5) {
        this.f34698id = i5;
    }

    public static DeliveryMechanism determineFrom(String str) {
        return str != null ? APP_STORE : DEVELOPER;
    }

    public int getId() {
        return this.f34698id;
    }

    @Override // java.lang.Enum
    public String toString() {
        return Integer.toString(this.f34698id);
    }
}
