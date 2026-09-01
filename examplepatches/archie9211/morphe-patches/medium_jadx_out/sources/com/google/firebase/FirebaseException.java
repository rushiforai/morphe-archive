package com.google.firebase;

import defpackage.vp7;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class FirebaseException extends Exception {
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public FirebaseException(String str) {
        super(str);
        vp7.o(str, "Detail message must not be empty");
    }
}
