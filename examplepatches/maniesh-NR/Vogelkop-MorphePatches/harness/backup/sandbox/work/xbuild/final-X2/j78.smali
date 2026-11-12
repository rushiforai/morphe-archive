.class public final Lj78;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lm78;


# instance fields
.field public final a:Lqxh;

.field public final b:Lrxh;


# direct methods
.method public constructor <init>(Lqxh;Lrxh;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lj78;->a:Lqxh;

    iput-object p2, p0, Lj78;->b:Lrxh;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_1e

    instance-of v0, p1, Lj78;

    if-eqz v0, :cond_1c

    check-cast p1, Lj78;

    iget-object v0, p0, Lj78;->a:Lqxh;

    iget-object v1, p1, Lj78;->a:Lqxh;

    invoke-virtual {v0, v1}, Lqxh;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1c

    iget-object p0, p0, Lj78;->b:Lrxh;

    iget-object p1, p1, Lj78;->b:Lrxh;

    invoke-virtual {p0, p1}, Lrxh;->equals(Ljava/lang/Object;)Z

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

    iget-object v0, p0, Lj78;->a:Lqxh;

    iget-object v0, v0, Lqxh;->a:Ljava/lang/CharSequence;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object p0, p0, Lj78;->b:Lrxh;

    iget p0, p0, Lrxh;->a:I

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
