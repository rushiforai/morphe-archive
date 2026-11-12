.class public abstract Lm6k;
.super Lab2;
.source "SourceFile"

# interfaces
.implements Lev8;


# instance fields
.field public final d:Lkf;

.field public final e:Ltsd;


# direct methods
.method public constructor <init>(Lkf;Ltsd;Ltsd;)V
    .registers 7

    iget-object v0, p1, Lkf;->b:Landroid/view/View;

    check-cast v0, Landroid/widget/FrameLayout;

    invoke-direct {p0, v0}, Lab2;-><init>(Landroid/view/View;)V

    iput-object p1, p0, Lm6k;->d:Lkf;

    iput-object p2, p0, Lm6k;->e:Ltsd;

    iget-object p1, p1, Lkf;->c:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/startpage/SoftwareClipMaxWidthLinearLayout;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/view/View;->setClipToOutline(Z)V

    sget v1, Ld03;->e:I

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f0809a6

    invoke-static {v2, v1}, Lj14;->i0(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-static {p1, v1}, Lydp;->q(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    new-instance v1, Lkkf;

    const/16 v2, 0x15

    invoke-direct {v1, p0, v2}, Lkkf;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object v2

    if-eqz v2, :cond_33

    invoke-static {v2, p1, v1}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    :cond_33
    iget-object p1, p0, Lab2;->c:Lkze;

    new-instance v1, Ll6k;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Ll6k;-><init>(Lm6k;B)V

    invoke-static {p2, p1, v1}, La26;->T(Lekc;Likc;Lf7f;)V

    iget-object p1, p0, Lab2;->c:Lkze;

    new-instance p2, Ll6k;

    invoke-direct {p2, p0, v0}, Ll6k;-><init>(Lm6k;B)V

    invoke-static {p3, p1, p2}, La26;->T(Lekc;Likc;Lf7f;)V

    return-void
.end method
