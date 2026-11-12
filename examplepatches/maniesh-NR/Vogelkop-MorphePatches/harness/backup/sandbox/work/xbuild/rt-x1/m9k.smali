.class public final Lm9k;
.super Llim;
.source "SourceFile"


# instance fields
.field public final a:Lumi;

.field public final b:Lcom/opera/android/settings/SettingsManager;

.field public final c:Ljava/util/List;

.field public d:Ll9k;

.field public final e:Ljze;

.field public f:Z

.field public final g:Lt77;

.field public h:Loml;


# direct methods
.method public constructor <init>(Landroid/app/Activity;Lumi;Lcom/opera/android/Lazy;Lcom/opera/android/settings/SettingsManager;Lm9c;)V
    .registers 7

    new-instance v0, Lj9k;

    invoke-direct {v0, p1, p2, p3, p4}, Lj9k;-><init>(Landroid/app/Activity;Lumi;Lcom/opera/android/Lazy;Lcom/opera/android/settings/SettingsManager;)V

    new-instance p3, Lbac;

    invoke-direct {p3, p1, p5}, Lbac;-><init>(Landroid/app/Activity;Lm9c;)V

    const/4 p1, 0x2

    new-array p1, p1, [Lk9k;

    const/4 p5, 0x0

    aput-object v0, p1, p5

    const/4 v0, 0x1

    aput-object p3, p1, v0

    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lm9k;->a:Lumi;

    iput-object p4, p0, Lm9k;->b:Lcom/opera/android/settings/SettingsManager;

    iput-object p1, p0, Lm9k;->c:Ljava/util/List;

    sget-object p2, Ll9k;->a:Ll9k;

    iput-object p2, p0, Lm9k;->d:Ll9k;

    new-instance p2, Ljze;

    const-string p3, "has_waited_for_startup_dependencies"

    invoke-virtual {p4, p3}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result p3

    if-nez p3, :cond_34

    invoke-virtual {p4}, Lcom/opera/android/settings/SettingsManager;->J()Z

    move-result p3

    if-nez p3, :cond_35

    :cond_34
    move p5, v0

    :cond_35
    const/4 p5, 0x1

    invoke-static {p5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p3

    invoke-direct {p2, p3}, Ljze;-><init>(Ljava/lang/Object;)V

    iput-object p2, p0, Lm9k;->e:Ljze;

    new-instance p2, Lt77;

    const/16 p3, 0xb

    invoke-direct {p2, p0, p3}, Lt77;-><init>(Ljava/lang/Object;B)V

    iput-object p2, p0, Lm9k;->g:Lt77;

    check-cast p1, Ljava/lang/Iterable;

    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_4e
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_72

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lk9k;

    iget-object p3, p0, Lm9k;->e:Ljze;

    invoke-interface {p2}, Lk9k;->a()Lize;

    move-result-object p2

    new-instance p4, Ln6k;

    const/16 p5, 0x8

    invoke-direct {p4, p0, p5}, Ln6k;-><init>(Ljava/lang/Object;B)V

    new-instance p5, Lw4i;

    const/16 v0, 0xf

    invoke-direct {p5, p4, v0}, Lw4i;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p3, p2, p5}, Ljze;->s(Lekc;Lf7f;)V

    goto :goto_4e

    :cond_72
    return-void
.end method


# virtual methods
.method public final R(Z)V
    .registers 6

    iget-object v0, p0, Lm9k;->e:Ljze;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_f

    return-void

    :cond_f
    iget-object v1, p0, Lm9k;->h:Loml;

    if-eqz v1, :cond_17

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Loml;->cancel(Z)Z

    :cond_17
    const/4 v1, 0x0

    iput-object v1, p0, Lm9k;->h:Loml;

    if-eqz p1, :cond_1f

    sget-object v1, Ll9k;->d:Ll9k;

    goto :goto_21

    :cond_1f
    sget-object v1, Ll9k;->c:Ll9k;

    :goto_21
    iget-object v2, p0, Lm9k;->d:Ll9k;

    sget-object v3, Ll9k;->a:Ll9k;

    if-ne v2, v3, :cond_29

    iput-object v1, p0, Lm9k;->d:Ll9k;

    :cond_29
    iget-object p0, p0, Lm9k;->c:Ljava/util/List;

    check-cast p0, Ljava/lang/Iterable;

    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_31
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_41

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lk9k;

    invoke-interface {v1, p1}, Lk9k;->b(Z)V

    goto :goto_31

    :cond_41
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v0, p0}, Ljze;->r(Ljava/lang/Object;)V

    return-void
.end method

.method public final S()V
    .registers 2

    iget-boolean v0, p0, Lm9k;->f:Z

    if-nez v0, :cond_2d

    iget-object v0, p0, Lm9k;->e:Ljze;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_2d

    const/4 v0, 0x1

    iput-boolean v0, p0, Lm9k;->f:Z

    iget-object p0, p0, Lm9k;->c:Ljava/util/List;

    check-cast p0, Ljava/lang/Iterable;

    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_1d
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2d

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lk9k;

    invoke-interface {v0}, Lk9k;->start()V

    goto :goto_1d

    :cond_2d
    return-void
.end method

.method public final W(Lndc;)V
    .registers 2

    iget-object p1, p0, Lm9k;->e:Ljze;

    iget-object p0, p0, Lm9k;->g:Lt77;

    invoke-virtual {p1, p0}, Lekc;->k(Lf7f;)V

    return-void
.end method

.method public final onDestroy(Lndc;)V
    .registers 3

    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    iget-object p1, p0, Lm9k;->e:Ljze;

    iget-object v0, p0, Lm9k;->g:Lt77;

    invoke-virtual {p1, v0}, Lekc;->p(Lf7f;)V

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lm9k;->R(Z)V

    return-void
.end method
