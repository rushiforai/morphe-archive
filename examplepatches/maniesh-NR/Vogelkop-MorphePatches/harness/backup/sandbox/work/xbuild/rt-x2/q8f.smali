.class public final Lq8f;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Look;

.field public final b:Lzzh;


# direct methods
.method public constructor <init>(Look;Lzzh;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lq8f;->a:Look;

    iput-object p2, p0, Lq8f;->b:Lzzh;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Lq8f;

    const/4 v2, 0x0

    if-eqz v1, :cond_15

    check-cast p1, Lq8f;

    iget-object v1, p0, Lq8f;->a:Look;

    iget-object v3, p1, Lq8f;->a:Look;

    invoke-virtual {v1, v3}, Look;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_16

    :cond_15
    return v2

    :cond_16
    iget-object p0, p0, Lq8f;->b:Lzzh;

    iget-object p1, p1, Lq8f;->b:Lzzh;

    if-eq p0, p1, :cond_1d

    return v2

    :cond_1d
    return v0
.end method

.method public final hashCode()I
    .registers 2

    iget-object v0, p0, Lq8f;->a:Look;

    invoke-virtual {v0}, Look;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object p0, p0, Lq8f;->b:Lzzh;

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method
