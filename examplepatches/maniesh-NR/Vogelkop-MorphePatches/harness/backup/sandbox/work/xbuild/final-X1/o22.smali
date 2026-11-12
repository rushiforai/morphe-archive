.class public final synthetic Lo22;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;
.implements Lkr9;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lx22;


# direct methods
.method public synthetic constructor <init>(Lx22;B)V
    .registers 3

    iput-byte p2, p0, Lo22;->a:B

    iput-object p1, p0, Lo22;->b:Lx22;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()Lbr9;
    .registers 10

    iget-byte v0, p0, Lo22;->a:B

    packed-switch v0, :pswitch_data_26

    new-instance v1, Lnr9;

    const-string v6, "pickCameraOnError(Lcom/opera/android/webaiassistant/WebAiAssistantViewModel$CameraError;)V"

    const/4 v7, 0x0

    const/4 v2, 0x1

    iget-object v3, p0, Lo22;->b:Lx22;

    const-class v4, Lx22;

    const-string v5, "pickCameraOnError"

    invoke-direct/range {v1 .. v7}, Lmr9;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-object v1

    :pswitch_15
    new-instance v2, Lnr9;

    const-string v7, "pickCameraOnError(Lcom/opera/android/webaiassistant/WebAiAssistantViewModel$CameraError;)V"

    const/4 v8, 0x0

    const/4 v3, 0x1

    iget-object v4, p0, Lo22;->b:Lx22;

    const-class v5, Lx22;

    const-string v6, "pickCameraOnError"

    invoke-direct/range {v2 .. v8}, Lmr9;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-object v2

    nop

    :pswitch_data_26
    .packed-switch 0x0
        :pswitch_15
    .end packed-switch
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    iget-byte v0, p0, Lo22;->a:B

    const/4 v1, 0x0

    packed-switch v0, :pswitch_data_34

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

    :pswitch_data_34
    .packed-switch 0x0
        :pswitch_1d
    .end packed-switch
.end method

.method public final hashCode()I
    .registers 2

    iget-byte v0, p0, Lo22;->a:B

    packed-switch v0, :pswitch_data_18

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

    nop

    :pswitch_data_18
    .packed-switch 0x0
        :pswitch_e
    .end packed-switch
.end method

.method public final run(Ljava/lang/Object;)V
    .registers 3

    iget-byte v0, p0, Lo22;->a:B

    iget-object p0, p0, Lo22;->b:Lx22;

    packed-switch v0, :pswitch_data_14

    check-cast p1, Lxrn;

    invoke-virtual {p0, p1}, Lx22;->i(Lxrn;)V

    return-void

    :pswitch_d
    check-cast p1, Lxrn;

    invoke-virtual {p0, p1}, Lx22;->i(Lxrn;)V

    return-void

    nop

    :pswitch_data_14
    .packed-switch 0x0
        :pswitch_d
    .end packed-switch
.end method
