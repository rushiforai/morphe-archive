.class public final Ll/sor0;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static a(Ll/tor0;Ll/wor0;Ll/hkv0;)V
    .locals 7

    .line 1
    const/4 p1, 0x0

    .line 2
    :goto_0
    invoke-interface {p0}, Ll/tor0;->zza()I

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    if-ge p1, v0, :cond_2

    .line 7
    .line 8
    invoke-interface {p0, p1}, Ll/tor0;->e(I)J

    .line 9
    .line 10
    .line 11
    move-result-wide v3

    .line 12
    invoke-interface {p0, v3, v4}, Ll/tor0;->f(J)Ljava/util/List;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    goto :goto_1

    .line 23
    :cond_0
    invoke-interface {p0}, Ll/tor0;->zza()I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    add-int/lit8 v0, v0, -0x1

    .line 28
    .line 29
    if-eq p1, v0, :cond_1

    .line 30
    .line 31
    add-int/lit8 v0, p1, 0x1

    .line 32
    .line 33
    invoke-interface {p0, v0}, Ll/tor0;->e(I)J

    .line 34
    .line 35
    .line 36
    move-result-wide v0

    .line 37
    invoke-interface {p0, p1}, Ll/tor0;->e(I)J

    .line 38
    .line 39
    .line 40
    move-result-wide v5

    .line 41
    sub-long v5, v0, v5

    .line 42
    .line 43
    new-instance v1, Ll/qor0;

    .line 44
    .line 45
    invoke-direct/range {v1 .. v6}, Ll/qor0;-><init>(Ljava/util/List;JJ)V

    .line 46
    .line 47
    .line 48
    invoke-interface {p2, v1}, Ll/hkv0;->zza(Ljava/lang/Object;)V

    .line 49
    .line 50
    .line 51
    :goto_1
    add-int/lit8 p1, p1, 0x1

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_1
    invoke-static {}, Ll/wpg0;->a()V

    .line 55
    .line 56
    .line 57
    :cond_2
    return-void
.end method
