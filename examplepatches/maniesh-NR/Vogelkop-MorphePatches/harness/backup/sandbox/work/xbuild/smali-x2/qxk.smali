.class public final synthetic Lqxk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lrxk;


# direct methods
.method public synthetic constructor <init>(Lrxk;B)V
    .registers 3

    iput-byte p2, p0, Lqxk;->a:B

    iput-object p1, p0, Lqxk;->b:Lrxk;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 4

    iget-byte p1, p0, Lqxk;->a:B

    const/4 v0, 0x0

    const/4 v1, 0x0

    iget-object p0, p0, Lqxk;->b:Lrxk;

    packed-switch p1, :pswitch_data_34

    iget-object p0, p0, Lrxk;->c:Lz4k;

    iget-object p0, p0, Lz4k;->b:Ljava/lang/Object;

    check-cast p0, Ldyk;

    iget-object p0, p0, Ldyk;->j:Lkxk;

    iget-object p0, p0, Lkxk;->f:Landroidx/fragment/app/w;

    invoke-static {p0, v1, v0}, Lxih;->t(Landroidx/fragment/app/w;ZLtvh;)V

    return-void

    :pswitch_17
    iget-object p0, p0, Lrxk;->c:Lz4k;

    iget-object p0, p0, Lz4k;->b:Ljava/lang/Object;

    check-cast p0, Ldyk;

    iget-object p0, p0, Ldyk;->j:Lkxk;

    iget-object p0, p0, Lkxk;->f:Landroidx/fragment/app/w;

    invoke-static {p0, v1, v0}, Lxih;->t(Landroidx/fragment/app/w;ZLtvh;)V

    return-void

    :pswitch_25
    iget-object p0, p0, Lrxk;->c:Lz4k;

    iget-object p0, p0, Lz4k;->b:Ljava/lang/Object;

    check-cast p0, Ldyk;

    iget-object p0, p0, Ldyk;->j:Lkxk;

    iget-object p0, p0, Lkxk;->e:Lcom/opera/android/BrowserActivity;

    invoke-static {p0}, Lna2;->T(Landroid/content/Context;)V

    return-void

    nop

    :pswitch_data_34
    .packed-switch 0x0
        :pswitch_25
        :pswitch_17
    .end packed-switch
.end method
