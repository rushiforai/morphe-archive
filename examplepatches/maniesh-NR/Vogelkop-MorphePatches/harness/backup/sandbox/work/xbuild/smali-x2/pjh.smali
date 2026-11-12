.class public final Lpjh;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lee0;

.field public final b:Leo0;

.field public final c:Ljava/lang/String;

.field public final d:Ljava/lang/Integer;


# direct methods
.method public constructor <init>(Lee0;Leo0;Ljava/lang/String;Ljava/lang/Integer;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lpjh;->a:Lee0;

    iput-object p2, p0, Lpjh;->b:Leo0;

    iput-object p3, p0, Lpjh;->c:Ljava/lang/String;

    iput-object p4, p0, Lpjh;->d:Ljava/lang/Integer;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 5

    if-eq p0, p1, :cond_2f

    instance-of v0, p1, Lpjh;

    const/4 v1, 0x0

    if-eqz v0, :cond_2e

    check-cast p1, Lpjh;

    iget-object v0, p0, Lpjh;->a:Lee0;

    iget-object v2, p1, Lpjh;->a:Lee0;

    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2e

    iget-object v0, p0, Lpjh;->b:Leo0;

    iget-object v2, p1, Lpjh;->b:Leo0;

    if-eq v0, v2, :cond_1a

    return v1

    :cond_1a
    iget-object v0, p0, Lpjh;->c:Ljava/lang/String;

    iget-object v2, p1, Lpjh;->c:Ljava/lang/String;

    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2e

    iget-object p0, p0, Lpjh;->d:Ljava/lang/Integer;

    iget-object p1, p1, Lpjh;->d:Ljava/lang/Integer;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_2f

    :cond_2e
    return v1

    :cond_2f
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 4

    const/4 v0, 0x0

    iget-object v1, p0, Lpjh;->a:Lee0;

    if-nez v1, :cond_7

    move v1, v0

    goto :goto_b

    :cond_7
    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    :goto_b
    mul-int/lit8 v1, v1, 0x1f

    iget-object v2, p0, Lpjh;->b:Leo0;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    add-int/2addr v2, v1

    mul-int/lit8 v2, v2, 0x1f

    iget-object v1, p0, Lpjh;->c:Ljava/lang/String;

    if-nez v1, :cond_1c

    move v1, v0

    goto :goto_20

    :cond_1c
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    :goto_20
    add-int/2addr v2, v1

    mul-int/lit8 v2, v2, 0x1f

    iget-object p0, p0, Lpjh;->d:Ljava/lang/Integer;

    if-eqz p0, :cond_2b

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    :cond_2b
    add-int/2addr v2, v0

    return v2
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
