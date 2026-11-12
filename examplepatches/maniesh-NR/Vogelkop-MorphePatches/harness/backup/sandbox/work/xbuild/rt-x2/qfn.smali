.class public final Lqfn;
.super Ly08;
.source "SourceFile"

# interfaces
.implements Ltdn;
.implements Lj6l;


# instance fields
.field public a:Lri8;

.field public b:Lf6l;

.field public c:Z

.field public final synthetic d:Lrfn;


# direct methods
.method public constructor <init>(Lrfn;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lqfn;->d:Lrfn;

    iget-object v0, p1, Lmgn;->g:Lydn;

    iget-object v0, v0, Lydn;->d:Lvdn;

    iget-boolean v0, v0, Lvdn;->a:Z

    iput-boolean v0, p0, Lqfn;->c:Z

    if-eqz v0, :cond_17

    iget-object p1, p1, Lmgn;->f:Lk6l;

    invoke-virtual {p1, p0}, Lk6l;->a(La2l;)Lf6l;

    move-result-object p1

    iput-object p1, p0, Lqfn;->b:Lf6l;

    :cond_17
    return-void
.end method


# virtual methods
.method public final C()V
    .registers 2

    iget-object p0, p0, Lqfn;->d:Lrfn;

    iget-object v0, p0, Lmgn;->g:Lydn;

    iget-object v0, v0, Lydn;->c:Lgfn;

    invoke-interface {v0}, Lgfn;->isEnabled()Z

    move-result v0

    if-eqz v0, :cond_f

    invoke-virtual {p0}, Lrfn;->g()V

    :cond_f
    return-void
.end method

.method public final E(Lb2l;Lorg/chromium/content_public/browser/NavigationHandle;)V
    .registers 13

    move-object p2, p1

    check-cast p2, Ld7l;

    iget-object v0, p2, Ld7l;->j:Le7l;

    invoke-interface {v0}, Lb9l;->m()Z

    move-result v0

    iget-object v1, p0, Lqfn;->d:Lrfn;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v2, v1, Lmgn;->a:Lcom/opera/android/BrowserActivity;

    invoke-static {v2}, Lrfn;->h(Lcom/opera/android/BrowserActivity;)Z

    move-result v3

    if-eqz v3, :cond_8c

    const/4 v3, 0x1

    if-eqz v0, :cond_4f

    iget-object v4, v1, Lrfn;->k:Ljava/util/HashSet;

    iget-object v5, p2, Ld7l;->j:Le7l;

    invoke-interface {v5}, Lb9l;->getId()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_8c

    invoke-static {v2}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v4

    iget-object v4, v4, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v5, "vpn.tooltip_premium.shown_incognito_promo"

    const/4 v6, 0x0

    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v4

    if-eqz v4, :cond_3f

    if-ne v4, v3, :cond_8c

    const/16 v4, 0xa

    goto :goto_40

    :cond_3f
    const/4 v4, 0x2

    :goto_40
    invoke-static {v2}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v2

    iget-object v2, v2, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v5, "vpn.tooltip_premium.incognito_tabs_created"

    invoke-interface {v2, v5, v6}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2

    if-lt v2, v4, :cond_8c

    goto :goto_6d

    :cond_4f
    iget-boolean v4, v1, Lrfn;->l:Z

    if-nez v4, :cond_8c

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-static {v2}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v2

    iget-object v2, v2, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v6, "vpn.tooltip_premium.vpn_enabled_timestamp"

    const-wide/16 v7, 0x0

    invoke-interface {v2, v6, v7, v8}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v6

    const-wide/32 v8, 0xa4cb800

    add-long/2addr v6, v8

    cmp-long v2, v4, v6

    if-ltz v2, :cond_8c

    :goto_6d
    invoke-virtual {v1, p1}, Lrfn;->i(Lb2l;)Z

    move-result p1

    if-eqz p1, :cond_8c

    iget-object p1, p0, Lqfn;->a:Lri8;

    if-eqz p1, :cond_7a

    invoke-static {p1}, Lvml;->a(Ljava/lang/Runnable;)V

    :cond_7a
    iget-object p1, p2, Ld7l;->j:Le7l;

    invoke-interface {p1}, Lb9l;->getId()I

    move-result p1

    new-instance p2, Lri8;

    invoke-direct {p2, v3, p1, p0, v0}, Lri8;-><init>(BILjava/lang/Object;Z)V

    iput-object p2, p0, Lqfn;->a:Lri8;

    const-wide/16 p0, 0x3e8

    invoke-static {p2, p0, p1}, Lvml;->d(Ljava/lang/Runnable;J)V

    :cond_8c
    return-void
.end method

.method public final Q(Lb2l;Lorg/chromium/content_public/browser/NavigationHandle;)V
    .registers 3

    iget-object p1, p0, Lqfn;->a:Lri8;

    if-eqz p1, :cond_a

    invoke-static {p1}, Lvml;->a(Ljava/lang/Runnable;)V

    const/4 p1, 0x0

    iput-object p1, p0, Lqfn;->a:Lri8;

    :cond_a
    return-void
.end method

.method public final S(Ld7l;)V
    .registers 2

    iget-object p1, p0, Lqfn;->a:Lri8;

    if-eqz p1, :cond_a

    invoke-static {p1}, Lvml;->a(Ljava/lang/Runnable;)V

    const/4 p1, 0x0

    iput-object p1, p0, Lqfn;->a:Lri8;

    :cond_a
    return-void
.end method

.method public final o(Lb2l;IZ)V
    .registers 4

    check-cast p1, Ld7l;

    iget-object p1, p1, Ld7l;->j:Le7l;

    invoke-interface {p1}, Lb9l;->m()Z

    move-result p1

    if-eqz p1, :cond_2f

    iget-object p0, p0, Lqfn;->d:Lrfn;

    iget-object p0, p0, Lmgn;->a:Lcom/opera/android/BrowserActivity;

    invoke-static {p0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object p1

    invoke-virtual {p1}, Lru9;->b()Lnv6;

    move-result-object p1

    invoke-static {p0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object p0

    const/4 p2, 0x0

    iget-object p0, p0, Lru9;->a:Landroid/content/SharedPreferences;

    const-string p3, "vpn.tooltip_premium.incognito_tabs_created"

    invoke-interface {p0, p3, p2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p0

    add-int/lit8 p0, p0, 0x1

    iget-object p2, p1, Lnv6;->a:Ljava/lang/Object;

    check-cast p2, Landroid/content/SharedPreferences$Editor;

    invoke-interface {p2, p3, p0}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {p1}, Lnv6;->w()V

    :cond_2f
    return-void
.end method

.method public final s()V
    .registers 7

    iget-object v0, p0, Lqfn;->d:Lrfn;

    iget-object v1, v0, Lmgn;->g:Lydn;

    iget-object v2, v0, Lmgn;->a:Lcom/opera/android/BrowserActivity;

    iget-object v1, v1, Lydn;->d:Lvdn;

    iget-boolean v1, v1, Lvdn;->a:Z

    iget-boolean v3, p0, Lqfn;->c:Z

    if-ne v3, v1, :cond_f

    return-void

    :cond_f
    iput-boolean v1, p0, Lqfn;->c:Z

    const-string v3, "vpn.tooltip_premium.vpn_enabled_timestamp"

    if-eqz v1, :cond_36

    invoke-static {v2}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v1

    invoke-virtual {v1}, Lru9;->b()Lnv6;

    move-result-object v1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    iget-object v2, v1, Lnv6;->a:Ljava/lang/Object;

    check-cast v2, Landroid/content/SharedPreferences$Editor;

    invoke-interface {v2, v3, v4, v5}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {v1}, Lnv6;->w()V

    iget-object v1, v0, Lmgn;->f:Lk6l;

    iget-object v0, v0, Lrfn;->m:Lqfn;

    invoke-virtual {v1, v0}, Lk6l;->a(La2l;)Lf6l;

    move-result-object v0

    iput-object v0, p0, Lqfn;->b:Lf6l;

    return-void

    :cond_36
    iget-object v1, p0, Lqfn;->b:Lf6l;

    if-eqz v1, :cond_42

    iget-object v0, v0, Lmgn;->f:Lk6l;

    invoke-virtual {v0, v1}, Lk6l;->x(Lj6l;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lqfn;->b:Lf6l;

    :cond_42
    invoke-static {v2}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object p0

    invoke-virtual {p0}, Lru9;->b()Lnv6;

    move-result-object p0

    iget-object v0, p0, Lnv6;->a:Ljava/lang/Object;

    check-cast v0, Landroid/content/SharedPreferences$Editor;

    invoke-interface {v0, v3}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {p0}, Lnv6;->w()V

    return-void
.end method

.method public final t()V
    .registers 1

    return-void
.end method
