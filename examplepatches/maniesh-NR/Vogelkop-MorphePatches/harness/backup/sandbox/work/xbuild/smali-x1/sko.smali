.class public abstract synthetic Lsko;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static _a(I)I
    .registers 1

    packed-switch p0, :pswitch_data_28

    const/4 p0, 0x0

    return p0

    :pswitch_5
    const/16 p0, 0xe

    return p0

    :pswitch_8
    const/16 p0, 0xd

    return p0

    :pswitch_b
    const/16 p0, 0xc

    return p0

    :pswitch_e
    const/16 p0, 0xb

    return p0

    :pswitch_11
    const/16 p0, 0xa

    return p0

    :pswitch_14
    const/16 p0, 0x9

    return p0

    :pswitch_17
    const/16 p0, 0x8

    return p0

    :pswitch_1a
    const/4 p0, 0x7

    return p0

    :pswitch_1c
    const/4 p0, 0x6

    return p0

    :pswitch_1e
    const/4 p0, 0x5

    return p0

    :pswitch_20
    const/4 p0, 0x4

    return p0

    :pswitch_22
    const/4 p0, 0x3

    return p0

    :pswitch_24
    const/4 p0, 0x2

    return p0

    :pswitch_26
    const/4 p0, 0x1

    return p0

    :pswitch_data_28
    .packed-switch 0x0
        :pswitch_26
        :pswitch_24
        :pswitch_22
        :pswitch_20
        :pswitch_1e
        :pswitch_1c
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

.method public static _a$1(I)I
    .registers 3

    const/4 v0, 0x1

    if-eqz p0, :cond_13

    const/4 v1, 0x2

    if-eq p0, v0, :cond_12

    if-eq p0, v1, :cond_10

    const/16 v0, 0x3e8

    if-eq p0, v0, :cond_e

    const/4 p0, 0x0

    return p0

    :cond_e
    const/4 p0, 0x4

    return p0

    :cond_10
    const/4 p0, 0x3

    return p0

    :cond_12
    return v1

    :cond_13
    return v0
.end method

.method public static _a$2(I)I
    .registers 3

    const/4 v0, 0x1

    if-eqz p0, :cond_11

    const/4 v1, 0x2

    if-eq p0, v0, :cond_10

    const/4 v0, 0x3

    if-eq p0, v1, :cond_f

    if-eq p0, v0, :cond_d

    const/4 p0, 0x0

    return p0

    :cond_d
    const/4 p0, 0x4

    return p0

    :cond_f
    return v0

    :cond_10
    return v1

    :cond_11
    return v0
.end method

.method public static final _getNumber$1(I)I
    .registers 3

    const/16 v0, 0x8

    const/4 v1, 0x0

    if-eq p0, v0, :cond_18

    packed-switch p0, :pswitch_data_20

    const/4 p0, 0x0

    throw p0

    :pswitch_a
    const/4 v1, -0x1

    goto :goto_17

    :pswitch_c
    const/4 v1, 0x6

    goto :goto_17

    :pswitch_e
    const/4 v1, 0x5

    goto :goto_17

    :pswitch_10
    const/4 v1, 0x4

    goto :goto_17

    :pswitch_12
    const/4 v1, 0x3

    goto :goto_17

    :pswitch_14
    const/4 v1, 0x2

    goto :goto_17

    :pswitch_16
    const/4 v1, 0x1

    :goto_17
    :pswitch_17
    return v1

    :cond_18
    sget-object p0, Lads_mobile_sdk/yb1;->a:[B

    const-string p0, "Can\'t get the number of an unknown enum value."

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    return v1

    :pswitch_data_20
    .packed-switch 0x1
        :pswitch_17
        :pswitch_16
        :pswitch_14
        :pswitch_12
        :pswitch_10
        :pswitch_e
        :pswitch_c
        :pswitch_a
    .end packed-switch
.end method

.method public static synthetic a(I)S
    .registers 3

    const/4 v0, 0x1

    if-eq p0, v0, :cond_13

    const/4 v1, 0x2

    if-eq p0, v1, :cond_12

    const/4 v0, 0x3

    if-eq p0, v0, :cond_11

    const/4 v0, 0x4

    if-ne p0, v0, :cond_f

    const/16 p0, 0x3e8

    return p0

    :cond_f
    const/4 p0, 0x0

    throw p0

    :cond_11
    return v1

    :cond_12
    return v0

    :cond_13
    const/4 p0, 0x0

    return p0
.end method

.method public static synthetic b(I)B
    .registers 3

    const/4 v0, 0x1

    if-eq p0, v0, :cond_11

    const/4 v1, 0x2

    if-eq p0, v1, :cond_10

    const/4 v0, 0x3

    if-eq p0, v0, :cond_f

    const/4 v1, 0x4

    if-ne p0, v1, :cond_d

    return v0

    :cond_d
    const/4 p0, 0x0

    throw p0

    :cond_f
    return v1

    :cond_10
    return v0

    :cond_11
    const/4 p0, 0x0

    return p0
.end method

.method public static synthetic c(I)I
    .registers 1

    packed-switch p0, :pswitch_data_52

    const/4 p0, 0x0

    throw p0

    :pswitch_5
    const/high16 p0, 0x20000

    return p0

    :pswitch_8
    const/high16 p0, 0x10000

    return p0

    :pswitch_b
    const p0, 0x8000

    return p0

    :pswitch_f
    const/16 p0, 0x4000

    return p0

    :pswitch_12
    const/16 p0, 0x2000

    return p0

    :pswitch_15
    const/16 p0, 0x1000

    return p0

    :pswitch_18
    const/16 p0, 0x800

    return p0

    :pswitch_1b
    const/16 p0, 0x400

    return p0

    :pswitch_1e
    const/16 p0, 0x200

    return p0

    :pswitch_21
    const/16 p0, 0x100

    return p0

    :pswitch_24
    const/16 p0, 0x80

    return p0

    :pswitch_27
    const/16 p0, 0x40

    return p0

    :pswitch_2a
    const/16 p0, 0x20

    return p0

    :pswitch_2d
    const/16 p0, 0x10

    return p0

    :pswitch_30
    const/16 p0, 0x8

    return p0

    :pswitch_33
    const/4 p0, 0x4

    return p0

    :pswitch_35
    const/4 p0, 0x2

    return p0

    :pswitch_37
    const/16 p0, 0x13

    return p0

    :pswitch_3a
    const/16 p0, 0x11

    return p0

    :pswitch_3d
    const/16 p0, 0xf

    return p0

    :pswitch_40
    const/16 p0, 0xd

    return p0

    :pswitch_43
    const/16 p0, 0xb

    return p0

    :pswitch_46
    const/16 p0, 0x9

    return p0

    :pswitch_49
    const/4 p0, 0x7

    return p0

    :pswitch_4b
    const/4 p0, 0x5

    return p0

    :pswitch_4d
    const/4 p0, 0x3

    return p0

    :pswitch_4f
    const/4 p0, 0x1

    return p0

    nop

    :pswitch_data_52
    .packed-switch 0x1
        :pswitch_4f
        :pswitch_4d
        :pswitch_4b
        :pswitch_49
        :pswitch_46
        :pswitch_43
        :pswitch_40
        :pswitch_3d
        :pswitch_3a
        :pswitch_37
        :pswitch_35
        :pswitch_33
        :pswitch_30
        :pswitch_2d
        :pswitch_2a
        :pswitch_27
        :pswitch_24
        :pswitch_21
        :pswitch_1e
        :pswitch_1b
        :pswitch_18
        :pswitch_15
        :pswitch_12
        :pswitch_f
        :pswitch_b
        :pswitch_8
        :pswitch_5
    .end packed-switch
.end method

.method public static d(FII)I
    .registers 3

    invoke-static {p0}, Ljava/lang/Float;->hashCode(F)I

    move-result p0

    add-int/2addr p0, p1

    mul-int/2addr p0, p2

    return p0
.end method

.method public static e(Lh58;Lh58;)Lw4;
    .registers 3

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p0, Lw4;

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lw4;-><init>(Ljava/lang/Object;B)V

    return-object p0
.end method

.method public static f(Ljava/lang/Object;)Lpqh;
    .registers 1

    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    new-instance p0, Lpqh;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-object p0
.end method

.method public static g(Ljava/lang/Object;)Ljava/lang/ClassCastException;
    .registers 1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p0, Ljava/lang/ClassCastException;

    invoke-direct {p0}, Ljava/lang/ClassCastException;-><init>()V

    return-object p0
.end method

.method public static h(IILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 5

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static i(ILjava/lang/String;)Ljava/lang/String;
    .registers 3

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static j(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static k(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static l(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 6

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static m(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)Ljava/lang/String;
    .registers 4

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static n(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 5

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static o(IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuilder;
    .registers 6

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    return-object v0
.end method

.method public static p(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuilder;
    .registers 6

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    return-object v0
.end method

.method public static q(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuilder;
    .registers 6

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    return-object v0
.end method

.method public static r(IILjava/lang/String;Ljava/lang/String;Ljava/lang/StringBuilder;)V
    .registers 5

    invoke-virtual {p4, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p4, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    return-void
.end method

.method public static synthetic s(Ljava/lang/Object;)V
    .registers 1

    if-nez p0, :cond_3

    return-void

    :cond_3
    invoke-static {}, Lh9o;->t()V

    return-void
.end method

.method public static t(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 5

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0, p3}, Lads_mobile_sdk/xu0;->b(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static u(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static v(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic w(I)Ljava/lang/String;
    .registers 1

    packed-switch p0, :pswitch_data_18

    const/4 p0, 0x0

    throw p0

    :pswitch_5
    const-string p0, "none"

    return-object p0

    :pswitch_8
    const-string p0, "error"

    return-object p0

    :pswitch_b
    const-string p0, "warning"

    return-object p0

    :pswitch_e
    const-string p0, "info"

    return-object p0

    :pswitch_11
    const-string p0, "debug"

    return-object p0

    :pswitch_14
    const-string p0, "verbose"

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

.method public static synthetic x(I)Ljava/lang/String;
    .registers 1

    packed-switch p0, :pswitch_data_54

    const/4 p0, 0x0

    throw p0

    :pswitch_5
    const-string p0, "ILLEGAL"

    return-object p0

    :pswitch_8
    const-string p0, "AD_CHOICE"

    return-object p0

    :pswitch_b
    const-string p0, "VIDEO_EXIT_FULLSCREEN"

    return-object p0

    :pswitch_e
    const-string p0, "VIDEO_FULLSCREEN"

    return-object p0

    :pswitch_11
    const-string p0, "VIDEO_RESUME"

    return-object p0

    :pswitch_14
    const-string p0, "VIDEO_PAUSE"

    return-object p0

    :pswitch_17
    const-string p0, "VIDEO_STOP"

    return-object p0

    :pswitch_1a
    const-string p0, "VIDEO_SKIP"

    return-object p0

    :pswitch_1d
    const-string p0, "VIDEO_UNMUTE"

    return-object p0

    :pswitch_20
    const-string p0, "VIDEO_MUTE"

    return-object p0

    :pswitch_23
    const-string p0, "VIDEO_ERROR"

    return-object p0

    :pswitch_26
    const-string p0, "VIDEO_PROGRESS_97_PERCENT"

    return-object p0

    :pswitch_29
    const-string p0, "VIDEO_PROGRESS_15S"

    return-object p0

    :pswitch_2c
    const-string p0, "VIDEO_PROGRESS_2S"

    return-object p0

    :pswitch_2f
    const-string p0, "VIDEO_COMPLETE"

    return-object p0

    :pswitch_32
    const-string p0, "VIDEO_THIRDQUARTILE"

    return-object p0

    :pswitch_35
    const-string p0, "VIDEO_MIDPOINT"

    return-object p0

    :pswitch_38
    const-string p0, "VIDEO_FIRSTQUARTILE"

    return-object p0

    :pswitch_3b
    const-string p0, "VIDEO_START"

    return-object p0

    :pswitch_3e
    const-string p0, "VIDEO_LOAD"

    return-object p0

    :pswitch_41
    const-string p0, "MISSING"

    return-object p0

    :pswitch_44
    const-string p0, "DISCARD"

    return-object p0

    :pswitch_47
    const-string p0, "CLICK"

    return-object p0

    :pswitch_4a
    const-string p0, "IMPRESSION_FAIL"

    return-object p0

    :pswitch_4d
    const-string p0, "VIEWABLE_IMPRESSION"

    return-object p0

    :pswitch_50
    const-string p0, "IMPRESSION"

    return-object p0

    nop

    :pswitch_data_54
    .packed-switch 0x1
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
