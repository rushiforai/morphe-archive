.class public final Lvbg;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final d:Lcrb;


# instance fields
.field public final a:Lb59;

.field public final b:Lx5f;

.field public final c:Lx5f;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lm3g;

    const/16 v1, 0x8

    invoke-direct {v0, v1}, Lm3g;-><init>(B)V

    sget-object v1, Lrpb;->d:Lqpb;

    invoke-static {v1, v0}, Lphj;->o(Lrpb;Lkotlin/jvm/functions/Function1;)Lcrb;

    move-result-object v0

    sput-object v0, Lvbg;->d:Lcrb;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lumi;Lx5f;Lx5f;)V
    .registers 7

    const/4 v0, 0x0

    new-array v0, v0, [Lbg1;

    const-string v1, "personalization_onboarding_reporter"

    invoke-static {p1, p2, v1, v0}, Lw1h;->l(Landroid/content/Context;Ltcl;Ljava/lang/String;[Lbg1;)Lb59;

    move-result-object p1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lvbg;->a:Lb59;

    iput-object p3, p0, Lvbg;->b:Lx5f;

    iput-object p4, p0, Lvbg;->c:Lx5f;

    return-void
.end method


# virtual methods
.method public final a(Lxcg;Z)V
    .registers 14

    iget-object v0, p1, Lxcg;->c:Ljava/util/List;

    move-object v1, v0

    check-cast v1, Ljava/lang/Iterable;

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_e
    :goto_e
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_23

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    move-object v4, v3

    check-cast v4, Lwcg;

    iget-boolean v4, v4, Lwcg;->b:Z

    if-eqz v4, :cond_e

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_e

    :cond_23
    new-instance v1, Ljava/util/ArrayList;

    const/16 v3, 0xa

    invoke-static {v2, v3}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v4

    invoke-direct {v1, v4}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v4

    const/4 v5, 0x0

    :goto_33
    if-ge v5, v4, :cond_43

    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    add-int/lit8 v5, v5, 0x1

    check-cast v6, Lwcg;

    iget-object v6, v6, Lwcg;->a:Ljava/lang/String;

    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_33

    :cond_43
    new-instance v2, Ll51;

    const/4 v4, 0x4

    invoke-direct {v2, v1, v4}, Ll51;-><init>(Ljava/util/ArrayList;B)V

    iget-object v1, p0, Lvbg;->c:Lx5f;

    invoke-virtual {v1, v2}, Lx5f;->T0(Lkotlin/jvm/functions/Function1;)V

    iget-object v5, p1, Lxcg;->a:Ljava/util/List;

    iget-object v6, p1, Lxcg;->b:Ljava/lang/String;

    check-cast v0, Ljava/lang/Iterable;

    invoke-static {v0, v3}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v1

    invoke-static {v1}, Lqbd;->a(I)I

    move-result v1

    const/16 v2, 0x10

    if-ge v1, v2, :cond_61

    move v1, v2

    :cond_61
    new-instance v7, Ljava/util/LinkedHashMap;

    invoke-direct {v7, v1}, Ljava/util/LinkedHashMap;-><init>(I)V

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_6a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_93

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lwcg;

    iget-object v2, v1, Lwcg;->a:Ljava/lang/String;

    new-instance v3, Lpcg;

    iget-boolean v4, v1, Lwcg;->b:Z

    if-eqz v4, :cond_81

    sget-object v4, Lvd0;->b:Lvd0;

    goto :goto_83

    :cond_81
    sget-object v4, Lvd0;->c:Lvd0;

    :goto_83
    iget-boolean v1, v1, Lwcg;->c:Z

    if-eqz v1, :cond_8a

    sget-object v1, Lop0;->d:Lop0;

    goto :goto_8c

    :cond_8a
    sget-object v1, Lop0;->b:Lop0;

    :goto_8c
    invoke-direct {v3, v4, v1}, Lpcg;-><init>(Lvd0;Lop0;)V

    invoke-interface {v7, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_6a

    :cond_93
    iget-object p1, p1, Lxcg;->d:Lhff;

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    if-eqz p1, :cond_ac

    const/4 v0, 0x1

    if-eq p1, v0, :cond_a9

    const/4 v0, 0x2

    if-ne p1, v0, :cond_a5

    sget-object p1, Lnm0;->d:Lnm0;

    :goto_a3
    move-object v9, p1

    goto :goto_af

    :cond_a5
    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_a9
    sget-object p1, Lnm0;->c:Lnm0;

    goto :goto_a3

    :cond_ac
    sget-object p1, Lnm0;->b:Lnm0;

    goto :goto_a3

    :goto_af
    iget-object p1, p0, Lvbg;->b:Lx5f;

    iget-boolean v0, p1, Lx5f;->h:Z

    if-eqz v0, :cond_cd

    iget-object v0, p1, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v1

    new-instance v2, Lck0;

    invoke-direct {v2, v0, v1}, Lck0;-><init>(Lzpa;Lx56;)V

    new-instance v4, Ln5f;

    const/4 v10, 0x0

    move v8, p2

    invoke-direct/range {v4 .. v10}, Ln5f;-><init>(Ljava/util/List;Ljava/lang/String;Ljava/util/LinkedHashMap;ZLnm0;B)V

    invoke-virtual {v2, v4}, Lck0;->b(Lkotlin/jvm/functions/Function1;)V

    invoke-virtual {p1, v1}, Lx5f;->U0(Lx56;)V

    :cond_cd
    iget-object p0, p0, Lvbg;->a:Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string p1, "snapshot"

    invoke-interface {p0, p1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method
