.class public final Lm3f;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lh2j;
.end annotation


# static fields
.field public static final Companion:Ll3f;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# instance fields
.field public final a:Lj3f;

.field public final b:Lj3f;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Ll3f;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lm3f;->Companion:Ll3f;

    return-void
.end method

.method public constructor <init>(ILj3f;Lj3f;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    and-int/lit8 v0, p1, 0x1

    if-nez v0, :cond_e

    new-instance p2, Lj3f;

    sget-object v0, Ll08;->a:Ll08;

    invoke-direct {p2, v0}, Lj3f;-><init>(Ll08;)V

    :cond_e
    iput-object p2, p0, Lm3f;->a:Lj3f;

    and-int/lit8 p1, p1, 0x2

    if-nez p1, :cond_1e

    new-instance p1, Lj3f;

    sget-object p2, Ll08;->a:Ll08;

    invoke-direct {p1, p2}, Lj3f;-><init>(Ll08;)V

    iput-object p1, p0, Lm3f;->b:Lj3f;

    return-void

    :cond_1e
    iput-object p3, p0, Lm3f;->b:Lj3f;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Lm3f;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Lm3f;

    iget-object v1, p0, Lm3f;->a:Lj3f;

    iget-object v3, p1, Lm3f;->a:Lj3f;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_17

    return v2

    :cond_17
    iget-object p0, p0, Lm3f;->b:Lj3f;

    iget-object p1, p1, Lm3f;->b:Lj3f;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_22

    return v2

    :cond_22
    return v0
.end method

.method public final hashCode()I
    .registers 2

    iget-object v0, p0, Lm3f;->a:Lj3f;

    iget-object v0, v0, Lj3f;->a:Ljava/util/List;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object p0, p0, Lm3f;->b:Lj3f;

    iget-object p0, p0, Lj3f;->a:Ljava/util/List;

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
