.class public final Lyv;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcsl;


# static fields
.field public static final b:Lyv;


# instance fields
.field public final a:Ljava/math/BigInteger;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    const-wide/high16 v0, -0x8000000000000000L

    invoke-static {v0, v1}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v0

    invoke-static {v0}, Lyv;->b(Ljava/math/BigInteger;)Lyv;

    move-result-object v0

    sput-object v0, Lyv;->b:Lyv;

    new-instance v0, Lyv;

    sget-object v1, Ljava/math/BigInteger;->ZERO:Ljava/math/BigInteger;

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lyv;-><init>(Ljava/math/BigInteger;Z)V

    return-void
.end method

.method public constructor <init>(Ljava/math/BigInteger;Z)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p2, :cond_12

    invoke-virtual {p1}, Ljava/math/BigInteger;->signum()I

    move-result p2

    if-ltz p2, :cond_18

    const-string p0, "Sentinel value must be negative"

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    const/4 p0, 0x0

    throw p0

    :cond_12
    invoke-virtual {p1}, Ljava/math/BigInteger;->signum()I

    move-result p2

    if-ltz p2, :cond_1b

    :cond_18
    iput-object p1, p0, Lyv;->a:Ljava/math/BigInteger;

    return-void

    :cond_1b
    const-string p0, "Value must be non-negative"

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    const/4 p0, 0x0

    throw p0
.end method

.method public static a(Ljava/lang/String;)Lyv;
    .registers 3

    new-instance v0, Ljava/math/BigInteger;

    const/16 v1, 0x10

    invoke-direct {v0, p0, v1}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;I)V

    new-instance p0, Lyv;

    invoke-virtual {v0}, Ljava/math/BigInteger;->signum()I

    move-result v1

    if-gez v1, :cond_11

    const/4 v1, 0x1

    goto :goto_12

    :cond_11
    const/4 v1, 0x0

    :goto_12
    invoke-direct {p0, v0, v1}, Lyv;-><init>(Ljava/math/BigInteger;Z)V

    return-object p0
.end method

.method public static b(Ljava/math/BigInteger;)Lyv;
    .registers 3
    .param p0    # Ljava/math/BigInteger;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/opera/android/annotations/RequiredForTest;
    .end annotation

    new-instance v0, Lyv;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Lyv;-><init>(Ljava/math/BigInteger;Z)V

    return-object v0
.end method

.method public static c(Ljava/lang/String;Lb85;)Lyv;
    .registers 5

    iget p1, p1, Lb85;->b:I

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-ne p1, v1, :cond_22

    new-instance p1, Lyv;

    sget v1, Lyw5;->a:I

    const-string v1, "0x"

    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_17

    const/4 v1, 0x2

    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    :cond_17
    new-instance v1, Ljava/math/BigInteger;

    const/16 v2, 0x10

    invoke-direct {v1, p0, v2}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;I)V

    invoke-direct {p1, v1, v0}, Lyv;-><init>(Ljava/math/BigInteger;Z)V

    return-object p1

    :cond_22
    new-instance p1, Lyv;

    new-instance v2, Ljava/math/BigInteger;

    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object p0

    invoke-direct {v2, v1, p0}, Ljava/math/BigInteger;-><init>(I[B)V

    invoke-direct {p1, v2, v0}, Lyv;-><init>(Ljava/math/BigInteger;Z)V

    return-object p1
.end method


# virtual methods
.method public final a1()Ljava/lang/String;
    .registers 2

    iget-object p0, p0, Lyv;->a:Ljava/math/BigInteger;

    const/16 v0, 0x10

    invoke-virtual {p0, v0}, Ljava/math/BigInteger;->toString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-ne p0, p1, :cond_4

    const/4 p0, 0x1

    return p0

    :cond_4
    if-eqz p1, :cond_19

    const-class v0, Lyv;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    if-ne v0, v1, :cond_19

    check-cast p1, Lyv;

    iget-object p0, p0, Lyv;->a:Ljava/math/BigInteger;

    iget-object p1, p1, Lyv;->a:Ljava/math/BigInteger;

    invoke-virtual {p0, p1}, Ljava/math/BigInteger;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0

    :cond_19
    const/4 p0, 0x0

    return p0
.end method

.method public final hashCode()I
    .registers 1

    iget-object p0, p0, Lyv;->a:Ljava/math/BigInteger;

    invoke-virtual {p0}, Ljava/math/BigInteger;->hashCode()I

    move-result p0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
