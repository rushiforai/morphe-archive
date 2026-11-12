.class public interface abstract Lwv8;
.super Ljava/lang/Object;
.source "SourceFile"


# virtual methods
.method public abstract a(Lyz;)Ljava/lang/String;
.end method

.method public abstract b(Lyz;)D
.end method

.method public abstract c(Lyz;)Ljava/lang/String;
.end method

.method public d(Lyz;)Z
    .registers 2

    invoke-interface {p0, p1}, Lwv8;->a(Lyz;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p0

    xor-int/lit8 p0, p0, 0x1

    return p0
.end method

.method public abstract e(Lyz;)Ljava/lang/CharSequence;
.end method

.method public abstract f(Lyz;)Ljava/lang/CharSequence;
.end method

.method public abstract g(Lyz;)Ljava/lang/CharSequence;
.end method

.method public h(Lyz;)Ljava/lang/CharSequence;
    .registers 2

    const-string p0, ""

    return-object p0
.end method

.method public j(Lyz;)Ljava/lang/String;
    .registers 2

    const-string p0, ""

    return-object p0
.end method
