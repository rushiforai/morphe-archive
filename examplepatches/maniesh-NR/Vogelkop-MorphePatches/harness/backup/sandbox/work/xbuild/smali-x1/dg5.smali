.class public final Ldg5;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:I

.field public final b:Lcg5;


# direct methods
.method public synthetic constructor <init>(I)V
    .registers 3

    .line 8
    sget-object v0, Lcg5;->a:Lcg5;

    .line 9
    invoke-direct {p0, p1, v0}, Ldg5;-><init>(ILcg5;)V

    return-void
.end method

.method public constructor <init>(ILcg5;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Ldg5;->a:I

    iput-object p2, p0, Ldg5;->b:Lcg5;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Ldg5;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Ldg5;

    iget v1, p0, Ldg5;->a:I

    iget v3, p1, Ldg5;->a:I

    if-eq v1, v3, :cond_13

    return v2

    :cond_13
    iget-object p0, p0, Ldg5;->b:Lcg5;

    iget-object p1, p1, Ldg5;->b:Lcg5;

    if-eq p0, p1, :cond_1a

    return v2

    :cond_1a
    return v0
.end method

.method public final hashCode()I
    .registers 2

    iget v0, p0, Ldg5;->a:I

    invoke-static {v0}, Ljava/lang/Integer;->hashCode(I)I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object p0, p0, Ldg5;->b:Lcg5;

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
