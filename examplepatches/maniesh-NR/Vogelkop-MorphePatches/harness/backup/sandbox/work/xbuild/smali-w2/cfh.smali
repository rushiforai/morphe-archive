.class public final Lcfh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lgfh;


# instance fields
.field public final a:Lbfh;


# direct methods
.method public constructor <init>(Lbfh;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcfh;->a:Lbfh;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 3

    if-eq p0, p1, :cond_14

    instance-of v0, p1, Lcfh;

    if-eqz v0, :cond_12

    check-cast p1, Lcfh;

    iget-object p0, p0, Lcfh;->a:Lbfh;

    iget-object p1, p1, Lcfh;->a:Lbfh;

    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_14

    :cond_12
    const/4 p0, 0x0

    return p0

    :cond_14
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 1

    iget-object p0, p0, Lcfh;->a:Lbfh;

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
