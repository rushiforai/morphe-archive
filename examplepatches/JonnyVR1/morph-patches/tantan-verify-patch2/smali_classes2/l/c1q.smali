.class public final Ll/c1q;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(JLjava/nio/ByteBuffer;I)V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    if-eq p3, v0, :cond_4

    .line 3
    .line 4
    const/4 v0, 0x2

    .line 5
    if-eq p3, v0, :cond_3

    .line 6
    .line 7
    const/4 v0, 0x3

    .line 8
    if-eq p3, v0, :cond_2

    .line 9
    .line 10
    const/4 v0, 0x4

    .line 11
    if-eq p3, v0, :cond_1

    .line 12
    .line 13
    const/16 v0, 0x8

    .line 14
    .line 15
    if-ne p3, v0, :cond_0

    .line 16
    .line 17
    invoke-static {p2, p0, p1}, Ll/b1q;->i(Ljava/nio/ByteBuffer;J)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    const-string p0, "I don\'t know how to read "

    .line 22
    .line 23
    const-string p1, " bytes"

    .line 24
    .line 25
    invoke-static {p0, p3, p1}, Ll/z0q;->a(Ljava/lang/String;ILjava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_1
    invoke-static {p2, p0, p1}, Ll/b1q;->g(Ljava/nio/ByteBuffer;J)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_2
    const-wide/32 v0, 0xffffff

    .line 34
    .line 35
    .line 36
    and-long/2addr p0, v0

    .line 37
    long-to-int p0, p0

    .line 38
    invoke-static {p2, p0}, Ll/b1q;->f(Ljava/nio/ByteBuffer;I)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_3
    const-wide/32 v0, 0xffff

    .line 43
    .line 44
    .line 45
    and-long/2addr p0, v0

    .line 46
    long-to-int p0, p0

    .line 47
    invoke-static {p2, p0}, Ll/b1q;->e(Ljava/nio/ByteBuffer;I)V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_4
    const-wide/16 v0, 0xff

    .line 52
    .line 53
    and-long/2addr p0, v0

    .line 54
    long-to-int p0, p0

    .line 55
    invoke-static {p2, p0}, Ll/b1q;->j(Ljava/nio/ByteBuffer;I)V

    .line 56
    .line 57
    .line 58
    return-void
.end method
