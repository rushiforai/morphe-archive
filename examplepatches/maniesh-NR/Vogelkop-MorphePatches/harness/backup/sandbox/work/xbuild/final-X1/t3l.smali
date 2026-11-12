.class public final Lt3l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lu3l;


# instance fields
.field public final d:Lgsi;

.field public final e:Lfsi;


# direct methods
.method public constructor <init>(Lgsi;Lfsi;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lt3l;->d:Lgsi;

    iput-object p2, p0, Lt3l;->e:Lfsi;

    return-void
.end method


# virtual methods
.method public final a(Lb2l;)Z
    .registers 3

    iget-object v0, p0, Lt3l;->d:Lgsi;

    invoke-virtual {v0, p1}, Lgsi;->a(Lb2l;)Z

    move-result v0

    if-nez v0, :cond_12

    iget-object p0, p0, Lt3l;->e:Lfsi;

    invoke-virtual {p0, p1}, Lfsi;->a(Lb2l;)Z

    move-result p0

    if-nez p0, :cond_12

    const/4 p0, 0x0

    return p0

    :cond_12
    const/4 p0, 0x1

    return p0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_1e

    instance-of v0, p1, Lt3l;

    if-eqz v0, :cond_1c

    check-cast p1, Lt3l;

    iget-object v0, p0, Lt3l;->d:Lgsi;

    iget-object v1, p1, Lt3l;->d:Lgsi;

    invoke-virtual {v0, v1}, Lgsi;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1c

    iget-object p0, p0, Lt3l;->e:Lfsi;

    iget-object p1, p1, Lt3l;->e:Lfsi;

    invoke-virtual {p0, p1}, Lfsi;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1e

    :cond_1c
    const/4 p0, 0x0

    return p0

    :cond_1e
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 2

    iget-object v0, p0, Lt3l;->d:Lgsi;

    invoke-virtual {v0}, Lgsi;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object p0, p0, Lt3l;->e:Lfsi;

    iget-object p0, p0, Lfsi;->d:Lesi;

    invoke-virtual {p0}, Lesi;->hashCode()I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
