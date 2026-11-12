.class public final Lqwk;
.super Lz5k;
.source "SourceFile"


# instance fields
.field public final f:Landroid/content/Context;

.field public final g:Landroidx/recyclerview/widget/RecyclerView;

.field public final h:Ltsd;

.field public final i:Lzwk;

.field public final j:Lswk;

.field public final k:Let3;

.field public final l:Lyu8;

.field public final m:Lft3;

.field public final n:Lulp;

.field public final o:Lowk;

.field public final p:Lagm;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lijc;Landroidx/recyclerview/widget/RecyclerView;Ltsd;Ltsd;Lzwk;Lswk;Let3;Lyu8;Lft3;)V
    .registers 17

    sget-object v3, Le6k;->m:Le6k;

    const v4, 0x7f0d03be

    const/4 v5, 0x1

    const-class v1, Lrwk;

    move-object v0, p0

    move-object v2, p2

    invoke-direct/range {v0 .. v5}, Lz5k;-><init>(Ljava/lang/Class;Lijc;Le6k;IB)V

    iput-object p1, p0, Lqwk;->f:Landroid/content/Context;

    iput-object p3, p0, Lqwk;->g:Landroidx/recyclerview/widget/RecyclerView;

    iput-object p5, p0, Lqwk;->h:Ltsd;

    iput-object p6, p0, Lqwk;->i:Lzwk;

    iput-object p7, p0, Lqwk;->j:Lswk;

    iput-object p8, p0, Lqwk;->k:Let3;

    iput-object p9, p0, Lqwk;->l:Lyu8;

    move-object/from16 p1, p10

    iput-object p1, p0, Lqwk;->m:Lft3;

    sget-object p1, Lu55;->Ro:Lulp;

    iput-object p1, p0, Lqwk;->n:Lulp;

    new-instance p1, Lowk;

    invoke-direct {p1, p0}, Lowk;-><init>(Lqwk;)V

    iput-object p1, p0, Lqwk;->o:Lowk;

    new-instance p2, Lagm;

    new-instance p3, Leek;

    const/4 p5, 0x6

    invoke-direct {p3, p0, p4, p5}, Leek;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-direct {p2, p3}, Lagm;-><init>(Lkotlin/jvm/functions/Function0;)V

    iput-object p2, p0, Lqwk;->p:Lagm;

    new-instance p2, Ln6k;

    const/16 p3, 0x10

    invoke-direct {p2, p0, p3}, Ln6k;-><init>(Ljava/lang/Object;B)V

    iget-object p0, p7, Lswk;->a:Lb59;

    new-instance p3, Lb94;

    const/4 p4, 0x4

    invoke-direct {p3, p7, p2, p4}, Lb94;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p0, p3}, Lcom/opera/android/Lazy;->a(Lbg1;)V

    invoke-virtual {p6, p1}, Lzwk;->a(Lywk;)V

    return-void
.end method


# virtual methods
.method public final C()Lagm;
    .registers 1

    iget-object p0, p0, Lqwk;->p:Lagm;

    return-object p0
.end method

.method public final D(Z)V
    .registers 7

    if-nez p1, :cond_3

    return-void

    :cond_3
    iget-object p1, p0, Lqwk;->i:Lzwk;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Lzwk;->b()Lwyk;

    move-result-object v0

    iget-object v1, v0, Lwyk;->a:Ljava/util/Set;

    iget-object v0, v0, Lwyk;->b:Ljava/util/Set;

    check-cast v0, Ljava/lang/Iterable;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_16
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_29

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    move-object v3, v2

    check-cast v3, Lne6;

    iget v3, v3, Lne6;->a:I

    const/4 v4, 0x3

    if-ne v3, v4, :cond_16

    goto :goto_2a

    :cond_29
    const/4 v2, 0x0

    :goto_2a
    check-cast v2, Lne6;

    if-eqz v2, :cond_45

    invoke-interface {v1, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    invoke-virtual {p1, v1}, Lzwk;->k(Ljava/util/Set;)V

    iget-object p1, p0, Lqwk;->l:Lyu8;

    iget-object p1, p1, Lyu8;->b:Lcv8;

    iget-object p1, p1, Lcv8;->a:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v2}, Lcom/opera/android/settings/SettingsManager;->B(Lne6;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {p1, v1, v0}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    :cond_45
    iget-object p1, p0, Lqwk;->j:Lswk;

    invoke-virtual {p1}, Lswk;->a()Landroid/content/SharedPreferences;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    const-string v0, "password.promote"

    const/4 v1, 0x0

    invoke-interface {p1, v0, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    invoke-virtual {p0}, Lu5k;->A()V

    return-void
.end method

.method public final E()V
    .registers 7

    iget-object v0, p0, Lqwk;->n:Lulp;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-object v2, p0, Lqwk;->j:Lswk;

    invoke-virtual {v2}, Lswk;->a()Landroid/content/SharedPreferences;

    move-result-object v3

    invoke-interface {v3}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    invoke-virtual {v2}, Lswk;->a()Landroid/content/SharedPreferences;

    move-result-object v2

    const/4 v4, 0x0

    const-string v5, "passphrase.dismiss.count"

    invoke-interface {v2, v5, v4}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2

    add-int/lit8 v2, v2, 0x1

    invoke-interface {v3, v5, v2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    const-string v2, "passphrase.dismiss.time"

    invoke-interface {v3, v2, v0, v1}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    invoke-interface {v3}, Landroid/content/SharedPreferences$Editor;->apply()V

    invoke-virtual {p0}, Lu5k;->A()V

    return-void
.end method

.method public final F()Z
    .registers 7

    sget v0, Lswk;->e:I

    iget-object v0, p0, Lqwk;->i:Lzwk;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Lzwk;->i()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_3b

    iget-object v0, p0, Lqwk;->n:Lulp;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iget-object p0, p0, Lqwk;->j:Lswk;

    invoke-virtual {p0}, Lswk;->a()Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v4, "passphrase.dismiss.count"

    invoke-interface {v0, v4, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    const/4 v4, 0x2

    if-ge v0, v4, :cond_3b

    invoke-virtual {p0}, Lswk;->a()Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v0, "passphrase.dismiss.time"

    const-wide/16 v4, 0x0

    invoke-interface {p0, v0, v4, v5}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v4

    sub-long/2addr v2, v4

    sget-wide v4, Lswk;->d:J

    cmp-long p0, v2, v4

    if-ltz p0, :cond_3b

    const/4 p0, 0x1

    return p0

    :cond_3b
    return v1
.end method

.method public final onDestroy()V
    .registers 2

    iget-object v0, p0, Lqwk;->i:Lzwk;

    iget-object p0, p0, Lqwk;->o:Lowk;

    invoke-virtual {v0, p0}, Lzwk;->j(Lywk;)V

    return-void
.end method

.method public final t()Lja2;
    .registers 11

    invoke-virtual {p0}, Lqwk;->F()Z

    move-result v0

    if-eqz v0, :cond_90

    sget v0, Lswk;->e:I

    iget-object v0, p0, Lqwk;->i:Lzwk;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Lzwk;->i()Z

    move-result v0

    if-eqz v0, :cond_54

    invoke-static {}, Lzwk;->h()Z

    move-result v0

    if-eqz v0, :cond_54

    new-instance v0, Lrwk;

    new-instance v1, Lj1k;

    const/4 v7, 0x0

    const/4 v8, 0x5

    const/4 v2, 0x0

    const-class v4, Lqwk;

    const-string v5, "onCredentialAccept"

    const-string v6, "onCredentialAccept()V"

    move-object v3, p0

    invoke-direct/range {v1 .. v8}, Lj1k;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    move-object v9, v1

    new-instance v1, Lj1k;

    const/4 v8, 0x6

    const-string v5, "onCredentialDismiss"

    const-string v6, "onCredentialDismiss()V"

    invoke-direct/range {v1 .. v8}, Lj1k;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    new-instance v2, Lrxh;

    const v3, 0x7f141205

    invoke-direct {v2, v3}, Lrxh;-><init>(I)V

    new-instance v3, Lrxh;

    const v4, 0x7f140c54

    invoke-direct {v3, v4}, Lrxh;-><init>(I)V

    new-instance v4, Lrxh;

    const v5, 0x7f1406a0

    invoke-direct {v4, v5}, Lrxh;-><init>(I)V

    move-object v6, v1

    move-object v5, v9

    move-object v1, v0

    invoke-direct/range {v1 .. v6}, Lrwk;-><init>(Lrxh;Lrxh;Lrxh;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;)V

    return-object v1

    :cond_54
    new-instance v0, Lrwk;

    new-instance v1, Lj1k;

    const/4 v7, 0x0

    const/4 v8, 0x7

    const/4 v2, 0x0

    const-class v4, Lqwk;

    const-string v5, "onCredentialAccept"

    const-string v6, "onCredentialAccept()V"

    move-object v3, p0

    invoke-direct/range {v1 .. v8}, Lj1k;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    move-object v9, v1

    new-instance v1, Lj1k;

    const/16 v8, 0x8

    const-string v5, "onCredentialDismiss"

    const-string v6, "onCredentialDismiss()V"

    invoke-direct/range {v1 .. v8}, Lj1k;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    new-instance v2, Lrxh;

    const v3, 0x7f141206

    invoke-direct {v2, v3}, Lrxh;-><init>(I)V

    move-object v5, v1

    move-object v1, v2

    new-instance v2, Lrxh;

    const v3, 0x7f140c60

    invoke-direct {v2, v3}, Lrxh;-><init>(I)V

    new-instance v3, Lrxh;

    const v4, 0x7f1406a3

    invoke-direct {v3, v4}, Lrxh;-><init>(I)V

    move-object v4, v9

    invoke-direct/range {v0 .. v5}, Lrwk;-><init>(Lrxh;Lrxh;Lrxh;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;)V

    return-object v0

    :cond_90
    new-instance v0, Lrwk;

    new-instance v1, Lj1k;

    const/4 v7, 0x0

    const/16 v8, 0x9

    const/4 v2, 0x0

    const-class v4, Lqwk;

    const-string v5, "onSyncPasswordsAccept"

    const-string v6, "onSyncPasswordsAccept()V"

    move-object v3, p0

    invoke-direct/range {v1 .. v8}, Lj1k;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    move-object v9, v1

    new-instance v1, Lj1k;

    const/16 v8, 0xa

    const-string v5, "onSyncPasswordsDismiss"

    const-string v6, "onSyncPasswordsDismiss()V"

    invoke-direct/range {v1 .. v8}, Lj1k;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    new-instance v2, Lrxh;

    const v3, 0x7f140c67

    invoke-direct {v2, v3}, Lrxh;-><init>(I)V

    move-object v5, v1

    move-object v1, v2

    new-instance v2, Lrxh;

    const v3, 0x7f140c66

    invoke-direct {v2, v3}, Lrxh;-><init>(I)V

    new-instance v3, Lrxh;

    const v4, 0x7f140c65

    invoke-direct {v3, v4}, Lrxh;-><init>(I)V

    move-object v4, v9

    invoke-direct/range {v0 .. v5}, Lrwk;-><init>(Lrxh;Lrxh;Lrxh;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;)V

    return-object v0
.end method

.method public final z()Z
    .registers 9

    invoke-virtual {p0}, Lqwk;->F()Z

    move-result v0

    if-nez v0, :cond_70

    sget v0, Lswk;->e:I

    iget-object v0, p0, Lqwk;->n:Lulp;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-object v2, p0, Lqwk;->j:Lswk;

    invoke-virtual {v2}, Lswk;->a()Landroid/content/SharedPreferences;

    move-result-object v3

    const-string v4, "password.promote"

    const/4 v5, 0x0

    invoke-interface {v3, v4, v5}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    if-eqz v3, :cond_6f

    invoke-virtual {v2}, Lswk;->a()Landroid/content/SharedPreferences;

    move-result-object v2

    const-string v3, "password.first.show"

    const-wide/16 v6, 0x0

    invoke-interface {v2, v3, v6, v7}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v2

    sub-long/2addr v0, v2

    sget-wide v2, Lswk;->c:J

    cmp-long v0, v0, v2

    if-gez v0, :cond_6f

    iget-object p0, p0, Lqwk;->i:Lzwk;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Lzwk;->i()Z

    move-result p0

    if-nez p0, :cond_6f

    invoke-static {}, Lzwk;->e()Z

    move-result p0

    if-eqz p0, :cond_6f

    invoke-static {}, Lzwk;->b()Lwyk;

    move-result-object p0

    iget-object p0, p0, Lwyk;->b:Ljava/util/Set;

    check-cast p0, Ljava/lang/Iterable;

    instance-of v0, p0, Ljava/util/Collection;

    if-eqz v0, :cond_59

    move-object v0, p0

    check-cast v0, Ljava/util/Collection;

    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_6f

    :cond_59
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_5d
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_6f

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lne6;

    iget v0, v0, Lne6;->a:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_5d

    goto :goto_70

    :cond_6f
    return v5

    :cond_70
    :goto_70
    const/4 p0, 0x1

    return p0
.end method
