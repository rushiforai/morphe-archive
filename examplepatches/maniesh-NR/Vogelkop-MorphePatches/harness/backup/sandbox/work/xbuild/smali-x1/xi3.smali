.class public final Lxi3;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:I

.field public final b:Lti3;

.field public final c:Ljava/lang/String;

.field public final d:Ljava/lang/String;

.field public final e:Ljava/lang/String;


# direct methods
.method public constructor <init>(ILti3;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lxi3;->a:I

    iput-object p2, p0, Lxi3;->b:Lti3;

    iput-object p3, p0, Lxi3;->c:Ljava/lang/String;

    iput-object p4, p0, Lxi3;->d:Ljava/lang/String;

    iput-object p5, p0, Lxi3;->e:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_34

    instance-of v0, p1, Lxi3;

    if-eqz v0, :cond_32

    check-cast p1, Lxi3;

    iget v0, p0, Lxi3;->a:I

    iget v1, p1, Lxi3;->a:I

    if-ne v0, v1, :cond_32

    iget-object v0, p0, Lxi3;->b:Lti3;

    iget-object v1, p1, Lxi3;->b:Lti3;

    if-ne v0, v1, :cond_32

    iget-object v0, p0, Lxi3;->c:Ljava/lang/String;

    iget-object v1, p1, Lxi3;->c:Ljava/lang/String;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_32

    iget-object v0, p0, Lxi3;->d:Ljava/lang/String;

    iget-object v1, p1, Lxi3;->d:Ljava/lang/String;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_32

    iget-object p0, p0, Lxi3;->e:Ljava/lang/String;

    iget-object p1, p1, Lxi3;->e:Ljava/lang/String;

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
    .registers 4

    iget v0, p0, Lxi3;->a:I

    invoke-static {v0}, Ljava/lang/Integer;->hashCode(I)I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lxi3;->b:Lti3;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    const/4 v0, 0x0

    iget-object v2, p0, Lxi3;->c:Ljava/lang/String;

    if-nez v2, :cond_18

    move v2, v0

    goto :goto_1c

    :cond_18
    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    :goto_1c
    add-int/2addr v1, v2

    mul-int/lit8 v1, v1, 0x1f

    iget-object v2, p0, Lxi3;->d:Ljava/lang/String;

    if-nez v2, :cond_25

    move v2, v0

    goto :goto_29

    :cond_25
    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    :goto_29
    add-int/2addr v1, v2

    mul-int/lit8 v1, v1, 0x1f

    iget-object p0, p0, Lxi3;->e:Ljava/lang/String;

    if-eqz p0, :cond_34

    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result v0

    :cond_34
    add-int/2addr v1, v0

    return v1
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
