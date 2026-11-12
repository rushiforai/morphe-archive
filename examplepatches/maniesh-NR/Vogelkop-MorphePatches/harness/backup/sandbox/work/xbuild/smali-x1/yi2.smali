.class public abstract Lyi2;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/Object;

.field public final b:Ljava/lang/Object;

.field public final c:Ljava/lang/Object;

.field public final d:Ljava/lang/Object;

.field public e:Ljava/lang/Object;

.field public f:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lslk;Lydn;)V
    .registers 4

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    iput-object p1, p0, Lyi2;->a:Ljava/lang/Object;

    .line 39
    iput-object p2, p0, Lyi2;->b:Ljava/lang/Object;

    .line 40
    iput-object p3, p0, Lyi2;->c:Ljava/lang/Object;

    .line 41
    new-instance p1, Lkze;

    sget-object p2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 42
    invoke-direct {p1, p2}, Lekc;-><init>(Ljava/lang/Object;)V

    .line 43
    iput-object p1, p0, Lyi2;->d:Ljava/lang/Object;

    .line 44
    new-instance p1, Lgen;

    invoke-direct {p1, p0}, Lgen;-><init>(Lyi2;)V

    iput-object p1, p0, Lyi2;->f:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;Lole;)V
    .registers 4

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lyi2;->c:Ljava/lang/Object;

    .line 34
    iput-object p1, p0, Lyi2;->b:Ljava/lang/Object;

    .line 35
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lyi2;->a:Ljava/lang/Object;

    .line 36
    iput-object p2, p0, Lyi2;->d:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lcom/opera/android/oauth2/OperaAccessToken;Ljava/lang/String;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ltw2;

    const/16 v1, 0xb

    invoke-direct {v0, p0, v1}, Ltw2;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lyi2;->f:Ljava/lang/Object;

    new-instance v0, Lii;

    const/16 v1, 0x14

    invoke-direct {v0, v1}, Lii;-><init>(B)V

    iput-object v0, p0, Lyi2;->a:Ljava/lang/Object;

    iput-object p2, p0, Lyi2;->c:Ljava/lang/Object;

    invoke-static {}, Ldgh;->h()Landroid/net/Uri;

    move-result-object p2

    iput-object p2, p0, Lyi2;->b:Ljava/lang/Object;

    iput-object p1, p0, Lyi2;->d:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public a()Landroid/animation/AnimatorSet;
    .registers 3

    iget-object v0, p0, Lyi2;->f:Ljava/lang/Object;

    check-cast v0, Lkae;

    if-nez v0, :cond_1d

    iget-object v0, p0, Lyi2;->e:Ljava/lang/Object;

    check-cast v0, Lkae;

    if-nez v0, :cond_1a

    iget-object v0, p0, Lyi2;->a:Ljava/lang/Object;

    check-cast v0, Landroid/content/Context;

    invoke-virtual {p0}, Lyi2;->c()I

    move-result v1

    invoke-static {v1, v0}, Lkae;->b(ILandroid/content/Context;)Lkae;

    move-result-object v0

    iput-object v0, p0, Lyi2;->e:Ljava/lang/Object;

    :cond_1a
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :cond_1d
    invoke-virtual {p0, v0}, Lyi2;->b(Lkae;)Landroid/animation/AnimatorSet;

    move-result-object p0

    return-object p0
.end method

.method public final b(Lkae;)Landroid/animation/AnimatorSet;
    .registers 8

    iget-object p0, p0, Lyi2;->b:Ljava/lang/Object;

    check-cast p0, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const-string v1, "opacity"

    invoke-virtual {p1, v1}, Lkae;->g(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1a

    sget-object v2, Landroid/view/View;->ALPHA:Landroid/util/Property;

    invoke-virtual {p1, v1, p0, v2}, Lkae;->d(Ljava/lang/String;Ljava/lang/Object;Landroid/util/Property;)Landroid/animation/ObjectAnimator;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_1a
    const-string v1, "scale"

    invoke-virtual {p1, v1}, Lkae;->g(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_34

    sget-object v2, Landroid/view/View;->SCALE_Y:Landroid/util/Property;

    invoke-virtual {p1, v1, p0, v2}, Lkae;->d(Ljava/lang/String;Ljava/lang/Object;Landroid/util/Property;)Landroid/animation/ObjectAnimator;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    sget-object v2, Landroid/view/View;->SCALE_X:Landroid/util/Property;

    invoke-virtual {p1, v1, p0, v2}, Lkae;->d(Ljava/lang/String;Ljava/lang/Object;Landroid/util/Property;)Landroid/animation/ObjectAnimator;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_34
    const-string v1, "width"

    invoke-virtual {p1, v1}, Lkae;->g(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_45

    sget-object v2, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;->j0:Ls73;

    invoke-virtual {p1, v1, p0, v2}, Lkae;->d(Ljava/lang/String;Ljava/lang/Object;Landroid/util/Property;)Landroid/animation/ObjectAnimator;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_45
    const-string v1, "height"

    invoke-virtual {p1, v1}, Lkae;->g(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_56

    sget-object v2, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;->k0:Ls73;

    invoke-virtual {p1, v1, p0, v2}, Lkae;->d(Ljava/lang/String;Ljava/lang/Object;Landroid/util/Property;)Landroid/animation/ObjectAnimator;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_56
    const-string v1, "paddingStart"

    invoke-virtual {p1, v1}, Lkae;->g(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_67

    sget-object v2, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;->l0:Ls73;

    invoke-virtual {p1, v1, p0, v2}, Lkae;->d(Ljava/lang/String;Ljava/lang/Object;Landroid/util/Property;)Landroid/animation/ObjectAnimator;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_67
    const-string v1, "paddingEnd"

    invoke-virtual {p1, v1}, Lkae;->g(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_78

    sget-object v2, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;->m0:Ls73;

    invoke-virtual {p1, v1, p0, v2}, Lkae;->d(Ljava/lang/String;Ljava/lang/Object;Landroid/util/Property;)Landroid/animation/ObjectAnimator;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_78
    const-string v1, "labelOpacity"

    invoke-virtual {p1, v1}, Lkae;->g(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_91

    new-instance v2, Ls73;

    const-string v3, "LABEL_OPACITY_PROPERTY"

    const/4 v4, 0x0

    const-class v5, Ljava/lang/Float;

    invoke-direct {v2, v5, v3, v4}, Ls73;-><init>(Ljava/lang/Class;Ljava/lang/String;B)V

    invoke-virtual {p1, v1, p0, v2}, Lkae;->d(Ljava/lang/String;Ljava/lang/Object;Landroid/util/Property;)Landroid/animation/ObjectAnimator;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_91
    new-instance p0, Landroid/animation/AnimatorSet;

    invoke-direct {p0}, Landroid/animation/AnimatorSet;-><init>()V

    invoke-static {p0, v0}, Lui6;->T(Landroid/animation/AnimatorSet;Ljava/util/ArrayList;)V

    return-object p0
.end method

.method public c()I
    .registers 1

    const p0, 0x7f020023

    return p0
.end method

.method public d(Ljava/lang/String;)V
    .registers 10

    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0, p1}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    new-instance p1, Ljava/util/ArrayList;

    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v1

    invoke-direct {p1, v1}, Ljava/util/ArrayList;-><init>(I)V

    const/4 v1, 0x0

    :goto_f
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-ge v1, v2, :cond_42

    new-instance v2, Lorb;

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    invoke-direct {v2, v3}, Lorb;-><init>(Lorg/json/JSONObject;)V

    const-string v3, "type"

    invoke-virtual {v2, v3}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "username"

    const-string v5, ""

    invoke-virtual {v2, v4, v5}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v6, "email"

    invoke-virtual {v2, v6, v5}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string v7, "fullname"

    invoke-virtual {v2, v7, v5}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    new-instance v2, Lbvj;

    invoke-direct {v2, v3, v4, v6}, Lbvj;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_f

    :cond_42
    new-instance v0, Ljri;

    const/16 v1, 0xb

    invoke-direct {v0, p0, p1, v1}, Ljri;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v0}, Lvml;->c(Ljava/lang/Runnable;)V

    return-void
.end method

.method public e(Landroid/content/Context;)Z
    .registers 2

    sget p0, Lcom/opera/android/vpn/app_widget/VpnProAppWidget;->b:I

    sget p0, Leif;->a:I

    const-class p0, Lcom/opera/android/vpn/app_widget/VpnProAppWidget;

    invoke-static {p1, p0}, Lkfo;->I(Landroid/content/Context;Ljava/lang/Class;)Ljava/lang/Integer;

    move-result-object p0

    if-eqz p0, :cond_14

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    if-lez p0, :cond_14

    const/4 p0, 0x1

    return p0

    :cond_14
    const/4 p0, 0x0

    return p0
.end method

.method public f()V
    .registers 2

    iget-object p0, p0, Lyi2;->d:Ljava/lang/Object;

    check-cast p0, Lole;

    const/4 v0, 0x0

    iput-object v0, p0, Lole;->a:Ljava/lang/Object;

    return-void
.end method

.method public abstract g()V
.end method

.method public abstract h(Landroid/animation/Animator;)V
.end method

.method public abstract i(Ljava/lang/String;)V
.end method

.method public abstract j()V
.end method

.method public final k()V
    .registers 6

    iget-object v0, p0, Lyi2;->e:Ljava/lang/Object;

    check-cast v0, Lokhttp3/internal/connection/RealCall;

    if-eqz v0, :cond_7

    return-void

    :cond_7
    iget-object v0, p0, Lyi2;->a:Ljava/lang/Object;

    check-cast v0, Lii;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lt9f;

    new-instance v1, Lfvh;

    invoke-direct {v1}, Lfvh;-><init>()V

    iget-object v2, p0, Lyi2;->b:Ljava/lang/Object;

    check-cast v2, Landroid/net/Uri;

    invoke-virtual {v2}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "api/v1/"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v4, p0, Lyi2;->c:Ljava/lang/Object;

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/net/Uri$Builder;->appendEncodedPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v2

    invoke-virtual {v2}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lfvh;->h(Ljava/lang/String;)V

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Bearer "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, p0, Lyi2;->d:Ljava/lang/Object;

    check-cast v3, Lcom/opera/android/oauth2/OperaAccessToken;

    iget-object v3, v3, Lcom/opera/android/oauth2/OperaAccessToken;->a:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "Authorization"

    invoke-virtual {v1, v3, v2}, Lfvh;->d(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v2, Lkvh;

    invoke-direct {v2, v1}, Lkvh;-><init>(Lfvh;)V

    invoke-virtual {v0, v2}, Lt9f;->c(Lkvh;)Lokhttp3/internal/connection/RealCall;

    move-result-object v0

    iput-object v0, p0, Lyi2;->e:Ljava/lang/Object;

    iget-object p0, p0, Lyi2;->f:Ljava/lang/Object;

    check-cast p0, Ltw2;

    invoke-interface {v0, p0}, Lv84;->enqueue(Lf94;)V

    return-void
.end method

.method public abstract l(Landroid/content/Context;Z)V
.end method

.method public final m(Z)V
    .registers 5

    iget-object v0, p0, Lyi2;->c:Ljava/lang/Object;

    check-cast v0, Lydn;

    iget-object v1, p0, Lyi2;->b:Ljava/lang/Object;

    check-cast v1, Lslk;

    iget-object v2, p0, Lyi2;->e:Ljava/lang/Object;

    check-cast v2, Lhen;

    if-eqz p1, :cond_25

    if-eqz v2, :cond_11

    return-void

    :cond_11
    new-instance p1, Lhen;

    invoke-direct {p1, p0}, Lhen;-><init>(Lyi2;)V

    iput-object p1, p0, Lyi2;->e:Ljava/lang/Object;

    iget-object v1, v1, Lslk;->i:Lkze;

    invoke-virtual {v1, p1}, Lekc;->k(Lf7f;)V

    iget-object p0, p0, Lyi2;->e:Ljava/lang/Object;

    check-cast p0, Lhen;

    invoke-virtual {v0, p0}, Lydn;->b(Ltdn;)V

    return-void

    :cond_25
    if-eqz v2, :cond_36

    iget-object p1, v1, Lslk;->i:Lkze;

    invoke-virtual {p1, v2}, Lekc;->p(Lf7f;)V

    iget-object p1, p0, Lyi2;->e:Ljava/lang/Object;

    check-cast p1, Lhen;

    invoke-virtual {v0, p1}, Lydn;->A(Ltdn;)V

    const/4 p1, 0x0

    iput-object p1, p0, Lyi2;->e:Ljava/lang/Object;

    :cond_36
    return-void
.end method

.method public abstract n()Z
.end method

.method public abstract o()V
.end method

.method public final p()V
    .registers 7

    iget-object v0, p0, Lyi2;->a:Ljava/lang/Object;

    check-cast v0, Landroid/content/Context;

    iget-object v1, p0, Lyi2;->c:Ljava/lang/Object;

    check-cast v1, Lydn;

    invoke-static {}, Li0l;->g()Z

    move-result v2

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-nez v2, :cond_2a

    invoke-virtual {v1}, Lydn;->p()Lwdn;

    move-result-object v2

    invoke-virtual {v2}, Lwdn;->a()Z

    move-result v2

    if-eqz v2, :cond_2a

    iget-object v2, v1, Lydn;->c:Lgfn;

    invoke-interface {v2}, Lgfn;->isEnabled()Z

    move-result v2

    if-nez v2, :cond_2c

    invoke-virtual {v1}, Lydn;->p()Lwdn;

    move-result-object v1

    iget-boolean v1, v1, Lwdn;->e:Z

    if-nez v1, :cond_2c

    :cond_2a
    move v1, v4

    goto :goto_2d

    :cond_2c
    move v1, v3

    :goto_2d
    iget-object v2, p0, Lyi2;->d:Ljava/lang/Object;

    check-cast v2, Lkze;

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    invoke-virtual {v2, v5}, Lekc;->r(Ljava/lang/Object;)V

    invoke-virtual {p0, v0, v1}, Lyi2;->l(Landroid/content/Context;Z)V

    if-eqz v1, :cond_43

    invoke-virtual {p0, v0}, Lyi2;->e(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_44

    :cond_43
    move v3, v4

    :cond_44
    invoke-virtual {p0, v3}, Lyi2;->m(Z)V

    return-void
.end method
