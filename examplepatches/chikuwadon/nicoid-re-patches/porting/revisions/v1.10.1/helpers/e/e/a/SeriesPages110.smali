.class public final Le/e/a/SeriesPages110;
.super Ljava/lang/Object;
.source "SeriesPages110.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static finished(IIIZZJ)Z
    .registers 7

    .line 3
    if-eqz p1, :cond_12

    if-eqz p2, :cond_12

    if-eqz p3, :cond_8

    if-eqz p4, :cond_12

    :cond_8
    int-to-long p0, p0

    const-wide/16 p2, 0x64

    mul-long/2addr p0, p2

    cmp-long p0, p0, p5

    if-gez p0, :cond_12

    const/4 p0, 0x0

    return p0

    :cond_12
    const/4 p0, 0x1

    return p0
.end method
