.class public Lcom/uraroji/garage/android/lame/SimpleLame;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-string v0, "mp3lame"

    .line 2
    .line 3
    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(IIII)V
    .locals 1

    .line 1
    const/4 v0, 0x7

    .line 2
    invoke-static {p0, p1, p2, p3, v0}, Lcom/uraroji/garage/android/lame/SimpleLame;->init(IIIII)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static native close()V
.end method

.method public static native encode([S[SI[B)I
.end method

.method public static native flush([B)I
.end method

.method public static native init(IIIII)V
.end method
