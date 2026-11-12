.class public final Lu3k;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/lang/String;

.field public final c:I


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;I)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lu3k;->a:Ljava/lang/String;

    iput-object p2, p0, Lu3k;->b:Ljava/lang/String;

    iput p3, p0, Lu3k;->c:I

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_24

    instance-of v0, p1, Lu3k;

    if-eqz v0, :cond_22

    check-cast p1, Lu3k;

    iget-object v0, p0, Lu3k;->a:Ljava/lang/String;

    iget-object v1, p1, Lu3k;->a:Ljava/lang/String;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_22

    iget-object v0, p0, Lu3k;->b:Ljava/lang/String;

    iget-object v1, p1, Lu3k;->b:Ljava/lang/String;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_22

    iget p0, p0, Lu3k;->c:I

    iget p1, p1, Lu3k;->c:I

    if-eq p0, p1, :cond_24

    :cond_22
    const/4 p0, 0x0

    return p0

    :cond_24
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 4

    const v0, 0x67c92f02

    iget-object v1, p0, Lu3k;->a:Ljava/lang/String;

    const/16 v2, 0x1f

    invoke-static {v0, v2, v1}, Lz1m;->f(IILjava/lang/String;)I

    move-result v0

    iget-object v1, p0, Lu3k;->b:Ljava/lang/String;

    invoke-static {v0, v2, v1}, Lz1m;->f(IILjava/lang/String;)I

    move-result v0

    iget p0, p0, Lu3k;->c:I

    invoke-static {p0}, Ljava/lang/Integer;->hashCode(I)I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
