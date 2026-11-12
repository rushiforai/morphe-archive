.class public abstract Ldwd;
.super Ldej;
.source "SourceFile"


# instance fields
.field public final c:Lbf9;

.field public final d:Lhb9;

.field public e:Lua7;

.field public f:Lcom/opera/android/custom_views/StylingImageView;


# direct methods
.method public constructor <init>(Lmej;Lhb9;)V
    .registers 4

    invoke-direct {p0, p1}, Ldej;-><init>(Lmej;)V

    invoke-interface {p1}, Lmej;->getContext()Landroid/content/Context;

    move-result-object p1

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lcom/opera/android/OperaApplication;

    invoke-virtual {p1}, Lcom/opera/android/OperaApplication;->s()Lbf9;

    move-result-object p1

    iput-object p1, p0, Ldwd;->c:Lbf9;

    iput-object p2, p0, Ldwd;->d:Lhb9;

    new-instance p1, Lbwd;

    invoke-direct {p1, p0}, Lbwd;-><init>(Ldwd;)V

    iget-object p0, p0, Ldej;->a:Li7f;

    invoke-virtual {p0, p1}, Li7f;->b(Ljava/lang/Object;)Z

    return-void
.end method


# virtual methods
.method public final d(IILjava/lang/Runnable;)V
    .registers 5

    iget-object p0, p0, Ldwd;->e:Lua7;

    new-instance v0, Lcwd;

    invoke-direct {v0, p1, p2, p3}, Lcwd;-><init>(IILjava/lang/Runnable;)V

    invoke-virtual {p0, v0}, Lua7;->n(Lcwd;)V

    return-void
.end method

.method public final e()V
    .registers 5

    iget-object v0, p0, Ldwd;->e:Lua7;

    new-instance v1, Lcwd;

    new-instance v2, Lyqd;

    const/4 v3, 0x1

    invoke-direct {v2, p0, v3}, Lyqd;-><init>(Ljava/lang/Object;B)V

    const p0, 0x7f140567

    const v3, 0x7f080540

    invoke-direct {v1, p0, v3, v2}, Lcwd;-><init>(IILjava/lang/Runnable;)V

    invoke-virtual {v0, v1}, Lua7;->n(Lcwd;)V

    return-void
.end method

.method public f(Landroid/view/View;)V
    .registers 5

    iget-object p0, p0, Ldwd;->f:Lcom/opera/android/custom_views/StylingImageView;

    if-eqz p0, :cond_1f

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    const v0, 0x7f080241

    invoke-static {v0, p1}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    const v1, 0x7f0402e3

    const v2, 0x7f06063b

    invoke-static {v1, p1, v2}, Lf03;->t(ILandroid/content/Context;I)I

    move-result p1

    invoke-static {v0, p1}, Lj14;->n0(Landroid/graphics/drawable/Drawable;I)V

    invoke-virtual {p0, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    :cond_1f
    return-void
.end method

.method public final g(Landroid/widget/FrameLayout;Landroid/widget/LinearLayout;)V
    .registers 9

    new-instance v0, Lua7;

    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v2

    const/16 v5, 0x18

    const/4 v4, 0x0

    move-object v1, p0

    move-object v3, p2

    invoke-direct/range {v0 .. v5}, Lua7;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;ZB)V

    iput-object v0, v1, Ldwd;->e:Lua7;

    const p0, 0x7f0a0279

    invoke-virtual {p1, p0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    check-cast p0, Lcom/opera/android/custom_views/StylingImageView;

    iput-object p0, v1, Ldwd;->f:Lcom/opera/android/custom_views/StylingImageView;

    new-instance p0, Llzb;

    const/16 p2, 0xd

    invoke-direct {p0, v1, p2}, Llzb;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object p2

    if-eqz p2, :cond_2f

    invoke-static {p2, p1, p0}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    :cond_2f
    invoke-virtual {p0, p1}, Llzb;->a(Landroid/view/View;)V

    return-void
.end method

.method public h(Lhb9;)V
    .registers 2

    return-void
.end method

.method public j()V
    .registers 2

    const/4 v0, 0x0

    iput-object v0, p0, Ldwd;->f:Lcom/opera/android/custom_views/StylingImageView;

    return-void
.end method
