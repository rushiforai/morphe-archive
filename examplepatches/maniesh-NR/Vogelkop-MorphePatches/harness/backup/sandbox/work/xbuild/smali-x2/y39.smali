.class public final Ly39;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnFocusChangeListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Ly39;->a:B

    iput-object p1, p0, Ly39;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onFocusChange(Landroid/view/View;Z)V
    .registers 4

    iget-byte v0, p0, Ly39;->a:B

    iget-object p0, p0, Ly39;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_4a

    check-cast p0, Landroidx/appcompat/widget/SearchView;

    iget-object p1, p0, Landroidx/appcompat/widget/SearchView;->K:Landroid/view/View$OnFocusChangeListener;

    if-eqz p1, :cond_10

    invoke-interface {p1, p0, p2}, Landroid/view/View$OnFocusChangeListener;->onFocusChange(Landroid/view/View;Z)V

    :cond_10
    return-void

    :pswitch_11
    if-nez p2, :cond_16

    invoke-static {p1}, Lq9n;->u(Landroid/view/View;)Z

    :cond_16
    check-cast p0, Ldvc;

    iget-object p1, p0, Ldvc;->u:Lcom/opera/android/custom_views/ActionBarSearchView;

    if-eqz p1, :cond_37

    if-eqz p2, :cond_25

    const p0, 0x7f0807f0

    invoke-virtual {p1, p0}, Landroid/view/View;->setBackgroundResource(I)V

    goto :goto_37

    :cond_25
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    const p2, 0x7f0401de

    invoke-static {p2, p1}, Lf03;->x(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    if-eqz p1, :cond_37

    iget-object p0, p0, Ldvc;->u:Lcom/opera/android/custom_views/ActionBarSearchView;

    invoke-virtual {p0, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    :cond_37
    :goto_37
    return-void

    :pswitch_38
    if-nez p2, :cond_48

    check-cast p0, Lcom/opera/android/bar/FindInPage;

    sget p1, Lcom/opera/android/bar/FindInPage;->w:I

    const p1, 0x7f0a0494

    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    invoke-static {p0}, Lq9n;->u(Landroid/view/View;)Z

    :cond_48
    return-void

    nop

    :pswitch_data_4a
    .packed-switch 0x0
        :pswitch_38
        :pswitch_11
    .end packed-switch
.end method
