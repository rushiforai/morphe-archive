.class public final Lgsj;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lpxh;

.field public final b:S

.field public final c:Lbsj;


# direct methods
.method public constructor <init>(Lpxh;ILbsj;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lgsj;->a:Lpxh;

    iput-short p2, p0, Lgsj;->b:S

    iput-object p3, p0, Lgsj;->c:Lbsj;

    return-void
.end method

.method public synthetic constructor <init>(Lpxh;ILbsj;I)V
    .registers 5

    and-int/lit8 p4, p4, 0x4

    if-eqz p4, :cond_5

    const/4 p3, 0x0

    .line 10
    :cond_5
    invoke-direct {p0, p1, p2, p3}, Lgsj;-><init>(Lpxh;ILbsj;)V

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 5

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Lgsj;

    if-eqz v1, :cond_24

    check-cast p1, Lgsj;

    iget-object v1, p0, Lgsj;->a:Lpxh;

    iget-object v2, p1, Lgsj;->a:Lpxh;

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_24

    iget-short v1, p0, Lgsj;->b:S

    iget-short v2, p1, Lgsj;->b:S

    if-ne v1, v2, :cond_24

    iget-object p0, p0, Lgsj;->c:Lbsj;

    iget-object p1, p1, Lgsj;->c:Lbsj;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_26

    :cond_24
    const/4 p0, 0x0

    return p0

    :cond_26
    return v0
.end method

.method public final hashCode()I
    .registers 4

    iget-object v0, p0, Lgsj;->a:Lpxh;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-short v2, p0, Lgsj;->b:S

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget-object p0, p0, Lgsj;->c:Lbsj;

    if-nez p0, :cond_15

    const/4 p0, 0x0

    goto :goto_19

    :cond_15
    invoke-virtual {p0}, Lbsj;->hashCode()I

    move-result p0

    :goto_19
    add-int/2addr v0, p0

    mul-int/lit16 v0, v0, 0x3c1

    add-int/lit16 v0, v0, 0x4d5

    return v0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
