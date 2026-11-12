.class public final Lpse;
.super Llim;
.source "SourceFile"


# instance fields
.field private final a:Lose;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/opera/android/annotations/WeakOwner;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lose;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    invoke-direct {v0, p1}, Lose;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lpse;->a:Lose;

    return-void
.end method


# virtual methods
.method public final W(Lndc;)V
    .registers 2

    iget-object p0, p0, Lpse;->a:Lose;

    iget-object p1, p0, Lose;->b:Lwnm;

    invoke-virtual {p1, p0}, Lekc;->k(Lf7f;)V

    return-void
.end method

.method public final onDestroy(Lndc;)V
    .registers 3

    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    iget-object p0, p0, Lpse;->a:Lose;

    iget-object p1, p0, Lose;->a:Landroid/content/Context;

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lcom/opera/android/OperaApplication;

    iget-boolean p1, p0, Lose;->f:Z

    if-eqz p1, :cond_23

    iget-object p1, p0, Lose;->d:Lc6j;

    if-eqz p1, :cond_23

    iget-object p1, p1, Lc6j;->c:Ljava/util/HashSet;

    invoke-virtual {p1, p0}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    const/4 p1, 0x0

    iput-object p1, p0, Lose;->d:Lc6j;

    :cond_23
    iget-object p1, p0, Lose;->b:Lwnm;

    invoke-virtual {p1, p0}, Lekc;->p(Lf7f;)V

    const/4 p1, 0x1

    iput-boolean p1, p0, Lose;->e:Z

    return-void
.end method
