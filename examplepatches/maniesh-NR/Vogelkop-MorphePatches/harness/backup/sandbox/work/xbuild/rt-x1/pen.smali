.class public final Lpen;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/Integer;

.field public final b:Ljava/lang/CharSequence;

.field public final c:Z

.field public final d:Z

.field public final e:Leb8;


# direct methods
.method public constructor <init>(Ljava/lang/Integer;Ljava/lang/CharSequence;ZZLeb8;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lpen;->a:Ljava/lang/Integer;

    iput-object p2, p0, Lpen;->b:Ljava/lang/CharSequence;

    iput-boolean p3, p0, Lpen;->c:Z

    iput-boolean p4, p0, Lpen;->d:Z

    iput-object p5, p0, Lpen;->e:Leb8;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_34

    instance-of v0, p1, Lpen;

    if-eqz v0, :cond_32

    check-cast p1, Lpen;

    iget-object v0, p0, Lpen;->a:Ljava/lang/Integer;

    iget-object v1, p1, Lpen;->a:Ljava/lang/Integer;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_32

    iget-object v0, p0, Lpen;->b:Ljava/lang/CharSequence;

    iget-object v1, p1, Lpen;->b:Ljava/lang/CharSequence;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_32

    iget-boolean v0, p0, Lpen;->c:Z

    iget-boolean v1, p1, Lpen;->c:Z

    if-ne v0, v1, :cond_32

    iget-boolean v0, p0, Lpen;->d:Z

    iget-boolean v1, p1, Lpen;->d:Z

    if-ne v0, v1, :cond_32

    iget-object p0, p0, Lpen;->e:Leb8;

    iget-object p1, p1, Lpen;->e:Leb8;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_34

    :cond_32
    const/4 p0, 0x0

    return p0

    :cond_34
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 5

    const/4 v0, 0x0

    iget-object v1, p0, Lpen;->a:Ljava/lang/Integer;

    if-nez v1, :cond_7

    move v1, v0

    goto :goto_b

    :cond_7
    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    :goto_b
    const/16 v2, 0x1f

    mul-int/2addr v1, v2

    iget-object v3, p0, Lpen;->b:Ljava/lang/CharSequence;

    if-nez v3, :cond_14

    move v3, v0

    goto :goto_18

    :cond_14
    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    move-result v3

    :goto_18
    add-int/2addr v1, v3

    mul-int/2addr v1, v2

    iget-boolean v3, p0, Lpen;->c:Z

    invoke-static {v1, v2, v3}, Lfki;->k(IIZ)I

    move-result v1

    iget-boolean v3, p0, Lpen;->d:Z

    invoke-static {v1, v2, v3}, Lfki;->k(IIZ)I

    move-result v1

    iget-object p0, p0, Lpen;->e:Leb8;

    if-eqz p0, :cond_2e

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    :cond_2e
    add-int/2addr v1, v0

    return v1
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
