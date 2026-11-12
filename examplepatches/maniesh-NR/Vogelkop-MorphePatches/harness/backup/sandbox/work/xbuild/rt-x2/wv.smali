.class public final Lwv;
.super Lle3;
.source "SourceFile"


# annotations
.annotation runtime Lh2j;
    with = Lvv;
.end annotation


# static fields
.field public static final Companion:Luv;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final d:Lwv;


# instance fields
.field public final c:Ljava/math/BigInteger;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Luv;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lwv;->Companion:Luv;

    new-instance v0, Lwv;

    sget-object v1, Lpe3;->a:Ljava/math/BigInteger;

    sget-object v1, Lpe3;->a:Ljava/math/BigInteger;

    invoke-direct {v0, v1}, Lwv;-><init>(Ljava/math/BigInteger;)V

    sput-object v0, Lwv;->d:Lwv;

    return-void
.end method

.method public constructor <init>(Ljava/math/BigInteger;)V
    .registers 5

    const/16 v0, 0x28

    invoke-direct {p0, v0, p1}, Lle3;-><init>(ILjava/math/BigInteger;)V

    iput-object p1, p0, Lwv;->c:Ljava/math/BigInteger;

    invoke-virtual {p1}, Ljava/math/BigInteger;->signum()I

    move-result p1

    const/4 v1, 0x0

    const-string v2, "Check failed."

    if-ltz p1, :cond_1d

    iget-object p0, p0, Lle3;->b:Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p0

    if-ne p0, v0, :cond_19

    return-void

    :cond_19
    invoke-static {v2}, Lqp2;->n(Ljava/lang/String;)V

    throw v1

    :cond_1d
    invoke-static {v2}, Lqp2;->n(Ljava/lang/String;)V

    throw v1
.end method
