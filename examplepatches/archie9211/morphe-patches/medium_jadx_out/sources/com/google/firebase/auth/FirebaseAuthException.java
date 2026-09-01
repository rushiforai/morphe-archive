package com.google.firebase.auth;

import com.google.firebase.FirebaseException;
import defpackage.vp7;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class FirebaseAuthException extends FirebaseException {
    public final String a;

    public FirebaseAuthException(String str, String str2) {
        super(str2);
        vp7.n(str);
        this.a = str;
    }
}
