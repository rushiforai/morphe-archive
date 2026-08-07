.class public abstract Ll/s20$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/s20;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lcom/p1/mobile/android/app/Act;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field public a:Ll/s20$c;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/s20;->a()Ll/l01;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {p0}, Ll/s20$a;->i()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v0, v1}, Ll/oof0;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Ll/s20$c;

    .line 17
    .line 18
    iput-object v0, p0, Ll/s20$a;->a:Ll/s20$c;

    .line 19
    .line 20
    return-void
.end method

.method public static synthetic a(Ll/s20$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/s20$a;->k()V

    return-void
.end method

.method public static synthetic b(Ll/s20$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/s20$a;->j()V

    return-void
.end method


# virtual methods
.method public c(Lcom/p1/mobile/android/app/Act;)Landroid/view/View;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)",
            "Landroid/view/View;"
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public d()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public abstract e(Lcom/p1/mobile/android/app/Act;)Landroid/animation/Animator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)",
            "Landroid/animation/Animator;"
        }
    .end annotation
.end method

.method public final f(Lcom/p1/mobile/android/app/Act;)Landroid/animation/Animator;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/s20$a;->a:Ll/s20$c;

    .line 2
    .line 3
    iget-object v0, v0, Ll/s20$c;->b:Lrx/subjects/a;

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, p1}, Ll/s20$a;->e(Lcom/p1/mobile/android/app/Act;)Landroid/animation/Animator;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    const/4 p0, 0x0

    .line 20
    return-object p0

    .line 21
    :cond_0
    new-instance v0, Ll/q20;

    .line 22
    .line 23
    invoke-direct {v0, p0}, Ll/q20;-><init>(Ll/s20$a;)V

    .line 24
    .line 25
    .line 26
    invoke-static {p1, v0}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 27
    .line 28
    .line 29
    return-object p1
.end method

.method public abstract g(Lcom/p1/mobile/android/app/Act;)Landroid/animation/Animator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)",
            "Landroid/animation/Animator;"
        }
    .end annotation
.end method

.method public final h(Lcom/p1/mobile/android/app/Act;)Landroid/animation/Animator;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/s20$a;->a:Ll/s20$c;

    .line 2
    .line 3
    iget-object v0, v0, Ll/s20$c;->b:Lrx/subjects/a;

    .line 4
    .line 5
    const/4 v1, 0x3

    .line 6
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, p1}, Ll/s20$a;->g(Lcom/p1/mobile/android/app/Act;)Landroid/animation/Animator;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    const/4 p0, 0x0

    .line 20
    return-object p0

    .line 21
    :cond_0
    new-instance v0, Ll/r20;

    .line 22
    .line 23
    invoke-direct {v0, p0}, Ll/r20;-><init>(Ll/s20$a;)V

    .line 24
    .line 25
    .line 26
    invoke-static {p1, v0}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 27
    .line 28
    .line 29
    return-object p1
.end method

.method public abstract i()Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end method

.method public final synthetic j()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/s20$a;->a:Ll/s20$c;

    .line 2
    .line 3
    iget-object p0, p0, Ll/s20$c;->b:Lrx/subjects/a;

    .line 4
    .line 5
    const/4 v0, 0x2

    .line 6
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic k()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/s20$a;->a:Ll/s20$c;

    .line 2
    .line 3
    iget-object v0, v0, Ll/s20$c;->b:Lrx/subjects/a;

    .line 4
    .line 5
    const/4 v1, 0x4

    .line 6
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Ll/s20$a;->a:Ll/s20$c;

    .line 14
    .line 15
    iget-object p0, p0, Ll/s20$c;->b:Lrx/subjects/a;

    .line 16
    .line 17
    const/4 v0, 0x5

    .line 18
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public l(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    invoke-virtual {p1, p0, p0}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public m(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    invoke-virtual {p1, p0, p0}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public abstract n(Lcom/p1/mobile/android/app/Act;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation
.end method

.method public o(Lcom/p1/mobile/android/app/Act;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/s20$a;->a:Ll/s20$c;

    .line 2
    .line 3
    iget-object v0, v0, Ll/s20$c;->b:Lrx/subjects/a;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, p1}, Ll/s20$a;->n(Lcom/p1/mobile/android/app/Act;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method
