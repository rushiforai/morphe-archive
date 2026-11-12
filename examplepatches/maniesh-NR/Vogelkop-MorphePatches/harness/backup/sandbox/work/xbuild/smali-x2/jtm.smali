.class public final Ljtm;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/app/Application$ActivityLifecycleCallbacks;


# static fields
.field public static final b:Ljava/util/HashSet;


# instance fields
.field public a:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    sput-object v0, Ljtm;->b:Ljava/util/HashSet;

    return-void
.end method

.method public static a(Landroid/app/Activity;)V
    .registers 4

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p0

    iget-object p0, p0, Ld6j;->d:Lx5f;

    iget-object v0, p0, Lx5f;->b:Lumi;

    new-instance v1, Lrml;

    sget-object v2, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-direct {v1, v2, v0}, Lrml;-><init>(Ljava/lang/Object;Ltcl;)V

    new-instance v0, Li5f;

    const/4 v2, 0x0

    invoke-direct {v0, p0, v2}, Li5f;-><init>(Lx5f;B)V

    invoke-virtual {v1, v0}, Lrml;->a(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object v0

    iget-object p0, p0, Lx5f;->e:Lqie;

    invoke-virtual {v0, p0}, Lplk;->m(Lqie;)Lp1j;

    return-void
.end method


# virtual methods
.method public final onActivityCreated(Landroid/app/Activity;Landroid/os/Bundle;)V
    .registers 3

    return-void
.end method

.method public final onActivityDestroyed(Landroid/app/Activity;)V
    .registers 2

    return-void
.end method

.method public final onActivityPaused(Landroid/app/Activity;)V
    .registers 2

    return-void
.end method

.method public final onActivityResumed(Landroid/app/Activity;)V
    .registers 2

    return-void
.end method

.method public final onActivitySaveInstanceState(Landroid/app/Activity;Landroid/os/Bundle;)V
    .registers 3

    return-void
.end method

.method public final onActivityStarted(Landroid/app/Activity;)V
    .registers 4

    sget-object v0, Ljtm;->b:Ljava/util/HashSet;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_d

    return-void

    :cond_d
    iget v0, p0, Ljtm;->a:I

    if-nez v0, :cond_14

    invoke-static {p1}, Ljtm;->a(Landroid/app/Activity;)V

    :cond_14
    iget p1, p0, Ljtm;->a:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Ljtm;->a:I

    return-void
.end method

.method public final onActivityStopped(Landroid/app/Activity;)V
    .registers 4

    sget-object v0, Ljtm;->b:Ljava/util/HashSet;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_17

    iget v0, p0, Ljtm;->a:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Ljtm;->a:I

    if-nez v0, :cond_17

    invoke-static {p1}, Ljtm;->a(Landroid/app/Activity;)V

    :cond_17
    return-void
.end method
