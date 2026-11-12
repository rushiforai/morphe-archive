.class public final Lfsi;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lu3l;


# instance fields
.field public final d:Lesi;


# direct methods
.method public constructor <init>(Lesi;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lfsi;->d:Lesi;

    return-void
.end method


# virtual methods
.method public final a(Lb2l;)Z
    .registers 5

    check-cast p1, Ld7l;

    invoke-virtual {p1}, Ld7l;->l0()Ljava/lang/String;

    move-result-object v0

    iget-object p0, p0, Lfsi;->d:Lesi;

    invoke-virtual {p0, v0}, Lesi;->a(Ljava/lang/String;)I

    move-result v0

    const/4 v1, 0x1

    const/4 v2, -0x1

    if-eq v0, v2, :cond_11

    return v1

    :cond_11
    invoke-virtual {p1}, Ld7l;->g0()Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_22

    invoke-static {p1}, Lwqm;->G(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lesi;->a(Ljava/lang/String;)I

    move-result p0

    if-eq p0, v2, :cond_22

    return v1

    :cond_22
    const/4 p0, 0x0

    return p0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 3

    if-eq p0, p1, :cond_14

    instance-of v0, p1, Lfsi;

    if-eqz v0, :cond_12

    check-cast p1, Lfsi;

    iget-object p0, p0, Lfsi;->d:Lesi;

    iget-object p1, p1, Lfsi;->d:Lesi;

    invoke-virtual {p0, p1}, Lesi;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_14

    :cond_12
    const/4 p0, 0x0

    return p0

    :cond_14
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 1

    iget-object p0, p0, Lfsi;->d:Lesi;

    invoke-virtual {p0}, Lesi;->hashCode()I

    move-result p0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
