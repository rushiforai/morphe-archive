.class public final Lyu1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lu9j;


# instance fields
.field public final a:Lcom/opera/android/settings/SettingsManager;

.field public final b:Lev1;

.field public final c:Lnzk;

.field public final d:Ldxe;

.field public final e:Ljjg;

.field public final f:Luu1;

.field public final g:Lv9j;

.field public final h:Ls9;

.field public final i:Lxu1;

.field public final j:Lvu1;


# direct methods
.method public constructor <init>(Lcom/opera/android/settings/SettingsManager;Lev1;Lnzk;Ldxe;Ljjg;)V
    .registers 8

    new-instance v0, Luu1;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Luu1;-><init>(B)V

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lyu1;->a:Lcom/opera/android/settings/SettingsManager;

    iput-object p2, p0, Lyu1;->b:Lev1;

    iput-object p3, p0, Lyu1;->c:Lnzk;

    iput-object p4, p0, Lyu1;->d:Ldxe;

    iput-object p5, p0, Lyu1;->e:Ljjg;

    iput-object v0, p0, Lyu1;->f:Luu1;

    new-instance p1, Lv9j;

    invoke-direct {p1, p0}, Lv9j;-><init>(Lu9j;)V

    iput-object p1, p0, Lyu1;->g:Lv9j;

    new-instance p1, Ls9;

    const/4 p2, 0x2

    invoke-direct {p1, p0, p2}, Ls9;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lyu1;->h:Ls9;

    new-instance p1, Lxu1;

    invoke-direct {p1, p0, v1}, Lxu1;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lyu1;->i:Lxu1;

    new-instance p1, Lvu1;

    invoke-direct {p1, p0, v1}, Lvu1;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lyu1;->j:Lvu1;

    return-void
.end method


# virtual methods
.method public final a()Lb7j;
    .registers 2

    iget-object v0, p0, Lyu1;->b:Lev1;

    iget-object v0, v0, Lev1;->b:Lb7j;

    if-nez v0, :cond_d

    iget-object p0, p0, Lyu1;->a:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {p0}, Lcom/opera/android/settings/SettingsManager;->c()Lb7j;

    move-result-object p0

    return-object p0

    :cond_d
    return-object v0
.end method

.method public final b()Le7j;
    .registers 2

    iget-object v0, p0, Lyu1;->b:Lev1;

    iget-object v0, v0, Lev1;->a:Le7j;

    if-nez v0, :cond_d

    iget-object p0, p0, Lyu1;->a:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {p0}, Lcom/opera/android/settings/SettingsManager;->f()Le7j;

    move-result-object p0

    return-object p0

    :cond_d
    return-object v0
.end method

.method public final c()V
    .registers 15

    new-instance v0, Ltu1;

    new-instance v1, Lfll;

    sget-object v2, Lwu1;->a:Lh58;

    new-instance v3, Lyg9;

    const/16 v4, 0xc

    invoke-direct {v3, v4}, Lyg9;-><init>(B)V

    invoke-static {v3, v2}, Lkotlin/collections/CollectionsKt;->c0(Ljava/util/Comparator;Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v2

    iget-object v7, p0, Lyu1;->a:Lcom/opera/android/settings/SettingsManager;

    const-string v8, "app_theme"

    invoke-virtual {v7, v8}, Lcom/opera/android/settings/SettingsManager;->n(Ljava/lang/String;)I

    move-result v3

    invoke-static {}, Lf7j;->values()[Lf7j;

    move-result-object v4

    aget-object v3, v4, v3

    sget-object v4, Lwu1;->b:Lh58;

    new-instance v5, Lyg9;

    const/16 v6, 0xd

    invoke-direct {v5, v6}, Lyg9;-><init>(B)V

    invoke-static {v5, v4}, Lkotlin/collections/CollectionsKt;->c0(Ljava/util/Comparator;Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v4

    invoke-virtual {v7}, Lcom/opera/android/settings/SettingsManager;->g()Lg7j;

    move-result-object v5

    iget-object v6, p0, Lyu1;->c:Lnzk;

    iget-boolean v6, v6, Lnzk;->a:Z

    invoke-direct/range {v1 .. v6}, Lfll;-><init>(Ljava/util/List;Lf7j;Ljava/util/List;Lg7j;Z)V

    invoke-virtual {v7, v8}, Lcom/opera/android/settings/SettingsManager;->n(Ljava/lang/String;)I

    move-result v2

    invoke-static {}, Lf7j;->values()[Lf7j;

    move-result-object v3

    aget-object v2, v3, v2

    sget-object v3, Lf7j;->d:Lf7j;

    const/4 v4, 0x0

    const/4 v5, 0x1

    if-eq v2, v3, :cond_49

    move v2, v5

    goto :goto_4a

    :cond_49
    move v2, v4

    :goto_4a
    new-instance v3, Lpxe;

    iget-object v6, p0, Lyu1;->d:Ldxe;

    if-eqz v6, :cond_60

    iget-boolean v8, v6, Ldxe;->i:Z

    if-ne v8, v5, :cond_60

    const-string v8, "night_mode_switch_theme"

    invoke-virtual {v7, v8}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_60

    if-eqz v2, :cond_60

    move v2, v5

    goto :goto_61

    :cond_60
    move v2, v4

    :goto_61
    if-eqz v6, :cond_69

    iget-boolean v8, v6, Ldxe;->i:Z

    if-ne v8, v5, :cond_69

    move v8, v5

    goto :goto_6a

    :cond_69
    move v8, v4

    :goto_6a
    if-eqz v6, :cond_7d

    const v9, 0x7f141022

    const v10, 0x7f14101f

    const v11, 0x7f141021

    const v12, 0x7f14101e

    invoke-virtual {v6, v11, v12, v9, v10}, Ldxe;->R(IIII)Ljava/lang/String;

    move-result-object v6

    goto :goto_7e

    :cond_7d
    const/4 v6, 0x0

    :goto_7e
    if-nez v6, :cond_82

    const-string v6, ""

    :cond_82
    invoke-direct {v3, v2, v8, v6}, Lpxe;-><init>(ZZLjava/lang/String;)V

    const-string v2, "darken_websites_dark_theme"

    invoke-virtual {v7, v2}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v2

    iget-object v6, p0, Lyu1;->f:Luu1;

    invoke-virtual {v6}, Luu1;->get()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Boolean;

    invoke-virtual {v6}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v6

    if-eqz v6, :cond_9c

    sget-object v4, Lb4c;->i:Lb4c;

    goto :goto_dc

    :cond_9c
    new-instance v6, Lc4c;

    invoke-virtual {p0}, Lyu1;->b()Le7j;

    move-result-object v8

    sget-object v9, Le7j;->d:Le7j;

    if-ne v8, v9, :cond_a8

    move v8, v5

    goto :goto_a9

    :cond_a8
    move v8, v4

    :goto_a9
    invoke-virtual {p0}, Lyu1;->a()Lb7j;

    move-result-object v9

    iget v9, v9, Lb7j;->a:I

    invoke-virtual {p0}, Lyu1;->b()Le7j;

    move-result-object v10

    invoke-virtual {v7, v10}, Lcom/opera/android/settings/SettingsManager;->D(Le7j;)Lr7j;

    move-result-object v10

    invoke-virtual {p0}, Lyu1;->a()Lb7j;

    move-result-object v11

    sget-object v12, Lb7j;->d:Lb7j;

    if-ne v11, v12, :cond_c5

    sget-object v11, Lr7j;->d:Lr7j;

    if-ne v10, v11, :cond_c5

    sget-object v10, Lr7j;->c:Lr7j;

    :cond_c5
    iget v10, v10, Lr7j;->a:I

    invoke-virtual {p0}, Lyu1;->a()Lb7j;

    move-result-object v11

    sget-object v12, Lb7j;->c:Lb7j;

    if-ne v11, v12, :cond_d8

    invoke-virtual {p0}, Lyu1;->b()Le7j;

    move-result-object v11

    sget-object v12, Le7j;->c:Le7j;

    if-ne v11, v12, :cond_d8

    move v4, v5

    :cond_d8
    invoke-direct {v6, v8, v9, v10, v4}, Lc4c;-><init>(ZIIZ)V

    move-object v4, v6

    :goto_dc
    iget-object v6, p0, Lyu1;->e:Ljjg;

    invoke-virtual {v6}, Ljjg;->get()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Boolean;

    invoke-virtual {v6}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v6

    move v8, v5

    move v5, v6

    new-instance v6, Lns1;

    sget-object v9, Lozk;->a:Ljava/util/Set;

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v10

    invoke-virtual {v10}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v10

    invoke-interface {v9, v10}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v9

    xor-int/2addr v9, v8

    invoke-static {}, Lc7j;->values()[Lc7j;

    move-result-object v8

    const-string v10, "app_font"

    invoke-virtual {v7, v10}, Lcom/opera/android/settings/SettingsManager;->n(Ljava/lang/String;)I

    move-result v7

    aget-object v7, v8, v7

    iget v7, v7, Lc7j;->a:I

    new-instance v8, Lrxh;

    invoke-direct {v8, v7}, Lrxh;-><init>(I)V

    invoke-direct {v6, v9, v8}, Lns1;-><init>(ZLrxh;)V

    move-object v13, v3

    move v3, v2

    move-object v2, v13

    invoke-direct/range {v0 .. v6}, Ltu1;-><init>(Lfll;Lpxe;ZLp37;ZLns1;)V

    iget-object p0, p0, Lyu1;->g:Lv9j;

    invoke-virtual {p0, v0}, Lekc;->r(Ljava/lang/Object;)V

    return-void
.end method

.method public final j()V
    .registers 1

    invoke-virtual {p0}, Lyu1;->c()V

    return-void
.end method

.method public final m(Lkze;)V
    .registers 4

    iget-object v0, p0, Lyu1;->a:Lcom/opera/android/settings/SettingsManager;

    iget-object v1, p0, Lyu1;->h:Ls9;

    invoke-static {v0, p1, v1}, La26;->V(Lw6f;Likc;Ljava/lang/Object;)V

    iget-object v0, p0, Lyu1;->c:Lnzk;

    iget-object v1, p0, Lyu1;->j:Lvu1;

    invoke-static {v0, p1, v1}, La26;->V(Lw6f;Likc;Ljava/lang/Object;)V

    sget-object v0, Lowe;->c:Lowe;

    iget-object v1, p0, Lyu1;->i:Lxu1;

    invoke-static {v0, p1, v1}, La26;->V(Lw6f;Likc;Ljava/lang/Object;)V

    iget-object p0, p0, Lyu1;->d:Ldxe;

    if-eqz p0, :cond_1c

    invoke-static {p0, p1, v1}, La26;->V(Lw6f;Likc;Ljava/lang/Object;)V

    :cond_1c
    return-void
.end method
