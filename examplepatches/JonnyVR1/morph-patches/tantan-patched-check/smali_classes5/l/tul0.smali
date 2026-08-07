.class public Ll/tul0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:D = 1.0E-4


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
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

.method public static a(Lcom/p1/mobile/putong/data/DoublePair;Lcom/p1/mobile/putong/data/DoublePair;)Z
    .locals 4

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    if-eqz p1, :cond_1

    .line 4
    .line 5
    :cond_0
    if-eqz p0, :cond_2

    .line 6
    .line 7
    if-eqz p1, :cond_2

    .line 8
    .line 9
    iget-wide v0, p0, Lcom/p1/mobile/putong/data/DoublePair;->first:D

    .line 10
    .line 11
    iget-wide v2, p1, Lcom/p1/mobile/putong/data/DoublePair;->first:D

    .line 12
    .line 13
    sub-double/2addr v0, v2

    .line 14
    invoke-static {v0, v1}, Ljava/lang/Math;->abs(D)D

    .line 15
    .line 16
    .line 17
    move-result-wide v0

    .line 18
    sget-wide v2, Ll/tul0;->a:D

    .line 19
    .line 20
    cmpg-double v0, v0, v2

    .line 21
    .line 22
    if-gez v0, :cond_2

    .line 23
    .line 24
    iget-wide v0, p0, Lcom/p1/mobile/putong/data/DoublePair;->second:D

    .line 25
    .line 26
    iget-wide p0, p1, Lcom/p1/mobile/putong/data/DoublePair;->second:D

    .line 27
    .line 28
    sub-double/2addr v0, p0

    .line 29
    invoke-static {v0, v1}, Ljava/lang/Math;->abs(D)D

    .line 30
    .line 31
    .line 32
    move-result-wide p0

    .line 33
    sget-wide v0, Ll/tul0;->a:D

    .line 34
    .line 35
    cmpg-double p0, p0, v0

    .line 36
    .line 37
    if-gez p0, :cond_2

    .line 38
    .line 39
    :cond_1
    const/4 p0, 0x1

    .line 40
    return p0

    .line 41
    :cond_2
    const/4 p0, 0x0

    .line 42
    return p0
.end method
