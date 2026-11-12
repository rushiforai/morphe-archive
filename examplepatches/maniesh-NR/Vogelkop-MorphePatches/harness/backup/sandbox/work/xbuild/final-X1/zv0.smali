.class public final Lzv0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lnv0;

.field public final b:Ljava/lang/String;

.field public final c:Ljava/lang/String;

.field public final d:Z

.field public final e:Ljava/lang/String;

.field public final f:Ljava/lang/String;

.field public final g:Ljava/lang/String;

.field public final h:Z

.field public final i:Z

.field public final j:Lfw0;


# direct methods
.method public constructor <init>(Lnv0;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZLfw0;)V
    .registers 11

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lzv0;->a:Lnv0;

    iput-object p2, p0, Lzv0;->b:Ljava/lang/String;

    iput-object p3, p0, Lzv0;->c:Ljava/lang/String;

    iput-boolean p4, p0, Lzv0;->d:Z

    iput-object p5, p0, Lzv0;->e:Ljava/lang/String;

    iput-object p6, p0, Lzv0;->f:Ljava/lang/String;

    iput-object p7, p0, Lzv0;->g:Ljava/lang/String;

    iput-boolean p8, p0, Lzv0;->h:Z

    iput-boolean p9, p0, Lzv0;->i:Z

    iput-object p10, p0, Lzv0;->j:Lfw0;

    return-void
.end method

.method public static a(Lzv0;I)Lzv0;
    .registers 13

    iget-object v1, p0, Lzv0;->a:Lnv0;

    and-int/lit8 v0, p1, 0x2

    const/4 v2, 0x0

    if-eqz v0, :cond_a

    iget-object v0, p0, Lzv0;->b:Ljava/lang/String;

    goto :goto_b

    :cond_a
    move-object v0, v2

    :goto_b
    and-int/lit8 v3, p1, 0x4

    if-eqz v3, :cond_11

    iget-object v2, p0, Lzv0;->c:Ljava/lang/String;

    :cond_11
    move-object v3, v2

    iget-boolean v4, p0, Lzv0;->d:Z

    iget-object v5, p0, Lzv0;->e:Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v6, p0, Lzv0;->f:Ljava/lang/String;

    iget-object v7, p0, Lzv0;->g:Ljava/lang/String;

    iget-boolean v8, p0, Lzv0;->h:Z

    and-int/lit16 p1, p1, 0x200

    if-eqz p1, :cond_27

    iget-boolean p1, p0, Lzv0;->i:Z

    :goto_25
    move v9, p1

    goto :goto_29

    :cond_27
    const/4 p1, 0x0

    goto :goto_25

    :goto_29
    iget-object v10, p0, Lzv0;->j:Lfw0;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-object v2, v0

    new-instance v0, Lzv0;

    invoke-direct/range {v0 .. v10}, Lzv0;-><init>(Lnv0;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZLfw0;)V

    return-object v0
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_5e

    instance-of v0, p1, Lzv0;

    if-eqz v0, :cond_5c

    check-cast p1, Lzv0;

    iget-object v0, p0, Lzv0;->a:Lnv0;

    iget-object v1, p1, Lzv0;->a:Lnv0;

    if-ne v0, v1, :cond_5c

    iget-object v0, p0, Lzv0;->b:Ljava/lang/String;

    iget-object v1, p1, Lzv0;->b:Ljava/lang/String;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5c

    iget-object v0, p0, Lzv0;->c:Ljava/lang/String;

    iget-object v1, p1, Lzv0;->c:Ljava/lang/String;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5c

    iget-boolean v0, p0, Lzv0;->d:Z

    iget-boolean v1, p1, Lzv0;->d:Z

    if-ne v0, v1, :cond_5c

    iget-object v0, p0, Lzv0;->e:Ljava/lang/String;

    iget-object v1, p1, Lzv0;->e:Ljava/lang/String;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5c

    iget-object v0, p0, Lzv0;->f:Ljava/lang/String;

    iget-object v1, p1, Lzv0;->f:Ljava/lang/String;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5c

    iget-object v0, p0, Lzv0;->g:Ljava/lang/String;

    iget-object v1, p1, Lzv0;->g:Ljava/lang/String;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5c

    iget-boolean v0, p0, Lzv0;->h:Z

    iget-boolean v1, p1, Lzv0;->h:Z

    if-ne v0, v1, :cond_5c

    iget-boolean v0, p0, Lzv0;->i:Z

    iget-boolean v1, p1, Lzv0;->i:Z

    if-ne v0, v1, :cond_5c

    iget-object p0, p0, Lzv0;->j:Lfw0;

    iget-object p1, p1, Lzv0;->j:Lfw0;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_5e

    :cond_5c
    const/4 p0, 0x0

    return p0

    :cond_5e
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 5

    iget-object v0, p0, Lzv0;->a:Lnv0;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    const/4 v2, 0x0

    iget-object v3, p0, Lzv0;->b:Ljava/lang/String;

    if-nez v3, :cond_10

    move v3, v2

    goto :goto_14

    :cond_10
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_14
    add-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget-object v3, p0, Lzv0;->c:Ljava/lang/String;

    if-nez v3, :cond_1c

    move v3, v2

    goto :goto_20

    :cond_1c
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_20
    add-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget-boolean v3, p0, Lzv0;->d:Z

    invoke-static {v0, v1, v3}, Lfki;->k(IIZ)I

    move-result v0

    iget-object v3, p0, Lzv0;->e:Ljava/lang/String;

    if-nez v3, :cond_2e

    move v3, v2

    goto :goto_32

    :cond_2e
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_32
    add-int/2addr v0, v3

    mul-int/lit16 v0, v0, 0x3c1

    iget-object v3, p0, Lzv0;->f:Ljava/lang/String;

    if-nez v3, :cond_3b

    move v3, v2

    goto :goto_3f

    :cond_3b
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_3f
    add-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget-object v3, p0, Lzv0;->g:Ljava/lang/String;

    if-nez v3, :cond_47

    move v3, v2

    goto :goto_4b

    :cond_47
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_4b
    add-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget-boolean v3, p0, Lzv0;->h:Z

    invoke-static {v0, v1, v3}, Lfki;->k(IIZ)I

    move-result v0

    iget-boolean v3, p0, Lzv0;->i:Z

    invoke-static {v0, v1, v3}, Lfki;->k(IIZ)I

    move-result v0

    iget-object p0, p0, Lzv0;->j:Lfw0;

    if-eqz p0, :cond_61

    invoke-virtual {p0}, Lfw0;->hashCode()I

    move-result v2

    :cond_61
    add-int/2addr v0, v2

    return v0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
