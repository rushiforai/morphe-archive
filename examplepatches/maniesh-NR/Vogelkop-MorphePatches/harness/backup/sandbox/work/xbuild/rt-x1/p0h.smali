.class public final Lp0h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lp5j;
.implements Lgj;
.implements Lq9g;


# instance fields
.field public final a:Lcom/opera/android/settings/SettingsManager;

.field public final b:Ls9g;

.field public final c:Lh42;

.field public final d:Lh42;

.field public final e:Lkze;

.field public final f:Lkze;

.field public final g:Lkze;

.field public final h:Lh42;


# direct methods
.method public constructor <init>(Lcom/opera/android/settings/SettingsManager;Ls9g;)V
    .registers 10

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lh42;

    invoke-direct {v0}, Lh42;-><init>()V

    iput-object v0, p0, Lp0h;->c:Lh42;

    new-instance v1, Lh42;

    invoke-direct {v1}, Lh42;-><init>()V

    iput-object v1, p0, Lp0h;->d:Lh42;

    new-instance v2, Lkze;

    const-string v3, ""

    invoke-direct {v2, v3}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v2, p0, Lp0h;->e:Lkze;

    new-instance v3, Lkze;

    invoke-static {}, Lqwi;->a()Lqwi;

    move-result-object v4

    invoke-direct {v3, v4}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v3, p0, Lp0h;->f:Lkze;

    new-instance v3, Lkze;

    sget-object v4, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-direct {v3, v4}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v3, p0, Lp0h;->g:Lkze;

    new-instance v4, Lh42;

    invoke-direct {v4}, Lh42;-><init>()V

    iput-object v4, p0, Lp0h;->h:Lh42;

    sget-object v5, Lh1b;->b:La1b;

    sget-object v5, Lcsh;->e:Lcsh;

    invoke-virtual {v4, v5}, Lekc;->r(Ljava/lang/Object;)V

    new-instance v5, Lm0h;

    const/4 v6, 0x0

    invoke-direct {v5, p0, v6}, Lm0h;-><init>(Lp0h;B)V

    invoke-virtual {v4, v2, v5}, Lh42;->s(Lekc;Lf7f;)V

    new-instance v5, Lm0h;

    const/4 v6, 0x1

    invoke-direct {v5, p0, v6}, Lm0h;-><init>(Lp0h;B)V

    invoke-virtual {v4, v3, v5}, Lh42;->s(Lekc;Lf7f;)V

    new-instance v4, Lm0h;

    const/4 v5, 0x2

    invoke-direct {v4, p0, v5}, Lm0h;-><init>(Lp0h;B)V

    invoke-virtual {v0, v3, v4}, Lh42;->s(Lekc;Lf7f;)V

    new-instance v4, Lm0h;

    const/4 v5, 0x3

    invoke-direct {v4, p0, v5}, Lm0h;-><init>(Lp0h;B)V

    invoke-virtual {v0, v2, v4}, Lh42;->s(Lekc;Lf7f;)V

    new-instance v0, Lm0h;

    const/4 v4, 0x4

    invoke-direct {v0, p0, v4}, Lm0h;-><init>(Lp0h;B)V

    invoke-virtual {v1, v3, v0}, Lh42;->s(Lekc;Lf7f;)V

    new-instance v0, Lm0h;

    const/4 v3, 0x5

    invoke-direct {v0, p0, v3}, Lm0h;-><init>(Lp0h;B)V

    invoke-virtual {v1, v2, v0}, Lh42;->s(Lekc;Lf7f;)V

    iput-object p1, p0, Lp0h;->a:Lcom/opera/android/settings/SettingsManager;

    iput-object p2, p0, Lp0h;->b:Ls9g;

    invoke-virtual {p1, p0}, Lcom/opera/android/settings/SettingsManager;->a(Lp5j;)V

    sget-object p1, Lhj;->a:Li7f;

    invoke-virtual {p1, p0}, Li7f;->b(Ljava/lang/Object;)Z

    invoke-virtual {p0}, Lp0h;->c()V

    invoke-virtual {p0}, Lp0h;->g()V

    invoke-virtual {p2, p0}, Ls9g;->a(Lq9g;)V

    return-void
.end method


# virtual methods
.method public final A()V
    .registers 1

    invoke-virtual {p0}, Lp0h;->f()V

    return-void
.end method

.method public final M(Ljava/lang/String;)V
    .registers 3

    const-string v0, "ad_blocking"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_c

    invoke-virtual {p0}, Lp0h;->c()V

    return-void

    :cond_c
    const-string v0, "tracker_blocker"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_17

    invoke-virtual {p0}, Lp0h;->g()V

    :cond_17
    return-void
.end method

.method public final a(IILjava/lang/String;)V
    .registers 5

    iget-object p1, p0, Lp0h;->e:Lkze;

    invoke-virtual {p1}, Lekc;->g()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    invoke-static {p1}, Lcom/opera/android/browser/BrowserUtils;->getExternalUrlWithFallback(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    sget-object v0, Lhj;->a:Li7f;

    invoke-static {p1}, Lwqm;->q(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1, p3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_26

    and-int/lit8 p1, p2, 0x1

    if-eqz p1, :cond_1f

    invoke-virtual {p0}, Lp0h;->c()V

    :cond_1f
    and-int/lit8 p2, p2, 0x2

    if-eqz p2, :cond_26

    invoke-virtual {p0}, Lp0h;->g()V

    :cond_26
    return-void
.end method

.method public final b(IZ)V
    .registers 6

    iget-object v0, p0, Lp0h;->g:Lkze;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iget-object p0, p0, Lp0h;->e:Lkze;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    invoke-static {p0}, Lcom/opera/android/browser/BrowserUtils;->getExternalUrlWithFallback(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    sget-object v1, Lhj;->a:Li7f;

    invoke-static {p0}, Lwqm;->q(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    if-nez v1, :cond_23

    move v1, v2

    goto :goto_27

    :cond_23
    invoke-static {v1, v0}, LJ/N;->M$NXlYYm(Ljava/lang/Object;Z)I

    move-result v1

    :goto_27
    and-int/2addr v1, p1

    if-ne v1, p1, :cond_2c

    const/4 v1, 0x1

    goto :goto_2d

    :cond_2c
    move v1, v2

    :goto_2d
    if-eq p2, v1, :cond_30

    return-void

    :cond_30
    if-eqz p2, :cond_36

    invoke-static {v2, p1, p0, v0}, Lhj;->b(IILjava/lang/String;Z)V

    return-void

    :cond_36
    invoke-static {p1, v2, p0, v0}, Lhj;->b(IILjava/lang/String;Z)V

    return-void
.end method

.method public final c()V
    .registers 3

    iget-object v0, p0, Lp0h;->c:Lh42;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lo0h;

    if-nez v0, :cond_d

    const-wide/16 v0, 0x0

    goto :goto_f

    :cond_d
    iget-wide v0, v0, Lo0h;->a:J

    :goto_f
    invoke-virtual {p0, v0, v1}, Lp0h;->e(J)V

    return-void
.end method

.method public final d(Ljava/util/List;)V
    .registers 5

    iget-object v0, p0, Lp0h;->e:Lkze;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Lorg/chromium/net/GURLUtils;->getOrigin(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1}, Ljava/util/Collection;->stream()Ljava/util/stream/Stream;

    move-result-object p1

    new-instance v1, Ln0h;

    const/4 v2, 0x0

    invoke-direct {v1, v0, v2}, Ln0h;-><init>(Ljava/lang/String;B)V

    invoke-interface {p1, v1}, Ljava/util/stream/Stream;->anyMatch(Ljava/util/function/Predicate;)Z

    move-result p1

    if-eqz p1, :cond_1f

    invoke-virtual {p0}, Lp0h;->f()V

    :cond_1f
    return-void
.end method

.method public final e(J)V
    .registers 8

    new-instance v0, Lo0h;

    iget-object v1, p0, Lp0h;->a:Lcom/opera/android/settings/SettingsManager;

    const-string v2, "ad_blocking"

    invoke-virtual {v1, v2}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v1

    iget-object v2, p0, Lp0h;->e:Lkze;

    invoke-virtual {v2}, Lekc;->g()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-static {v2}, Lcom/opera/android/browser/BrowserUtils;->getExternalUrlWithFallback(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lp0h;->g:Lkze;

    invoke-virtual {v3}, Lekc;->g()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    sget-object v4, Lhj;->a:Li7f;

    invoke-static {v2}, Lwqm;->q(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const/4 v4, 0x0

    if-nez v2, :cond_2d

    move v2, v4

    goto :goto_31

    :cond_2d
    invoke-static {v2, v3}, LJ/N;->M$NXlYYm(Ljava/lang/Object;Z)I

    move-result v2

    :goto_31
    const/4 v3, 0x1

    and-int/2addr v2, v3

    if-ne v2, v3, :cond_36

    move v4, v3

    :cond_36
    xor-int/2addr v4, v3

    invoke-direct {v0, p1, p2, v1, v4}, Lo0h;-><init>(JZZ)V

    iget-object p0, p0, Lp0h;->c:Lh42;

    invoke-virtual {p0, v0}, Lekc;->r(Ljava/lang/Object;)V

    return-void
.end method

.method public final f()V
    .registers 5

    iget-object v0, p0, Lp0h;->e:Lkze;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Lorg/chromium/net/GURLUtils;->getOrigin(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    iget-object v2, p0, Lp0h;->h:Lh42;

    if-nez v1, :cond_38

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-static {v1}, Lwqm;->D(Landroid/net/Uri;)Z

    move-result v1

    if-eqz v1, :cond_38

    sget-object v1, Lui6;->n:[Llag;

    sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    iget-object p0, p0, Lp0h;->g:Lkze;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v3, p0}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result p0

    invoke-static {v0, v1, p0}, Lui6;->x(Ljava/lang/String;[Llag;Z)Ljava/util/ArrayList;

    move-result-object p0

    invoke-static {p0}, Lh1b;->s(Ljava/util/Collection;)Lh1b;

    move-result-object p0

    invoke-virtual {v2, p0}, Lekc;->r(Ljava/lang/Object;)V

    return-void

    :cond_38
    sget-object p0, Lh1b;->b:La1b;

    sget-object p0, Lcsh;->e:Lcsh;

    invoke-virtual {v2, p0}, Lekc;->r(Ljava/lang/Object;)V

    return-void
.end method

.method public final g()V
    .registers 3

    iget-object v0, p0, Lp0h;->d:Lh42;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lo0h;

    if-nez v0, :cond_d

    const-wide/16 v0, 0x0

    goto :goto_f

    :cond_d
    iget-wide v0, v0, Lo0h;->a:J

    :goto_f
    invoke-virtual {p0, v0, v1}, Lp0h;->h(J)V

    return-void
.end method

.method public final h(J)V
    .registers 9

    new-instance v0, Lo0h;

    iget-object v1, p0, Lp0h;->a:Lcom/opera/android/settings/SettingsManager;

    const-string v2, "tracker_blocker"

    invoke-virtual {v1, v2}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v1

    iget-object v2, p0, Lp0h;->e:Lkze;

    invoke-virtual {v2}, Lekc;->g()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-static {v2}, Lcom/opera/android/browser/BrowserUtils;->getExternalUrlWithFallback(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lp0h;->g:Lkze;

    invoke-virtual {v3}, Lekc;->g()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    sget-object v4, Lhj;->a:Li7f;

    invoke-static {v2}, Lwqm;->q(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const/4 v4, 0x0

    if-nez v2, :cond_2d

    move v2, v4

    goto :goto_31

    :cond_2d
    invoke-static {v2, v3}, LJ/N;->M$NXlYYm(Ljava/lang/Object;Z)I

    move-result v2

    :goto_31
    const/4 v3, 0x2

    and-int/2addr v2, v3

    const/4 v5, 0x1

    if-ne v2, v3, :cond_37

    move v4, v5

    :cond_37
    xor-int/2addr v4, v5

    invoke-direct {v0, p1, p2, v1, v4}, Lo0h;-><init>(JZZ)V

    iget-object p0, p0, Lp0h;->d:Lh42;

    invoke-virtual {p0, v0}, Lekc;->r(Ljava/lang/Object;)V

    return-void
.end method
