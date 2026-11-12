.class public final Ljwc;
.super Lewc;
.source "SourceFile"


# instance fields
.field public final d:Late;

.field public final e:I

.field public final f:Lvse;


# direct methods
.method public constructor <init>(Late;ILvse;)V
    .registers 4

    invoke-direct {p0, p1}, Lewc;-><init>(Late;)V

    iput-object p1, p0, Ljwc;->d:Late;

    iput p2, p0, Ljwc;->e:I

    iput-object p3, p0, Ljwc;->f:Lvse;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 5

    if-ne p0, p1, :cond_4

    const/4 p0, 0x1

    return p0

    :cond_4
    if-eqz p1, :cond_b

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    goto :goto_c

    :cond_b
    const/4 v0, 0x0

    :goto_c
    const-class v1, Ljwc;

    invoke-virtual {v1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_27

    move-object v0, p1

    check-cast v0, Ljwc;

    iget-object v1, p0, Ljwc;->d:Late;

    iget-object v2, v0, Ljwc;->d:Late;

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_27

    iget v1, p0, Ljwc;->e:I

    iget v0, v0, Ljwc;->e:I

    if-eq v1, v0, :cond_29

    :cond_27
    const/4 p0, 0x0

    return p0

    :cond_29
    invoke-super {p0, p1}, Lewc;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public final hashCode()I
    .registers 3

    iget-object v0, p0, Ljwc;->d:Late;

    invoke-virtual {v0}, Late;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget v1, p0, Ljwc;->e:I

    invoke-static {v1}, Ljava/lang/Integer;->hashCode(I)I

    move-result v1

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    const v0, 0x7f12004d

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object p0, p0, Lewc;->b:Late;

    invoke-virtual {p0}, Late;->hashCode()I

    move-result p0

    add-int/2addr p0, v1

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
