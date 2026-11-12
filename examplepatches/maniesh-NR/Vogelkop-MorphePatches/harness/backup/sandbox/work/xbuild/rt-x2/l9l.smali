.class public final Ll9l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll24;


# instance fields
.field public final synthetic a:Lr9l;


# direct methods
.method public constructor <init>(Lr9l;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll9l;->a:Lr9l;

    return-void
.end method


# virtual methods
.method public final V()Z
    .registers 1

    iget-object p0, p0, Ll9l;->a:Lr9l;

    invoke-virtual {p0}, Lr9l;->t()V

    const/4 p0, 0x1

    return p0
.end method

.method public final Z()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final b()Lvvb;
    .registers 1

    iget-object p0, p0, Ll9l;->a:Lr9l;

    iget-object p0, p0, Lr9l;->m:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lvvb;

    return-object p0
.end method

.method public final j()Z
    .registers 3

    iget-object p0, p0, Ll9l;->a:Lr9l;

    const/4 v0, 0x0

    invoke-virtual {p0, v0, v0}, Lr9l;->s(ZZ)Z

    move-result v1

    if-nez v1, :cond_16

    invoke-virtual {p0, v0}, Lr9l;->r(Z)Z

    move-result v1

    if-nez v1, :cond_16

    invoke-virtual {p0}, Lr9l;->b()Z

    move-result p0

    if-nez p0, :cond_16

    return v0

    :cond_16
    const/4 p0, 0x1

    return p0
.end method

.method public final u()Z
    .registers 3

    iget-object p0, p0, Ll9l;->a:Lr9l;

    const/4 v0, 0x0

    invoke-virtual {p0, v0, v0}, Lr9l;->s(ZZ)Z

    move-result v1

    if-nez v1, :cond_16

    invoke-virtual {p0, v0}, Lr9l;->r(Z)Z

    move-result v1

    if-nez v1, :cond_16

    invoke-virtual {p0}, Lr9l;->b()Z

    move-result p0

    if-nez p0, :cond_16

    return v0

    :cond_16
    const/4 p0, 0x1

    return p0
.end method
