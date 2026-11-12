.class public final Lv3k;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lz3k;


# instance fields
.field public final a:I

.field public final b:Ljava/lang/String;

.field public final c:Lyx9;


# direct methods
.method public constructor <init>(ILjava/lang/String;Lyx9;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lv3k;->a:I

    iput-object p2, p0, Lv3k;->b:Ljava/lang/String;

    iput-object p3, p0, Lv3k;->c:Lyx9;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Lv3k;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Lv3k;

    iget v1, p0, Lv3k;->a:I

    iget v3, p1, Lv3k;->a:I

    if-eq v1, v3, :cond_13

    return v2

    :cond_13
    iget-object v1, p0, Lv3k;->b:Ljava/lang/String;

    iget-object v3, p1, Lv3k;->b:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1e

    return v2

    :cond_1e
    iget-object p0, p0, Lv3k;->c:Lyx9;

    iget-object p1, p1, Lv3k;->c:Lyx9;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_29

    return v2

    :cond_29
    return v0
.end method

.method public final hashCode()I
    .registers 4

    iget v0, p0, Lv3k;->a:I

    invoke-static {v0}, Ljava/lang/Integer;->hashCode(I)I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-object v2, p0, Lv3k;->b:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lz1m;->f(IILjava/lang/String;)I

    move-result v0

    iget-object p0, p0, Lv3k;->c:Lyx9;

    if-nez p0, :cond_15

    const/4 p0, 0x0

    goto :goto_1b

    :cond_15
    iget-object p0, p0, Lyx9;->a:Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result p0

    :goto_1b
    add-int/2addr v0, p0

    return v0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
