.class public abstract Lle3;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/math/BigInteger;

.field public final b:Ljava/lang/String;


# direct methods
.method public constructor <init>(ILjava/math/BigInteger;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lle3;->a:Ljava/math/BigInteger;

    const/16 v0, 0x10

    invoke-virtual {p2, v0}, Ljava/math/BigInteger;->toString(I)Ljava/lang/String;

    move-result-object p2

    if-lez p1, :cond_11

    invoke-static {p1, p2}, Lkotlin/text/StringsKt;->S(ILjava/lang/String;)Ljava/lang/String;

    move-result-object p2

    :cond_11
    iput-object p2, p0, Lle3;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final a()Ljava/lang/String;
    .registers 2

    iget-object p0, p0, Lle3;->b:Ljava/lang/String;

    const-string v0, "0x"

    invoke-static {v0, p0}, Lsko;->j(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    const/4 v1, 0x0

    if-eqz p1, :cond_1f

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-ne v2, v3, :cond_1f

    check-cast p1, Lle3;

    iget-object p0, p0, Lle3;->a:Ljava/math/BigInteger;

    iget-object p1, p1, Lle3;->a:Ljava/math/BigInteger;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1e

    return v1

    :cond_1e
    return v0

    :cond_1f
    return v1
.end method

.method public final hashCode()I
    .registers 1

    iget-object p0, p0, Lle3;->a:Ljava/math/BigInteger;

    invoke-virtual {p0}, Ljava/math/BigInteger;->hashCode()I

    move-result p0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lle3;->b:Ljava/lang/String;

    return-object p0
.end method
