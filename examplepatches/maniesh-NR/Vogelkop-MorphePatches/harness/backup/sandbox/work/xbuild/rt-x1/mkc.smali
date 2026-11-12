.class public final Lmkc;
.super Landroid/graphics/drawable/LayerDrawable;
.source "SourceFile"


# instance fields
.field public final a:Lcom/opera/android/BrowserActivity;

.field public final b:Likc;

.field public c:Z

.field public final d:Lks6;


# direct methods
.method public constructor <init>(Lcom/opera/android/BrowserActivity;Likc;)V
    .registers 6

    new-instance v0, Landroid/graphics/drawable/ColorDrawable;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    const/4 v2, 0x1

    new-array v2, v2, [Landroid/graphics/drawable/Drawable;

    aput-object v0, v2, v1

    invoke-direct {p0, v2}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    iput-object p1, p0, Lmkc;->a:Lcom/opera/android/BrowserActivity;

    iput-object p2, p0, Lmkc;->b:Likc;

    new-instance p1, Lks6;

    const/16 p2, 0x19

    invoke-direct {p1, p0, p2}, Lks6;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lmkc;->d:Lks6;

    invoke-virtual {p0, v1, v1}, Lmkc;->setVisible(ZZ)Z

    return-void
.end method


# virtual methods
.method public final setVisible(ZZ)Z
    .registers 6

    iget-boolean v0, p0, Lmkc;->c:Z

    iget-object v1, p0, Lmkc;->d:Lks6;

    iget-object v2, p0, Lmkc;->b:Likc;

    if-eqz p1, :cond_13

    if-nez v0, :cond_1b

    const/4 v0, 0x1

    iput-boolean v0, p0, Lmkc;->c:Z

    iget-object v0, p0, Lmkc;->a:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v2, v0, v1}, Lekc;->j(Lndc;Lf7f;)V

    goto :goto_1b

    :cond_13
    if-eqz v0, :cond_1b

    const/4 v0, 0x0

    iput-boolean v0, p0, Lmkc;->c:Z

    invoke-virtual {v2, v1}, Lekc;->p(Lf7f;)V

    :cond_1b
    :goto_1b
    invoke-super {p0, p1, p2}, Landroid/graphics/drawable/LayerDrawable;->setVisible(ZZ)Z

    move-result p0

    return p0
.end method
