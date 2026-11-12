.class public final Lz6k;
.super Lab2;
.source "SourceFile"


# instance fields
.field public final d:Lb7k;

.field public final e:Ldnj;

.field public f:Lw6k;


# direct methods
.method public constructor <init>(Lb7k;Lpde;Lpde;Ldnj;)V
    .registers 7

    iget-object v0, p1, Lb7k;->b:Landroid/view/View;

    check-cast v0, Lcom/opera/android/custom_views/DropShadowFrameLayout;

    invoke-direct {p0, v0}, Lab2;-><init>(Landroid/view/View;)V

    iput-object p1, p0, Lz6k;->d:Lb7k;

    iput-object p4, p0, Lz6k;->e:Ldnj;

    iget-object p4, p0, Lab2;->c:Lkze;

    new-instance v0, Ly6k;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Ly6k;-><init>(Lz6k;B)V

    invoke-static {p2, p4, v0}, La26;->T(Lekc;Likc;Lf7f;)V

    iget-object p2, p0, Lab2;->c:Lkze;

    new-instance p4, Ly6k;

    const/4 v0, 0x1

    invoke-direct {p4, p0, v0}, Ly6k;-><init>(Lz6k;B)V

    invoke-static {p3, p2, p4}, La26;->T(Lekc;Likc;Lf7f;)V

    iget-object p1, p1, Lb7k;->c:Ljava/lang/Object;

    check-cast p1, Landroid/widget/ImageView;

    new-instance p2, Lkkf;

    const/16 p3, 0x17

    invoke-direct {p2, p0, p3}, Lkkf;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object p0

    if-nez p0, :cond_33

    return-void

    :cond_33
    invoke-static {p0, p1, p2}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    return-void
.end method


# virtual methods
.method public final b0()V
    .registers 5

    iget-object v0, p0, Lz6k;->f:Lw6k;

    if-nez v0, :cond_5

    return-void

    :cond_5
    iget-object v1, p0, Lz6k;->d:Lb7k;

    iget-object v1, v1, Lb7k;->c:Ljava/lang/Object;

    check-cast v1, Landroid/widget/ImageView;

    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    const v2, 0x7f06063b

    iget-object p0, p0, Lz6k;->e:Ldnj;

    if-eqz v0, :cond_37

    const/4 v3, 0x1

    if-ne v0, v3, :cond_33

    invoke-virtual {p0}, Ldnj;->invoke()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    if-eqz p0, :cond_31

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    const v0, 0x7f040770

    invoke-static {v0, p0, v2}, Lf03;->t(ILandroid/content/Context;I)I

    move-result p0

    goto :goto_51

    :cond_31
    const/4 p0, -0x1

    goto :goto_51

    :cond_33
    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_37
    invoke-virtual {p0}, Ldnj;->invoke()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    if-eqz p0, :cond_4f

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    const v0, 0x7f04076a

    invoke-static {v0, p0, v2}, Lf03;->t(ILandroid/content/Context;I)I

    move-result p0

    goto :goto_51

    :cond_4f
    const/high16 p0, -0x1000000

    :goto_51
    invoke-static {p0}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p0

    invoke-virtual {v1, p0}, Landroid/widget/ImageView;->setImageTintList(Landroid/content/res/ColorStateList;)V

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    const v0, 0x7f040573

    invoke-static {v0, p0}, Lf03;->V(ILandroid/content/Context;)Z

    move-result p0

    if-eqz p0, :cond_69

    const p0, 0x3f59999a    # 0.85f

    goto :goto_6b

    :cond_69
    const/high16 p0, 0x3f400000    # 0.75f

    :goto_6b
    invoke-virtual {v1, p0}, Landroid/view/View;->setAlpha(F)V

    return-void
.end method
