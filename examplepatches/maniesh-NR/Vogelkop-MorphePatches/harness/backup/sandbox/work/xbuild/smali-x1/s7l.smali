.class public final Ls7l;
.super Ldyg;
.source "SourceFile"


# instance fields
.field public final b:Lyni;


# direct methods
.method public constructor <init>(Lyni;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ls7l;->b:Lyni;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 5

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Ls7l;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Ls7l;

    iget-object p0, p0, Ls7l;->b:Lyni;

    iget-object p1, p1, Ls7l;->b:Lyni;

    if-eq p0, p1, :cond_13

    return v2

    :cond_13
    return v0
.end method

.method public final hashCode()I
    .registers 1

    iget-object p0, p0, Ls7l;->b:Lyni;

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
