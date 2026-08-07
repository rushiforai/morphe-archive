.class public Ll/s5r0;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static a(Landroid/content/Context;Lcom/xiaomi/push/hq;Lcom/xiaomi/push/gf;)Lcom/xiaomi/push/hb;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lcom/xiaomi/push/hq<",
            "TT;*>;>(",
            "Landroid/content/Context;",
            "TT;",
            "Lcom/xiaomi/push/gf;",
            ")",
            "Lcom/xiaomi/push/hb;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/xiaomi/push/gf;->a:Lcom/xiaomi/push/gf;

    .line 2
    .line 3
    invoke-virtual {p2, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    xor-int/lit8 v4, v0, 0x1

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v5

    .line 13
    invoke-static {p0}, Lcom/xiaomi/mipush/sdk/c;->c(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/c;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Lcom/xiaomi/mipush/sdk/c;->d()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v6

    .line 21
    move-object v1, p0

    .line 22
    move-object v2, p1

    .line 23
    move-object v3, p2

    .line 24
    invoke-static/range {v1 .. v6}, Ll/s5r0;->b(Landroid/content/Context;Lcom/xiaomi/push/hq;Lcom/xiaomi/push/gf;ZLjava/lang/String;Ljava/lang/String;)Lcom/xiaomi/push/hb;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method

.method public static b(Landroid/content/Context;Lcom/xiaomi/push/hq;Lcom/xiaomi/push/gf;ZLjava/lang/String;Ljava/lang/String;)Lcom/xiaomi/push/hb;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lcom/xiaomi/push/hq<",
            "TT;*>;>(",
            "Landroid/content/Context;",
            "TT;",
            "Lcom/xiaomi/push/gf;",
            "Z",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lcom/xiaomi/push/hb;"
        }
    .end annotation

    .line 1
    const/4 v6, 0x1

    .line 2
    move-object v0, p0

    .line 3
    move-object v1, p1

    .line 4
    move-object v2, p2

    .line 5
    move v3, p3

    .line 6
    move-object v4, p4

    .line 7
    move-object v5, p5

    .line 8
    invoke-static/range {v0 .. v6}, Ll/s5r0;->c(Landroid/content/Context;Lcom/xiaomi/push/hq;Lcom/xiaomi/push/gf;ZLjava/lang/String;Ljava/lang/String;Z)Lcom/xiaomi/push/hb;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static c(Landroid/content/Context;Lcom/xiaomi/push/hq;Lcom/xiaomi/push/gf;ZLjava/lang/String;Ljava/lang/String;Z)Lcom/xiaomi/push/hb;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lcom/xiaomi/push/hq<",
            "TT;*>;>(",
            "Landroid/content/Context;",
            "TT;",
            "Lcom/xiaomi/push/gf;",
            "Z",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Z)",
            "Lcom/xiaomi/push/hb;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Lcom/xiaomi/push/m;->e(Lcom/xiaomi/push/hq;)[B

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const/4 v0, 0x0

    .line 6
    if-nez p1, :cond_0

    .line 7
    .line 8
    const-string p0, "invoke convertThriftObjectToBytes method, return null."

    .line 9
    .line 10
    invoke-static {p0}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-object v0

    .line 14
    :cond_0
    new-instance v1, Lcom/xiaomi/push/hb;

    .line 15
    .line 16
    invoke-direct {v1}, Lcom/xiaomi/push/hb;-><init>()V

    .line 17
    .line 18
    .line 19
    if-eqz p3, :cond_2

    .line 20
    .line 21
    invoke-static {p0}, Lcom/xiaomi/mipush/sdk/c;->c(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/c;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p0}, Lcom/xiaomi/mipush/sdk/c;->t()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    if-eqz v2, :cond_1

    .line 34
    .line 35
    const-string p0, "regSecret is empty, return null"

    .line 36
    .line 37
    invoke-static {p0}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    return-object v0

    .line 41
    :cond_1
    invoke-static {p0}, Ll/ptq0;->b(Ljava/lang/String;)[B

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    :try_start_0
    invoke-static {p0, p1}, Ll/g3r0;->c([B[B)[B

    .line 46
    .line 47
    .line 48
    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 49
    goto :goto_0

    .line 50
    :catch_0
    const-string p0, "encryption error. "

    .line 51
    .line 52
    invoke-static {p0}, Ll/ouq0;->B(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    :cond_2
    :goto_0
    new-instance p0, Lcom/xiaomi/push/gu;

    .line 56
    .line 57
    invoke-direct {p0}, Lcom/xiaomi/push/gu;-><init>()V

    .line 58
    .line 59
    .line 60
    const-wide/16 v2, 0x5

    .line 61
    .line 62
    iput-wide v2, p0, Lcom/xiaomi/push/gu;->a:J

    .line 63
    .line 64
    const-string v0, "fakeid"

    .line 65
    .line 66
    iput-object v0, p0, Lcom/xiaomi/push/gu;->a:Ljava/lang/String;

    .line 67
    .line 68
    invoke-virtual {v1, p0}, Lcom/xiaomi/push/hb;->a(Lcom/xiaomi/push/gu;)Lcom/xiaomi/push/hb;

    .line 69
    .line 70
    .line 71
    invoke-static {p1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    invoke-virtual {v1, p0}, Lcom/xiaomi/push/hb;->a(Ljava/nio/ByteBuffer;)Lcom/xiaomi/push/hb;

    .line 76
    .line 77
    .line 78
    invoke-virtual {v1, p2}, Lcom/xiaomi/push/hb;->a(Lcom/xiaomi/push/gf;)Lcom/xiaomi/push/hb;

    .line 79
    .line 80
    .line 81
    invoke-virtual {v1, p6}, Lcom/xiaomi/push/hb;->b(Z)Lcom/xiaomi/push/hb;

    .line 82
    .line 83
    .line 84
    invoke-virtual {v1, p4}, Lcom/xiaomi/push/hb;->b(Ljava/lang/String;)Lcom/xiaomi/push/hb;

    .line 85
    .line 86
    .line 87
    invoke-virtual {v1, p3}, Lcom/xiaomi/push/hb;->a(Z)Lcom/xiaomi/push/hb;

    .line 88
    .line 89
    .line 90
    invoke-virtual {v1, p5}, Lcom/xiaomi/push/hb;->a(Ljava/lang/String;)Lcom/xiaomi/push/hb;

    .line 91
    .line 92
    .line 93
    return-object v1
.end method

.method public static d(Landroid/content/Context;Lcom/xiaomi/push/hb;)Lcom/xiaomi/push/hq;
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/xiaomi/push/hb;->b()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    sget-object v0, Lcom/xiaomi/mipush/sdk/d;->b:Lcom/xiaomi/mipush/sdk/d;

    .line 8
    .line 9
    invoke-static {p0, p1, v0}, Ll/n1r0;->j(Landroid/content/Context;Lcom/xiaomi/push/hb;Lcom/xiaomi/mipush/sdk/d;)[B

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    invoke-static {p0}, Lcom/xiaomi/mipush/sdk/c;->c(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/c;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Lcom/xiaomi/mipush/sdk/c;->t()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-static {p0}, Ll/ptq0;->b(Ljava/lang/String;)[B

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    :cond_0
    :try_start_0
    invoke-virtual {p1}, Lcom/xiaomi/push/hb;->a()[B

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-static {v0, p0}, Ll/g3r0;->b([B[B)[B

    .line 32
    .line 33
    .line 34
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 35
    goto :goto_0

    .line 36
    :catch_0
    move-exception p0

    .line 37
    new-instance p1, Lcom/xiaomi/mipush/sdk/l;

    .line 38
    .line 39
    const-string v0, "the aes decrypt failed."

    .line 40
    .line 41
    invoke-direct {p1, v0, p0}, Lcom/xiaomi/mipush/sdk/l;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 42
    .line 43
    .line 44
    throw p1

    .line 45
    :cond_1
    invoke-virtual {p1}, Lcom/xiaomi/push/hb;->a()[B

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    :goto_0
    invoke-virtual {p1}, Lcom/xiaomi/push/hb;->a()Lcom/xiaomi/push/gf;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    iget-boolean p1, p1, Lcom/xiaomi/push/hb;->b:Z

    .line 54
    .line 55
    invoke-static {v0, p1}, Ll/s5r0;->e(Lcom/xiaomi/push/gf;Z)Lcom/xiaomi/push/hq;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    if-eqz p1, :cond_2

    .line 60
    .line 61
    invoke-static {p1, p0}, Lcom/xiaomi/push/m;->d(Lcom/xiaomi/push/hq;[B)V

    .line 62
    .line 63
    .line 64
    :cond_2
    return-object p1
.end method

.method private static e(Lcom/xiaomi/push/gf;Z)Lcom/xiaomi/push/hq;
    .locals 1

    .line 1
    sget-object v0, Ll/s5r0$a;->a:[I

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    aget p0, v0, p0

    .line 8
    .line 9
    packed-switch p0, :pswitch_data_0

    .line 10
    .line 11
    .line 12
    const/4 p0, 0x0

    .line 13
    return-object p0

    .line 14
    :pswitch_0
    new-instance p0, Lcom/xiaomi/push/ha;

    .line 15
    .line 16
    invoke-direct {p0}, Lcom/xiaomi/push/ha;-><init>()V

    .line 17
    .line 18
    .line 19
    return-object p0

    .line 20
    :pswitch_1
    if-eqz p1, :cond_0

    .line 21
    .line 22
    new-instance p0, Lcom/xiaomi/push/he;

    .line 23
    .line 24
    invoke-direct {p0}, Lcom/xiaomi/push/he;-><init>()V

    .line 25
    .line 26
    .line 27
    return-object p0

    .line 28
    :cond_0
    new-instance p0, Lcom/xiaomi/push/gw;

    .line 29
    .line 30
    invoke-direct {p0}, Lcom/xiaomi/push/gw;-><init>()V

    .line 31
    .line 32
    .line 33
    const/4 p1, 0x1

    .line 34
    invoke-virtual {p0, p1}, Lcom/xiaomi/push/gw;->a(Z)V

    .line 35
    .line 36
    .line 37
    return-object p0

    .line 38
    :pswitch_2
    new-instance p0, Lcom/xiaomi/push/hh;

    .line 39
    .line 40
    invoke-direct {p0}, Lcom/xiaomi/push/hh;-><init>()V

    .line 41
    .line 42
    .line 43
    return-object p0

    .line 44
    :pswitch_3
    new-instance p0, Lcom/xiaomi/push/ha;

    .line 45
    .line 46
    invoke-direct {p0}, Lcom/xiaomi/push/ha;-><init>()V

    .line 47
    .line 48
    .line 49
    return-object p0

    .line 50
    :pswitch_4
    new-instance p0, Lcom/xiaomi/push/gv;

    .line 51
    .line 52
    invoke-direct {p0}, Lcom/xiaomi/push/gv;-><init>()V

    .line 53
    .line 54
    .line 55
    return-object p0

    .line 56
    :pswitch_5
    new-instance p0, Lcom/xiaomi/push/hi;

    .line 57
    .line 58
    invoke-direct {p0}, Lcom/xiaomi/push/hi;-><init>()V

    .line 59
    .line 60
    .line 61
    return-object p0

    .line 62
    :pswitch_6
    new-instance p0, Lcom/xiaomi/push/ho;

    .line 63
    .line 64
    invoke-direct {p0}, Lcom/xiaomi/push/ho;-><init>()V

    .line 65
    .line 66
    .line 67
    return-object p0

    .line 68
    :pswitch_7
    new-instance p0, Lcom/xiaomi/push/hk;

    .line 69
    .line 70
    invoke-direct {p0}, Lcom/xiaomi/push/hk;-><init>()V

    .line 71
    .line 72
    .line 73
    return-object p0

    .line 74
    :pswitch_8
    new-instance p0, Lcom/xiaomi/push/hm;

    .line 75
    .line 76
    invoke-direct {p0}, Lcom/xiaomi/push/hm;-><init>()V

    .line 77
    .line 78
    .line 79
    return-object p0

    .line 80
    :pswitch_9
    new-instance p0, Lcom/xiaomi/push/hg;

    .line 81
    .line 82
    invoke-direct {p0}, Lcom/xiaomi/push/hg;-><init>()V

    .line 83
    .line 84
    .line 85
    return-object p0

    .line 86
    nop

    .line 87
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static f(Landroid/content/Context;Lcom/xiaomi/push/hq;Lcom/xiaomi/push/gf;ZLjava/lang/String;Ljava/lang/String;)Lcom/xiaomi/push/hb;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lcom/xiaomi/push/hq<",
            "TT;*>;>(",
            "Landroid/content/Context;",
            "TT;",
            "Lcom/xiaomi/push/gf;",
            "Z",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lcom/xiaomi/push/hb;"
        }
    .end annotation

    .line 1
    const/4 v6, 0x0

    .line 2
    move-object v0, p0

    .line 3
    move-object v1, p1

    .line 4
    move-object v2, p2

    .line 5
    move v3, p3

    .line 6
    move-object v4, p4

    .line 7
    move-object v5, p5

    .line 8
    invoke-static/range {v0 .. v6}, Ll/s5r0;->c(Landroid/content/Context;Lcom/xiaomi/push/hq;Lcom/xiaomi/push/gf;ZLjava/lang/String;Ljava/lang/String;Z)Lcom/xiaomi/push/hb;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method
