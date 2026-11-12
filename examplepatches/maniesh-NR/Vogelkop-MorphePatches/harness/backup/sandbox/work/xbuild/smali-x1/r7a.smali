.class public final Lr7a;
.super Lle3;
.source "SourceFile"


# annotations
.annotation runtime Lh2j;
    with = Lp7a;
.end annotation


# static fields
.field public static final Companion:Lo7a;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lo7a;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lr7a;->Companion:Lo7a;

    new-instance v0, Lr7a;

    sget-object v1, Lpe3;->a:Ljava/math/BigInteger;

    sget-object v1, Lpe3;->a:Ljava/math/BigInteger;

    invoke-direct {v0, v1}, Lr7a;-><init>(Ljava/math/BigInteger;)V

    return-void
.end method

.method public constructor <init>(Ljava/math/BigInteger;)V
    .registers 3

    const/16 v0, 0x40

    invoke-direct {p0, v0, p1}, Lle3;-><init>(ILjava/math/BigInteger;)V

    return-void
.end method
