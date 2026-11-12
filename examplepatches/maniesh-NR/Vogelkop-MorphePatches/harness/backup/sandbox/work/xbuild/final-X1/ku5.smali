.class public final Lku5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lw6f;


# instance fields
.field public final a:Lc5o;

.field public final b:Lcom/opera/android/continue_on_booking/NativeContinueOnBookingStorage;

.field public final c:Lqb7;

.field public final d:Lx5f;

.field public final e:Lh7f;

.field public f:Ljava/util/List;

.field public g:Z

.field public final h:Leu5;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lx5f;)V
    .registers 7

    new-instance v0, Lc5o;

    const/16 v1, 0xb

    invoke-direct {v0, p1, v1}, Lc5o;-><init>(Landroid/content/Context;B)V

    new-instance v1, Lcom/opera/android/continue_on_booking/NativeContinueOnBookingStorage;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    new-instance v2, Lqb7;

    const/16 v3, 0x1b

    invoke-direct {v2, p1, v3}, Lqb7;-><init>(Landroid/content/Context;B)V

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Lh7f;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lku5;->e:Lh7f;

    new-instance p1, Leu5;

    invoke-direct {p1, p0}, Leu5;-><init>(Lku5;)V

    iput-object p1, p0, Lku5;->h:Leu5;

    iput-object v0, p0, Lku5;->a:Lc5o;

    iput-object v1, p0, Lku5;->b:Lcom/opera/android/continue_on_booking/NativeContinueOnBookingStorage;

    iput-object v2, p0, Lku5;->c:Lqb7;

    iput-object p2, p0, Lku5;->d:Lx5f;

    new-instance p1, Lfu5;

    const/4 p2, 0x0

    invoke-direct {p1, p0, p2}, Lfu5;-><init>(Lku5;B)V

    iget-object p0, v2, Lqb7;->c:Ljava/lang/Object;

    check-cast p0, Ljava/lang/Boolean;

    if-nez p0, :cond_40

    iget-object p0, v2, Lqb7;->a:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void

    :cond_40
    invoke-virtual {p1, p0}, Lfu5;->run(Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public final F(Ljava/lang/Object;)V
    .registers 3

    check-cast p1, Lju5;

    iget-object v0, p0, Lku5;->e:Lh7f;

    invoke-virtual {v0, p1}, Lh7f;->b(Ljava/lang/Object;)Z

    iget-boolean p0, p0, Lku5;->g:Z

    invoke-interface {p1, p0}, Lju5;->e(Z)V

    return-void
.end method

.method public final H(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Lju5;

    iget-object p0, p0, Lku5;->e:Lh7f;

    invoke-virtual {p0, p1}, Lh7f;->c(Ljava/lang/Object;)Z

    return-void
.end method

.method public final a()Z
    .registers 6

    iget-object p0, p0, Lku5;->a:Lc5o;

    invoke-virtual {p0}, Lc5o;->s()Llu5;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    if-eqz v0, :cond_2b

    const/4 v1, 0x2

    if-ne v0, v1, :cond_29

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-object p0, p0, Lc5o;->a:Ljava/lang/Object;

    check-cast p0, Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    const-string v2, "postponed_remind_timestamp"

    const-wide/16 v3, -0x1

    invoke-interface {p0, v2, v3, v4}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v2

    cmp-long p0, v0, v2

    if-gtz p0, :cond_2b

    :cond_29
    const/4 p0, 0x0

    return p0

    :cond_2b
    const/4 p0, 0x1

    return p0
.end method

.method public final b()V
    .registers 4

    iget-object v0, p0, Lku5;->f:Ljava/util/List;

    if-eqz v0, :cond_3d

    invoke-virtual {p0}, Lku5;->e()Z

    move-result v0

    if-nez v0, :cond_3d

    iget-object v0, p0, Lku5;->f:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x2

    if-lt v0, v1, :cond_32

    iget-object v0, p0, Lku5;->a:Lc5o;

    iget-object v0, v0, Lc5o;->a:Ljava/lang/Object;

    check-cast v0, Lb59;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "state"

    const-string v2, "visible"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    invoke-virtual {p0}, Lku5;->g()V

    return-void

    :cond_32
    iget-object v0, p0, Lku5;->f:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_3d

    invoke-virtual {p0}, Lku5;->c()V

    :cond_3d
    return-void
.end method

.method public final c()V
    .registers 2

    iget-object v0, p0, Lku5;->a:Lc5o;

    invoke-virtual {v0}, Lc5o;->A()V

    invoke-virtual {p0}, Lku5;->g()V

    return-void
.end method

.method public final e()Z
    .registers 6

    iget-object p0, p0, Lku5;->a:Lc5o;

    invoke-virtual {p0}, Lc5o;->s()Llu5;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    const/4 v1, 0x2

    if-eq v0, v1, :cond_11

    const/4 p0, 0x3

    if-eq v0, p0, :cond_2b

    goto :goto_2d

    :cond_11
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-object p0, p0, Lc5o;->a:Ljava/lang/Object;

    check-cast p0, Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    const-string v2, "postponed_remind_timestamp"

    const-wide/16 v3, -0x1

    invoke-interface {p0, v2, v3, v4}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v2

    cmp-long p0, v0, v2

    if-gtz p0, :cond_2d

    :cond_2b
    const/4 p0, 0x1

    return p0

    :cond_2d
    :goto_2d
    const/4 p0, 0x0

    return p0
.end method

.method public final f(Ljava/lang/Runnable;)V
    .registers 4

    new-instance v0, Lhu5;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, v1}, Lhu5;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object p0, p0, Lku5;->b:Lcom/opera/android/continue_on_booking/NativeContinueOnBookingStorage;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p0, Lcom/opera/android/continue_on_booking/NativeContinueOnBookingStorage$Request;

    invoke-direct {p0, v0}, Lcom/opera/android/continue_on_booking/NativeContinueOnBookingStorage$Request;-><init>(Lhu5;)V

    sget-object p1, Lcak;->d:Lavj;

    const/4 p1, 0x1

    invoke-static {p1, p0}, Lavj;->g(ILjava/lang/Runnable;)V

    return-void
.end method

.method public final g()V
    .registers 5

    invoke-virtual {p0}, Lku5;->a()Z

    move-result v0

    iget-boolean v1, p0, Lku5;->g:Z

    if-eq v0, v1, :cond_52

    iput-boolean v0, p0, Lku5;->g:Z

    const-string v1, "reported_available"

    iget-object v2, p0, Lku5;->a:Lc5o;

    if-eqz v0, :cond_2f

    iget-object v2, v2, Lc5o;->a:Ljava/lang/Object;

    check-cast v2, Lb59;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/SharedPreferences;

    const/4 v3, 0x0

    invoke-interface {v2, v1, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    if-nez v3, :cond_3c

    const/4 v3, 0x1

    invoke-static {v2, v1, v3}, Lcom/appsflyer/internal/j;->d(Landroid/content/SharedPreferences;Ljava/lang/String;Z)V

    iget-object v1, p0, Lku5;->d:Lx5f;

    iget-boolean v2, v1, Lx5f;->h:Z

    if-eqz v2, :cond_3c

    invoke-virtual {v1, v3}, Lx5f;->k(I)V

    goto :goto_3c

    :cond_2f
    iget-object v2, v2, Lc5o;->a:Ljava/lang/Object;

    check-cast v2, Lb59;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/SharedPreferences;

    invoke-static {v2, v1}, Lcom/appsflyer/internal/j;->a(Landroid/content/SharedPreferences;Ljava/lang/String;)V

    :cond_3c
    :goto_3c
    iget-object p0, p0, Lku5;->e:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :goto_42
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_52

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lju5;

    invoke-interface {v1, v0}, Lju5;->e(Z)V

    goto :goto_42

    :cond_52
    return-void
.end method
