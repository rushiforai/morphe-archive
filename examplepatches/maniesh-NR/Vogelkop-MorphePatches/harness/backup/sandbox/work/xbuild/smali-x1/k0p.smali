.class public final Lk0p;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lh2j;
.end annotation


# static fields
.field public static final Companion:Lh0p;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final d:[Lkotlinx/serialization/KSerializer;


# instance fields
.field public final a:Ljava/util/List;

.field public final b:Ljava/util/List;

.field public final c:Ljava/util/List;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Lh0p;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lk0p;->Companion:Lh0p;

    new-instance v0, Lk72;

    sget-object v1, Lm0p;->a:Lm0p;

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lk72;-><init>(Lkotlinx/serialization/KSerializer;B)V

    new-instance v1, Lk72;

    sget-object v3, Lxhk;->a:Lxhk;

    invoke-direct {v1, v3, v2}, Lk72;-><init>(Lkotlinx/serialization/KSerializer;B)V

    new-instance v3, Lk72;

    sget-object v4, Lecb;->a:Lecb;

    invoke-direct {v3, v4, v2}, Lk72;-><init>(Lkotlinx/serialization/KSerializer;B)V

    const/4 v4, 0x3

    new-array v4, v4, [Lkotlinx/serialization/KSerializer;

    aput-object v0, v4, v2

    const/4 v0, 0x1

    aput-object v1, v4, v0

    const/4 v0, 0x2

    aput-object v3, v4, v0

    sput-object v4, Lk0p;->d:[Lkotlinx/serialization/KSerializer;

    return-void
.end method

.method public constructor <init>(ILjava/util/List;Ljava/util/List;Ljava/util/List;)V
    .registers 7

    and-int/lit8 v0, p1, 0x7

    const/4 v1, 0x7

    if-ne v1, v0, :cond_1f

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lk0p;->a:Ljava/util/List;

    iput-object p3, p0, Lk0p;->b:Ljava/util/List;

    iput-object p4, p0, Lk0p;->c:Ljava/util/List;

    invoke-interface {p2}, Ljava/util/Collection;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_18

    invoke-interface {p4}, Ljava/util/Collection;->isEmpty()Z

    return-void

    :cond_18
    const-string p0, "Failed requirement."

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    const/4 p0, 0x0

    throw p0

    :cond_1f
    sget-object p0, Lg0p;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    invoke-static {p1, v1, p0}, Lx7d;->I(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    const/4 p0, 0x0

    throw p0
.end method

.method public constructor <init>(Ljava/util/List;Ljava/util/List;Ljava/util/List;)V
    .registers 4

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lk0p;->a:Ljava/util/List;

    iput-object p2, p0, Lk0p;->b:Ljava/util/List;

    iput-object p3, p0, Lk0p;->c:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/Collection;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_13

    invoke-interface {p3}, Ljava/util/Collection;->isEmpty()Z

    return-void

    :cond_13
    const-string p0, "Failed requirement."

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

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
    instance-of v1, p1, Lk0p;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Lk0p;

    iget-object v1, p0, Lk0p;->a:Ljava/util/List;

    iget-object v3, p1, Lk0p;->a:Ljava/util/List;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_17

    return v2

    :cond_17
    iget-object v1, p0, Lk0p;->b:Ljava/util/List;

    iget-object v3, p1, Lk0p;->b:Ljava/util/List;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_22

    return v2

    :cond_22
    iget-object p0, p0, Lk0p;->c:Ljava/util/List;

    iget-object p1, p1, Lk0p;->c:Ljava/util/List;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_2d

    return v2

    :cond_2d
    return v0
.end method

.method public final hashCode()I
    .registers 4

    iget-object v0, p0, Lk0p;->a:Ljava/util/List;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-object v2, p0, Lk0p;->b:Ljava/util/List;

    invoke-static {v0, v1, v2}, Lrfp;->f(IILjava/util/List;)I

    move-result v0

    iget-object p0, p0, Lk0p;->c:Ljava/util/List;

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 3

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Banner(format="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lk0p;->a:Ljava/util/List;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", mimes="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lk0p;->b:Ljava/util/List;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", api="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p0, p0, Lk0p;->c:Ljava/util/List;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const/16 p0, 0x29

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
