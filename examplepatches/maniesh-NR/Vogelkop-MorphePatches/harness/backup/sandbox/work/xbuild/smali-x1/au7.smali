.class public final synthetic Lau7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lxjj;
.implements Lyjj;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lx77;


# direct methods
.method public synthetic constructor <init>(Lx77;B)V
    .registers 3

    iput-byte p2, p0, Lau7;->a:B

    iput-object p1, p0, Lau7;->b:Lx77;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final c(Landroid/view/ViewGroup;)Landroidx/recyclerview/widget/i;
    .registers 7

    new-instance v0, Lju7;

    const v1, 0x7f0d0305

    const/4 v2, 0x0

    invoke-static {p1, v1, p1, v2}, Lj7c;->n(Landroid/view/ViewGroup;ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    const v1, 0x7f0a02ef

    invoke-static {v1, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    if-eqz v2, :cond_36

    new-instance v1, Lb98;

    check-cast v2, Landroid/widget/FrameLayout;

    const/4 v3, 0x3

    invoke-direct {v1, v2, v3}, Lb98;-><init>(Landroid/widget/FrameLayout;B)V

    const v2, 0x7f0a0b7b

    invoke-static {v2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    check-cast v3, Lcom/opera/android/ui/catalog/widget/OperaTextView;

    if-eqz v3, :cond_35

    new-instance v2, Lov0;

    check-cast p1, Landroid/widget/FrameLayout;

    const/16 v4, 0x1b

    invoke-direct {v2, p1, v1, v3, v4}, Lov0;-><init>(Landroid/view/View;Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object p0, p0, Lau7;->b:Lx77;

    invoke-direct {v0, v2, p0}, Lju7;-><init>(Lov0;Lx77;)V

    return-object v0

    :cond_35
    move v1, v2

    :cond_36
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public final i(Ljava/lang/Object;Landroidx/recyclerview/widget/i;)V
    .registers 6

    iget-byte v0, p0, Lau7;->a:B

    iget-object p0, p0, Lau7;->b:Lx77;

    packed-switch v0, :pswitch_data_42

    check-cast p1, Lcu7;

    check-cast p2, Lbu7;

    iget-object v0, p2, Lbu7;->b:Lov0;

    iget-object v0, v0, Lov0;->c:Ljava/lang/Object;

    check-cast v0, Lb98;

    iget-object v0, v0, Lb98;->b:Landroid/widget/FrameLayout;

    new-instance v1, Lzt7;

    const/4 v2, 0x1

    invoke-direct {v1, p0, p1, v2}, Lzt7;-><init>(Lx77;Lcu7;B)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p2, p2, Lbu7;->b:Lov0;

    iget-object p2, p2, Lov0;->d:Ljava/lang/Object;

    check-cast p2, Landroid/widget/FrameLayout;

    new-instance v0, Lzt7;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, v1}, Lzt7;-><init>(Lx77;Lcu7;B)V

    invoke-virtual {p2, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void

    :pswitch_2c
    check-cast p1, Leu7;

    check-cast p2, Liu7;

    iget-object p2, p2, Liu7;->b:Lkf;

    iget-object p2, p2, Lkf;->c:Ljava/lang/Object;

    check-cast p2, Lb98;

    iget-object p2, p2, Lb98;->b:Landroid/widget/FrameLayout;

    new-instance v0, Ljf7;

    const/4 v1, 0x3

    invoke-direct {v0, p0, p1, v1}, Ljf7;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p2, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void

    :pswitch_data_42
    .packed-switch 0x0
        :pswitch_2c
    .end packed-switch
.end method
