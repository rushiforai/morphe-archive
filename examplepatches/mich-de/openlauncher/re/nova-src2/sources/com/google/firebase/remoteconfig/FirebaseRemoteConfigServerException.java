package com.google.firebase.remoteconfig;

/* loaded from: classes.dex */
public class FirebaseRemoteConfigServerException extends FirebaseRemoteConfigException {

    /* renamed from: a, reason: collision with root package name */
    public final int f34768a;

    public FirebaseRemoteConfigServerException(int i5, String str) {
        super(str);
        this.f34768a = i5;
    }

    public FirebaseRemoteConfigServerException(int i5, String str, FirebaseRemoteConfigServerException firebaseRemoteConfigServerException) {
        super(str, firebaseRemoteConfigServerException);
        this.f34768a = i5;
    }

    public FirebaseRemoteConfigServerException(int i5, String str, int i11) {
        super(str);
        this.f34768a = i5;
    }

    public FirebaseRemoteConfigServerException(String str) {
        super(str);
        this.f34768a = -1;
    }
}
