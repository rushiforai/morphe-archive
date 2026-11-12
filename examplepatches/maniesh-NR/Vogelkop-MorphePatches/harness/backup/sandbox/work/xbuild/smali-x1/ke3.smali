.class public final Lke3;
.super Lle3;
.source "SourceFile"


# annotations
.annotation runtime Lh2j;
    with = Lje3;
.end annotation


# static fields
.field public static final Companion:Lie3;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lie3;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lke3;->Companion:Lie3;

    return-void
.end method

.method public constructor <init>(J)V
    .registers 4

    sget-object v0, Lpe3;->a:Ljava/math/BigInteger;

    invoke-static {p1, p2}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object p1

    const/4 p2, 0x0

    invoke-direct {p0, p2, p1}, Lle3;-><init>(ILjava/math/BigInteger;)V

    return-void
.end method
