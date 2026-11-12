.class public interface abstract Lr7n;
.super Ljava/lang/Object;
.source "SourceFile"


# virtual methods
.method public a(Ljava/lang/Class;Ldde;)Ll7n;
    .registers 3

    invoke-interface {p0, p1}, Lr7n;->c(Ljava/lang/Class;)Ll7n;

    move-result-object p0

    return-object p0
.end method

.method public b(Ls15;Ldde;)Ll7n;
    .registers 3

    invoke-interface {p1}, Ln15;->a()Ljava/lang/Class;

    move-result-object p1

    invoke-interface {p0, p1, p2}, Lr7n;->a(Ljava/lang/Class;Ldde;)Ll7n;

    move-result-object p0

    return-object p0
.end method

.method public c(Ljava/lang/Class;)Ll7n;
    .registers 2

    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string p1, "`Factory.create(String, CreationExtras)` is not implemented. You may need to override the method and provide a custom implementation. Note that using `Factory.create(String)` is not supported and considered an error."

    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0
.end method
