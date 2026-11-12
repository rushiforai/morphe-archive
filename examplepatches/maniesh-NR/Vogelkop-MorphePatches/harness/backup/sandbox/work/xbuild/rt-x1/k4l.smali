.class public final Lk4l;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ldxh;

.field public final b:Ldxh;


# direct methods
.method public constructor <init>(Ldxh;Ldxh;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lk4l;->a:Ldxh;

    iput-object p2, p0, Lk4l;->b:Ldxh;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_1e

    instance-of v0, p1, Lk4l;

    if-eqz v0, :cond_1c

    check-cast p1, Lk4l;

    iget-object v0, p0, Lk4l;->a:Ldxh;

    iget-object v1, p1, Lk4l;->a:Ldxh;

    invoke-virtual {v0, v1}, Ldxh;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1c

    iget-object p0, p0, Lk4l;->b:Ldxh;

    iget-object p1, p1, Lk4l;->b:Ldxh;

    invoke-virtual {p0, p1}, Ldxh;->equals(Ljava/lang/Object;)Z

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

    iget-object v0, p0, Lk4l;->a:Ldxh;

    iget v0, v0, Ldxh;->a:I

    invoke-static {v0}, Ljava/lang/Integer;->hashCode(I)I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object p0, p0, Lk4l;->b:Ldxh;

    iget p0, p0, Ldxh;->a:I

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
