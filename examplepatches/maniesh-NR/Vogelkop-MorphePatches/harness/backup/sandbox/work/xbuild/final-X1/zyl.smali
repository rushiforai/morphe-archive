.class public final Lzyl;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lh2j;
.end annotation


# static fields
.field public static final Companion:Lyyl;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final c:[Ll4c;


# instance fields
.field public final a:Lld8;

.field public final b:Ljava/util/List;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lyyl;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lzyl;->Companion:Lyyl;

    sget-object v0, Lf7c;->b:Lf7c;

    new-instance v1, Lthk;

    const/16 v2, 0x16

    invoke-direct {v1, v2}, Lthk;-><init>(B)V

    invoke-static {v0, v1}, Lz4c;->a(Lf7c;Lkotlin/jvm/functions/Function0;)Ll4c;

    move-result-object v1

    new-instance v2, Lthk;

    const/16 v3, 0x17

    invoke-direct {v2, v3}, Lthk;-><init>(B)V

    invoke-static {v0, v2}, Lz4c;->a(Lf7c;Lkotlin/jvm/functions/Function0;)Ll4c;

    move-result-object v0

    const/4 v2, 0x2

    new-array v2, v2, [Ll4c;

    const/4 v3, 0x0

    aput-object v1, v2, v3

    const/4 v1, 0x1

    aput-object v0, v2, v1

    sput-object v2, Lzyl;->c:[Ll4c;

    return-void
.end method

.method public synthetic constructor <init>(ILld8;Ljava/util/List;)V
    .registers 6

    and-int/lit8 v0, p1, 0x3

    const/4 v1, 0x3

    if-ne v1, v0, :cond_d

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lzyl;->a:Lld8;

    iput-object p3, p0, Lzyl;->b:Ljava/util/List;

    return-void

    :cond_d
    sget-object p0, Lxyl;->a:Lxyl;

    invoke-virtual {p0}, Lxyl;->getDescriptor()Lkotlinx/serialization/descriptors/SerialDescriptor;

    move-result-object p0

    invoke-static {p1, v1, p0}, Lx7d;->I(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    const/4 p0, 0x0

    throw p0
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Lzyl;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Lzyl;

    iget-object v1, p0, Lzyl;->a:Lld8;

    iget-object v3, p1, Lzyl;->a:Lld8;

    if-eq v1, v3, :cond_13

    return v2

    :cond_13
    iget-object p0, p0, Lzyl;->b:Ljava/util/List;

    iget-object p1, p1, Lzyl;->b:Ljava/util/List;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1e

    return v2

    :cond_1e
    return v0
.end method

.method public final hashCode()I
    .registers 2

    iget-object v0, p0, Lzyl;->a:Lld8;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object p0, p0, Lzyl;->b:Ljava/util/List;

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
