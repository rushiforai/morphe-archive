.class public final Ls3l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lu3l;


# instance fields
.field public final d:Lp6l;


# direct methods
.method public constructor <init>(Lp6l;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ls3l;->d:Lp6l;

    return-void
.end method


# virtual methods
.method public final a(Lb2l;)Z
    .registers 2

    invoke-interface {p1}, Lb9l;->T()Lp6l;

    move-result-object p1

    iget-object p0, p0, Ls3l;->d:Lp6l;

    if-ne p1, p0, :cond_a

    const/4 p0, 0x1

    return p0

    :cond_a
    const/4 p0, 0x0

    return p0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 3

    if-eq p0, p1, :cond_10

    instance-of v0, p1, Ls3l;

    if-eqz v0, :cond_e

    check-cast p1, Ls3l;

    iget-object p0, p0, Ls3l;->d:Lp6l;

    iget-object p1, p1, Ls3l;->d:Lp6l;

    if-eq p0, p1, :cond_10

    :cond_e
    const/4 p0, 0x0

    return p0

    :cond_10
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 1

    iget-object p0, p0, Ls3l;->d:Lp6l;

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
