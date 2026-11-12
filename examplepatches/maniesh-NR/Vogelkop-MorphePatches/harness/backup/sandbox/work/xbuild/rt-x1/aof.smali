.class public final Laof;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lgsj;

.field public final b:Lwg5;


# direct methods
.method public constructor <init>(Lgsj;Lwg5;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Laof;->a:Lgsj;

    iput-object p2, p0, Laof;->b:Lwg5;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Laof;

    const/4 v2, 0x0

    if-eqz v1, :cond_15

    check-cast p1, Laof;

    iget-object v1, p0, Laof;->a:Lgsj;

    iget-object v3, p1, Laof;->a:Lgsj;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_16

    :cond_15
    return v2

    :cond_16
    iget-object p0, p0, Laof;->b:Lwg5;

    iget-object p1, p1, Laof;->b:Lwg5;

    if-eq p0, p1, :cond_1d

    return v2

    :cond_1d
    return v0
.end method

.method public final hashCode()I
    .registers 2

    iget-object v0, p0, Laof;->a:Lgsj;

    invoke-virtual {v0}, Lgsj;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object p0, p0, Laof;->b:Lwg5;

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
