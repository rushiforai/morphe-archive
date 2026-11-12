.class public final Liw9;
.super Lj93;
.source "SourceFile"

# interfaces
.implements Lp5j;


# instance fields
.field public final d:Lev1;

.field public final e:Lswf;

.field public final f:Lpo3;

.field public final g:Lode;

.field public final h:Lh42;

.field public final i:Ljava/util/Set;

.field public final j:Lhw9;


# direct methods
.method public constructor <init>(Lcom/opera/android/settings/SettingsManager;Lev1;Lg8j;Lswf;Lpo3;)V
    .registers 6

    invoke-direct {p0, p1, p3}, Lj93;-><init>(Lcom/opera/android/settings/SettingsManager;Ld8j;)V

    iput-object p2, p0, Liw9;->d:Lev1;

    iput-object p4, p0, Liw9;->e:Lswf;

    iput-object p5, p0, Liw9;->f:Lpo3;

    new-instance p2, Lode;

    invoke-direct {p2}, Lekc;-><init>()V

    iput-object p2, p0, Liw9;->g:Lode;

    invoke-static {p2}, Lb8h;->d(Lekc;)Lh42;

    move-result-object p2

    iput-object p2, p0, Liw9;->h:Lh42;

    const-string p2, "tab_switch_swipe_gesture_enabled"

    const-string p3, "thumb_scroller_enabled"

    const-string p5, "main_menu_swipe_gesture_enabled"

    filled-new-array {p5, p2, p3}, [Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Le82;->E([Ljava/lang/Object;)Ljava/util/Set;

    move-result-object p2

    iput-object p2, p0, Liw9;->i:Ljava/util/Set;

    new-instance p2, Lhw9;

    const/4 p3, 0x0

    invoke-direct {p2, p0, p3}, Lhw9;-><init>(Ljava/lang/Object;B)V

    iput-object p2, p0, Liw9;->j:Lhw9;

    iget-object p3, p4, Lswf;->g:Li7f;

    invoke-virtual {p3, p2}, Li7f;->b(Ljava/lang/Object;)Z

    invoke-virtual {p1, p0}, Lcom/opera/android/settings/SettingsManager;->a(Lp5j;)V

    invoke-virtual {p0}, Liw9;->h()V

    return-void
.end method


# virtual methods
.method public final M(Ljava/lang/String;)V
    .registers 3

    iget-object v0, p0, Liw9;->i:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_b

    invoke-virtual {p0}, Liw9;->h()V

    :cond_b
    return-void
.end method

.method public final e()V
    .registers 2

    iget-object v0, p0, Lj93;->b:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v0, p0}, Lcom/opera/android/settings/SettingsManager;->T(Lp5j;)V

    iget-object v0, p0, Liw9;->j:Lhw9;

    iget-object p0, p0, Liw9;->e:Lswf;

    iget-object p0, p0, Lswf;->g:Li7f;

    invoke-virtual {p0, v0}, Li7f;->c(Ljava/lang/Object;)Z

    return-void
.end method

.method public final g(Ldp3;Z)Lf03;
    .registers 5

    iget-object v0, p0, Liw9;->d:Lev1;

    iget-object v1, v0, Lev1;->a:Le7j;

    iget-object p0, p0, Lj93;->b:Lcom/opera/android/settings/SettingsManager;

    if-nez v1, :cond_c

    invoke-virtual {p0}, Lcom/opera/android/settings/SettingsManager;->f()Le7j;

    move-result-object v1

    :cond_c
    iget-object v0, v0, Lev1;->b:Lb7j;

    if-nez v0, :cond_14

    invoke-virtual {p0}, Lcom/opera/android/settings/SettingsManager;->c()Lb7j;

    move-result-object v0

    :cond_14
    invoke-virtual {p1, v1, v0}, Ldp3;->a(Le7j;Lb7j;)Z

    move-result p0

    if-eqz p0, :cond_20

    new-instance p0, Llw9;

    invoke-direct {p0, p2}, Llw9;-><init>(Z)V

    return-object p0

    :cond_20
    sget-object p0, Lkw9;->l:Lkw9;

    return-object p0
.end method

.method public final h()V
    .registers 7

    new-instance v0, Lgw9;

    iget-object v1, p0, Liw9;->f:Lpo3;

    iget-object v2, v1, Lpo3;->b:Lk7d;

    const-string v3, "main_menu_swipe_gesture_enabled"

    iget-object v4, p0, Lj93;->b:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v4, v3}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v3

    invoke-virtual {p0, v2, v3}, Liw9;->g(Ldp3;Z)Lf03;

    move-result-object v2

    iget-object v1, v1, Lpo3;->a:Ly8l;

    const-string v3, "tab_switch_swipe_gesture_enabled"

    invoke-virtual {v4, v3}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v3

    invoke-virtual {p0, v1, v3}, Liw9;->g(Ldp3;Z)Lf03;

    move-result-object v1

    const-string v3, "thumb_scroller_enabled"

    invoke-virtual {v4, v3}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v3

    iget-object v4, p0, Liw9;->e:Lswf;

    invoke-virtual {v4}, Lswf;->a()Ljava/util/ArrayList;

    move-result-object v4

    invoke-static {v4}, Lkotlin/collections/CollectionsKt;->K(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lqwf;

    sget-object v5, Lqhj;->e:Lr16;

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v4}, Lr16;->p(Lqwf;)Lqhj;

    move-result-object v4

    invoke-direct {v0, v2, v1, v3, v4}, Lgw9;-><init>(Lf03;Lf03;ZLqhj;)V

    iget-object p0, p0, Liw9;->g:Lode;

    invoke-virtual {p0, v0}, Lekc;->r(Ljava/lang/Object;)V

    return-void
.end method
