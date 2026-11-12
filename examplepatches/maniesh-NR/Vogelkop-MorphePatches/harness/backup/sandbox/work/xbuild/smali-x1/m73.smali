.class public abstract Lm73;
.super Llim;
.source "SourceFile"

# interfaces
.implements Lysd;


# instance fields
.field public a:Z


# virtual methods
.method public final W(Lndc;)V
    .registers 2

    sget-object p1, Lzsd;->b:Lzsd;

    iget-object p1, p1, Lzsd;->a:Ljava/util/ArrayList;

    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public final onDestroy(Lndc;)V
    .registers 2

    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    sget-object p1, Lzsd;->b:Lzsd;

    iget-object p1, p1, Lzsd;->a:Ljava/util/ArrayList;

    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    return-void
.end method

.method public final onPause(Lndc;)V
    .registers 2

    const/4 p1, 0x0

    iput-boolean p1, p0, Lm73;->a:Z

    return-void
.end method

.method public final onResume(Lndc;)V
    .registers 2

    const/4 p1, 0x1

    iput-boolean p1, p0, Lm73;->a:Z

    return-void
.end method
