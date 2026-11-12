.class public final Ls00;
.super Lbqi;
.source "SourceFile"


# static fields
.field public static u:Z

.field public static v:Z

.field public static w:I


# instance fields
.field public final p:Lcom/opera/android/settings/SettingsManager;

.field public final q:Lesk;

.field public final r:Lzv9;

.field public s:Landroid/location/Location;

.field public t:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/app/Activity;Lcom/opera/android/settings/SettingsManager;Lesk;Lrm;Ljava/lang/String;Lpyl;Luwh;Lqfb;Lr68;Li3j;Lap;Lr9g;Li5o;Lzv9;)V
    .registers 29

    move-object/from16 v0, p13

    const-string v2, "AdxAdsProvider"

    sget-object v4, Lyo;->c:Lyo;

    move-object v1, p0

    move-object v3, p1

    move-object/from16 v5, p4

    move-object/from16 v6, p5

    move-object/from16 v7, p6

    move-object/from16 v8, p7

    move-object/from16 v9, p8

    move-object/from16 v10, p9

    move-object/from16 v11, p10

    move-object/from16 v12, p11

    move-object/from16 v13, p12

    invoke-direct/range {v1 .. v13}, Lbqi;-><init>(Ljava/lang/String;Landroid/app/Activity;Lyo;Lrm;Ljava/lang/String;Lpyl;Luwh;Lqfb;Lr68;Li3j;Lap;Lr9g;)V

    move-object/from16 p1, p2

    iput-object p1, p0, Ls00;->p:Lcom/opera/android/settings/SettingsManager;

    move-object/from16 p1, p3

    iput-object p1, p0, Ls00;->q:Lesk;

    move-object/from16 p1, p14

    iput-object p1, p0, Ls00;->r:Lzv9;

    new-instance p1, Lab;

    const/4 v2, 0x4

    invoke-direct {p1, p0, v2}, Lab;-><init>(Ljava/lang/Object;B)V

    iget-object p0, v0, Li5o;->a:Ljava/lang/Object;

    check-cast p0, Liy;

    new-instance v1, Lxa;

    const/4 v2, 0x6

    invoke-direct {v1, v0, p1, v2}, Lxa;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p0, v1}, Liy;->d(Ljava/lang/Runnable;)Ljava/lang/Runnable;

    return-void
.end method

.method public static p(Lw06;)Lv50;
    .registers 2

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    sget-object v0, Lv50;->j:Lv50;

    packed-switch p0, :pswitch_data_2c

    :pswitch_9
    return-object v0

    :pswitch_a
    sget-object p0, Lv50;->c:Lv50;

    return-object p0

    :pswitch_d
    sget-object p0, Lv50;->l:Lv50;

    return-object p0

    :pswitch_10
    sget-object p0, Lv50;->g:Lv50;

    return-object p0

    :pswitch_13
    sget-object p0, Lv50;->f:Lv50;

    return-object p0

    :pswitch_16
    sget-object p0, Lv50;->e:Lv50;

    return-object p0

    :pswitch_19
    sget-object p0, Lv50;->d:Lv50;

    return-object p0

    :pswitch_1c
    sget-object p0, Lv50;->k:Lv50;

    return-object p0

    :pswitch_1f
    sget-object p0, Lv50;->m:Lv50;

    return-object p0

    :pswitch_22
    sget-object p0, Lv50;->h:Lv50;

    return-object p0

    :pswitch_25
    sget-object p0, Lv50;->i:Lv50;

    return-object p0

    :pswitch_28
    sget-object p0, Lv50;->b:Lv50;

    return-object p0

    nop

    :pswitch_data_2c
    .packed-switch 0x0
        :pswitch_28
        :pswitch_25
        :pswitch_25
        :pswitch_28
        :pswitch_25
        :pswitch_25
        :pswitch_25
        :pswitch_25
        :pswitch_22
        :pswitch_25
        :pswitch_25
        :pswitch_1f
        :pswitch_1c
        :pswitch_19
        :pswitch_16
        :pswitch_13
        :pswitch_25
        :pswitch_1c
        :pswitch_25
        :pswitch_10
        :pswitch_10
        :pswitch_10
        :pswitch_d
        :pswitch_d
        :pswitch_d
        :pswitch_a
        :pswitch_25
        :pswitch_9
    .end packed-switch
.end method

.method public static q(Lw06;I)Z
    .registers 4

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    const/4 v0, 0x1

    if-eqz p0, :cond_22

    const/16 v1, 0x8

    if-eq p0, v1, :cond_1d

    const/4 v1, 0x3

    if-eq p0, v1, :cond_1d

    const/4 v1, 0x4

    if-eq p0, v1, :cond_18

    packed-switch p0, :pswitch_data_24

    packed-switch p0, :pswitch_data_32

    goto :goto_20

    :cond_18
    :pswitch_18
    and-int/lit8 p1, p1, 0x2

    if-eqz p1, :cond_20

    goto :goto_22

    :cond_1d
    :pswitch_1d
    and-int/2addr p1, v0

    if-nez p1, :cond_22

    :cond_20
    :goto_20
    const/4 p0, 0x0

    return p0

    :cond_22
    :goto_22
    :pswitch_22
    return v0

    nop

    :pswitch_data_24
    .packed-switch 0xb
        :pswitch_1d
        :pswitch_18
        :pswitch_1d
        :pswitch_1d
        :pswitch_1d
    .end packed-switch

    :pswitch_data_32
    .packed-switch 0x13
        :pswitch_1d
        :pswitch_1d
        :pswitch_1d
        :pswitch_22
        :pswitch_22
        :pswitch_1d
        :pswitch_1d
    .end packed-switch
.end method


# virtual methods
.method public final a()Z
    .registers 2

    sget-boolean v0, Ls00;->v:Z

    if-eqz v0, :cond_6

    const/4 p0, 0x0

    return p0

    :cond_6
    invoke-super {p0}, Lbqi;->a()Z

    move-result p0

    return p0
.end method

.method public final c()I
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final l(Lzy;Laz;)Lk43;
    .registers 9

    invoke-virtual {p0}, Lbqi;->m()Landroid/app/Activity;

    move-result-object v2

    iget-object v0, p0, Lbqi;->g:Ljava/lang/String;

    const/4 v1, 0x0

    if-eqz v2, :cond_62

    sget-boolean v3, Ls00;->v:Z

    if-nez v3, :cond_62

    invoke-interface {p2}, Laz;->a()Ldl;

    move-result-object v4

    invoke-interface {p2}, Laz;->f()Z

    move-result v3

    iget-object v5, p0, Lbqi;->f:Lrm;

    if-eqz v3, :cond_3d

    invoke-interface {p2}, Laz;->b()Z

    move-result p2

    if-eqz p2, :cond_29

    const-string p0, "ad provider does not support offline requests"

    invoke-static {p0, v0}, Lbqi;->n(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-interface {p1, p0}, Lzy;->onFailed(Ljava/lang/String;)V

    return-object v1

    :cond_29
    sget-object p2, Lrm;->f:Lrm;

    if-ne v5, p2, :cond_36

    new-instance v0, Lq00;

    const/4 v5, 0x0

    move-object v1, p0

    move-object v3, p1

    invoke-direct/range {v0 .. v5}, Lq00;-><init>(Ls00;Landroid/app/Activity;Lzy;Ldl;B)V

    return-object v0

    :cond_36
    move-object v3, p1

    const-string p0, "Facebook bidding is no longer supported"

    invoke-interface {v3, p0}, Lzy;->onFailed(Ljava/lang/String;)V

    return-object v1

    :cond_3d
    move-object v3, v1

    move-object v1, p0

    move-object p0, v3

    move-object v3, p1

    sget-object p1, Lrm;->b:Lrm;

    if-ne v5, p1, :cond_58

    invoke-interface {p2}, Laz;->b()Z

    move-result p0

    if-eqz p0, :cond_51

    new-instance p0, Lr00;

    invoke-direct {p0, v1, v2, v3, v4}, Lr00;-><init>(Ls00;Landroid/app/Activity;Lzy;Ldl;)V

    return-object p0

    :cond_51
    new-instance v0, Lq00;

    const/4 v5, 0x1

    invoke-direct/range {v0 .. v5}, Lq00;-><init>(Ls00;Landroid/app/Activity;Lzy;Ldl;B)V

    return-object v0

    :cond_58
    const-string p1, "ad format not supported"

    invoke-static {p1, v0}, Lbqi;->n(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v3, p1}, Lzy;->onFailed(Ljava/lang/String;)V

    return-object p0

    :cond_62
    move-object v3, p1

    move-object p0, v1

    const-string p1, "ads provider not available"

    invoke-static {p1, v0}, Lbqi;->n(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v3, p1}, Lzy;->onFailed(Ljava/lang/String;)V

    return-object p0
.end method

.method public final r()[D
    .registers 7

    iget-object v0, p0, Ls00;->p:Lcom/opera/android/settings/SettingsManager;

    const-string v1, "process_location"

    invoke-virtual {v0, v1}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4c

    iget-object v0, p0, Ls00;->s:Landroid/location/Location;

    if-nez v0, :cond_28

    iget-object v0, p0, Ls00;->r:Lzv9;

    invoke-virtual {v0}, Lzv9;->a()Lyv9;

    move-result-object v0

    new-instance v1, Landroid/location/Location;

    const-string v2, ""

    invoke-direct {v1, v2}, Landroid/location/Location;-><init>(Ljava/lang/String;)V

    iget-wide v2, v0, Lyv9;->a:D

    invoke-virtual {v1, v2, v3}, Landroid/location/Location;->setLatitude(D)V

    iget-wide v2, v0, Lyv9;->b:D

    invoke-virtual {v1, v2, v3}, Landroid/location/Location;->setLongitude(D)V

    iput-object v1, p0, Ls00;->s:Landroid/location/Location;

    move-object v0, v1

    :cond_28
    if-eqz v0, :cond_4c

    invoke-virtual {v0}, Landroid/location/Location;->getLatitude()D

    move-result-wide v0

    const-wide/high16 v2, 0x4024000000000000L    # 10.0

    mul-double/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->floor(D)D

    move-result-wide v0

    div-double/2addr v0, v2

    iget-object p0, p0, Ls00;->s:Landroid/location/Location;

    invoke-virtual {p0}, Landroid/location/Location;->getLongitude()D

    move-result-wide v4

    mul-double/2addr v4, v2

    invoke-static {v4, v5}, Ljava/lang/Math;->floor(D)D

    move-result-wide v4

    div-double/2addr v4, v2

    const/4 p0, 0x2

    new-array p0, p0, [D

    const/4 v2, 0x0

    aput-wide v0, p0, v2

    const/4 v0, 0x1

    aput-wide v4, p0, v0

    return-object p0

    :cond_4c
    const/4 p0, 0x0

    return-object p0
.end method
