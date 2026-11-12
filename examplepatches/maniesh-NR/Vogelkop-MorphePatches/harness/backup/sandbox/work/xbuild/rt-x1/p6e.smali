.class public final synthetic Lp6e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lwub;

.field public final synthetic c:Ljava/util/ArrayList;


# direct methods
.method public synthetic constructor <init>(Lwub;Ljava/util/ArrayList;B)V
    .registers 4

    iput-byte p3, p0, Lp6e;->a:B

    iput-object p1, p0, Lp6e;->b:Lwub;

    iput-object p2, p0, Lp6e;->c:Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 13

    iget-byte v0, p0, Lp6e;->a:B

    iget-object v1, p0, Lp6e;->c:Ljava/util/ArrayList;

    iget-object p0, p0, Lp6e;->b:Lwub;

    const/4 v2, 0x1

    packed-switch v0, :pswitch_data_c6

    iget-object p0, p0, Lwub;->a:Ljava/lang/Object;

    check-cast p0, Lq6e;

    iget-object v0, p0, Lq6e;->j:Lb59;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/content/SharedPreferences;

    const-wide/16 v4, -0x1

    const-string v6, "default_search_engine_long"

    invoke-interface {v3, v6, v4, v5}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v3

    const-wide/16 v7, 0x0

    cmp-long v5, v3, v7

    const/4 v7, 0x0

    if-gez v5, :cond_27

    move-object v3, v7

    goto :goto_2b

    :cond_27
    invoke-virtual {p0, v3, v4}, Lq6e;->c(J)Ll6e;

    move-result-object v3

    :goto_2b
    new-instance v4, Ljava/util/ArrayList;

    iget-object v5, p0, Lq6e;->a:Ljava/util/ArrayList;

    invoke-direct {v4, v5}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->removeAll(Ljava/util/Collection;)Z

    iget-object v8, p0, Lq6e;->l:Lqie;

    iget-object v9, p0, Lq6e;->k:Lumi;

    new-instance v10, Lbw6;

    const/4 v11, 0x2

    invoke-direct {v10, v4, v11}, Lbw6;-><init>(Ljava/util/ArrayList;B)V

    invoke-interface {v9, v10}, Ltcl;->c(Ljava/lang/Runnable;)Lnml;

    move-result-object v4

    new-instance v9, Loml;

    invoke-direct {v9, v4}, Loml;-><init>(Lnml;)V

    invoke-virtual {v8, v9, v7}, Lqie;->n(Loml;Ljava/lang/Object;)Lp1j;

    invoke-virtual {v5}, Ljava/util/ArrayList;->clear()V

    invoke-virtual {v5, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    invoke-virtual {p0}, Lq6e;->j()Z

    iget-object v1, p0, Lq6e;->i:Ljbf;

    invoke-virtual {v1}, Lno7;->i()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Libf;

    const/16 v4, 0x200

    invoke-virtual {v1, v4}, Libf;->a(I)Z

    move-result v1

    if-eqz v1, :cond_67

    invoke-virtual {p0, v2}, Lq6e;->g(Z)Z

    :cond_67
    if-eqz v3, :cond_6d

    invoke-virtual {p0, v3}, Lq6e;->f(Leri;)Ll6e;

    move-result-object v7

    :cond_6d
    if-eqz v7, :cond_83

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    iget-wide v1, v7, Ll6e;->b:J

    invoke-interface {v0, v6, v1, v2}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    goto :goto_8c

    :cond_83
    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/SharedPreferences;

    invoke-static {v0, v6}, Lcom/appsflyer/internal/j;->a(Landroid/content/SharedPreferences;Ljava/lang/String;)V

    :goto_8c
    invoke-virtual {p0}, Lq6e;->b()Leri;

    move-result-object v0

    invoke-virtual {p0, v0}, Lq6e;->i(Leri;)V

    invoke-virtual {p0}, Lq6e;->l()V

    return-void

    :pswitch_97
    iget-object v0, p0, Lwub;->a:Ljava/lang/Object;

    check-cast v0, Lq6e;

    iget-object v3, v0, Lq6e;->b:Liri;

    :try_start_9d
    new-instance v4, Ld9;

    const/4 v5, 0x5

    invoke-direct {v4, p0, v1, v5}, Ld9;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v3, v2}, Liri;->h(Z)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    invoke-static {v4, v1}, Liri;->p(Ljava/util/concurrent/Callable;Landroid/database/sqlite/SQLiteDatabase;)Ljava/lang/Object;

    iget-object v1, v0, Lq6e;->c:Lwzg;

    iget-object v4, v0, Lq6e;->m:Lp1;

    iget-object v0, v0, Lq6e;->h:Lk6e;

    invoke-virtual {v3, v1, v4, v0}, Liri;->l(Lwzg;Lp1;Lk6e;)Ljava/util/ArrayList;

    move-result-object v0

    new-instance v1, Lp6e;

    invoke-direct {v1, p0, v0, v2}, Lp6e;-><init>(Lwub;Ljava/util/ArrayList;B)V

    invoke-static {v1}, Lvml;->e(Ljava/lang/Runnable;)V
    :try_end_bc
    .catchall {:try_start_9d .. :try_end_bc} :catchall_c0

    invoke-virtual {v3}, Landroid/database/sqlite/SQLiteOpenHelper;->close()V

    return-void

    :catchall_c0
    move-exception p0

    invoke-virtual {v3}, Landroid/database/sqlite/SQLiteOpenHelper;->close()V

    throw p0

    nop

    :pswitch_data_c6
    .packed-switch 0x0
        :pswitch_97
    .end packed-switch
.end method
