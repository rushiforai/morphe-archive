.class public final synthetic Lbua;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lr8n;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lcom/opera/android/custom_views/StylingImageView;

.field public final synthetic c:Lgua;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/custom_views/StylingImageView;Lgua;B)V
    .registers 4

    iput-byte p3, p0, Lbua;->a:B

    iput-object p1, p0, Lbua;->b:Lcom/opera/android/custom_views/StylingImageView;

    iput-object p2, p0, Lbua;->c:Lgua;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .registers 4

    iget-byte v0, p0, Lbua;->a:B

    iget-object v1, p0, Lbua;->c:Lgua;

    iget-object p0, p0, Lbua;->b:Lcom/opera/android/custom_views/StylingImageView;

    packed-switch v0, :pswitch_data_26

    invoke-virtual {p0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object p0

    iget-object v0, v1, Lgua;->m:Ldxh;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcxh;->a(Landroid/content/Context;)I

    move-result p1

    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->setTint(I)V

    return-void

    :pswitch_1b
    iget-object p1, v1, Lgua;->a:Lfua;

    invoke-interface {p1}, Lfua;->i()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/opera/android/custom_views/StylingImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void

    nop

    :pswitch_data_26
    .packed-switch 0x0
        :pswitch_1b
    .end packed-switch
.end method
