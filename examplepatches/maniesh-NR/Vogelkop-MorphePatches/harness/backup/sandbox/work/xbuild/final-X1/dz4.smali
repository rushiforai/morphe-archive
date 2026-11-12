.class public final Ldz4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lbag;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lcom/opera/api/Callback;


# direct methods
.method public constructor <init>(Lcom/opera/android/browser/chromium/ChromiumContent;Lcom/opera/api/Callback;)V
    .registers 3

    const/4 p1, 0x0

    iput-byte p1, p0, Ldz4;->a:B

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Ldz4;->b:Lcom/opera/api/Callback;

    return-void
.end method

.method public constructor <init>(Lcom/opera/api/Callback;)V
    .registers 3

    const/4 v0, 0x1

    iput-byte v0, p0, Ldz4;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ldz4;->b:Lcom/opera/api/Callback;

    return-void
.end method


# virtual methods
.method public final g(Landroid/app/Activity;Ljava/util/List;)Lv9g;
    .registers 4

    iget-byte p0, p0, Ldz4;->a:B

    packed-switch p0, :pswitch_data_30

    new-instance p0, Lt9g;

    const p2, 0x7f1405d1

    invoke-virtual {p1, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p2

    const v0, 0x7f1405d2

    invoke-direct {p0, p1, v0, p2}, Lt9g;-><init>(Landroid/app/Activity;ILjava/lang/String;)V

    return-object p0

    :pswitch_15
    const p0, 0x7f1401b7

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    new-instance p2, Lt9g;

    const v0, 0x7f140cda

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {p1, v0, p0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    const v0, 0x7f140cd5

    invoke-direct {p2, p1, v0, p0}, Lt9g;-><init>(Landroid/app/Activity;ILjava/lang/String;)V

    return-object p2

    :pswitch_data_30
    .packed-switch 0x0
        :pswitch_15
    .end packed-switch
.end method

.method public final n(Ldx3;Ljava/util/ArrayList;)Lv9g;
    .registers 4

    iget-byte p0, p0, Ldz4;->a:B

    const p2, 0x7f1401b7

    packed-switch p0, :pswitch_data_32

    invoke-virtual {p1, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    new-instance p2, Lt9g;

    const v0, 0x7f1405d0

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {p1, v0, p0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {p2, p1, p0}, Lt9g;-><init>(Ldx3;Ljava/lang/String;)V

    return-object p2

    :pswitch_1d
    invoke-virtual {p1, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    new-instance p2, Lt9g;

    const v0, 0x7f140cda

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {p1, v0, p0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {p2, p1, p0}, Lt9g;-><init>(Ldx3;Ljava/lang/String;)V

    return-object p2

    :pswitch_data_32
    .packed-switch 0x0
        :pswitch_1d
    .end packed-switch
.end method

.method public final s()V
    .registers 2

    iget-byte v0, p0, Ldz4;->a:B

    iget-object p0, p0, Ldz4;->b:Lcom/opera/api/Callback;

    packed-switch v0, :pswitch_data_14

    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-interface {p0, v0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_d
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-interface {p0, v0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    nop

    :pswitch_data_14
    .packed-switch 0x0
        :pswitch_d
    .end packed-switch
.end method

.method public final t()V
    .registers 2

    iget-byte v0, p0, Ldz4;->a:B

    iget-object p0, p0, Ldz4;->b:Lcom/opera/api/Callback;

    packed-switch v0, :pswitch_data_14

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-interface {p0, v0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_d
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-interface {p0, v0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    nop

    :pswitch_data_14
    .packed-switch 0x0
        :pswitch_d
    .end packed-switch
.end method
