.class public abstract synthetic Lj7c;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static _values()[I
    .registers 1

    const/16 v0, 0x2a

    invoke-static {v0}, Lvep;->B(I)[I

    move-result-object v0

    return-object v0
.end method

.method public static final a(II)Z
    .registers 2

    invoke-static {p0}, Lvep;->A(I)I

    move-result p0

    invoke-static {p1}, Lvep;->A(I)I

    move-result p1

    if-lt p0, p1, :cond_c

    const/4 p0, 0x1

    return p0

    :cond_c
    const/4 p0, 0x0

    return p0
.end method

.method public static b(Ljava/lang/Boolean;)I
    .registers 1

    if-nez p0, :cond_4

    const/4 p0, 0x1

    return p0

    :cond_4
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    if-eqz p0, :cond_c

    const/4 p0, 0x2

    return p0

    :cond_c
    const/4 p0, 0x3

    return p0
.end method

.method public static c(Ljava/lang/String;)I
    .registers 2

    const-string v0, "hot_topic"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_42

    const-string v0, "trending"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_42

    const-string v0, "publishers"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_42

    const-string v0, "double_videos"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_42

    const-string v0, "top_news_group"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_42

    const-string v0, "roundups"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_42

    const-string v0, "audios"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_42

    const-string v0, "carousel"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_42

    const/4 p0, 0x1

    return p0

    :cond_42
    const/4 p0, 0x2

    return p0
.end method

.method public static synthetic d(I)B
    .registers 2

    const/4 v0, 0x1

    if-eq p0, v0, :cond_9

    const/4 v0, 0x2

    if-ne p0, v0, :cond_7

    return v0

    :cond_7
    const/4 p0, 0x0

    throw p0

    :cond_9
    return v0
.end method

.method public static synthetic e(I)B
    .registers 2

    const/4 v0, 0x1

    if-eq p0, v0, :cond_d

    const/4 v0, 0x2

    if-eq p0, v0, :cond_d

    const/4 v0, 0x3

    if-ne p0, v0, :cond_b

    const/4 p0, 0x4

    return p0

    :cond_b
    const/4 p0, 0x0

    throw p0

    :cond_d
    return v0
.end method

.method public static synthetic f(I)B
    .registers 1

    packed-switch p0, :pswitch_data_82

    const/4 p0, 0x0

    throw p0

    :pswitch_5
    const/16 p0, 0x2f

    return p0

    :pswitch_8
    const/16 p0, 0x2e

    return p0

    :pswitch_b
    const/16 p0, 0x2d

    return p0

    :pswitch_e
    const/16 p0, 0x2c

    return p0

    :pswitch_11
    const/16 p0, 0x2b

    return p0

    :pswitch_14
    const/16 p0, 0x2a

    return p0

    :pswitch_17
    const/16 p0, 0x29

    return p0

    :pswitch_1a
    const/16 p0, 0x28

    return p0

    :pswitch_1d
    const/16 p0, 0x27

    return p0

    :pswitch_20
    const/16 p0, 0x26

    return p0

    :pswitch_23
    const/16 p0, 0x25

    return p0

    :pswitch_26
    const/16 p0, 0x24

    return p0

    :pswitch_29
    const/16 p0, 0x23

    return p0

    :pswitch_2c
    const/16 p0, 0x22

    return p0

    :pswitch_2f
    const/16 p0, 0x21

    return p0

    :pswitch_32
    const/16 p0, 0x20

    return p0

    :pswitch_35
    const/16 p0, 0x1f

    return p0

    :pswitch_38
    const/16 p0, 0x1e

    return p0

    :pswitch_3b
    const/16 p0, 0x1d

    return p0

    :pswitch_3e
    const/16 p0, 0x1c

    return p0

    :pswitch_41
    const/16 p0, 0x1b

    return p0

    :pswitch_44
    const/16 p0, 0x1a

    return p0

    :pswitch_47
    const/16 p0, 0x19

    return p0

    :pswitch_4a
    const/16 p0, 0x18

    return p0

    :pswitch_4d
    const/16 p0, 0x17

    return p0

    :pswitch_50
    const/16 p0, 0x16

    return p0

    :pswitch_53
    const/16 p0, 0x15

    return p0

    :pswitch_56
    const/16 p0, 0x14

    return p0

    :pswitch_59
    const/16 p0, 0x13

    return p0

    :pswitch_5c
    const/16 p0, 0x12

    return p0

    :pswitch_5f
    const/16 p0, 0x11

    return p0

    :pswitch_62
    const/16 p0, 0x10

    return p0

    :pswitch_65
    const/16 p0, 0xf

    return p0

    :pswitch_68
    const/16 p0, 0xe

    return p0

    :pswitch_6b
    const/16 p0, 0xd

    return p0

    :pswitch_6e
    const/16 p0, 0xc

    return p0

    :pswitch_71
    const/16 p0, 0xb

    return p0

    :pswitch_74
    const/16 p0, 0xa

    return p0

    :pswitch_77
    const/16 p0, 0x9

    return p0

    :pswitch_7a
    const/16 p0, 0x8

    return p0

    :pswitch_7d
    const/4 p0, 0x2

    return p0

    :pswitch_7f
    const/4 p0, 0x1

    return p0

    nop

    :pswitch_data_82
    .packed-switch 0x1
        :pswitch_7f
        :pswitch_7d
        :pswitch_7a
        :pswitch_77
        :pswitch_74
        :pswitch_71
        :pswitch_6e
        :pswitch_6b
        :pswitch_68
        :pswitch_65
        :pswitch_62
        :pswitch_5f
        :pswitch_5c
        :pswitch_59
        :pswitch_56
        :pswitch_53
        :pswitch_50
        :pswitch_4d
        :pswitch_4a
        :pswitch_47
        :pswitch_44
        :pswitch_41
        :pswitch_3e
        :pswitch_3b
        :pswitch_38
        :pswitch_35
        :pswitch_32
        :pswitch_2f
        :pswitch_2c
        :pswitch_29
        :pswitch_26
        :pswitch_23
        :pswitch_20
        :pswitch_1d
        :pswitch_1a
        :pswitch_17
        :pswitch_14
        :pswitch_11
        :pswitch_e
        :pswitch_b
        :pswitch_8
        :pswitch_5
    .end packed-switch
.end method

.method public static synthetic g(I)B
    .registers 3

    const/4 v0, 0x1

    if-eq p0, v0, :cond_d

    const/4 v1, 0x2

    if-eq p0, v1, :cond_c

    const/4 v0, 0x3

    if-ne p0, v0, :cond_a

    return v1

    :cond_a
    const/4 p0, 0x0

    throw p0

    :cond_c
    return v0

    :cond_d
    const/4 p0, 0x0

    return p0
.end method

.method public static synthetic h(I)Ljava/lang/String;
    .registers 2

    const/4 v0, 0x1

    if-eq p0, v0, :cond_b

    const/4 v0, 0x2

    if-ne p0, v0, :cond_9

    const-string p0, "com.opera.ofasettingsmocker"

    return-object p0

    :cond_9
    const/4 p0, 0x0

    throw p0

    :cond_b
    const-string p0, "com.opera.minisettingsmocker"

    return-object p0
.end method

.method public static synthetic i(I)Ljava/lang/String;
    .registers 1

    packed-switch p0, :pswitch_data_26

    const/4 p0, 0x0

    throw p0

    :pswitch_5
    const-string p0, "ILLEGAL"

    return-object p0

    :pswitch_8
    const-string p0, "SURNAME"

    return-object p0

    :pswitch_b
    const-string p0, "COUNTRY"

    return-object p0

    :pswitch_e
    const-string p0, "COMPANY"

    return-object p0

    :pswitch_11
    const-string p0, "ADDRESS2"

    return-object p0

    :pswitch_14
    const-string p0, "ADDRESS1"

    return-object p0

    :pswitch_17
    const-string p0, "AGE"

    return-object p0

    :pswitch_1a
    const-string p0, "GENDER"

    return-object p0

    :pswitch_1d
    const-string p0, "EMAIL"

    return-object p0

    :pswitch_20
    const-string p0, "PHONE"

    return-object p0

    :pswitch_23
    const-string p0, "NAME"

    return-object p0

    :pswitch_data_26
    .packed-switch 0x1
        :pswitch_23
        :pswitch_20
        :pswitch_1d
        :pswitch_1a
        :pswitch_17
        :pswitch_14
        :pswitch_11
        :pswitch_e
        :pswitch_b
        :pswitch_8
        :pswitch_5
    .end packed-switch
.end method

.method public static synthetic j(I)Ljava/lang/String;
    .registers 1

    packed-switch p0, :pswitch_data_18

    const/4 p0, 0x0

    throw p0

    :pswitch_5
    const-string p0, "og"

    return-object p0

    :pswitch_8
    const-string p0, "uhq"

    return-object p0

    :pswitch_b
    const-string p0, "hq"

    return-object p0

    :pswitch_e
    const-string p0, "mq"

    return-object p0

    :pswitch_11
    const-string p0, "lq"

    return-object p0

    :pswitch_14
    const-string p0, "ulq"

    return-object p0

    nop

    :pswitch_data_18
    .packed-switch 0x1
        :pswitch_14
        :pswitch_11
        :pswitch_e
        :pswitch_b
        :pswitch_8
        :pswitch_5
    .end packed-switch
.end method

.method public static k(IIII)I
    .registers 4

    invoke-static {p0}, Lw75;->e(I)I

    move-result p0

    add-int/2addr p0, p1

    add-int/2addr p0, p2

    add-int/2addr p0, p3

    return p0
.end method

.method public static l(IIIII)I
    .registers 5

    add-int/2addr p0, p1

    add-int/2addr p0, p2

    shl-int p1, p0, p3

    rsub-int/lit8 p2, p3, 0x20

    ushr-int/2addr p0, p2

    or-int/2addr p1, p0

    add-int/2addr p1, p4

    return p1
.end method

.method public static m(Lqc3;Li8e;)Ltlj;
    .registers 3

    new-instance v0, Ltlj;

    invoke-direct {v0, p0}, Lvab;-><init>(Lqc3;)V

    invoke-virtual {p1, v0}, Li8e;->a(Lvab;)V

    return-object v0
.end method

.method public static n(Landroid/view/ViewGroup;ILandroid/view/ViewGroup;Z)Landroid/view/View;
    .registers 4

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p0

    invoke-virtual {p0, p1, p2, p3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    return-object p0
.end method

.method public static o(JLjava/lang/String;Ljava/lang/StringBuilder;)Ljava/lang/String;
    .registers 4

    invoke-virtual {p3, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static p(Ljava/lang/StringBuilder;CLjava/lang/String;CLrhk;)Ljava/lang/String;
    .registers 5

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {p0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static q(Lfvh;Lt9f;)Lokhttp3/internal/connection/RealCall;
    .registers 3

    new-instance v0, Lkvh;

    invoke-direct {v0, p0}, Lkvh;-><init>(Lfvh;)V

    invoke-virtual {p1, v0}, Lt9f;->c(Lkvh;)Lokhttp3/internal/connection/RealCall;

    move-result-object p0

    return-object p0
.end method

.method public static r(Lto9;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 5

    invoke-virtual {p0, p1}, Lto9;->n(Ljava/lang/String;)V

    invoke-virtual {p0, p2}, Lto9;->n(Ljava/lang/String;)V

    invoke-virtual {p0, p3}, Lto9;->n(Ljava/lang/String;)V

    invoke-virtual {p0, p4}, Lto9;->n(Ljava/lang/String;)V

    return-void
.end method

.method public static s(IIII)I
    .registers 4

    invoke-static {p0}, Lx75;->h(I)I

    move-result p0

    add-int/2addr p0, p1

    add-int/2addr p0, p2

    add-int/2addr p0, p3

    return p0
.end method

.method public static synthetic t(I)Ljava/lang/String;
    .registers 1

    packed-switch p0, :pswitch_data_18

    const-string p0, "null"

    return-object p0

    :pswitch_6
    const-string p0, "TEMPORARILY_UNMETERED"

    return-object p0

    :pswitch_9
    const-string p0, "METERED"

    return-object p0

    :pswitch_c
    const-string p0, "NOT_ROAMING"

    return-object p0

    :pswitch_f
    const-string p0, "UNMETERED"

    return-object p0

    :pswitch_12
    const-string p0, "CONNECTED"

    return-object p0

    :pswitch_15
    const-string p0, "NOT_REQUIRED"

    return-object p0

    :pswitch_data_18
    .packed-switch 0x1
        :pswitch_15
        :pswitch_12
        :pswitch_f
        :pswitch_c
        :pswitch_9
        :pswitch_6
    .end packed-switch
.end method
