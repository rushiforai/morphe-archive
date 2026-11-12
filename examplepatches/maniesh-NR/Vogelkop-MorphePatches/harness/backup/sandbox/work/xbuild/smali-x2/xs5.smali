.class public final synthetic Lxs5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lat5;

.field public final synthetic c:Landroid/widget/ImageView;


# direct methods
.method public synthetic constructor <init>(Lat5;Landroid/widget/ImageView;B)V
    .registers 4

    iput-byte p3, p0, Lxs5;->a:B

    iput-object p1, p0, Lxs5;->b:Lat5;

    iput-object p2, p0, Lxs5;->c:Landroid/widget/ImageView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 6

    iget-byte v0, p0, Lxs5;->a:B

    iget-object v1, p0, Lxs5;->c:Landroid/widget/ImageView;

    iget-object p0, p0, Lxs5;->b:Lat5;

    const/4 v2, 0x0

    check-cast p1, Lwcj;

    packed-switch v0, :pswitch_data_50

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-interface {p1, v0}, Lwcj;->d(Landroid/content/Context;)Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    invoke-static {v1, v3, v2}, Ln1h;->o(Landroid/view/View;Ljava/lang/CharSequence;I)V

    invoke-interface {p1, v0}, Lwcj;->b(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    new-instance v0, Lss5;

    invoke-direct {v0, p0, p1, v2}, Lss5;-><init>(Lat5;Lwcj;B)V

    invoke-virtual {v1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void

    :pswitch_2d
    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-interface {p1, v0}, Lwcj;->d(Landroid/content/Context;)Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    invoke-static {v1, v3, v2}, Ln1h;->o(Landroid/view/View;Ljava/lang/CharSequence;I)V

    invoke-interface {p1, v0}, Lwcj;->b(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    new-instance v0, Lss5;

    const/4 v2, 0x1

    invoke-direct {v0, p0, p1, v2}, Lss5;-><init>(Lat5;Lwcj;B)V

    invoke-virtual {v1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void

    nop

    :pswitch_data_50
    .packed-switch 0x0
        :pswitch_2d
    .end packed-switch
.end method
