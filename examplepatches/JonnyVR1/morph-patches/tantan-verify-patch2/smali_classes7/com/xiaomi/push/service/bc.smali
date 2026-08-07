.class public Lcom/xiaomi/push/service/bc;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static a(Landroid/content/Context;Lcom/xiaomi/push/hb;)Lcom/xiaomi/push/hq;
    .locals 1

    .line 87
    invoke-virtual {p1}, Lcom/xiaomi/push/hb;->b()Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 88
    :cond_0
    invoke-virtual {p1}, Lcom/xiaomi/push/hb;->a()[B

    move-result-object p0

    .line 89
    invoke-virtual {p1}, Lcom/xiaomi/push/hb;->a()Lcom/xiaomi/push/gf;

    move-result-object v0

    iget-boolean p1, p1, Lcom/xiaomi/push/hb;->b:Z

    invoke-static {v0, p1}, Lcom/xiaomi/push/service/bc;->a(Lcom/xiaomi/push/gf;Z)Lcom/xiaomi/push/hq;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 90
    invoke-static {p1, p0}, Lcom/xiaomi/push/m;->d(Lcom/xiaomi/push/hq;[B)V

    :cond_1
    return-object p1
.end method

.method private static a(Lcom/xiaomi/push/gf;Z)Lcom/xiaomi/push/hq;
    .locals 1

    .line 1
    sget-object v0, Lcom/xiaomi/push/service/bc$1;->a:[I

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
