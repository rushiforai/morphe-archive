.class public Lcom/opera/ad/view/VolumeMutableButton;
.super Landroid/widget/ImageButton;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final a:Landroid/graphics/drawable/Drawable;

.field public final b:Landroid/graphics/drawable/Drawable;

.field public c:Z

.field public d:Lecn;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4

    const/4 v0, -0x1

    invoke-direct {p0, p1, p2, v0}, Landroid/widget/ImageButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p2, 0x1

    iput-boolean p2, p0, Lcom/opera/ad/view/VolumeMutableButton;->c:Z

    const p2, 0x7f0808e2

    invoke-static {p2, p1}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p2

    iput-object p2, p0, Lcom/opera/ad/view/VolumeMutableButton;->a:Landroid/graphics/drawable/Drawable;

    const p2, 0x7f080a0e

    invoke-static {p2, p1}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    iput-object p1, p0, Lcom/opera/ad/view/VolumeMutableButton;->b:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 3

    iget-boolean p1, p0, Lcom/opera/ad/view/VolumeMutableButton;->c:Z

    xor-int/lit8 v0, p1, 0x1

    iput-boolean v0, p0, Lcom/opera/ad/view/VolumeMutableButton;->c:Z

    if-nez p1, :cond_b

    iget-object p1, p0, Lcom/opera/ad/view/VolumeMutableButton;->a:Landroid/graphics/drawable/Drawable;

    goto :goto_d

    :cond_b
    iget-object p1, p0, Lcom/opera/ad/view/VolumeMutableButton;->b:Landroid/graphics/drawable/Drawable;

    :goto_d
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object p1, p0, Lcom/opera/ad/view/VolumeMutableButton;->d:Lecn;

    if-eqz p1, :cond_19

    iget-boolean p0, p0, Lcom/opera/ad/view/VolumeMutableButton;->c:Z

    invoke-interface {p1, p0}, Lecn;->a(Z)V

    :cond_19
    return-void
.end method
