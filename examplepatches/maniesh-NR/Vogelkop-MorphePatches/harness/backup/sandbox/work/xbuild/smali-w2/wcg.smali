.class public final Lwcg;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lh2j;
.end annotation


# static fields
.field public static final Companion:Lvcg;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Z

.field public final c:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lvcg;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lwcg;->Companion:Lvcg;

    return-void
.end method

.method public synthetic constructor <init>(ILjava/lang/String;ZZ)V
    .registers 7

    and-int/lit8 v0, p1, 0x7

    const/4 v1, 0x7

    if-ne v1, v0, :cond_f

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lwcg;->a:Ljava/lang/String;

    iput-boolean p3, p0, Lwcg;->b:Z

    iput-boolean p4, p0, Lwcg;->c:Z

    return-void

    :cond_f
    sget-object p0, Lucg;->a:Lucg;

    invoke-virtual {p0}, Lucg;->getDescriptor()Lkotlinx/serialization/descriptors/SerialDescriptor;

    move-result-object p0

    invoke-static {p1, v1, p0}, Lx7d;->I(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    const/4 p0, 0x0

    throw p0
.end method

.method public constructor <init>(Ljava/lang/String;ZZ)V
    .registers 4

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    iput-object p1, p0, Lwcg;->a:Ljava/lang/String;

    .line 28
    iput-boolean p2, p0, Lwcg;->b:Z

    .line 29
    iput-boolean p3, p0, Lwcg;->c:Z

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Lwcg;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Lwcg;

    iget-object v1, p0, Lwcg;->a:Ljava/lang/String;

    iget-object v3, p1, Lwcg;->a:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_17

    return v2

    :cond_17
    iget-boolean v1, p0, Lwcg;->b:Z

    iget-boolean v3, p1, Lwcg;->b:Z

    if-eq v1, v3, :cond_1e

    return v2

    :cond_1e
    iget-boolean p0, p0, Lwcg;->c:Z

    iget-boolean p1, p1, Lwcg;->c:Z

    if-eq p0, p1, :cond_25

    return v2

    :cond_25
    return v0
.end method

.method public final hashCode()I
    .registers 4

    iget-object v0, p0, Lwcg;->a:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-boolean v2, p0, Lwcg;->b:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget-boolean p0, p0, Lwcg;->c:Z

    invoke-static {p0}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
