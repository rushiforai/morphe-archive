.class public final Lfdk;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lh2j;
.end annotation


# static fields
.field public static final Companion:Ledk;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# instance fields
.field public final a:Lv3f;

.field public final b:Lebb;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Ledk;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lfdk;->Companion:Ledk;

    return-void
.end method

.method public synthetic constructor <init>(ILv3f;Lebb;)V
    .registers 6

    and-int/lit8 v0, p1, 0x3

    const/4 v1, 0x3

    if-ne v1, v0, :cond_d

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lfdk;->a:Lv3f;

    iput-object p3, p0, Lfdk;->b:Lebb;

    return-void

    :cond_d
    sget-object p0, Lddk;->a:Lddk;

    invoke-virtual {p0}, Lddk;->getDescriptor()Lkotlinx/serialization/descriptors/SerialDescriptor;

    move-result-object p0

    invoke-static {p1, v1, p0}, Lx7d;->I(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    const/4 p0, 0x0

    throw p0
.end method

.method public constructor <init>(Lv3f;Lebb;)V
    .registers 3

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    iput-object p1, p0, Lfdk;->a:Lv3f;

    .line 26
    iput-object p2, p0, Lfdk;->b:Lebb;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Lfdk;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Lfdk;

    iget-object v1, p0, Lfdk;->a:Lv3f;

    iget-object v3, p1, Lfdk;->a:Lv3f;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_17

    return v2

    :cond_17
    iget-object p0, p0, Lfdk;->b:Lebb;

    iget-object p1, p1, Lfdk;->b:Lebb;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_22

    return v2

    :cond_22
    return v0
.end method

.method public final hashCode()I
    .registers 3

    const/4 v0, 0x0

    iget-object v1, p0, Lfdk;->a:Lv3f;

    if-nez v1, :cond_7

    move v1, v0

    goto :goto_b

    :cond_7
    invoke-virtual {v1}, Lv3f;->hashCode()I

    move-result v1

    :goto_b
    mul-int/lit8 v1, v1, 0x1f

    iget-object p0, p0, Lfdk;->b:Lebb;

    if-eqz p0, :cond_15

    invoke-virtual {p0}, Lebb;->hashCode()I

    move-result v0

    :cond_15
    add-int/2addr v1, v0

    return v1
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
