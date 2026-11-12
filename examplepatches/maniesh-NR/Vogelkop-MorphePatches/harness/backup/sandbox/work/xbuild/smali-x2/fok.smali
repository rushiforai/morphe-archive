.class public final synthetic Lfok;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lhok;

.field public final synthetic c:Landroid/content/Context;

.field public final synthetic d:Lhq8;


# direct methods
.method public synthetic constructor <init>(Lhok;Landroid/content/Context;Lhq8;B)V
    .registers 5

    iput-byte p4, p0, Lfok;->a:B

    iput-object p1, p0, Lfok;->b:Lhok;

    iput-object p2, p0, Lfok;->c:Landroid/content/Context;

    iput-object p3, p0, Lfok;->d:Lhq8;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 14

    iget-byte p1, p0, Lfok;->a:B

    const/4 v0, 0x0

    const/4 v1, 0x1

    iget-object v2, p0, Lfok;->d:Lhq8;

    iget-object v3, p0, Lfok;->b:Lhok;

    packed-switch p1, :pswitch_data_76

    iget-object p0, v3, Lhok;->C:Ljava/lang/Object;

    check-cast p0, Lipk;

    move-object p1, v2

    check-cast p1, Lqok;

    iget-object p1, p1, Lqok;->e:Look;

    iget-object v4, p0, Lipk;->c:Li32;

    iget-object v5, p1, Look;->b:Ljava/lang/String;

    iget-byte p1, p1, Look;->d:B

    invoke-virtual {v4, p1, v5}, Li32;->k(ILjava/lang/String;)Lnxd;

    move-result-object p1

    iget-boolean v5, p1, Lnxd;->f:Z

    if-nez v5, :cond_31

    iput-boolean v1, p1, Lnxd;->f:Z

    new-instance v1, Lnxd;

    invoke-direct {v1, p1}, Lnxd;-><init>(Lnxd;)V

    invoke-virtual {v4, v1}, Lldk;->g(Ljava/lang/Object;)V

    iget-object p0, p0, Lipk;->b:Ljs6;

    invoke-virtual {p0}, Ljs6;->a()V

    :cond_31
    invoke-virtual {v3, v2, v0}, Lhok;->b0(Lhq8;Z)V

    return-void

    :pswitch_35
    new-instance p1, Lmzj;

    invoke-virtual {v2}, Lhq8;->h()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2}, Lhq8;->f()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2}, Lhq8;->g()Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_67

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v7

    if-eqz v7, :cond_67

    new-instance v11, Lsok;

    invoke-direct {v11}, Lsok;-><init>()V

    iget-object p0, p0, Lfok;->c:Landroid/content/Context;

    invoke-static {p0}, Lnr8;->e(Landroid/content/Context;)I

    move-result v7

    const/4 v9, 0x0

    const/4 v10, 0x0

    move v8, v7

    invoke-static/range {v6 .. v11}, Loya;->b(Ljava/lang/String;IIIILmya;)Lnya;

    move-result-object p0

    if-eqz p0, :cond_62

    invoke-static {p0}, Loya;->a(Lnya;)V

    :cond_62
    iget-object p0, v11, Lsok;->l:Ljava/lang/Object;

    check-cast p0, Landroid/graphics/Bitmap;

    goto :goto_68

    :cond_67
    const/4 p0, 0x0

    :goto_68
    invoke-direct {p1, v4, v5, p0, v0}, Lmzj;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/graphics/Bitmap;Z)V

    iget-object p0, v3, Lhok;->D:Ljava/lang/Object;

    check-cast p0, Lnr8;

    invoke-virtual {p0, p1}, Lnr8;->a(Lmzj;)J

    invoke-virtual {v3, v2, v1}, Lhok;->b0(Lhq8;Z)V

    return-void

    :pswitch_data_76
    .packed-switch 0x0
        :pswitch_35
    .end packed-switch
.end method
