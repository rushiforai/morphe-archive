.class public final Lcf7;
.super Lo93;
.source "SourceFile"


# instance fields
.field public final synthetic c:B

.field public final d:Ljava/lang/Object;

.field public final e:Ljava/lang/Object;

.field public final f:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lre7;)V
    .registers 4

    const/4 v0, 0x0

    iput-byte v0, p0, Lcf7;->c:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcf7;->e:Ljava/lang/Object;

    iput-object p2, p0, Lcf7;->d:Ljava/lang/Object;

    new-instance p1, Lbf7;

    invoke-direct {p1, p0, v0}, Lbf7;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lcf7;->f:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lgcj;Ljava/lang/String;Landroid/net/Uri;)V
    .registers 5

    const/4 v0, 0x2

    iput-byte v0, p0, Lcf7;->c:B

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    iput-object p1, p0, Lcf7;->e:Ljava/lang/Object;

    iput-object p2, p0, Lcf7;->d:Ljava/lang/Object;

    iput-object p3, p0, Lcf7;->f:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/opera/android/BrowserActivity;Lre7;)V
    .registers 5

    const/4 v0, 0x1

    iput-byte v0, p0, Lcf7;->c:B

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    iput-object p1, p0, Lcf7;->e:Ljava/lang/Object;

    iput-object p2, p0, Lcf7;->f:Ljava/lang/Object;

    iput-object p3, p0, Lcf7;->d:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final d()Z
    .registers 2

    iget-byte v0, p0, Lcf7;->c:B

    packed-switch v0, :pswitch_data_16

    invoke-super {p0}, Lo93;->d()Z

    move-result p0

    return p0

    :pswitch_a
    iget-object p0, p0, Lcf7;->d:Ljava/lang/Object;

    check-cast p0, Lre7;

    invoke-virtual {p0}, Lre7;->l()Z

    move-result p0

    xor-int/lit8 p0, p0, 0x1

    return p0

    nop

    :pswitch_data_16
    .packed-switch 0x0
        :pswitch_a
    .end packed-switch
.end method

.method public final e(Landroid/view/View;)Lgtj;
    .registers 8

    iget-byte v0, p0, Lcf7;->c:B

    const v1, 0x7f1405b5

    iget-object v2, p0, Lcf7;->e:Ljava/lang/Object;

    iget-object v3, p0, Lcf7;->f:Ljava/lang/Object;

    const/16 v4, 0x1388

    iget-object v5, p0, Lcf7;->d:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_6a

    check-cast v2, Lgcj;

    iget-object p0, v2, Lgcj;->r:Ldx3;

    check-cast v5, Ljava/lang/String;

    filled-new-array {v5}, [Ljava/lang/Object;

    move-result-object v0

    const v1, 0x7f1405b4

    invoke-virtual {p0, v1, v0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p0, v4}, Lgtj;->e(Landroid/view/View;Ljava/lang/CharSequence;I)Lgtj;

    move-result-object p0

    check-cast v3, Landroid/net/Uri;

    new-instance p1, Lj5g;

    const/16 v0, 0xc

    invoke-direct {p1, v3, v2, v0}, Lj5g;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    const v0, 0x7f141364

    invoke-virtual {p0, v0, p1}, Lgtj;->f(ILandroid/view/View$OnClickListener;)V

    return-object p0

    :pswitch_35
    check-cast v2, Ljava/lang/String;

    invoke-static {p1, v2, v4}, Lgtj;->e(Landroid/view/View;Ljava/lang/CharSequence;I)Lgtj;

    move-result-object p0

    check-cast v3, Lcom/opera/android/BrowserActivity;

    check-cast v5, Lre7;

    new-instance p1, Ljf7;

    const/4 v0, 0x0

    invoke-direct {p1, v3, v5, v0}, Ljf7;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p0, v1, p1}, Lgtj;->f(ILandroid/view/View$OnClickListener;)V

    return-object p0

    :pswitch_49
    check-cast v5, Lre7;

    check-cast v3, Lbf7;

    iget-object v0, v5, Lre7;->u:Lh7f;

    invoke-virtual {v0, v3}, Lh7f;->b(Ljava/lang/Object;)Z

    new-instance v0, Lrxh;

    const v2, 0x7f1405dc

    invoke-direct {v0, v2}, Lrxh;-><init>(I)V

    const/4 v2, 0x0

    invoke-static {p1, v0, v4, v2}, Lgtj;->d(Landroid/view/View;Lpxh;ILandroid/view/View;)Lgtj;

    move-result-object p1

    new-instance v0, Lyk4;

    const/16 v2, 0xb

    invoke-direct {v0, p0, v2}, Lyk4;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, v1, v0}, Lgtj;->f(ILandroid/view/View$OnClickListener;)V

    return-object p1

    :pswitch_data_6a
    .packed-switch 0x0
        :pswitch_49
        :pswitch_35
    .end packed-switch
.end method

.method public final f(I)V
    .registers 2

    iget-byte p1, p0, Lcf7;->c:B

    packed-switch p1, :pswitch_data_12

    return-void

    :pswitch_6
    iget-object p1, p0, Lcf7;->d:Ljava/lang/Object;

    check-cast p1, Lre7;

    iget-object p0, p0, Lcf7;->f:Ljava/lang/Object;

    check-cast p0, Lbf7;

    invoke-virtual {p1, p0}, Lre7;->t(Lqe7;)V

    return-void

    :pswitch_data_12
    .packed-switch 0x0
        :pswitch_6
    .end packed-switch
.end method
