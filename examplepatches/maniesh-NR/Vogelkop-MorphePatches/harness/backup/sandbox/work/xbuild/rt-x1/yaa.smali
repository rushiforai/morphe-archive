.class public final Lyaa;
.super Lk1g;
.source "SourceFile"


# instance fields
.field public final i:Lbba;


# direct methods
.method public constructor <init>(Lbba;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lyaa;->i:Lbba;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 3

    if-eq p0, p1, :cond_10

    instance-of v0, p1, Lyaa;

    if-eqz v0, :cond_e

    check-cast p1, Lyaa;

    iget-object p0, p0, Lyaa;->i:Lbba;

    iget-object p1, p1, Lyaa;->i:Lbba;

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

    iget-object p0, p0, Lyaa;->i:Lbba;

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
