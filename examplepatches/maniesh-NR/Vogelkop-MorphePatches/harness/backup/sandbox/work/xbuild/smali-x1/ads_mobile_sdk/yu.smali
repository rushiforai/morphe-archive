.class public final Lads_mobile_sdk/yu;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:I

.field public final b:I

.field public final c:I


# direct methods
.method public constructor <init>(III)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lads_mobile_sdk/yu;->a:I

    iput p2, p0, Lads_mobile_sdk/yu;->b:I

    iput p3, p0, Lads_mobile_sdk/yu;->c:I

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Lads_mobile_sdk/yu;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Lads_mobile_sdk/yu;

    iget v1, p0, Lads_mobile_sdk/yu;->a:I

    iget v3, p1, Lads_mobile_sdk/yu;->a:I

    if-eq v1, v3, :cond_13

    return v2

    :cond_13
    iget v1, p0, Lads_mobile_sdk/yu;->b:I

    iget v3, p1, Lads_mobile_sdk/yu;->b:I

    if-eq v1, v3, :cond_1a

    return v2

    :cond_1a
    iget p0, p0, Lads_mobile_sdk/yu;->c:I

    iget p1, p1, Lads_mobile_sdk/yu;->c:I

    if-eq p0, p1, :cond_21

    return v2

    :cond_21
    return v0
.end method

.method public final hashCode()I
    .registers 3

    iget v0, p0, Lads_mobile_sdk/yu;->a:I

    invoke-static {v0}, Ljava/lang/Integer;->hashCode(I)I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget v1, p0, Lads_mobile_sdk/yu;->b:I

    invoke-static {v1, v0}, Ln6h;->a(II)I

    move-result v0

    const/4 v1, 0x0

    invoke-static {v1, v0}, Ln6h;->a(II)I

    move-result v0

    iget p0, p0, Lads_mobile_sdk/yu;->c:I

    invoke-static {p0, v0}, Ln6h;->a(II)I

    move-result p0

    add-int/lit8 p0, p0, 0x32

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 6

    const-string v0, ", paddingRight="

    const-string v1, ", paddingTop=0, paddingBottom="

    iget v2, p0, Lads_mobile_sdk/yu;->a:I

    iget v3, p0, Lads_mobile_sdk/yu;->b:I

    const-string v4, "CloseButtonConfig(paddingLeft="

    invoke-static {v2, v3, v4, v0, v1}, Lsko;->o(IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", size=50)"

    iget p0, p0, Lads_mobile_sdk/yu;->c:I

    invoke-static {p0, v1, v0}, Lp3p;->k(ILjava/lang/String;Ljava/lang/StringBuilder;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
