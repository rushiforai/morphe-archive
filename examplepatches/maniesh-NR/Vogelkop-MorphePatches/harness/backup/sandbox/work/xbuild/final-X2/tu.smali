.class public final synthetic Ltu;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;
.implements Lkr9;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Ltu;->a:B

    iput-object p1, p0, Ltu;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()Lbr9;
    .registers 12

    iget-byte v0, p0, Ltu;->a:B

    iget-object p0, p0, Ltu;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_e0

    check-cast p0, Llz8;

    return-object p0

    :pswitch_a
    new-instance v0, Lnr9;

    move-object v2, p0

    check-cast v2, Lmqn;

    const-string v5, "pickCameraOnError(Lcom/opera/android/webaiassistant/WebAiAssistantViewModel$CameraError;)V"

    const/4 v6, 0x0

    const/4 v1, 0x1

    const-class v3, Llqn;

    const-string v4, "pickCameraOnError"

    invoke-direct/range {v0 .. v6}, Lmr9;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-object v0

    :pswitch_1b
    new-instance v1, Lnr9;

    move-object v3, p0

    check-cast v3, Llqn;

    const-string v6, "pickCameraOnError(Lcom/opera/android/webaiassistant/WebAiAssistantViewModel$CameraError;)V"

    const/4 v7, 0x0

    const/4 v2, 0x1

    const-class v4, Llqn;

    const-string v5, "pickCameraOnError"

    invoke-direct/range {v1 .. v7}, Lmr9;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-object v1

    :pswitch_2c
    new-instance v2, Lnr9;

    move-object v4, p0

    check-cast v4, Lpjn;

    const-string v7, "onBitmapLoaded(Landroid/graphics/Bitmap;)V"

    const/4 v8, 0x0

    const/4 v3, 0x1

    const-class v5, Lpjn;

    const-string v6, "onBitmapLoaded"

    invoke-direct/range {v2 .. v8}, Lmr9;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-object v2

    :pswitch_3d
    check-cast p0, Ln6k;

    return-object p0

    :pswitch_40
    new-instance v0, Lnr9;

    move-object v2, p0

    check-cast v2, Lqwk;

    const-string v5, "checkSyncPasswordsStatus(Z)V"

    const/4 v6, 0x0

    const/4 v1, 0x1

    const-class v3, Lqwk;

    const-string v4, "checkSyncPasswordsStatus"

    invoke-direct/range {v0 .. v6}, Lmr9;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-object v0

    :pswitch_51
    new-instance v1, Lnr9;

    move-object v3, p0

    check-cast v3, Lxl2;

    const-string v6, "onFinished(Landroid/graphics/drawable/Drawable;)V"

    const/4 v7, 0x0

    const/4 v2, 0x1

    const-class v4, Lxl2;

    const-string v5, "onFinished"

    invoke-direct/range {v1 .. v7}, Lmr9;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-object v1

    :pswitch_62
    new-instance v2, Lnr9;

    move-object v4, p0

    check-cast v4, Lvqi;

    const-string v7, "onDataUpdated(Ljava/util/List;)V"

    const/4 v8, 0x0

    const/4 v3, 0x1

    const-class v5, Lvqi;

    const-string v6, "onDataUpdated"

    invoke-direct/range {v2 .. v8}, Lmr9;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-object v2

    :pswitch_73
    new-instance v3, Lnr9;

    move-object v5, p0

    check-cast v5, Ls9i;

    const-string v8, "transferRequestToWeb(Ljava/lang/String;)V"

    const/4 v9, 0x0

    const/4 v4, 0x1

    const-class v6, Ls9i;

    const-string v7, "transferRequestToWeb"

    invoke-direct/range {v3 .. v9}, Lmr9;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-object v3

    :pswitch_84
    new-instance v4, Lnr9;

    move-object v6, p0

    check-cast v6, Lr9i;

    const-string v9, "transferRequestToWeb(Ljava/lang/String;)V"

    const/4 v10, 0x0

    const/4 v5, 0x1

    const-class v7, Lr9i;

    const-string v8, "transferRequestToWeb"

    invoke-direct/range {v4 .. v10}, Lmr9;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-object v4

    :pswitch_95
    check-cast p0, Lrmg;

    return-object p0

    :pswitch_98
    new-instance v0, Lnr9;

    move-object v2, p0

    check-cast v2, Lcom/opera/android/downloads/DownloadJobService;

    const-string v5, "updateNotification(Landroid/app/Notification;)V"

    const/4 v6, 0x0

    const/4 v1, 0x1

    const-class v3, Lcom/opera/android/downloads/DownloadJobService;

    const-string v4, "updateNotification"

    invoke-direct/range {v0 .. v6}, Lmr9;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-object v0

    :pswitch_a9
    new-instance v1, Lnr9;

    move-object v3, p0

    check-cast v3, Lc47;

    const-string v6, "report(Ljava/util/List;)V"

    const/4 v7, 0x0

    const/4 v2, 0x1

    const-class v4, Lc47;

    const-string v5, "report"

    invoke-direct/range {v1 .. v7}, Lmr9;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-object v1

    :pswitch_ba
    check-cast p0, Lyo7;

    return-object p0

    :pswitch_bd
    new-instance v0, Lnr9;

    move-object v2, p0

    check-cast v2, Lxt5;

    const-string v5, "setBitmap(Landroid/graphics/Bitmap;)V"

    const/4 v6, 0x0

    const/4 v1, 0x1

    const-class v3, Lxt5;

    const-string v4, "setBitmap"

    invoke-direct/range {v0 .. v6}, Lmr9;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-object v0

    :pswitch_ce
    new-instance v1, Lnr9;

    move-object v3, p0

    check-cast v3, Lode;

    const-string v6, "setValue(Ljava/lang/Object;)V"

    const/4 v7, 0x0

    const/4 v2, 0x1

    const-class v4, Lode;

    const-string v5, "setValue"

    invoke-direct/range {v1 .. v7}, Lmr9;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-object v1

    nop

    :pswitch_data_e0
    .packed-switch 0x0
        :pswitch_ce
        :pswitch_bd
        :pswitch_ba
        :pswitch_a9
        :pswitch_98
        :pswitch_95
        :pswitch_84
        :pswitch_73
        :pswitch_62
        :pswitch_51
        :pswitch_40
        :pswitch_3d
        :pswitch_2c
        :pswitch_1b
        :pswitch_a
    .end packed-switch
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    iget-byte v0, p0, Ltu;->a:B

    const/4 v1, 0x0

    packed-switch v0, :pswitch_data_176

    instance-of v0, p1, Lcom/opera/api/Callback;

    if-eqz v0, :cond_1c

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_1c

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_1c
    return v1

    :pswitch_1d
    instance-of v0, p1, Lcom/opera/api/Callback;

    if-eqz v0, :cond_33

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_33

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_33
    return v1

    :pswitch_34
    instance-of v0, p1, Lcom/opera/api/Callback;

    if-eqz v0, :cond_4a

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_4a

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_4a
    return v1

    :pswitch_4b
    instance-of v0, p1, Lcom/opera/api/Callback;

    if-eqz v0, :cond_61

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_61

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_61
    return v1

    :pswitch_62
    instance-of v0, p1, Lcom/opera/api/Callback;

    if-eqz v0, :cond_78

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_78

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_78
    return v1

    :pswitch_79
    instance-of v0, p1, Lcom/opera/api/Callback;

    if-eqz v0, :cond_8f

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_8f

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_8f
    return v1

    :pswitch_90
    instance-of v0, p1, Lcom/opera/api/Callback;

    if-eqz v0, :cond_a6

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_a6

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_a6
    return v1

    :pswitch_a7
    instance-of v0, p1, Lcom/opera/api/Callback;

    if-eqz v0, :cond_bd

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_bd

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_bd
    return v1

    :pswitch_be
    instance-of v0, p1, Lcom/opera/api/Callback;

    if-eqz v0, :cond_d4

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_d4

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_d4
    return v1

    :pswitch_d5
    instance-of v0, p1, Lcom/opera/api/Callback;

    if-eqz v0, :cond_eb

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_eb

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_eb
    return v1

    :pswitch_ec
    instance-of v0, p1, Lcom/opera/api/Callback;

    if-eqz v0, :cond_102

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_102

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_102
    return v1

    :pswitch_103
    instance-of v0, p1, Lcom/opera/api/Callback;

    if-eqz v0, :cond_119

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_119

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_119
    return v1

    :pswitch_11a
    instance-of v0, p1, Lcom/opera/api/Callback;

    if-eqz v0, :cond_130

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_130

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_130
    return v1

    :pswitch_131
    instance-of v0, p1, Lcom/opera/api/Callback;

    if-eqz v0, :cond_147

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_147

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_147
    return v1

    :pswitch_148
    instance-of v0, p1, Lcom/opera/api/Callback;

    if-eqz v0, :cond_15e

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_15e

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_15e
    return v1

    :pswitch_15f
    instance-of v0, p1, Lcom/opera/api/Callback;

    if-eqz v0, :cond_175

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_175

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_175
    return v1

    :pswitch_data_176
    .packed-switch 0x0
        :pswitch_15f
        :pswitch_148
        :pswitch_131
        :pswitch_11a
        :pswitch_103
        :pswitch_ec
        :pswitch_d5
        :pswitch_be
        :pswitch_a7
        :pswitch_90
        :pswitch_79
        :pswitch_62
        :pswitch_4b
        :pswitch_34
        :pswitch_1d
    .end packed-switch
.end method

.method public final hashCode()I
    .registers 2

    iget-byte v0, p0, Ltu;->a:B

    packed-switch v0, :pswitch_data_96

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_e
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_17
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_20
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_29
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_32
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_3b
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_44
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_4d
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_56
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_5f
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_68
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_71
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_7a
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_83
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_8c
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    nop

    :pswitch_data_96
    .packed-switch 0x0
        :pswitch_8c
        :pswitch_83
        :pswitch_7a
        :pswitch_71
        :pswitch_68
        :pswitch_5f
        :pswitch_56
        :pswitch_4d
        :pswitch_44
        :pswitch_3b
        :pswitch_32
        :pswitch_29
        :pswitch_20
        :pswitch_17
        :pswitch_e
    .end packed-switch
.end method

.method public final run(Ljava/lang/Object;)V
    .registers 9

    iget-byte v0, p0, Ltu;->a:B

    const-wide/16 v1, 0x0

    iget-object p0, p0, Ltu;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_f2

    check-cast p0, Llz8;

    invoke-virtual {p0, p1}, Llz8;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_f
    check-cast p1, Lxrn;

    check-cast p0, Lmqn;

    invoke-virtual {p0, p1}, Llqn;->J0(Lxrn;)V

    return-void

    :pswitch_17
    check-cast p1, Lxrn;

    check-cast p0, Llqn;

    invoke-virtual {p0, p1}, Llqn;->J0(Lxrn;)V

    return-void

    :pswitch_1f
    check-cast p1, Landroid/graphics/Bitmap;

    check-cast p0, Lpjn;

    iget-object v0, p0, Lpjn;->b:Ljava/lang/Object;

    check-cast v0, Lqjn;

    iput-object p1, v0, Lqjn;->g:Landroid/graphics/Bitmap;

    new-instance p1, Lcnn;

    invoke-direct {p1, v0}, Lcnn;-><init>(Lqjn;)V

    iput-object p1, v0, Lqjn;->h:Ldnn;

    invoke-virtual {p0}, Lpjn;->n()V

    return-void

    :pswitch_34
    check-cast p0, Ln6k;

    invoke-virtual {p0, p1}, Ln6k;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_3a
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    check-cast p0, Lqwk;

    invoke-virtual {p0, p1}, Lqwk;->D(Z)V

    return-void

    :pswitch_46
    check-cast p1, Landroid/graphics/drawable/Drawable;

    check-cast p0, Lxl2;

    invoke-interface {p0, p1}, Lxl2;->c(Landroid/graphics/drawable/Drawable;)V

    return-void

    :pswitch_4e
    check-cast p1, Ljava/util/List;

    check-cast p0, Lvqi;

    iget-object p0, p0, Lvqi;->f:Lode;

    invoke-virtual {p0, p1}, Lekc;->r(Ljava/lang/Object;)V

    return-void

    :pswitch_58
    check-cast p1, Ljava/lang/String;

    check-cast p0, Ls9i;

    iget-object p0, p0, Ls9i;->d:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/webcore/WebcoreRpcBridge;

    iget-wide v3, p0, Lcom/opera/android/webcore/WebcoreRpcBridge;->a:J

    cmp-long p0, v3, v1

    if-eqz p0, :cond_69

    invoke-static {v3, v4, p1}, LJ/N;->MM1UajSt(JLjava/lang/Object;)V

    :cond_69
    return-void

    :pswitch_6a
    check-cast p1, Ljava/lang/String;

    check-cast p0, Lr9i;

    iget-object p0, p0, Lr9i;->d:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/webcore/WebcoreRpcBridge;

    iget-wide v3, p0, Lcom/opera/android/webcore/WebcoreRpcBridge;->a:J

    cmp-long p0, v3, v1

    if-eqz p0, :cond_7b

    invoke-static {v3, v4, p1}, LJ/N;->MM1UajSt(JLjava/lang/Object;)V

    :cond_7b
    return-void

    :pswitch_7c
    check-cast p0, Lrmg;

    invoke-virtual {p0, p1}, Lrmg;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_82
    check-cast p1, Landroid/app/Notification;

    check-cast p0, Lcom/opera/android/downloads/DownloadJobService;

    sget v0, Lcom/opera/android/downloads/DownloadJobService;->d:I

    invoke-virtual {p0, p1}, Lcom/opera/android/downloads/DownloadJobService;->b(Landroid/app/Notification;)V

    return-void

    :pswitch_8c
    check-cast p1, Ljava/util/List;

    check-cast p0, Lc47;

    iget-object p0, p0, Lc47;->b:Lx5f;

    const/4 v0, 0x0

    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    sget-object v2, Lz37;->b:Lz37;

    const/4 v3, 0x1

    if-ne v1, v2, :cond_9e

    move v1, v3

    goto :goto_9f

    :cond_9e
    move v1, v0

    :goto_9f
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    if-ne v4, v2, :cond_a7

    move v4, v3

    goto :goto_a8

    :cond_a7
    move v4, v0

    :goto_a8
    const/4 v5, 0x2

    invoke-interface {p1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    if-ne v5, v2, :cond_b1

    move v5, v3

    goto :goto_b2

    :cond_b1
    move v5, v0

    :goto_b2
    const/4 v6, 0x3

    invoke-interface {p1, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v2, :cond_ba

    move v0, v3

    :cond_ba
    iget-object p1, p0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v2

    invoke-virtual {v2, p1}, Lx56;->L(Lzpa;)Lrr0;

    move-result-object p1

    const/16 v6, 0x16

    invoke-virtual {p1, v6, v3, v1}, Ljf0;->r(IIZ)V

    const/16 v1, 0x15

    invoke-virtual {p1, v1, v3, v4}, Ljf0;->r(IIZ)V

    const/16 v1, 0x17

    invoke-virtual {p1, v1, v3, v5}, Ljf0;->r(IIZ)V

    const/16 v1, 0x18

    invoke-virtual {p1, v1, v3, v0}, Ljf0;->r(IIZ)V

    invoke-virtual {p0, v2}, Lx5f;->U0(Lx56;)V

    return-void

    :pswitch_dc
    check-cast p0, Lyo7;

    invoke-virtual {p0, p1}, Lyo7;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_e2
    check-cast p1, Landroid/graphics/Bitmap;

    check-cast p0, Lxt5;

    invoke-virtual {p0, p1}, Lxt5;->U(Landroid/graphics/Bitmap;)V

    return-void

    :pswitch_ea
    check-cast p1, Ljava/util/List;

    check-cast p0, Lode;

    invoke-virtual {p0, p1}, Lekc;->r(Ljava/lang/Object;)V

    return-void

    :pswitch_data_f2
    .packed-switch 0x0
        :pswitch_ea
        :pswitch_e2
        :pswitch_dc
        :pswitch_8c
        :pswitch_82
        :pswitch_7c
        :pswitch_6a
        :pswitch_58
        :pswitch_4e
        :pswitch_46
        :pswitch_3a
        :pswitch_34
        :pswitch_1f
        :pswitch_17
        :pswitch_f
    .end packed-switch
.end method
