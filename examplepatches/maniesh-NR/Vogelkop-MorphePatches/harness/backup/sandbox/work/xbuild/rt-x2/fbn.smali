.class public final Lfbn;
.super Lhbn;
.source "SourceFile"


# instance fields
.field public final a:Lzan;


# direct methods
.method public constructor <init>(Lzan;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lfbn;->a:Lzan;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 3

    if-eq p0, p1, :cond_10

    instance-of v0, p1, Lfbn;

    if-eqz v0, :cond_e

    check-cast p1, Lfbn;

    iget-object p0, p0, Lfbn;->a:Lzan;

    iget-object p1, p1, Lfbn;->a:Lzan;

    if-eq p0, p1, :cond_10

    :cond_e
    const/4 p0, 0x0

    return p0

    :cond_10
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 1

    iget-object p0, p0, Lfbn;->a:Lzan;

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
