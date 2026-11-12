.class public final synthetic Lq7d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lr8n;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lor2;


# direct methods
.method public synthetic constructor <init>(Lor2;B)V
    .registers 3

    iput-byte p2, p0, Lq7d;->a:B

    iput-object p1, p0, Lq7d;->b:Lor2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .registers 5

    iget-byte p1, p0, Lq7d;->a:B

    iget-object p0, p0, Lq7d;->b:Lor2;

    packed-switch p1, :pswitch_data_38

    iget-object p0, p0, Lor2;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/custom_views/CornerRadiusLayout;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    const v0, 0x7f040a7d

    invoke-static {v0, p1}, Lf03;->x(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    if-eqz p1, :cond_23

    new-instance v0, Lw3a;

    const/4 v1, 0x1

    const/16 v2, 0x37

    invoke-direct {v0, p1, v2, v1}, Lw3a;-><init>(Landroid/graphics/drawable/Drawable;IZ)V

    invoke-virtual {p0, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    :cond_23
    return-void

    :pswitch_24
    iget-object p0, p0, Lor2;->d:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/custom_views/StylingImageView;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    const v0, 0x7f040a78

    invoke-static {v0, p1}, Lf03;->x(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/opera/android/custom_views/StylingImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void

    nop

    :pswitch_data_38
    .packed-switch 0x0
        :pswitch_24
    .end packed-switch
.end method
