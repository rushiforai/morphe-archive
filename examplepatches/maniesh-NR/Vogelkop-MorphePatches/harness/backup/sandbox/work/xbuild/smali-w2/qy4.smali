.class public final Lqy4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljs5;


# instance fields
.field public a:B

.field public b:Ljava/lang/Object;

.field public final c:Ljava/lang/Object;

.field public d:Ljava/lang/Object;

.field public e:Ljava/lang/Object;


# direct methods
.method public constructor <init>(ILcom/opera/api/Callback;Lcom/opera/android/browser/chromium/ChromiumContent;Lx5f;Lru9;)V
    .registers 6

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    iput-byte p1, p0, Lqy4;->a:B

    .line 23
    iput-object p2, p0, Lqy4;->b:Ljava/lang/Object;

    .line 24
    iput-object p3, p0, Lqy4;->c:Ljava/lang/Object;

    .line 25
    iput-object p4, p0, Lqy4;->d:Ljava/lang/Object;

    .line 26
    iput-object p5, p0, Lqy4;->e:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lmv1;Lole;)V
    .registers 4

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 18
    iput-byte v0, p0, Lqy4;->a:B

    .line 19
    iput-object p1, p0, Lqy4;->b:Ljava/lang/Object;

    .line 20
    iput-object p2, p0, Lqy4;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ls6h;Lua6;I)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lqy4;->c:Ljava/lang/Object;

    iput-object p1, p0, Lqy4;->d:Ljava/lang/Object;

    iput-object p2, p0, Lqy4;->e:Ljava/lang/Object;

    iput-byte p3, p0, Lqy4;->a:B

    return-void
.end method


# virtual methods
.method public final a(Lqs5;Z)Z
    .registers 6

    iget-boolean v0, p1, Lqs5;->u:Z

    if-eqz v0, :cond_18

    iget-object v1, p1, Lqs5;->k:Lsqh;

    if-eqz v1, :cond_18

    iget-object v1, v1, Lsqh;->a:Ljava/lang/String;

    invoke-static {v1}, Lwqm;->i(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_18

    const-string v2, ".youtube.com"

    invoke-virtual {v1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_52

    :cond_18
    if-eqz v0, :cond_28

    iget-object v1, p1, Lqs5;->e:Ljava/lang/String;

    sget-object v2, Lwqm;->a:[Ljava/lang/String;

    if-eqz v1, :cond_28

    const-string v2, "blob:"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_52

    :cond_28
    if-eqz p2, :cond_32

    iget-object v1, p1, Lqs5;->g:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_52

    :cond_32
    iget-byte p0, p0, Lqy4;->a:B

    and-int/lit8 p0, p0, 0x8

    const/4 v1, 0x1

    if-eqz p0, :cond_46

    iget-object p0, p1, Lqs5;->f:Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p0

    if-lez p0, :cond_46

    iget-boolean p0, p1, Lqs5;->j:Z

    if-eqz p0, :cond_46

    return v1

    :cond_46
    if-nez p2, :cond_52

    iget-boolean p0, p1, Lqs5;->s:Z

    if-nez p0, :cond_54

    iget-boolean p0, p1, Lqs5;->t:Z

    if-nez p0, :cond_54

    if-nez v0, :cond_54

    :cond_52
    const/4 p0, 0x0

    return p0

    :cond_54
    return v1
.end method

.method public final b()Ljava/util/ArrayList;
    .registers 8

    iget-object v0, p0, Lqy4;->c:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    invoke-virtual {p0}, Lqy4;->c()Lta6;

    move-result-object v1

    invoke-virtual {v1}, Lta6;->b()Lta6;

    move-result-object v1

    monitor-exit v0
    :try_end_c
    .catchall {:try_start_3 .. :try_end_c} :catchall_5f

    iget-object v0, p0, Lqy4;->d:Ljava/lang/Object;

    check-cast v0, Ls6h;

    const-string v2, "history"

    iget-object v3, v0, Ls6h;->a:Ljava/lang/Object;

    check-cast v3, Lk32;

    invoke-virtual {v3}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/content/SharedPreferences;

    iget-object v0, v0, Ls6h;->b:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/4 v2, 0x0

    invoke-interface {v3, v0, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_2d

    const-string v0, ""

    :cond_2d
    const/16 v2, 0x2c

    const/4 v3, 0x0

    invoke-static {v3, v0, v2}, Laik;->r(ZLjava/lang/String;C)Ljava/util/ArrayList;

    move-result-object v0

    new-instance v2, Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v4

    add-int/lit8 v4, v4, 0x1

    invoke-direct {v2, v4}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v4

    :goto_43
    if-ge v3, v4, :cond_59

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    add-int/lit8 v3, v3, 0x1

    check-cast v5, Ljava/lang/String;

    iget-object v6, p0, Lqy4;->e:Ljava/lang/Object;

    check-cast v6, Lua6;

    invoke-interface {v6, v5}, Lua6;->f(Ljava/lang/String;)Lta6;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_43

    :cond_59
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-object v2

    :goto_5d
    :try_start_5d
    monitor-exit v0
    :try_end_5e
    .catchall {:try_start_5d .. :try_end_5e} :catchall_5f

    throw p0

    :catchall_5f
    move-exception p0

    goto :goto_5d
.end method

.method public final c()Lta6;
    .registers 9

    iget-object v0, p0, Lqy4;->d:Ljava/lang/Object;

    check-cast v0, Ls6h;

    iget-object v1, p0, Lqy4;->e:Ljava/lang/Object;

    check-cast v1, Lua6;

    new-instance v2, Ljava/util/GregorianCalendar;

    invoke-direct {v2}, Ljava/util/GregorianCalendar;-><init>()V

    iget-object v3, p0, Lqy4;->b:Ljava/lang/Object;

    check-cast v3, Lta6;

    const/4 v4, 0x0

    if-nez v3, :cond_37

    iget-object v3, v0, Ls6h;->a:Ljava/lang/Object;

    check-cast v3, Lk32;

    invoke-virtual {v3}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/content/SharedPreferences;

    iget-object v5, v0, Ls6h;->b:Ljava/lang/Object;

    check-cast v5, Ljava/lang/String;

    const-string v6, "today"

    invoke-virtual {v5, v6}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v3, v5, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_33

    invoke-interface {v1, v3}, Lua6;->f(Ljava/lang/String;)Lta6;

    move-result-object v3

    goto :goto_37

    :cond_33
    invoke-interface {v1, v2}, Lua6;->e(Ljava/util/GregorianCalendar;)Lta6;

    move-result-object v3

    :cond_37
    :goto_37
    invoke-virtual {v3, v2}, Lta6;->e(Ljava/util/GregorianCalendar;)Z

    move-result v5

    if-nez v5, :cond_8b

    invoke-virtual {v3}, Lta6;->c()Z

    move-result v5

    if-nez v5, :cond_84

    iget-object v5, v0, Ls6h;->a:Ljava/lang/Object;

    check-cast v5, Lk32;

    invoke-virtual {v5}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/content/SharedPreferences;

    iget-object v6, v0, Ls6h;->b:Ljava/lang/Object;

    check-cast v6, Ljava/lang/String;

    const-string v7, "history"

    invoke-virtual {v6, v7}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_5f

    const-string v4, ""

    :cond_5f
    const/16 v5, 0x2c

    const/4 v6, 0x0

    invoke-static {v6, v4, v5}, Laik;->r(ZLjava/lang/String;C)Ljava/util/ArrayList;

    move-result-object v4

    invoke-interface {v1, v3}, Lua6;->i(Lta6;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v3

    iget-byte v5, p0, Lqy4;->a:B

    if-le v3, v5, :cond_81

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v3

    sub-int/2addr v3, v5

    invoke-virtual {v4, v6, v3}, Ljava/util/ArrayList;->subList(II)Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->clear()V

    :cond_81
    invoke-virtual {p0, v4}, Lqy4;->f(Ljava/util/List;)V

    :cond_84
    invoke-virtual {v0}, Ls6h;->P()V

    invoke-interface {v1, v2}, Lua6;->e(Ljava/util/GregorianCalendar;)Lta6;

    move-result-object v3

    :cond_8b
    iput-object v3, p0, Lqy4;->b:Ljava/lang/Object;

    return-object v3
.end method

.method public final d()V
    .registers 3

    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    invoke-virtual {p0, v0}, Lqy4;->f(Ljava/util/List;)V

    iget-object v0, p0, Lqy4;->c:Ljava/lang/Object;

    monitor-enter v0

    :try_start_8
    iget-object v1, p0, Lqy4;->d:Ljava/lang/Object;

    check-cast v1, Ls6h;

    invoke-virtual {v1}, Ls6h;->P()V

    const/4 v1, 0x0

    iput-object v1, p0, Lqy4;->b:Ljava/lang/Object;

    monitor-exit v0

    return-void

    :goto_14
    monitor-exit v0
    :try_end_15
    .catchall {:try_start_8 .. :try_end_15} :catchall_16

    throw p0

    :catchall_16
    move-exception p0

    goto :goto_14
.end method

.method public final e(Lqs5;Lk73;)V
    .registers 13

    iget-boolean v0, p1, Lqs5;->u:Z

    iget-object v1, p0, Lqy4;->c:Ljava/lang/Object;

    move-object v3, v1

    check-cast v3, Lcom/opera/android/browser/chromium/ChromiumContent;

    if-eqz v0, :cond_1c

    iget-object p0, p1, Lqs5;->e:Ljava/lang/String;

    iget-object p1, p1, Lqs5;->k:Lsqh;

    if-eqz p1, :cond_12

    iget-object p1, p1, Lsqh;->a:Ljava/lang/String;

    goto :goto_14

    :cond_12
    const-string p1, ""

    :goto_14
    invoke-virtual {v3}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object p2

    invoke-static {p2, p0, p1}, LJ/N;->M8vd_RmR(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    return-void

    :cond_1c
    iget-byte v6, p0, Lqy4;->a:B

    iget-object v0, p0, Lqy4;->b:Ljava/lang/Object;

    move-object v7, v0

    check-cast v7, Lcom/opera/api/Callback;

    iget-object v0, p0, Lqy4;->d:Ljava/lang/Object;

    move-object v8, v0

    check-cast v8, Lx5f;

    iget-object p0, p0, Lqy4;->e:Ljava/lang/Object;

    move-object v9, p0

    check-cast v9, Lru9;

    new-instance v2, Lzs5;

    move-object v4, p1

    move-object v5, p2

    invoke-direct/range {v2 .. v9}, Lzs5;-><init>(Lcom/opera/android/browser/chromium/ChromiumContent;Lqs5;Lk73;ILcom/opera/api/Callback;Lx5f;Lru9;)V

    iget-object p0, v3, Lcom/opera/android/browser/chromium/ChromiumContent;->p:Lcom/opera/android/browser/dialog/DialogDelegate;

    invoke-interface {p0, v2}, Lcom/opera/android/browser/dialog/DialogDelegate;->d(Lcej;)V

    return-void
.end method

.method public final f(Ljava/util/List;)V
    .registers 4

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_9
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1e

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v1, 0x2c

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_9

    :cond_1e
    iget-object p0, p0, Lqy4;->d:Ljava/lang/Object;

    check-cast p0, Ls6h;

    const-string p1, "history"

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Ls6h;->O(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public final g()V
    .registers 5

    iget-object v0, p0, Lqy4;->c:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    invoke-virtual {p0}, Lqy4;->c()Lta6;

    move-result-object v1

    iget-object v2, p0, Lqy4;->e:Ljava/lang/Object;

    check-cast v2, Lua6;

    invoke-interface {v2, v1}, Lua6;->d(Lta6;)V

    iget-object v1, p0, Lqy4;->d:Ljava/lang/Object;

    check-cast v1, Ls6h;

    const-string v2, "today"

    iget-object v3, p0, Lqy4;->e:Ljava/lang/Object;

    check-cast v3, Lua6;

    iget-object p0, p0, Lqy4;->b:Ljava/lang/Object;

    check-cast p0, Lta6;

    invoke-interface {v3, p0}, Lua6;->i(Lta6;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, v2, p0}, Ls6h;->O(Ljava/lang/String;Ljava/lang/String;)V

    monitor-exit v0

    return-void

    :goto_25
    monitor-exit v0
    :try_end_26
    .catchall {:try_start_3 .. :try_end_26} :catchall_27

    throw p0

    :catchall_27
    move-exception p0

    goto :goto_25
.end method
