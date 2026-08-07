.class public Ll/g0r0;
.super Ljava/lang/Object;


# direct methods
.method public static a(J)Z
    .locals 7

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-static {v0}, Ll/u5r0;->c(I)Z

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    const/4 v1, 0x1

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return v1

    .line 10
    :cond_0
    const/16 v0, 0x400

    .line 11
    .line 12
    invoke-static {v0}, Ll/u5r0;->c(I)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    const/4 v2, 0x0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    return v2

    .line 20
    :cond_1
    invoke-static {}, Ll/euq0;->s()J

    .line 21
    .line 22
    .line 23
    move-result-wide v3

    .line 24
    const-wide/16 v5, -0x1

    .line 25
    .line 26
    cmp-long v0, v3, v5

    .line 27
    .line 28
    if-eqz v0, :cond_2

    .line 29
    .line 30
    invoke-static {}, Ll/euq0;->s()J

    .line 31
    .line 32
    .line 33
    move-result-wide v3

    .line 34
    sub-long/2addr p0, v3

    .line 35
    invoke-static {}, Ll/n0r0;->k()Ll/ow5;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {v0}, Ll/ow5;->d()J

    .line 40
    .line 41
    .line 42
    move-result-wide v3

    .line 43
    cmp-long p0, p0, v3

    .line 44
    .line 45
    if-gtz p0, :cond_3

    .line 46
    .line 47
    :cond_2
    invoke-static {}, Ll/n0r0;->o()Z

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    if-eqz p0, :cond_4

    .line 52
    .line 53
    invoke-static {}, Ll/n0r0;->r()I

    .line 54
    .line 55
    .line 56
    move-result p0

    .line 57
    if-eqz p0, :cond_3

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_3
    return v2

    .line 61
    :cond_4
    :goto_0
    return v1
.end method
