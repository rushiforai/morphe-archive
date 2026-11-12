.class public final La6k;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lk6k;

.field public final b:Lb6k;


# direct methods
.method public constructor <init>(Lk6k;Lb6k;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, La6k;->a:Lk6k;

    iput-object p2, p0, La6k;->b:Lb6k;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_1e

    instance-of v0, p1, La6k;

    if-eqz v0, :cond_1c

    check-cast p1, La6k;

    iget-object v0, p0, La6k;->a:Lk6k;

    iget-object v1, p1, La6k;->a:Lk6k;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1c

    iget-object p0, p0, La6k;->b:Lb6k;

    iget-object p1, p1, La6k;->b:Lb6k;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1e

    :cond_1c
    const/4 p0, 0x0

    return p0

    :cond_1e
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 2

    iget-object v0, p0, La6k;->a:Lk6k;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object p0, p0, La6k;->b:Lb6k;

    if-nez p0, :cond_e

    const/4 p0, 0x0

    goto :goto_14

    :cond_e
    iget p0, p0, Lb6k;->a:I

    invoke-static {p0}, Ljava/lang/Integer;->hashCode(I)I

    move-result p0

    :goto_14
    add-int/2addr v0, p0

    return v0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
