.class public final Lny3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lu9j;


# instance fields
.field public a:Z

.field public b:Z

.field public final c:Ljava/lang/Object;

.field public final d:Ljava/lang/Object;

.field public final e:Ljava/lang/Object;

.field public final f:Ljava/lang/Object;

.field public g:Ljava/lang/Object;

.field public h:Ljava/lang/Object;

.field public i:Ljava/lang/Object;

.field public j:Ljava/lang/Object;

.field public final k:Ljava/lang/Object;

.field public final l:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lcom/opera/android/settings/SettingsManager;Lmm6;Lv3m;Ldj9;Lekc;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lny3;->c:Ljava/lang/Object;

    iput-object p2, p0, Lny3;->d:Ljava/lang/Object;

    iput-object p3, p0, Lny3;->e:Ljava/lang/Object;

    iput-object p4, p0, Lny3;->f:Ljava/lang/Object;

    iput-object p5, p0, Lny3;->g:Ljava/lang/Object;

    new-instance p1, Lv9j;

    invoke-direct {p1, p0}, Lv9j;-><init>(Lu9j;)V

    iput-object p1, p0, Lny3;->h:Ljava/lang/Object;

    new-instance p1, Lly3;

    const/4 p3, 0x0

    invoke-direct {p1, p0, p3}, Lly3;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lny3;->i:Ljava/lang/Object;

    new-instance p1, Ls9;

    const/16 p4, 0x8

    invoke-direct {p1, p0, p4}, Ls9;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lny3;->j:Ljava/lang/Object;

    new-instance p1, Lvy;

    const/4 p4, 0x3

    invoke-direct {p1, p0, p4}, Lvy;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lny3;->k:Ljava/lang/Object;

    new-instance p1, Lk9;

    const/16 p4, 0x14

    invoke-direct {p1, p0, p4}, Lk9;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lny3;->l:Ljava/lang/Object;

    invoke-virtual {p2}, Lmm6;->a()Lyl6;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Ltl6;->a()Z

    move-result p2

    if-eqz p2, :cond_47

    invoke-virtual {p1}, Lyl6;->k()Z

    move-result p3

    :cond_47
    iput-boolean p3, p0, Lny3;->a:Z

    return-void
.end method

.method public constructor <init>(Lylp;Lp7p;Lu6p;Lbxk;)V
    .registers 5

    .line 74
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lny3;->c:Ljava/lang/Object;

    iput-object p2, p0, Lny3;->d:Ljava/lang/Object;

    iput-object p3, p0, Lny3;->e:Ljava/lang/Object;

    iput-object p4, p0, Lny3;->f:Ljava/lang/Object;

    new-instance p1, Lbno;

    const/4 p2, 0x0

    invoke-direct {p1, p0, p2}, Lbno;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lny3;->k:Ljava/lang/Object;

    new-instance p1, Ldpj;

    const/16 p2, 0xc

    .line 75
    invoke-direct {p1, p2}, Ldpj;-><init>(B)V

    .line 76
    iput-object p1, p0, Lny3;->l:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final a(Lzro;)V
    .registers 7

    iget-object v0, p0, Lny3;->h:Ljava/lang/Object;

    check-cast v0, Llzo;

    iget-object v1, p0, Lny3;->g:Ljava/lang/Object;

    check-cast v1, La3p;

    const/4 v2, 0x0

    if-eqz v0, :cond_13

    if-eqz v1, :cond_13

    new-instance v3, Lkotlin/Pair;

    invoke-direct {v3, v0, v1}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_14

    :cond_13
    move-object v3, v2

    :goto_14
    if-eqz v3, :cond_6e

    iget-object v0, v3, Lkotlin/Pair;->a:Ljava/lang/Object;

    check-cast v0, Llzo;

    iget-object v1, v3, Lkotlin/Pair;->b:Ljava/lang/Object;

    check-cast v1, La3p;

    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    invoke-static {v3, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2f

    invoke-static {v1}, Lxgh;->g(Landroid/view/View;)V

    const/4 v3, -0x1

    invoke-virtual {p1, v1, v3, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;II)V

    :cond_2f
    iget-boolean v3, p0, Lny3;->b:Z

    iget-object v4, p0, Lny3;->i:Ljava/lang/Object;

    check-cast v4, Lne5;

    if-eqz v3, :cond_3f

    if-eqz v4, :cond_3c

    invoke-virtual {v4}, Lne5;->o()V

    :cond_3c
    :goto_3c
    iput-object v2, p0, Lny3;->i:Ljava/lang/Object;

    goto :goto_53

    :cond_3f
    if-nez v4, :cond_53

    new-instance v2, Lne5;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-direct {v2, p1}, Lne5;-><init>(Landroid/content/Context;)V

    new-instance p1, Lzlo;

    invoke-direct {p1, p0, v0}, Lzlo;-><init>(Lny3;Llzo;)V

    invoke-virtual {v2, v1, p1}, Lne5;->m(Landroid/view/View;Lhko;)V

    goto :goto_3c

    :cond_53
    :goto_53
    iget-object p0, v0, Llzo;->e:Lng2;

    iget-byte p1, p0, Lng2;->b:B

    const/4 v1, 0x2

    if-eq p1, v1, :cond_5d

    const/4 v1, 0x4

    if-ne p1, v1, :cond_6e

    :cond_5d
    iget-object p1, v0, Llzo;->a:La3p;

    iget-object p1, p1, La3p;->o:Lj2p;

    if-eqz p1, :cond_6b

    invoke-static {p1}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    sget-object v0, Lito;->a:[Lito;

    invoke-virtual {p1}, Landroid/webkit/WebView;->onResume()V

    :cond_6b
    const/4 p1, 0x3

    iput-byte p1, p0, Lng2;->b:B

    :cond_6e
    return-void
.end method

.method public final b()V
    .registers 4

    iget-boolean v0, p0, Lny3;->a:Z

    if-nez v0, :cond_3d

    iget-object v0, p0, Lny3;->j:Ljava/lang/Object;

    check-cast v0, Lzro;

    if-eqz v0, :cond_3d

    iget-object v0, p0, Lny3;->h:Ljava/lang/Object;

    check-cast v0, Llzo;

    if-eqz v0, :cond_13

    invoke-virtual {v0}, Llzo;->b()V

    :cond_13
    iget-object v0, p0, Lny3;->g:Ljava/lang/Object;

    check-cast v0, La3p;

    if-eqz v0, :cond_1c

    invoke-static {v0}, Lxgh;->g(Landroid/view/View;)V

    :cond_1c
    iget-object v0, p0, Lny3;->i:Ljava/lang/Object;

    check-cast v0, Lne5;

    if-eqz v0, :cond_25

    invoke-virtual {v0}, Lne5;->o()V

    :cond_25
    const/4 v0, 0x0

    iput-object v0, p0, Lny3;->i:Ljava/lang/Object;

    iget-object v1, p0, Lny3;->j:Ljava/lang/Object;

    check-cast v1, Lzro;

    if-eqz v1, :cond_3b

    iget-object v2, p0, Lny3;->k:Ljava/lang/Object;

    check-cast v2, Lbno;

    invoke-virtual {v1, v2}, Landroid/view/View;->removeOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    invoke-virtual {v1}, Landroid/view/ViewGroup;->removeAllViews()V

    invoke-static {v1}, Lxgh;->g(Landroid/view/View;)V

    :cond_3b
    iput-object v0, p0, Lny3;->j:Ljava/lang/Object;

    :cond_3d
    return-void
.end method

.method public final c()V
    .registers 16

    iget-object v0, p0, Lny3;->h:Ljava/lang/Object;

    check-cast v0, Lv9j;

    iget-object v1, p0, Lny3;->c:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/settings/SettingsManager;

    new-instance v2, Lky3;

    iget-boolean v3, p0, Lny3;->a:Z

    const/4 v4, 0x0

    if-eqz v3, :cond_4b

    iget-object v3, p0, Lny3;->d:Ljava/lang/Object;

    check-cast v3, Lmm6;

    invoke-virtual {v3}, Lmm6;->a()Lyl6;

    move-result-object v3

    invoke-virtual {v3}, Lyl6;->d()Lsl6;

    move-result-object v5

    invoke-virtual {v5}, Lsl6;->c()Z

    move-result v6

    if-eqz v6, :cond_24

    iget-object v5, v5, Lsl6;->a:Landroid/content/pm/ResolveInfo;

    goto :goto_25

    :cond_24
    move-object v5, v4

    :goto_25
    if-nez v5, :cond_29

    move-object v6, v4

    goto :goto_34

    :cond_29
    new-instance v6, Lpad;

    iget-object v3, v3, Lyl6;->a:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v3

    invoke-direct {v6, v5, v3}, Lpad;-><init>(Landroid/content/pm/ResolveInfo;Landroid/content/pm/PackageManager;)V

    :goto_34
    if-eqz v6, :cond_45

    new-instance v3, Lpm6;

    iget-object v5, v6, Lpad;->b:Ljava/lang/Object;

    check-cast v5, Landroid/graphics/drawable/Drawable;

    iget-object v6, v6, Lpad;->c:Ljava/lang/Object;

    check-cast v6, Ljava/lang/String;

    invoke-direct {v3, v5, v6}, Lpm6;-><init>(Landroid/graphics/drawable/Drawable;Ljava/lang/String;)V

    :goto_43
    move-object v5, v4

    goto :goto_4e

    :cond_45
    new-instance v3, Lom6;

    invoke-direct {v3}, Ljava/lang/Object;-><init>()V

    goto :goto_43

    :cond_4b
    sget-object v3, Lnm6;->m:Lnm6;

    goto :goto_43

    :goto_4e
    invoke-virtual {v1}, Lcom/opera/android/settings/SettingsManager;->y()I

    move-result v4

    move-object v6, v5

    invoke-virtual {v1}, Lcom/opera/android/settings/SettingsManager;->C()Lq7j;

    move-result-object v5

    move-object v7, v6

    new-instance v6, Liwk;

    const-string v8, "tab_auto_grouping"

    invoke-virtual {v1, v8}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v8

    invoke-direct {v6, v8}, Liwk;-><init>(Z)V

    iget-object v8, p0, Lny3;->e:Ljava/lang/Object;

    check-cast v8, Lv3m;

    iget-object v8, v8, Lv3m;->a:Landroid/content/Context;

    invoke-static {v8}, Lv3m;->f(Landroid/content/Context;)Z

    move-result v8

    if-eqz v8, :cond_78

    new-instance v8, Lk1c;

    const v9, 0x7f140ff7

    invoke-direct {v8, v9}, Lk1c;-><init>(I)V

    goto :goto_80

    :cond_78
    new-instance v8, Lk1c;

    const v9, 0x7f140ff8

    invoke-direct {v8, v9}, Lk1c;-><init>(I)V

    :goto_80
    sget-object v9, Loab;->h:Loab;

    iget-object v10, p0, Lny3;->f:Ljava/lang/Object;

    check-cast v10, Ldj9;

    invoke-virtual {v10}, Lno7;->i()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcj9;

    iget-object v11, v10, Lcj9;->b:Ljava/lang/String;

    iget-object v10, v10, Lcj9;->a:Ljava/lang/String;

    invoke-static {v11, v10}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v12

    const/4 v13, 0x1

    if-eqz v12, :cond_9b

    iget-boolean v12, p0, Lny3;->b:Z

    if-eqz v12, :cond_e1

    :cond_9b
    sget-object v12, Loy5;->a:Ljava/util/Map;

    invoke-interface {v12, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/lang/Integer;

    if-eqz v14, :cond_e1

    invoke-virtual {v14}, Ljava/lang/Integer;->intValue()I

    move-result v14

    invoke-interface {v12, v11}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/Integer;

    if-eqz v12, :cond_e1

    invoke-virtual {v12}, Ljava/lang/Integer;->intValue()I

    move-result v9

    iput-boolean v13, p0, Lny3;->b:Z

    const-string v12, "ongoing_installation_location_reset"

    invoke-virtual {v1, v12}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_d6

    invoke-static {v11, v10}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_d6

    new-instance v1, Lpab;

    new-instance v7, Lrxh;

    invoke-direct {v7, v14}, Lrxh;-><init>(I)V

    new-instance v10, Lrxh;

    invoke-direct {v10, v9}, Lrxh;-><init>(I)V

    invoke-direct {v1, v7, v10}, Lpab;-><init>(Lrxh;Lrxh;)V

    :goto_d4
    move-object v9, v1

    goto :goto_e1

    :cond_d6
    new-instance v1, Lpab;

    new-instance v10, Lrxh;

    invoke-direct {v10, v9}, Lrxh;-><init>(I)V

    invoke-direct {v1, v10, v7}, Lpab;-><init>(Lrxh;Lrxh;)V

    goto :goto_d4

    :cond_e1
    :goto_e1
    iget-object p0, p0, Lny3;->g:Ljava/lang/Object;

    check-cast p0, Lekc;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lm18;

    const/4 v1, -0x1

    if-nez p0, :cond_f0

    move p0, v1

    goto :goto_f8

    :cond_f0
    sget-object v7, Lmy3;->a:[I

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    aget p0, v7, p0

    :goto_f8
    if-eq p0, v1, :cond_119

    if-eq p0, v13, :cond_113

    const/4 v1, 0x2

    if-eq p0, v1, :cond_109

    const/4 v1, 0x3

    if-eq p0, v1, :cond_119

    const/4 v1, 0x4

    if-eq p0, v1, :cond_119

    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_109
    new-instance p0, Liwk;

    const/4 v1, 0x0

    invoke-direct {p0, v1}, Liwk;-><init>(Z)V

    :goto_10f
    move-object v7, v8

    move-object v8, v9

    move-object v9, p0

    goto :goto_11c

    :cond_113
    new-instance p0, Liwk;

    invoke-direct {p0, v13}, Liwk;-><init>(Z)V

    goto :goto_10f

    :cond_119
    sget-object p0, Lhwk;->a:Lhwk;

    goto :goto_10f

    :goto_11c
    invoke-direct/range {v2 .. v9}, Lky3;-><init>(Lrm5;ILq7j;Liwk;Lk1c;Luup;Lcgh;)V

    invoke-virtual {v0, v2}, Lekc;->r(Ljava/lang/Object;)V

    return-void
.end method

.method public final j()V
    .registers 3

    invoke-virtual {p0}, Lny3;->c()V

    iget-object v0, p0, Lny3;->c:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/settings/SettingsManager;

    iget-object v1, p0, Lny3;->j:Ljava/lang/Object;

    check-cast v1, Ls9;

    invoke-virtual {v0, v1}, Lcom/opera/android/settings/SettingsManager;->a(Lp5j;)V

    iget-object v0, p0, Lny3;->d:Ljava/lang/Object;

    check-cast v0, Lmm6;

    iget-object v1, p0, Lny3;->i:Ljava/lang/Object;

    check-cast v1, Lly3;

    iget-object v0, v0, Lmm6;->g:Lh7f;

    invoke-virtual {v0, v1}, Lh7f;->b(Ljava/lang/Object;)Z

    iget-object v0, p0, Lny3;->f:Ljava/lang/Object;

    check-cast v0, Ldj9;

    iget-object v1, p0, Lny3;->k:Ljava/lang/Object;

    check-cast v1, Lvy;

    invoke-virtual {v0, v1}, Lno7;->g(Lmo7;)V

    iget-object v0, p0, Lny3;->g:Ljava/lang/Object;

    check-cast v0, Lekc;

    iget-object p0, p0, Lny3;->l:Ljava/lang/Object;

    check-cast p0, Lk9;

    invoke-virtual {v0, p0}, Lekc;->k(Lf7f;)V

    return-void
.end method

.method public final onStopped()V
    .registers 3

    iget-object v0, p0, Lny3;->g:Ljava/lang/Object;

    check-cast v0, Lekc;

    iget-object v1, p0, Lny3;->l:Ljava/lang/Object;

    check-cast v1, Lk9;

    invoke-virtual {v0, v1}, Lekc;->p(Lf7f;)V

    iget-object v0, p0, Lny3;->f:Ljava/lang/Object;

    check-cast v0, Ldj9;

    iget-object v1, p0, Lny3;->k:Ljava/lang/Object;

    check-cast v1, Lvy;

    invoke-virtual {v0, v1}, Lno7;->p(Lmo7;)V

    iget-object v0, p0, Lny3;->d:Ljava/lang/Object;

    check-cast v0, Lmm6;

    iget-object v1, p0, Lny3;->i:Ljava/lang/Object;

    check-cast v1, Lly3;

    iget-object v0, v0, Lmm6;->g:Lh7f;

    invoke-virtual {v0, v1}, Lh7f;->c(Ljava/lang/Object;)Z

    iget-object v0, p0, Lny3;->c:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/settings/SettingsManager;

    iget-object p0, p0, Lny3;->j:Ljava/lang/Object;

    check-cast p0, Ls9;

    invoke-virtual {v0, p0}, Lcom/opera/android/settings/SettingsManager;->T(Lp5j;)V

    return-void
.end method
