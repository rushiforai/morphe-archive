.class public abstract Llim;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Las6;


# virtual methods
.method public onDestroy(Lndc;)V
    .registers 2

    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    return-void
.end method
