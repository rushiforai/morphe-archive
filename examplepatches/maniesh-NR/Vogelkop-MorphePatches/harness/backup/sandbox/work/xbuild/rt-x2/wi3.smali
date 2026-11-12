.class public final Lwi3;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lxi3;

.field public final b:Lyi3;


# direct methods
.method public constructor <init>(Lxi3;Lyi3;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lwi3;->a:Lxi3;

    iput-object p2, p0, Lwi3;->b:Lyi3;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_1e

    instance-of v0, p1, Lwi3;

    if-eqz v0, :cond_1c

    check-cast p1, Lwi3;

    iget-object v0, p0, Lwi3;->a:Lxi3;

    iget-object v1, p1, Lwi3;->a:Lxi3;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1c

    iget-object p0, p0, Lwi3;->b:Lyi3;

    iget-object p1, p1, Lwi3;->b:Lyi3;

    invoke-virtual {p0, p1}, Lyi3;->equals(Ljava/lang/Object;)Z

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

    iget-object v0, p0, Lwi3;->a:Lxi3;

    if-nez v0, :cond_6

    const/4 v0, 0x0

    goto :goto_a

    :cond_6
    invoke-virtual {v0}, Lxi3;->hashCode()I

    move-result v0

    :goto_a
    mul-int/lit8 v0, v0, 0x1f

    iget-object p0, p0, Lwi3;->b:Lyi3;

    invoke-virtual {p0}, Lyi3;->hashCode()I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
