.class public abstract Lx8e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Comparable<",
        "Lx8e;",
        ">;"
    }
.end annotation

.annotation runtime Lh2j;
.end annotation


# static fields
.field public static final Companion:Ln8e;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final b:Ll4c;


# instance fields
.field public final a:Lzyk;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    new-instance v0, Ln8e;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lx8e;->Companion:Ln8e;

    sget-object v0, Lf7c;->b:Lf7c;

    new-instance v1, Luuc;

    const/16 v2, 0xe

    invoke-direct {v1, v2}, Luuc;-><init>(B)V

    invoke-static {v0, v1}, Lz4c;->a(Lf7c;Lkotlin/jvm/functions/Function0;)Ll4c;

    move-result-object v0

    sput-object v0, Lx8e;->b:Ll4c;

    return-void
.end method

.method public constructor <init>()V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lm8e;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lm8e;-><init>(Lx8e;B)V

    invoke-static {v0}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object v0

    iput-object v0, p0, Lx8e;->a:Lzyk;

    return-void
.end method

.method public synthetic constructor <init>(I)V
    .registers 3

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    new-instance p1, Lm8e;

    const/4 v0, 0x1

    invoke-direct {p1, p0, v0}, Lm8e;-><init>(Lx8e;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    .line 18
    iput-object p1, p0, Lx8e;->a:Lzyk;

    return-void
.end method


# virtual methods
.method public abstract a()Ljava/math/BigInteger;
.end method

.method public abstract b()Li46;
.end method

.method public final c()Ljava/math/BigDecimal;
    .registers 1

    iget-object p0, p0, Lx8e;->a:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/math/BigDecimal;

    return-object p0
.end method

.method public final compareTo(Ljava/lang/Object;)I
    .registers 2

    check-cast p1, Lx8e;

    invoke-virtual {p0, p1}, Lx8e;->d(Lx8e;)V

    invoke-virtual {p0}, Lx8e;->c()Ljava/math/BigDecimal;

    move-result-object p0

    invoke-virtual {p1}, Lx8e;->c()Ljava/math/BigDecimal;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/math/BigDecimal;->compareTo(Ljava/math/BigDecimal;)I

    move-result p0

    return p0
.end method

.method public final d(Lx8e;)V
    .registers 4

    invoke-virtual {p0}, Lx8e;->b()Li46;

    move-result-object v0

    invoke-virtual {p1}, Lx8e;->b()Li46;

    move-result-object v1

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_f

    return-void

    :cond_f
    const-string v0, "Different currencies: this="

    const-string v1, ", that="

    invoke-static {v0, p0, v1, p1}, Lodf;->j(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    invoke-virtual {p0}, Lx8e;->c()Ljava/math/BigDecimal;

    move-result-object v0

    invoke-virtual {p0}, Lx8e;->b()Li46;

    move-result-object p0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
