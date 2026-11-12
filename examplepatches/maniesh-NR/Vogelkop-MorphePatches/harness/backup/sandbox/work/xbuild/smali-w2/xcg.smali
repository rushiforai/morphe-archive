.class public final Lxcg;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lh2j;
.end annotation


# static fields
.field public static final Companion:Ltcg;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final e:[Ll4c;


# instance fields
.field public final a:Ljava/util/List;

.field public final b:Ljava/lang/String;

.field public final c:Ljava/util/List;

.field public final d:Lhff;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Ltcg;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lxcg;->Companion:Ltcg;

    sget-object v0, Lf7c;->b:Lf7c;

    new-instance v1, Lkof;

    const/16 v2, 0xc

    invoke-direct {v1, v2}, Lkof;-><init>(B)V

    invoke-static {v0, v1}, Lz4c;->a(Lf7c;Lkotlin/jvm/functions/Function0;)Ll4c;

    move-result-object v1

    new-instance v2, Lkof;

    const/16 v3, 0xd

    invoke-direct {v2, v3}, Lkof;-><init>(B)V

    invoke-static {v0, v2}, Lz4c;->a(Lf7c;Lkotlin/jvm/functions/Function0;)Ll4c;

    move-result-object v2

    new-instance v3, Lkof;

    const/16 v4, 0xe

    invoke-direct {v3, v4}, Lkof;-><init>(B)V

    invoke-static {v0, v3}, Lz4c;->a(Lf7c;Lkotlin/jvm/functions/Function0;)Ll4c;

    move-result-object v0

    const/4 v3, 0x4

    new-array v3, v3, [Ll4c;

    const/4 v4, 0x0

    aput-object v1, v3, v4

    const/4 v1, 0x0

    const/4 v4, 0x1

    aput-object v1, v3, v4

    const/4 v1, 0x2

    aput-object v2, v3, v1

    const/4 v1, 0x3

    aput-object v0, v3, v1

    sput-object v3, Lxcg;->e:[Ll4c;

    return-void
.end method

.method public constructor <init>(ILjava/util/List;Ljava/lang/String;Ljava/util/List;Lhff;)V
    .registers 9

    and-int/lit8 v0, p1, 0x8

    const/4 v1, 0x0

    const/16 v2, 0x8

    if-ne v2, v0, :cond_29

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    and-int/lit8 v0, p1, 0x1

    if-nez v0, :cond_10

    sget-object p2, Ll08;->a:Ll08;

    :cond_10
    iput-object p2, p0, Lxcg;->a:Ljava/util/List;

    and-int/lit8 p2, p1, 0x2

    if-nez p2, :cond_19

    iput-object v1, p0, Lxcg;->b:Ljava/lang/String;

    goto :goto_1b

    :cond_19
    iput-object p3, p0, Lxcg;->b:Ljava/lang/String;

    :goto_1b
    and-int/lit8 p1, p1, 0x4

    if-nez p1, :cond_24

    sget-object p1, Ll08;->a:Ll08;

    iput-object p1, p0, Lxcg;->c:Ljava/util/List;

    goto :goto_26

    :cond_24
    iput-object p4, p0, Lxcg;->c:Ljava/util/List;

    :goto_26
    iput-object p5, p0, Lxcg;->d:Lhff;

    return-void

    :cond_29
    sget-object p0, Lscg;->a:Lscg;

    invoke-virtual {p0}, Lscg;->getDescriptor()Lkotlinx/serialization/descriptors/SerialDescriptor;

    move-result-object p0

    invoke-static {p1, v2, p0}, Lx7d;->I(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    throw v1
.end method

.method public constructor <init>(Ljava/util/List;Ljava/lang/String;Ljava/util/ArrayList;Lhff;)V
    .registers 5

    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    iput-object p1, p0, Lxcg;->a:Ljava/util/List;

    .line 53
    iput-object p2, p0, Lxcg;->b:Ljava/lang/String;

    .line 54
    iput-object p3, p0, Lxcg;->c:Ljava/util/List;

    .line 55
    iput-object p4, p0, Lxcg;->d:Lhff;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Lxcg;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Lxcg;

    iget-object v1, p0, Lxcg;->a:Ljava/util/List;

    iget-object v3, p1, Lxcg;->a:Ljava/util/List;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_17

    return v2

    :cond_17
    iget-object v1, p0, Lxcg;->b:Ljava/lang/String;

    iget-object v3, p1, Lxcg;->b:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_22

    return v2

    :cond_22
    iget-object v1, p0, Lxcg;->c:Ljava/util/List;

    iget-object v3, p1, Lxcg;->c:Ljava/util/List;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2d

    return v2

    :cond_2d
    iget-object p0, p0, Lxcg;->d:Lhff;

    iget-object p1, p1, Lxcg;->d:Lhff;

    if-eq p0, p1, :cond_34

    return v2

    :cond_34
    return v0
.end method

.method public final hashCode()I
    .registers 4

    iget-object v0, p0, Lxcg;->a:Ljava/util/List;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-object v2, p0, Lxcg;->b:Ljava/lang/String;

    if-nez v2, :cond_f

    const/4 v2, 0x0

    goto :goto_13

    :cond_f
    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    :goto_13
    add-int/2addr v0, v2

    mul-int/2addr v0, v1

    iget-object v2, p0, Lxcg;->c:Ljava/util/List;

    invoke-static {v0, v1, v2}, Lrfp;->f(IILjava/util/List;)I

    move-result v0

    iget-object p0, p0, Lxcg;->d:Lhff;

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
