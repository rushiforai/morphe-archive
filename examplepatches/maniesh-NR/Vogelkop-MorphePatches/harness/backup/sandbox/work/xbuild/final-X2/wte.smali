.class public final Lwte;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lu9j;


# instance fields
.field public final a:Lcom/opera/android/settings/SettingsManager;

.field public final b:Lyqa;

.field public final c:Lfqe;

.field public final d:Lfue;

.field public final e:Lv9j;

.field public final f:Lzxf;

.field public final g:Lzxf;

.field public final h:Ljava/util/Set;

.field public final i:Ls9;

.field public final j:Ltte;

.field public final k:Lkvc;

.field public final l:Lute;

.field public final m:Lvte;

.field public n:Ljava/util/List;

.field public o:Z

.field public p:Lbre;

.field public q:Z

.field public r:Ll0c;

.field public s:Z

.field public t:Lx77;

.field public u:Ll0c;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/opera/android/settings/SettingsManager;Ldyf;Lyqa;Lfqe;Lfue;)V
    .registers 13

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lwte;->a:Lcom/opera/android/settings/SettingsManager;

    iput-object p4, p0, Lwte;->b:Lyqa;

    iput-object p5, p0, Lwte;->c:Lfqe;

    iput-object p6, p0, Lwte;->d:Lfue;

    new-instance p2, Lv9j;

    invoke-direct {p2, p0}, Lv9j;-><init>(Lu9j;)V

    iput-object p2, p0, Lwte;->e:Lv9j;

    iget-object p2, p3, Ldyf;->j:Ljava/lang/ref/WeakReference;

    if-eqz p2, :cond_1e

    invoke-virtual {p2}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lzxf;

    if-nez p2, :cond_2a

    :cond_1e
    new-instance p2, Lyxf;

    invoke-direct {p2, p3}, Lzxf;-><init>(Ldyf;)V

    new-instance p4, Ljava/lang/ref/WeakReference;

    invoke-direct {p4, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object p4, p3, Ldyf;->j:Ljava/lang/ref/WeakReference;

    :cond_2a
    iput-object p2, p0, Lwte;->f:Lzxf;

    invoke-virtual {p3}, Ldyf;->b()Lzxf;

    move-result-object p2

    iput-object p2, p0, Lwte;->g:Lzxf;

    const-string v4, "process_news_topics"

    const-string v5, "recommendations_language_region"

    const-string v0, "enable_newsfeed"

    const-string v1, "enable_reading_mode_as_default"

    const-string v2, "personalized_news"

    const-string v3, "personalized_default"

    filled-new-array/range {v0 .. v5}, [Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Le82;->E([Ljava/lang/Object;)Ljava/util/Set;

    move-result-object p2

    iput-object p2, p0, Lwte;->h:Ljava/util/Set;

    new-instance p2, Ls9;

    const/16 p3, 0x18

    invoke-direct {p2, p0, p3}, Ls9;-><init>(Ljava/lang/Object;B)V

    iput-object p2, p0, Lwte;->i:Ls9;

    new-instance p2, Ltte;

    invoke-direct {p2, p0}, Ltte;-><init>(Lwte;)V

    iput-object p2, p0, Lwte;->j:Ltte;

    new-instance p2, Lkvc;

    const/4 p3, 0x1

    invoke-direct {p2, p0, p3}, Lkvc;-><init>(Ljava/lang/Object;B)V

    iput-object p2, p0, Lwte;->k:Lkvc;

    new-instance p2, Lute;

    invoke-direct {p2, p0, p1}, Lute;-><init>(Lwte;Landroid/content/Context;)V

    iput-object p2, p0, Lwte;->l:Lute;

    new-instance p1, Lvte;

    invoke-direct {p1, p0}, Lvte;-><init>(Lwte;)V

    iput-object p1, p0, Lwte;->m:Lvte;

    sget-object p1, Ll08;->a:Ll08;

    iput-object p1, p0, Lwte;->n:Ljava/util/List;

    invoke-virtual {p6}, Lfue;->d()V

    iget-object p1, p6, Lfue;->a:Lcue;

    iget-byte p1, p1, Lcue;->a:B

    const/4 p2, 0x2

    if-eq p1, p2, :cond_7d

    const/4 p3, 0x0

    :cond_7d
    iput-boolean p3, p0, Lwte;->s:Z

    return-void
.end method


# virtual methods
.method public final a()Z
    .registers 3

    iget-object v0, p0, Lwte;->f:Lzxf;

    iget-object v1, v0, Lzxf;->c:Ljava/util/HashSet;

    invoke-virtual {v1}, Ljava/util/HashSet;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_e

    iget-object v1, v0, Lzxf;->b:Ll0c;

    if-nez v1, :cond_12

    :cond_e
    invoke-virtual {v0}, Lzxf;->c()Ll0c;

    move-result-object v1

    :cond_12
    iget-object p0, p0, Lwte;->u:Ll0c;

    invoke-static {v1, p0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public final b()V
    .registers 16

    const-string v0, "enable_newsfeed"

    iget-object v1, p0, Lwte;->a:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v1, v0}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v3

    iget-object v0, p0, Lwte;->u:Ll0c;

    new-instance v2, Lste;

    const/4 v4, 0x0

    if-eqz v3, :cond_1c

    invoke-static {}, Lo7j;->values()[Lo7j;

    move-result-object v5

    const-string v6, "enable_reading_mode_as_default"

    invoke-virtual {v1, v6}, Lcom/opera/android/settings/SettingsManager;->n(Ljava/lang/String;)I

    move-result v6

    aget-object v5, v5, v6

    goto :goto_1d

    :cond_1c
    move-object v5, v4

    :goto_1d
    if-eqz v3, :cond_93

    iget-object v6, p0, Lwte;->t:Lx77;

    if-eqz v6, :cond_93

    if-eqz v0, :cond_93

    new-instance v7, Ljrh;

    iget-object v8, v6, Lx77;->b:Ljava/lang/Object;

    check-cast v8, Ljava/util/Map;

    iget-object v9, v6, Lx77;->c:Ljava/lang/Object;

    check-cast v9, Landroid/content/Context;

    iget-object v10, v6, Lx77;->d:Ljava/lang/Object;

    check-cast v10, Ljava/util/HashSet;

    if-nez v10, :cond_61

    new-instance v10, Ljava/util/HashSet;

    invoke-direct {v10}, Ljava/util/HashSet;-><init>()V

    new-instance v11, Ljava/util/HashSet;

    invoke-direct {v11}, Ljava/util/HashSet;-><init>()V

    invoke-interface {v8}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v12

    invoke-interface {v12}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :cond_47
    :goto_47
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_5f

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ll0c;

    iget-object v13, v13, Ll0c;->a:Ljava/lang/String;

    invoke-virtual {v11, v13}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    move-result v14

    if-nez v14, :cond_47

    invoke-virtual {v10, v13}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_47

    :cond_5f
    iput-object v10, v6, Lx77;->d:Ljava/lang/Object;

    :cond_61
    invoke-interface {v8, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lq0c;

    iget-object v6, v6, Lx77;->d:Ljava/lang/Object;

    check-cast v6, Ljava/util/HashSet;

    iget-object v10, v0, Ll0c;->a:Ljava/lang/String;

    invoke-virtual {v6, v10}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_89

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    iget v6, v8, Lq0c;->a:I

    invoke-virtual {v9, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    iget v8, v8, Lq0c;->b:I

    invoke-virtual {v9, v8}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v8

    const-string v9, " - "

    invoke-static {v6, v9, v8}, Lsko;->v(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    goto :goto_8f

    :cond_89
    iget v6, v8, Lq0c;->a:I

    invoke-virtual {v9, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    :goto_8f
    invoke-direct {v7, v6}, Ljrh;-><init>(Ljava/lang/String;)V

    goto :goto_94

    :cond_93
    move-object v7, v4

    :goto_94
    if-eqz v0, :cond_a0

    iget-object v6, p0, Lwte;->r:Ll0c;

    invoke-virtual {v0, v6}, Ll0c;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_a0

    const/4 v0, 0x1

    goto :goto_a1

    :cond_a0
    const/4 v0, 0x0

    :goto_a1
    if-eqz v3, :cond_b7

    if-eqz v0, :cond_b7

    iget-boolean v0, p0, Lwte;->o:Z

    if-eqz v0, :cond_b7

    iget-boolean v0, p0, Lwte;->s:Z

    if-eqz v0, :cond_b7

    invoke-virtual {v1}, Lcom/opera/android/settings/SettingsManager;->M()Z

    move-result v0

    if-eqz v0, :cond_b7

    iget-object v0, p0, Lwte;->p:Lbre;

    move-object v6, v0

    goto :goto_b8

    :cond_b7
    move-object v6, v4

    :goto_b8
    if-eqz v3, :cond_c5

    invoke-virtual {v1}, Lcom/opera/android/settings/SettingsManager;->M()Z

    move-result v0

    if-eqz v0, :cond_c3

    sget-object v4, Ladg;->b:Ladg;

    goto :goto_c5

    :cond_c3
    sget-object v4, Ladg;->c:Ladg;

    :cond_c5
    :goto_c5
    if-nez v3, :cond_cf

    sget-object v0, Lheb;->m:Lheb;

    :goto_c9
    move-object v8, v7

    move-object v7, v4

    move-object v4, v5

    move-object v5, v8

    move-object v8, v0

    goto :goto_de

    :cond_cf
    iget-boolean v0, p0, Lwte;->q:Z

    if-eqz v0, :cond_d6

    sget-object v0, Ljeb;->m:Ljeb;

    goto :goto_c9

    :cond_d6
    new-instance v0, Lieb;

    iget-object v1, p0, Lwte;->n:Ljava/util/List;

    invoke-direct {v0, v1}, Lieb;-><init>(Ljava/util/List;)V

    goto :goto_c9

    :goto_de
    invoke-direct/range {v2 .. v8}, Lste;-><init>(ZLo7j;Ljrh;Lbre;Ladg;Lcs5;)V

    iget-object p0, p0, Lwte;->e:Lv9j;

    invoke-virtual {p0, v2}, Lekc;->r(Ljava/lang/Object;)V

    return-void
.end method

.method public final j()V
    .registers 4

    iget-object v0, p0, Lwte;->a:Lcom/opera/android/settings/SettingsManager;

    iget-object v1, p0, Lwte;->i:Ls9;

    invoke-virtual {v0, v1}, Lcom/opera/android/settings/SettingsManager;->a(Lp5j;)V

    iget-object v0, p0, Lwte;->f:Lzxf;

    iget-object v1, p0, Lwte;->j:Ltte;

    invoke-virtual {v0, v1}, Lzxf;->F(Ljava/lang/Object;)V

    iget-object v0, p0, Lwte;->g:Lzxf;

    invoke-virtual {v0, v1}, Lzxf;->F(Ljava/lang/Object;)V

    iget-object v0, p0, Lwte;->d:Lfue;

    iget-object v2, p0, Lwte;->k:Lkvc;

    invoke-virtual {v0, v2}, Lfue;->b(Ldue;)V

    iget-object v0, p0, Lwte;->l:Lute;

    invoke-virtual {v0}, Lute;->e()V

    iget-object p0, p0, Lwte;->m:Lvte;

    invoke-virtual {p0}, Lvte;->e()V

    invoke-virtual {v1}, Ltte;->f()V

    return-void
.end method

.method public final onStopped()V
    .registers 3

    iget-object v0, p0, Lwte;->m:Lvte;

    const/4 v1, 0x1

    iput-boolean v1, v0, Loh4;->a:Z

    iget-object v0, p0, Lwte;->l:Lute;

    iput-boolean v1, v0, Loh4;->a:Z

    iget-object v0, p0, Lwte;->d:Lfue;

    iget-object v1, p0, Lwte;->k:Lkvc;

    invoke-virtual {v0, v1}, Lfue;->e(Ldue;)V

    iget-object v0, p0, Lwte;->g:Lzxf;

    iget-object v1, p0, Lwte;->j:Ltte;

    invoke-virtual {v0, v1}, Lzxf;->H(Ljava/lang/Object;)V

    iget-object v0, p0, Lwte;->f:Lzxf;

    iget-object v1, p0, Lwte;->j:Ltte;

    invoke-virtual {v0, v1}, Lzxf;->H(Ljava/lang/Object;)V

    iget-object v0, p0, Lwte;->a:Lcom/opera/android/settings/SettingsManager;

    iget-object p0, p0, Lwte;->i:Ls9;

    invoke-virtual {v0, p0}, Lcom/opera/android/settings/SettingsManager;->T(Lp5j;)V

    return-void
.end method
