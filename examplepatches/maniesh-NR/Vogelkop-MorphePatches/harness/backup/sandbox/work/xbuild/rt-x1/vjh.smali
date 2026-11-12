.class public final Lvjh;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lujh;

.field public final b:Ljava/lang/Integer;


# direct methods
.method public constructor <init>(Lujh;Ljava/lang/Integer;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lvjh;->a:Lujh;

    iput-object p2, p0, Lvjh;->b:Ljava/lang/Integer;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_1a

    instance-of v0, p1, Lvjh;

    if-eqz v0, :cond_18

    check-cast p1, Lvjh;

    iget-object v0, p0, Lvjh;->a:Lujh;

    iget-object v1, p1, Lvjh;->a:Lujh;

    if-ne v0, v1, :cond_18

    iget-object p0, p0, Lvjh;->b:Ljava/lang/Integer;

    iget-object p1, p1, Lvjh;->b:Ljava/lang/Integer;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1a

    :cond_18
    const/4 p0, 0x0

    return p0

    :cond_1a
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 2

    iget-object v0, p0, Lvjh;->a:Lujh;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object p0, p0, Lvjh;->b:Ljava/lang/Integer;

    if-nez p0, :cond_e

    const/4 p0, 0x0

    goto :goto_12

    :cond_e
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    :goto_12
    add-int/2addr v0, p0

    return v0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
