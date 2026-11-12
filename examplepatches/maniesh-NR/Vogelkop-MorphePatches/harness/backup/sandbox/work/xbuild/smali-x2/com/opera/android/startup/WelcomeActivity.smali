.class public final Lcom/opera/android/startup/WelcomeActivity;
.super Lg9k;
.source "SourceFile"

# interfaces
.implements Ln7n;
.implements Lqch;


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u0007\u0018\u00002\u00020\u00012\u00020\u0002B\u0007\u00a2\u0006\u0004\u0008\u0003\u0010\u0004\u00a8\u0006\u0005"
    }
    d2 = {
        "Lcom/opera/android/startup/WelcomeActivity;",
        "Lg9k;",
        "Ln7n;",
        "<init>",
        "()V",
        "app"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final synthetic w:I


# instance fields
.field public m:Lx77;

.field public n:Lbl9;

.field public final o:Lw6j;

.field public final p:Lwzn;

.field public final q:Lwzn;

.field public r:Lmcj;

.field public s:Landroid/view/View;

.field public t:Z

.field public u:Z

.field public final v:Lxbf;


# direct methods
.method public constructor <init>()V
    .registers 13

    invoke-direct {p0}, Lg9k;-><init>()V

    new-instance v0, Ltzn;

    const/4 v2, 0x0

    invoke-direct {v0, p0, v2}, Ltzn;-><init>(Lcom/opera/android/startup/WelcomeActivity;B)V

    new-instance v3, Lw6j;

    const-class v4, Lq0o;

    invoke-static {v4}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v4

    new-instance v5, Lxzn;

    invoke-direct {v5, p0, v2}, Lxzn;-><init>(Lcom/opera/android/startup/WelcomeActivity;B)V

    new-instance v6, Lxzn;

    const/4 v7, 0x1

    invoke-direct {v6, p0, v7}, Lxzn;-><init>(Lcom/opera/android/startup/WelcomeActivity;B)V

    invoke-direct {v3, v4, v5, v0, v6}, Lw6j;-><init>(Ls15;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;)V

    iput-object v3, p0, Lcom/opera/android/startup/WelcomeActivity;->o:Lw6j;

    new-instance v10, Lwzn;

    invoke-direct {v10, p0, v2}, Lwzn;-><init>(Lcom/opera/android/startup/WelcomeActivity;B)V

    iput-object v10, p0, Lcom/opera/android/startup/WelcomeActivity;->p:Lwzn;

    new-instance v0, Lwzn;

    invoke-direct {v0, p0, v7}, Lwzn;-><init>(Lcom/opera/android/startup/WelcomeActivity;B)V

    iput-object v0, p0, Lcom/opera/android/startup/WelcomeActivity;->q:Lwzn;

    iput-boolean v7, p0, Lcom/opera/android/startup/WelcomeActivity;->t:Z

    iput-boolean v7, p0, Lcom/opera/android/startup/WelcomeActivity;->u:Z

    new-instance v0, Lxbf;

    new-instance v3, Ltzn;

    const/4 v4, 0x2

    invoke-direct {v3, p0, v4}, Ltzn;-><init>(Lcom/opera/android/startup/WelcomeActivity;B)V

    move-object v5, v3

    new-instance v3, Lvzn;

    invoke-direct {v3, p0, v2}, Lvzn;-><init>(Lcom/opera/android/startup/WelcomeActivity;B)V

    new-instance v2, Ltzn;

    const/4 v6, 0x4

    invoke-direct {v2, p0, v6}, Ltzn;-><init>(Lcom/opera/android/startup/WelcomeActivity;B)V

    move-object v6, v2

    move-object v2, v5

    sget-object v5, Lmsl;->f:Lmsl;

    move-object v8, v6

    sget-object v6, Lvml;->d:Lumi;

    new-instance v9, Lvzn;

    invoke-direct {v9, p0, v7}, Lvzn;-><init>(Lcom/opera/android/startup/WelcomeActivity;B)V

    move-object v7, v8

    new-instance v8, Lvzn;

    invoke-direct {v8, p0, v4}, Lvzn;-><init>(Lcom/opera/android/startup/WelcomeActivity;B)V

    move-object v4, v7

    move-object v7, v9

    new-instance v9, Lvzn;

    const/4 v11, 0x3

    invoke-direct {v9, p0, v11}, Lvzn;-><init>(Lcom/opera/android/startup/WelcomeActivity;B)V

    iget-object v11, p0, Lhjf;->e:Lxbf;

    move-object v1, p0

    invoke-direct/range {v0 .. v11}, Lxbf;-><init>(Lcom/opera/android/startup/WelcomeActivity;Ltzn;Lvzn;Ltzn;Lmsl;Lumi;Lvzn;Lvzn;Lvzn;Lwzn;Lxbf;)V

    iput-object v0, p0, Lcom/opera/android/startup/WelcomeActivity;->v:Lxbf;

    return-void
.end method


# virtual methods
.method public final J()V
    .registers 4

    invoke-virtual {p0}, Lcom/opera/android/startup/WelcomeActivity;->M()Lcom/opera/android/settings/SettingsManager;

    move-result-object v0

    const-string v1, "news_is_blocked_by_personalization_change"

    invoke-virtual {v0, v1}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1d

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->F()Lcom/opera/android/PushedContentHandler;

    move-result-object v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/opera/android/PushedContentHandler;->b(ZLlch;)V

    :cond_1d
    invoke-super {p0}, Lg9k;->J()V

    return-void
.end method

.method public final K(Lo2c;)V
    .registers 16

    iget-object v0, p0, Lcom/opera/android/startup/WelcomeActivity;->v:Lxbf;

    iget-object v0, v0, Lxbf;->f:Ljava/lang/Object;

    check-cast v0, Lj4c;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lmdf;

    iget-object v1, v0, Lmdf;->e:Ljava/util/ArrayList;

    invoke-static {v1}, Lkotlin/collections/CollectionsKt;->R(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lkl0;

    if-eqz v1, :cond_1b

    sget-object v2, Lgl0;->c:Lgl0;

    invoke-virtual {v0, v1, v2}, Lmdf;->a(Lkl0;Lgl0;)V

    :cond_1b
    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->C()Lsdf;

    move-result-object v0

    iget v1, p1, Lo2c;->a:I

    iget v2, p1, Lo2c;->b:I

    invoke-virtual {v0, v1}, Lsdf;->c(I)V

    invoke-virtual {p0}, Lcom/opera/android/startup/WelcomeActivity;->M()Lcom/opera/android/settings/SettingsManager;

    move-result-object v0

    const/16 v3, 0x40

    invoke-virtual {p1, v3}, Lo2c;->c(I)Z

    move-result v4

    if-eqz v4, :cond_43

    const-string v4, "personalized_ads"

    invoke-virtual {p1, v3}, Lo2c;->d(I)Z

    move-result v3

    invoke-virtual {v0, v3, v4}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    :cond_43
    const/16 v3, 0x20

    invoke-virtual {p1, v3}, Lo2c;->c(I)Z

    move-result v4

    if-eqz v4, :cond_54

    const-string v4, "personalized_news"

    invoke-virtual {p1, v3}, Lo2c;->d(I)Z

    move-result v5

    invoke-virtual {v0, v5, v4}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    :cond_54
    const/4 v4, 0x1

    invoke-virtual {p1, v4}, Lo2c;->c(I)Z

    move-result v5

    if-eqz v5, :cond_64

    const-string v5, "collect_website_categories"

    invoke-virtual {p1, v4}, Lo2c;->d(I)Z

    move-result v6

    invoke-virtual {v0, v6, v5}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    :cond_64
    const/16 v5, 0x8

    invoke-virtual {p1, v5}, Lo2c;->c(I)Z

    move-result v6

    if-eqz v6, :cond_75

    const-string v6, "process_news_topics"

    invoke-virtual {p1, v5}, Lo2c;->d(I)Z

    move-result v7

    invoke-virtual {v0, v7, v6}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    :cond_75
    const/16 v6, 0x10

    invoke-virtual {p1, v6}, Lo2c;->c(I)Z

    move-result v7

    if-eqz v7, :cond_86

    const-string v7, "process_location"

    invoke-virtual {p1, v6}, Lo2c;->d(I)Z

    move-result v8

    invoke-virtual {v0, v8, v7}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    :cond_86
    invoke-virtual {v0}, Lcom/opera/android/settings/SettingsManager;->I()Z

    move-result v7

    const/16 v8, 0x60

    if-nez v7, :cond_98

    invoke-virtual {p1, v8}, Lo2c;->c(I)Z

    move-result v7

    xor-int/2addr v7, v4

    const-string v9, "personalized_default"

    invoke-virtual {v0, v7, v9}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    :cond_98
    filled-new-array {v3, v5}, [I

    move-result-object v0

    const/4 v3, 0x0

    move v5, v3

    :goto_9e
    const/4 v7, 0x2

    if-ge v5, v7, :cond_b8

    aget v9, v0, v5

    and-int v10, v1, v9

    if-ne v10, v9, :cond_b5

    and-int v10, v2, v9

    if-eq v10, v9, :cond_b5

    invoke-virtual {p0}, Lcom/opera/android/startup/WelcomeActivity;->M()Lcom/opera/android/settings/SettingsManager;

    move-result-object v0

    const-string v5, "news_is_blocked_by_personalization_change"

    invoke-virtual {v0, v4, v5}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    goto :goto_b8

    :cond_b5
    add-int/lit8 v5, v5, 0x1

    goto :goto_9e

    :cond_b8
    :goto_b8
    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v0

    iget-object v0, v0, Ld6j;->c:Lx5f;

    invoke-virtual {p0}, Lcom/opera/android/startup/WelcomeActivity;->M()Lcom/opera/android/settings/SettingsManager;

    move-result-object v5

    invoke-virtual {v5}, Lcom/opera/android/settings/SettingsManager;->J()Z

    move-result v5

    iget-boolean v9, p1, Lo2c;->c:Z

    if-eqz v9, :cond_d5

    sget-object v1, Lja0;->e:Lja0;

    goto :goto_e1

    :cond_d5
    if-nez v2, :cond_da

    sget-object v1, Lja0;->b:Lja0;

    goto :goto_e1

    :cond_da
    if-ne v2, v1, :cond_df

    sget-object v1, Lja0;->c:Lja0;

    goto :goto_e1

    :cond_df
    sget-object v1, Lja0;->d:Lja0;

    :goto_e1
    iget-boolean v2, p1, Lo2c;->d:Z

    invoke-virtual {p1, v6}, Lo2c;->c(I)Z

    move-result v6

    invoke-virtual {p1, v8}, Lo2c;->c(I)Z

    move-result p1

    iget-boolean v8, v0, Lx5f;->h:Z

    if-eqz v8, :cond_127

    iget-object v8, v0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v9

    invoke-virtual {v9, v8}, Lx56;->B(Lzpa;)Lqd0;

    move-result-object v10

    invoke-virtual {v10, v8}, Lqd0;->x(Lzpa;)Lxb0;

    move-result-object v8

    new-instance v10, Lka0;

    const/4 v11, -0x1

    const/4 v12, 0x7

    const/16 v13, 0x98b

    invoke-direct {v10, v13, v11, v12}, Ljf0;-><init>(III)V

    invoke-virtual {v10, v3, v4, v1}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v10, v4, v4, v2}, Ljf0;->r(IIZ)V

    invoke-virtual {v10, v7, v4, v6}, Ljf0;->r(IIZ)V

    const/4 v1, 0x3

    invoke-virtual {v10, v1, v4, p1}, Ljf0;->r(IIZ)V

    const/4 p1, 0x4

    invoke-virtual {v10, p1, v4, v5}, Ljf0;->r(IIZ)V

    sget-object p1, Lma0;->b:Lma0;

    const/4 v1, 0x5

    invoke-virtual {v10, v1, v4, p1}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v8}, Lxb0;->Q()Lhf0;

    move-result-object p1

    invoke-virtual {p1, v10}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v0, v9}, Lx5f;->U0(Lx56;)V

    :cond_127
    invoke-virtual {p0}, Lcom/opera/android/startup/WelcomeActivity;->W()V

    return-void
.end method

.method public final L()V
    .registers 4

    iget-object v0, p0, Lcom/opera/android/startup/WelcomeActivity;->v:Lxbf;

    iget-object v0, v0, Lxbf;->f:Ljava/lang/Object;

    check-cast v0, Lj4c;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->f()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_29

    check-cast v0, Lmdf;

    sget-object v1, Lkl0;->l:Lkl0;

    invoke-virtual {v0, v1}, Lmdf;->c(Lkl0;)V

    iget-object v1, v0, Lmdf;->e:Ljava/util/ArrayList;

    invoke-static {v1}, Lkotlin/collections/CollectionsKt;->R(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lkl0;

    if-eqz v1, :cond_22

    sget-object v2, Lgl0;->c:Lgl0;

    invoke-virtual {v0, v1, v2}, Lmdf;->a(Lkl0;Lgl0;)V

    :cond_22
    iget-object v1, v0, Lmdf;->a:Ltcc;

    iget-object v0, v0, Lmdf;->i:Lob;

    invoke-virtual {v1, v0}, Ltcc;->b(Lmdc;)V

    :cond_29
    invoke-virtual {p0}, Lcom/opera/android/startup/WelcomeActivity;->J()V

    return-void
.end method

.method public final M()Lcom/opera/android/settings/SettingsManager;
    .registers 2

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object p0

    return-object p0
.end method

.method public final N()Lq0o;
    .registers 1

    iget-object p0, p0, Lcom/opera/android/startup/WelcomeActivity;->o:Lw6j;

    invoke-virtual {p0}, Lw6j;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lq0o;

    return-object p0
.end method

.method public final O()V
    .registers 5

    iget-object v0, p0, Lcom/opera/android/startup/WelcomeActivity;->s:Landroid/view/View;

    if-eqz v0, :cond_35

    iget-boolean v1, p0, Lcom/opera/android/startup/WelcomeActivity;->t:Z

    const/4 v2, 0x0

    if-eqz v1, :cond_27

    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p0

    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p0

    invoke-virtual {p0}, Landroid/view/View;->getRootWindowInsets()Landroid/view/WindowInsets;

    move-result-object p0

    const/4 v1, 0x0

    invoke-static {v1, p0}, Lg3o;->g(Landroid/view/View;Landroid/view/WindowInsets;)Lg3o;

    move-result-object p0

    const/16 v1, 0x207

    iget-object p0, p0, Lg3o;->a:Ld3o;

    invoke-virtual {p0, v1}, Ld3o;->i(I)Lr9b;

    move-result-object p0

    iget v1, p0, Lr9b;->b:I

    iget p0, p0, Lr9b;->d:I

    goto :goto_29

    :cond_27
    move p0, v2

    move v1, p0

    :goto_29
    invoke-virtual {v0}, Landroid/view/View;->getPaddingTop()I

    move-result v3

    if-ne v3, v1, :cond_36

    invoke-virtual {v0}, Landroid/view/View;->getPaddingBottom()I

    move-result v3

    if-ne v3, p0, :cond_36

    :cond_35
    return-void

    :cond_36
    invoke-virtual {v0, v2, v1, v2, p0}, Landroid/view/View;->setPadding(IIII)V

    return-void
.end method

.method public final P()V
    .registers 4

    iget-object v0, p0, Lcom/opera/android/startup/WelcomeActivity;->s:Landroid/view/View;

    if-eqz v0, :cond_8

    iget-boolean v1, p0, Lcom/opera/android/startup/WelcomeActivity;->u:Z

    if-nez v1, :cond_9

    :cond_8
    return-void

    :cond_9
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lf03;->I(Landroid/content/Context;)Z

    move-result v0

    iget-object v1, p0, Lcom/opera/android/startup/WelcomeActivity;->r:Lmcj;

    const/4 v2, 0x0

    if-nez v1, :cond_17

    move-object v1, v2

    :cond_17
    invoke-virtual {v1, v0}, Lmcj;->t(Z)V

    iget-object p0, p0, Lcom/opera/android/startup/WelcomeActivity;->r:Lmcj;

    if-eqz p0, :cond_1f

    move-object v2, p0

    :cond_1f
    invoke-virtual {v2, v0}, Lmcj;->r(Z)V

    return-void
.end method

.method public final R(Lu65;)V
    .registers 3

    iget-object p0, p0, Lcom/opera/android/startup/WelcomeActivity;->v:Lxbf;

    iget-object p0, p0, Lxbf;->f:Ljava/lang/Object;

    check-cast p0, Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lmdf;

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    if-eqz p1, :cond_2b

    const/4 v0, 0x1

    if-eq p1, v0, :cond_28

    const/4 v0, 0x2

    if-eq p1, v0, :cond_28

    const/4 v0, 0x3

    if-eq p1, v0, :cond_25

    const/4 v0, 0x4

    if-eq p1, v0, :cond_2b

    const/4 v0, 0x5

    if-eq p1, v0, :cond_25

    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_25
    sget-object p1, Lgl0;->d:Lgl0;

    goto :goto_2d

    :cond_28
    sget-object p1, Lgl0;->f:Lgl0;

    goto :goto_2d

    :cond_2b
    sget-object p1, Lgl0;->c:Lgl0;

    :goto_2d
    iget-object v0, p0, Lmdf;->e:Ljava/util/ArrayList;

    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->R(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lkl0;

    if-eqz v0, :cond_3a

    invoke-virtual {p0, v0, p1}, Lmdf;->a(Lkl0;Lgl0;)V

    :cond_3a
    return-void
.end method

.method public final S(Landroid/content/Intent;)V
    .registers 10

    if-eqz p1, :cond_90

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_90

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_90

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v1

    const v2, 0x3d070fb5

    const/4 v3, 0x1

    const-wide/16 v4, 0x1

    const-string v6, "android.intent.action.MAIN"

    if-eq v1, v2, :cond_5b

    const v2, 0x768d0507

    if-ne v1, v2, :cond_90

    const-string v1, "com.opera.android.startup.ONGOING_NOTIFICATION"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_90

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v0

    iget-object v0, v0, Ld6j;->c:Lx5f;

    iget-boolean v1, v0, Lx5f;->h:Z

    if-eqz v1, :cond_53

    iget-object v1, v0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v2

    invoke-static {v1, v2}, Lam2;->f(Lzpa;Lx56;)Lhi0;

    move-result-object v1

    iget-object v1, v1, Lhi0;->b:Lfi0;

    const/16 v7, 0x19

    invoke-virtual {v1, v7, v3, v4, v5}, Ljf0;->p(IIJ)V

    invoke-virtual {v0, v2}, Lx5f;->U0(Lx56;)V

    :cond_53
    invoke-virtual {p1, v6}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/app/Activity;->setIntent(Landroid/content/Intent;)V

    return-void

    :cond_5b
    const-string v1, "com.opera.android.startup.INSTALL_COMPLETE_NOTIFICATION"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_90

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v0

    iget-object v0, v0, Ld6j;->c:Lx5f;

    iget-boolean v1, v0, Lx5f;->h:Z

    if-eqz v1, :cond_89

    iget-object v1, v0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v2

    invoke-static {v1, v2}, Lam2;->f(Lzpa;Lx56;)Lhi0;

    move-result-object v1

    iget-object v1, v1, Lhi0;->b:Lfi0;

    const/16 v7, 0x1b

    invoke-virtual {v1, v7, v3, v4, v5}, Ljf0;->p(IIJ)V

    invoke-virtual {v0, v2}, Lx5f;->U0(Lx56;)V

    :cond_89
    invoke-virtual {p1, v6}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/app/Activity;->setIntent(Landroid/content/Intent;)V

    :cond_90
    return-void
.end method

.method public final T()V
    .registers 2

    iget-boolean v0, p0, Lcom/opera/android/startup/WelcomeActivity;->t:Z

    if-nez v0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/opera/android/startup/WelcomeActivity;->t:Z

    invoke-virtual {p0}, Lcom/opera/android/startup/WelcomeActivity;->O()V

    return-void
.end method

.method public final V(Z)V
    .registers 3

    iget-boolean v0, p0, Lcom/opera/android/startup/WelcomeActivity;->u:Z

    if-ne v0, p1, :cond_5

    return-void

    :cond_5
    iput-boolean p1, p0, Lcom/opera/android/startup/WelcomeActivity;->u:Z

    invoke-virtual {p0}, Lcom/opera/android/startup/WelcomeActivity;->P()V

    return-void
.end method

.method public final W()V
    .registers 2

    invoke-virtual {p0}, Lg9k;->H()Z

    move-result v0

    if-eqz v0, :cond_a

    invoke-virtual {p0}, Lcom/opera/android/startup/WelcomeActivity;->L()V

    return-void

    :cond_a
    invoke-virtual {p0}, Lcom/opera/android/startup/WelcomeActivity;->N()Lq0o;

    move-result-object p0

    invoke-virtual {p0}, Lq0o;->f()V

    return-void
.end method

.method public final X()V
    .registers 5

    iget-object v0, p0, Lcom/opera/android/startup/WelcomeActivity;->v:Lxbf;

    iget-object v1, v0, Lxbf;->f:Ljava/lang/Object;

    check-cast v1, Lj4c;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lmdf;

    sget-object v2, Lkl0;->j:Lkl0;

    sget-object v3, Lgl0;->c:Lgl0;

    invoke-virtual {v1, v2, v3}, Lmdf;->a(Lkl0;Lgl0;)V

    invoke-virtual {p0}, Lcom/opera/android/startup/WelcomeActivity;->M()Lcom/opera/android/settings/SettingsManager;

    move-result-object v1

    const/4 v2, 0x1

    const-string v3, "eula_accepted.gdpr"

    invoke-virtual {v1, v2, v3}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->h()Lr65;

    move-result-object v1

    invoke-virtual {p0}, Lcom/opera/android/startup/WelcomeActivity;->M()Lcom/opera/android/settings/SettingsManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/opera/android/settings/SettingsManager;->J()Z

    move-result v3

    invoke-virtual {v1, v3}, Lr65;->b(Z)V

    iget-object v0, v0, Lxbf;->b:Ljava/lang/Object;

    check-cast v0, Lxbf;

    iget-object v0, v0, Lxbf;->e:Ljava/lang/Object;

    check-cast v0, Lj4c;

    new-instance v1, Ltzn;

    invoke-direct {v1, p0, v2}, Ltzn;-><init>(Lcom/opera/android/startup/WelcomeActivity;B)V

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v2

    check-cast v2, Lcom/opera/android/OperaApplication;

    invoke-virtual {v2}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/opera/android/settings/SettingsManager;->J()Z

    move-result v2

    if-nez v2, :cond_55

    invoke-virtual {v1}, Ltzn;->invoke()Ljava/lang/Object;

    goto :goto_71

    :cond_55
    new-instance v2, Lgl6;

    const/4 v3, 0x0

    invoke-direct {v2, p0, v1, v0, v3}, Lgl6;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v0, Lvr9;

    const/4 v1, 0x2

    invoke-direct {v0, v2, v1}, Lvr9;-><init>(Ljava/lang/Runnable;I)V

    sget-object v1, Lz7f;->k:Lrqd;

    invoke-static {p0}, Lipe;->E(Landroid/content/Context;)Lz7f;

    move-result-object v1

    invoke-virtual {v1, v0}, Lno7;->b(Ljava/lang/Runnable;)V

    invoke-static {p0}, Lv1;->u(Landroid/content/Context;)Lv1;

    move-result-object v1

    invoke-virtual {v1, v0}, Lno7;->b(Ljava/lang/Runnable;)V

    :goto_71
    iget-object v0, p0, Lcom/opera/android/startup/WelcomeActivity;->p:Lwzn;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lm9k;

    invoke-virtual {v0}, Lm9k;->S()V

    invoke-virtual {p0}, Lcom/opera/android/startup/WelcomeActivity;->W()V

    return-void
.end method

.method public final Y()V
    .registers 7

    iget-object p0, p0, Lcom/opera/android/startup/WelcomeActivity;->v:Lxbf;

    iget-object p0, p0, Lxbf;->f:Ljava/lang/Object;

    check-cast p0, Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lmdf;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v0, p0, Lmdf;->c:Lx5f;

    iget-object v1, v0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v2

    new-instance v3, Lck0;

    invoke-direct {v3, v1, v2}, Lck0;-><init>(Lzpa;Lx56;)V

    invoke-virtual {v3}, Lck0;->h()Lat0;

    move-result-object v1

    iget-object v1, v1, Lat0;->a:Lzs0;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v3, 0x1

    const/16 v4, 0xc

    const-string v5, "v1"

    invoke-virtual {v1, v4, v3, v5}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v0, v2}, Lx5f;->U0(Lx56;)V

    iget-object p0, p0, Lmdf;->d:Lwsf;

    iget-object v0, p0, Lwsf;->b:Lqs7;

    invoke-static {}, Lqs7;->u()Lv56;

    move-result-object v1

    new-instance v2, Lak0;

    invoke-direct {v2, v0, v1}, Lak0;-><init>(Lqs7;Lv56;)V

    iget-object v0, v2, Lak0;->e:Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljn0;

    iget-object v0, v0, Ljn0;->a:Lhn0;

    const/16 v2, 0x8

    invoke-virtual {v0, v2, v5}, Lhn0;->x(ILjava/lang/String;)V

    iget-object v0, p0, Lwsf;->e:Lmgh;

    invoke-virtual {v0, v1}, Lmgh;->c(Ljf0;)Z

    move-result v0

    if-eqz v0, :cond_55

    return-void

    :cond_55
    iget-object v0, p0, Lwsf;->a:Lumi;

    new-instance v1, Lrml;

    sget-object v2, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-direct {v1, v2, v0}, Lrml;-><init>(Ljava/lang/Object;Ltcl;)V

    new-instance v0, Lo5f;

    const/16 v2, 0x11

    invoke-direct {v0, p0, v2}, Lo5f;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v1, v0}, Lrml;->a(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object v0

    iget-object p0, p0, Lwsf;->d:Lqie;

    invoke-virtual {v0, p0}, Lplk;->m(Lqie;)Lp1j;

    return-void
.end method

.method public final b(Z)V
    .registers 5

    invoke-virtual {p0}, Lcom/opera/android/startup/WelcomeActivity;->N()Lq0o;

    move-result-object v0

    const/4 v1, 0x1

    iput-boolean v1, v0, Lq0o;->i:Z

    iget-object v0, v0, Lq0o;->c:Lpch;

    iget-object v0, v0, Lpch;->a:Ludf;

    iget-object v0, v0, Ludf;->a:Lb59;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "pushed.sequence"

    const/4 v2, 0x2

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    if-eqz p1, :cond_25

    invoke-virtual {p0}, Lcom/opera/android/startup/WelcomeActivity;->W()V

    :cond_25
    return-void
.end method

.method public final j()Lr7n;
    .registers 1

    iget-object p0, p0, Lcom/opera/android/startup/WelcomeActivity;->v:Lxbf;

    iget-object p0, p0, Lxbf;->g:Ljava/lang/Object;

    check-cast p0, Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lr7n;

    return-object p0
.end method

.method public final onCreate(Landroid/os/Bundle;)V
    .registers 19

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/view/Window;->setStatusBarColor(I)V

    invoke-virtual {v2, v3}, Landroid/view/Window;->setNavigationBarColor(I)V

    new-instance v4, Lmcj;

    invoke-direct {v4, v2}, Lmcj;-><init>(Landroid/view/Window;)V

    iput-object v4, v0, Lcom/opera/android/startup/WelcomeActivity;->r:Lmcj;

    sget-object v2, Lvml;->d:Lumi;

    sget-object v4, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    check-cast v4, Lcom/opera/android/OperaApplication;

    invoke-virtual {v4}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v4

    iget-object v4, v4, Ld6j;->g:Lwsf;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v5

    check-cast v5, Lcom/opera/android/OperaApplication;

    invoke-virtual {v5}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v5

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v6

    check-cast v6, Lcom/opera/android/OperaApplication;

    iget-object v6, v6, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object v6, v6, Lxv1;->r1:Lj4c;

    invoke-virtual {v6}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lb1o;

    invoke-static {v0}, Lz5i;->I(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v7

    new-instance v8, Lu5f;

    const/4 v9, 0x4

    invoke-direct {v8, v7, v9}, Lu5f;-><init>(Ljava/lang/String;B)V

    invoke-virtual {v4, v8}, Lwsf;->a(Lkotlin/jvm/functions/Function1;)V

    invoke-virtual {v5}, Lcom/opera/android/settings/SettingsManager;->J()Z

    move-result v5

    iget-object v7, v4, Lwsf;->b:Lqs7;

    invoke-static {}, Lqs7;->u()Lv56;

    move-result-object v8

    new-instance v10, Lak0;

    invoke-direct {v10, v7, v8}, Lak0;-><init>(Lqs7;Lv56;)V

    const/16 v7, 0xb

    const/4 v10, 0x1

    invoke-virtual {v8, v7, v10, v5}, Ljf0;->r(IIZ)V

    iget-object v5, v4, Lwsf;->e:Lmgh;

    invoke-virtual {v5, v8}, Lmgh;->c(Ljf0;)Z

    move-result v5

    if-nez v5, :cond_83

    iget-object v5, v4, Lwsf;->a:Lumi;

    new-instance v8, Lrml;

    sget-object v11, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-direct {v8, v11, v5}, Lrml;-><init>(Ljava/lang/Object;Ltcl;)V

    new-instance v5, Lo5f;

    const/16 v11, 0x11

    invoke-direct {v5, v4, v11}, Lo5f;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v8, v5}, Lrml;->a(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object v5

    iget-object v8, v4, Lwsf;->d:Lqie;

    invoke-virtual {v5, v8}, Lplk;->m(Lqie;)Lp1j;

    :cond_83
    sget-object v5, Lhs3;->a:Ln9a;

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v0}, Ln9a;->t(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v12

    invoke-static {v9, v0}, Lvtp;->G(ILandroid/content/Context;)Ljava/lang/String;

    move-result-object v13

    invoke-static {v0}, Letg;->a(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v14

    invoke-static {v10, v0}, Lvtp;->G(ILandroid/content/Context;)Ljava/lang/String;

    move-result-object v15

    new-instance v11, Lai;

    const/16 v16, 0x0

    invoke-direct/range {v11 .. v16}, Lai;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;)V

    invoke-virtual {v4, v11}, Lwsf;->a(Lkotlin/jvm/functions/Function1;)V

    sget-object v5, Lcak;->d:Lavj;

    new-instance v5, Lhpd;

    const/16 v8, 0x19

    invoke-direct {v5, v4, v0, v8}, Lhpd;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v10, v5}, Lavj;->g(ILjava/lang/Runnable;)V

    new-instance v5, Lvr3;

    new-instance v8, Lydf;

    invoke-direct {v8, v4, v3}, Lydf;-><init>(Lwsf;B)V

    invoke-direct {v5, v8}, Lvr3;-><init>(Lcom/opera/api/Callback;)V

    invoke-virtual {v5}, Lvr3;->b()Ltt2;

    move-result-object v8

    invoke-static {v0}, Ldj9;->t(Landroid/content/Context;)Ldj9;

    move-result-object v9

    new-instance v11, Lp1;

    const/16 v12, 0x9

    invoke-direct {v11, v9, v8, v12}, Lp1;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v9, v11}, Lno7;->g(Lmo7;)V

    invoke-virtual {v5}, Lvr3;->b()Ltt2;

    move-result-object v8

    invoke-static {v0}, Lv1;->u(Landroid/content/Context;)Lv1;

    move-result-object v9

    new-instance v11, Lp1;

    const/16 v12, 0xa

    invoke-direct {v11, v9, v8, v12}, Lp1;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v9, v11}, Lno7;->g(Lmo7;)V

    invoke-virtual {v5}, Lvr3;->d()V

    new-instance v5, Lydf;

    invoke-direct {v5, v4, v10}, Lydf;-><init>(Lwsf;B)V

    iget-object v8, v6, Lb1o;->g:La64;

    new-instance v9, Lcek;

    const/4 v11, 0x0

    invoke-direct {v9, v5, v6, v11, v7}, Lcek;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    const/4 v5, 0x3

    invoke-static {v8, v11, v11, v9, v5}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    new-instance v6, Lvr3;

    new-instance v7, Lydf;

    const/4 v8, 0x2

    invoke-direct {v7, v4, v8}, Lydf;-><init>(Lwsf;B)V

    invoke-direct {v6, v7}, Lvr3;-><init>(Lcom/opera/api/Callback;)V

    new-instance v4, Ld5o;

    new-instance v7, Lv37;

    invoke-direct {v7, v2, v3}, Lv37;-><init>(Lumi;B)V

    invoke-direct {v4, v7}, Ld5o;-><init>(Ln1;)V

    invoke-virtual {v6}, Lvr3;->b()Ltt2;

    move-result-object v7

    new-instance v9, Ld47;

    invoke-direct {v9, v7, v10}, Ld47;-><init>(Ltt2;B)V

    invoke-virtual {v4, v9}, Ld5o;->y(Lkotlin/jvm/functions/Function1;)V

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    new-instance v7, Ld5o;

    new-instance v9, Ly37;

    invoke-direct {v9, v4, v2}, Ly37;-><init>(Landroid/content/Context;Lumi;)V

    invoke-direct {v7, v9}, Ld5o;-><init>(Ln1;)V

    invoke-virtual {v6}, Lvr3;->b()Ltt2;

    move-result-object v4

    new-instance v9, Ld47;

    invoke-direct {v9, v4, v10}, Ld47;-><init>(Ltt2;B)V

    invoke-virtual {v7, v9}, Ld5o;->y(Lkotlin/jvm/functions/Function1;)V

    invoke-virtual {v6}, Lvr3;->b()Ltt2;

    move-result-object v4

    invoke-static {}, Landroid/app/ActivityManager;->isUserAMonkey()Z

    move-result v7

    if-eqz v7, :cond_138

    sget-object v7, Lz37;->b:Lz37;

    goto :goto_13a

    :cond_138
    sget-object v7, Lz37;->a:Lz37;

    :goto_13a
    sget-object v9, Lz37;->b:Lz37;

    if-ne v7, v9, :cond_140

    move v7, v10

    goto :goto_141

    :cond_140
    move v7, v3

    :goto_141
    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    invoke-virtual {v4, v7}, Ltt2;->run(Ljava/lang/Object;)V

    new-instance v4, Ld5o;

    new-instance v7, Lv37;

    invoke-direct {v7, v2, v10}, Lv37;-><init>(Lumi;B)V

    invoke-direct {v4, v7}, Ld5o;-><init>(Ln1;)V

    invoke-virtual {v6}, Lvr3;->b()Ltt2;

    move-result-object v7

    new-instance v9, Ld47;

    invoke-direct {v9, v7, v10}, Ld47;-><init>(Ltt2;B)V

    invoke-virtual {v4, v9}, Ld5o;->y(Lkotlin/jvm/functions/Function1;)V

    invoke-virtual {v6}, Lvr3;->d()V

    invoke-virtual {v0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v4

    check-cast v4, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Landroidx/fragment/app/r;->getSupportFragmentManager()Landroidx/fragment/app/w;

    move-result-object v6

    iget-object v7, v0, Lcom/opera/android/startup/WelcomeActivity;->v:Lxbf;

    iget-object v9, v7, Lxbf;->e:Ljava/lang/Object;

    check-cast v9, Lj4c;

    invoke-virtual {v9}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lol9;

    iput-object v9, v6, Landroidx/fragment/app/w;->B:Lol9;

    invoke-virtual {v0}, Lg9k;->H()Z

    move-result v6

    if-nez v6, :cond_190

    new-instance v6, Lx77;

    invoke-virtual {v4}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v9

    invoke-virtual {v4}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v12

    iget-object v12, v12, Ld6j;->d:Lx5f;

    invoke-direct {v6, v4, v9, v12}, Lx77;-><init>(Lcom/opera/android/OperaApplication;Lcom/opera/android/settings/SettingsManager;Lx5f;)V

    iput-object v6, v0, Lcom/opera/android/startup/WelcomeActivity;->m:Lx77;

    :cond_190
    new-instance v4, Lzg;

    new-instance v6, Ljava/lang/ref/WeakReference;

    invoke-direct {v6, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-direct {v4, v6}, Lzg;-><init>(Ljava/lang/ref/WeakReference;)V

    new-instance v6, Lsz4;

    invoke-direct {v6, v4}, Lsz4;-><init>(Lg91;)V

    iput-object v6, v0, Lhjf;->h:Lsz4;

    invoke-super/range {p0 .. p1}, Lg9k;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {v0}, Lg9k;->H()Z

    move-result v4

    if-nez v4, :cond_1b6

    const v4, 0x7f0d0495

    invoke-virtual {v0, v4}, Lg9k;->setContentView(I)V

    invoke-virtual {v0}, Lg9k;->H()Z

    move-result v4

    if-eqz v4, :cond_1b7

    :cond_1b6
    return-void

    :cond_1b7
    sget-object v4, Lq9n;->c:Ll5b;

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v4

    invoke-virtual {v4}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v4

    const v6, 0x7f0a04d1

    invoke-static {v6, v4}, Lq9n;->y(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    iput-object v4, v0, Lcom/opera/android/startup/WelcomeActivity;->s:Landroid/view/View;

    new-instance v6, Loon;

    invoke-direct {v6, v0, v5}, Loon;-><init>(Ljava/lang/Object;B)V

    invoke-static {v4}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object v5

    if-eqz v5, :cond_1d8

    invoke-static {v5, v4, v6}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    :cond_1d8
    invoke-virtual {v6, v4}, Loon;->a(Landroid/view/View;)V

    new-instance v5, Lr2n;

    const/16 v6, 0x15

    invoke-direct {v5, v0, v6}, Lr2n;-><init>(Ljava/lang/Object;B)V

    sget-object v6, Lr5n;->a:Ljava/util/WeakHashMap;

    invoke-static {v4, v5}, Lh5n;->c(Landroid/view/View;Lbcf;)V

    invoke-virtual {v0}, Lcom/opera/android/startup/WelcomeActivity;->M()Lcom/opera/android/settings/SettingsManager;

    move-result-object v4

    new-instance v5, Lezg;

    const/16 v6, 0xd

    invoke-direct {v5, v0, v6}, Lezg;-><init>(Ljava/lang/Object;B)V

    new-instance v6, Lvme;

    const/16 v9, 0x13

    invoke-direct {v6, v9}, Lvme;-><init>(B)V

    invoke-static {v4, v0, v5, v6}, Laib;->B(Lw6f;Lndc;Ljava/lang/Object;Lkotlin/jvm/functions/Function0;)V

    invoke-virtual {v0}, Lxd5;->getLifecycle()Ltcc;

    move-result-object v4

    iget-object v5, v0, Lcom/opera/android/startup/WelcomeActivity;->p:Lwzn;

    invoke-virtual {v5}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lmdc;

    invoke-virtual {v4, v6}, Ltcc;->a(Lmdc;)V

    invoke-virtual {v0}, Lcom/opera/android/startup/WelcomeActivity;->M()Lcom/opera/android/settings/SettingsManager;

    move-result-object v4

    const-string v6, "eula_accepted.gdpr"

    const/4 v4, 0x1

    if-eqz v4, :cond_21e

    invoke-virtual {v5}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lm9k;

    invoke-virtual {v2}, Lm9k;->S()V

    goto :goto_233

    :cond_21e
    if-nez v1, :cond_233

    new-instance v4, Lrml;

    sget-object v5, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-direct {v4, v5, v2}, Lrml;-><init>(Ljava/lang/Object;Ltcl;)V

    new-instance v2, Lqfl;

    invoke-direct {v2, v0, v9}, Lqfl;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v4, v2}, Lrml;->a(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object v2

    invoke-virtual {v2}, Lplk;->l()Loml;

    :cond_233
    :goto_233
    new-instance v2, Lshf;

    invoke-virtual {v0}, Landroidx/fragment/app/r;->getSupportFragmentManager()Landroidx/fragment/app/w;

    move-result-object v4

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    iput-object v4, v2, Lshf;->a:Ljava/lang/Object;

    new-instance v5, Lpde;

    invoke-direct {v5, v11}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v5, v2, Lshf;->b:Ljava/lang/Object;

    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    iput-object v5, v2, Lshf;->c:Ljava/lang/Object;

    new-instance v5, Lque;

    invoke-direct {v5, v2, v10}, Lque;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v4, v5, v10}, Landroidx/fragment/app/w;->b0(Lx1p;Z)V

    iget-object v2, v2, Lshf;->b:Ljava/lang/Object;

    check-cast v2, Lpde;

    new-instance v4, Luzn;

    invoke-direct {v4, v0, v10}, Luzn;-><init>(Lcom/opera/android/startup/WelcomeActivity;B)V

    invoke-virtual {v2, v0, v4}, Lekc;->j(Lndc;Lf7f;)V

    invoke-virtual {v0}, Lcom/opera/android/startup/WelcomeActivity;->N()Lq0o;

    move-result-object v2

    iget-object v2, v2, Lq0o;->e:Lpde;

    new-instance v4, Luzn;

    invoke-direct {v4, v0, v3}, Luzn;-><init>(Lcom/opera/android/startup/WelcomeActivity;B)V

    invoke-virtual {v2, v0, v4}, Lekc;->j(Lndc;Lf7f;)V

    if-nez v1, :cond_286

    invoke-virtual {v0}, Lcom/opera/android/startup/WelcomeActivity;->M()Lcom/opera/android/settings/SettingsManager;

    move-result-object v1

    invoke-virtual {v1, v6}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_282

    invoke-virtual {v0}, Lcom/opera/android/startup/WelcomeActivity;->N()Lq0o;

    move-result-object v1

    invoke-virtual {v1}, Lq0o;->f()V

    goto :goto_2b7

    :cond_282
    invoke-virtual {v0}, Lcom/opera/android/startup/WelcomeActivity;->X()V

    goto :goto_2b7

    :cond_286
    invoke-virtual {v0}, Lcom/opera/android/startup/WelcomeActivity;->N()Lq0o;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v3, "key.welcome_onboarding_flow.shown_leaves"

    invoke-virtual {v1, v3}, Landroid/os/BaseBundle;->getStringArray(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_2a9

    invoke-virtual {v2}, Lq0o;->g()Ljava/util/List;

    move-result-object v3

    iput-object v3, v2, Lq0o;->g:Ljava/util/List;

    new-instance v4, Lpyl;

    invoke-direct {v4, v3, v1}, Lpyl;-><init>(Ljava/util/List;Landroid/os/Bundle;)V

    invoke-static {v2}, Lp7n;->a(Ll7n;)Lf65;

    move-result-object v3

    invoke-virtual {v4, v3}, Lpyl;->r(Lf65;)V

    iput-object v4, v2, Lq0o;->f:Lpyl;

    :cond_2a9
    iget-object v2, v7, Lxbf;->f:Ljava/lang/Object;

    check-cast v2, Lj4c;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    new-instance v2, Lbl9;

    invoke-direct {v2, v0, v1}, Lbl9;-><init>(Lcom/opera/android/startup/WelcomeActivity;Landroid/os/Bundle;)V

    iput-object v2, v0, Lcom/opera/android/startup/WelcomeActivity;->n:Lbl9;

    :goto_2b7
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/opera/android/startup/WelcomeActivity;->S(Landroid/content/Intent;)V

    return-void
.end method

.method public final onDestroy()V
    .registers 5

    invoke-super {p0}, Lhjf;->onDestroy()V

    iget-object v0, p0, Lcom/opera/android/startup/WelcomeActivity;->n:Lbl9;

    if-eqz v0, :cond_31

    iget-object v1, v0, Lbl9;->d:Ljava/lang/Object;

    check-cast v1, Ljava/util/ArrayDeque;

    iget-object v2, v0, Lbl9;->f:Ljava/lang/Object;

    check-cast v2, Landroid/view/View;

    iget-object v3, v0, Lbl9;->e:Ljava/lang/Object;

    check-cast v3, Lho3;

    invoke-virtual {v2, v3}, Landroid/view/View;->removeOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    iget-object v2, v0, Lbl9;->c:Ljava/lang/Object;

    check-cast v2, Landroidx/fragment/app/w;

    invoke-static {v2, v2}, Lu35;->f(Landroidx/fragment/app/w;Landroidx/fragment/app/w;)Landroidx/fragment/app/a;

    move-result-object v2

    :goto_1e
    invoke-virtual {v1}, Ljava/util/ArrayDeque;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_2e

    invoke-virtual {v1}, Ljava/util/ArrayDeque;->pop()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/fragment/app/Fragment;

    invoke-virtual {v2, v3}, Landroidx/fragment/app/a;->m(Landroidx/fragment/app/Fragment;)Landroidx/fragment/app/a;

    goto :goto_1e

    :cond_2e
    invoke-virtual {v0, v2}, Lbl9;->a(Landroidx/fragment/app/a;)V

    :cond_31
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/opera/android/startup/WelcomeActivity;->n:Lbl9;

    iput-object v0, p0, Lhjf;->h:Lsz4;

    iget-object p0, p0, Lcom/opera/android/startup/WelcomeActivity;->q:Lwzn;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->f()Ljava/lang/Object;

    move-result-object p0

    if-eqz p0, :cond_5c

    check-cast p0, Lu9k;

    iget-object v1, p0, Lu9k;->a:Lpde;

    sget-object v2, Lp9k;->a:Lp9k;

    invoke-virtual {v1, v2}, Lekc;->r(Ljava/lang/Object;)V

    iget-object v1, p0, Lu9k;->b:Ltn;

    if-eqz v1, :cond_5c

    iput-object v0, p0, Lu9k;->b:Ltn;

    const/4 p0, 0x1

    iput-boolean p0, v1, Ltn;->a:Z

    iget-object p0, v1, Ltn;->b:Ljava/lang/Object;

    check-cast p0, Ls03;

    sget-object v0, Lcak;->d:Lavj;

    invoke-static {p0}, Lavj;->f(Ljava/lang/Runnable;)V

    invoke-virtual {p0}, Ls03;->run()V

    :cond_5c
    return-void
.end method

.method public final onNewIntent(Landroid/content/Intent;)V
    .registers 2

    invoke-super {p0, p1}, Lg9k;->onNewIntent(Landroid/content/Intent;)V

    invoke-virtual {p0, p1}, Lcom/opera/android/startup/WelcomeActivity;->S(Landroid/content/Intent;)V

    return-void
.end method

.method public final onPause()V
    .registers 2

    invoke-super {p0}, Landroidx/fragment/app/r;->onPause()V

    iget-object p0, p0, Lcom/opera/android/startup/WelcomeActivity;->n:Lbl9;

    if-eqz p0, :cond_11

    iget-object p0, p0, Lbl9;->g:Ljava/lang/Object;

    check-cast p0, Lzm9;

    if-eqz p0, :cond_11

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lzm9;->b(Z)V

    :cond_11
    return-void
.end method

.method public final onResume()V
    .registers 2

    invoke-super {p0}, Landroidx/fragment/app/r;->onResume()V

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->d()Le00;

    move-result-object p0

    invoke-virtual {p0}, Le00;->c()V

    return-void
.end method

.method public final onSaveInstanceState(Landroid/os/Bundle;)V
    .registers 10

    invoke-super {p0, p1}, Lxd5;->onSaveInstanceState(Landroid/os/Bundle;)V

    iget-object v0, p0, Lcom/opera/android/startup/WelcomeActivity;->n:Lbl9;

    const/4 v1, 0x0

    if-eqz v0, :cond_35

    iget-object v2, v0, Lbl9;->d:Ljava/lang/Object;

    check-cast v2, Ljava/util/ArrayDeque;

    invoke-virtual {v2}, Ljava/util/ArrayDeque;->iterator()Ljava/util/Iterator;

    move-result-object v2

    move v3, v1

    :goto_11
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_35

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroidx/fragment/app/Fragment;

    iget-object v5, v0, Lbl9;->c:Ljava/lang/Object;

    check-cast v5, Landroidx/fragment/app/w;

    add-int/lit8 v3, v3, 0x1

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "f"

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, p1, v4, v6}, Landroidx/fragment/app/w;->a0(Landroid/os/Bundle;Landroidx/fragment/app/Fragment;Ljava/lang/String;)V

    goto :goto_11

    :cond_35
    invoke-virtual {p0}, Lg9k;->H()Z

    move-result v0

    if-nez v0, :cond_b1

    invoke-virtual {p0}, Lcom/opera/android/startup/WelcomeActivity;->N()Lq0o;

    move-result-object p0

    iget-object p0, p0, Lq0o;->f:Lpyl;

    if-eqz p0, :cond_b1

    iget-object v0, p0, Lpyl;->d:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v3

    move v4, v1

    :goto_51
    if-ge v4, v3, :cond_7b

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    add-int/lit8 v4, v4, 0x1

    check-cast v5, Lm0o;

    iget-object v6, p0, Lpyl;->f:Ljava/lang/Object;

    check-cast v6, Ljava/util/LinkedHashMap;

    invoke-virtual {v6, v5}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/List;

    if-nez v6, :cond_69

    sget-object v6, Ll08;->a:Ll08;

    :cond_69
    check-cast v6, Ljava/util/Collection;

    invoke-interface {v6}, Ljava/util/Collection;->isEmpty()Z

    move-result v7

    if-eqz v7, :cond_75

    invoke-static {v5}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v6

    :cond_75
    check-cast v6, Ljava/lang/Iterable;

    invoke-static {v6, v2}, Lo95;->t(Ljava/lang/Iterable;Ljava/util/Collection;)V

    goto :goto_51

    :cond_7b
    new-instance v0, Ljava/util/ArrayList;

    const/16 v3, 0xa

    invoke-static {v2, v3}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v3

    invoke-direct {v0, v3}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v3

    move v4, v1

    :goto_8b
    if-ge v4, v3, :cond_9d

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    add-int/lit8 v4, v4, 0x1

    check-cast v5, Lm0o;

    invoke-virtual {v5}, Ljava/lang/Enum;->name()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_8b

    :cond_9d
    new-array v1, v1, [Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    const-string v1, "key.welcome_onboarding_flow.shown_leaves"

    invoke-virtual {p1, v1, v0}, Landroid/os/BaseBundle;->putStringArray(Ljava/lang/String;[Ljava/lang/String;)V

    const-string v0, "key.welcome_onboarding_flow.current_index"

    iget p0, p0, Lpyl;->b:I

    invoke-virtual {p1, v0, p0}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    :cond_b1
    return-void
.end method

.method public final onStart()V
    .registers 4

    invoke-super {p0}, Lfp1;->onStart()V

    new-instance v0, Landroid/content/Intent;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const-class v2, Lcom/opera/android/startup/InitialStartupService;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v0}, Landroid/content/Context;->stopService(Landroid/content/Intent;)Z

    const-string v0, "notification"

    invoke-virtual {p0, v0}, Lhjf;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/app/NotificationManager;

    const v0, 0x7f0a0a19

    invoke-virtual {p0, v0}, Landroid/app/NotificationManager;->cancel(I)V

    return-void
.end method

.method public final onStop()V
    .registers 4

    invoke-super {p0}, Lg9k;->onStop()V

    invoke-virtual {p0}, Lcom/opera/android/startup/WelcomeActivity;->M()Lcom/opera/android/settings/SettingsManager;

    move-result-object v0

    const-string v1, "eula_accepted.gdpr"

    invoke-virtual {v0, v1}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_35

    invoke-virtual {p0}, Lg9k;->H()Z

    move-result v0

    if-nez v0, :cond_2b

    invoke-virtual {p0}, Lcom/opera/android/startup/WelcomeActivity;->N()Lq0o;

    move-result-object v0

    iget-boolean v0, v0, Lq0o;->i:Z

    if-nez v0, :cond_2b

    :try_start_1d
    new-instance v0, Landroid/content/Intent;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const-class v2, Lcom/opera/android/startup/InitialStartupService;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;
    :try_end_2b
    .catch Ljava/lang/IllegalStateException; {:try_start_1d .. :try_end_2b} :catch_2b

    :catch_2b
    :cond_2b
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    sget-object v0, Llkk;->e:Llkk;

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Lxf8;->n0(Landroid/content/Context;Llkk;Z)V

    :cond_35
    return-void
.end method

.method public final s()Lfi;
    .registers 1

    iget-object p0, p0, Lcom/opera/android/startup/WelcomeActivity;->v:Lxbf;

    return-object p0
.end method

.method public final startActivityForResult(Landroid/content/Intent;ILandroid/os/Bundle;)V
    .registers 6

    invoke-virtual {p0}, Lcom/opera/android/startup/WelcomeActivity;->M()Lcom/opera/android/settings/SettingsManager;

    move-result-object v0

    const-string v1, "eula_accepted.gdpr"

    invoke-virtual {v0, v1}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_e

    const/4 v0, 0x0

    goto :goto_19

    :cond_e
    new-instance v0, Lnqi;

    const/16 v1, 0x14

    invoke-direct {v0, p0, v1}, Lnqi;-><init>(Ljava/lang/Object;B)V

    invoke-static {p0, p1, v0}, Lrm5;->z(Landroid/content/ContextWrapper;Landroid/content/Intent;Lkotlin/jvm/functions/Function2;)Z

    move-result v0

    :goto_19
    if-eqz v0, :cond_1c

    return-void

    :cond_1c
    invoke-super {p0, p1, p2, p3}, Lxd5;->startActivityForResult(Landroid/content/Intent;ILandroid/os/Bundle;)V

    return-void
.end method

.method public final t()Lijf;
    .registers 1

    iget-object p0, p0, Lcom/opera/android/startup/WelcomeActivity;->v:Lxbf;

    return-object p0
.end method
