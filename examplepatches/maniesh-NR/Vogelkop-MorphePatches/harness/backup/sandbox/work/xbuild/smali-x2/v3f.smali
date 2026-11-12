.class public final Lv3f;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lh2j;
.end annotation


# static fields
.field public static final Companion:Lu3f;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final f:[Ll4c;


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Lswh;

.field public final c:J

.field public final d:J

.field public final e:Lm3f;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lu3f;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lv3f;->Companion:Lu3f;

    sget-object v0, Lf7c;->b:Lf7c;

    new-instance v1, Lvme;

    const/16 v2, 0x10

    invoke-direct {v1, v2}, Lvme;-><init>(B)V

    invoke-static {v0, v1}, Lz4c;->a(Lf7c;Lkotlin/jvm/functions/Function0;)Ll4c;

    move-result-object v0

    const/4 v1, 0x5

    new-array v1, v1, [Ll4c;

    const/4 v2, 0x0

    const/4 v3, 0x0

    aput-object v3, v1, v2

    const/4 v2, 0x1

    aput-object v0, v1, v2

    const/4 v0, 0x2

    aput-object v3, v1, v0

    const/4 v0, 0x3

    aput-object v3, v1, v0

    const/4 v0, 0x4

    aput-object v3, v1, v0

    sput-object v1, Lv3f;->f:[Ll4c;

    return-void
.end method

.method public synthetic constructor <init>(ILjava/lang/String;Lswh;JJLm3f;)V
    .registers 11

    and-int/lit8 v0, p1, 0x1f

    const/16 v1, 0x1f

    if-ne v1, v0, :cond_14

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lv3f;->a:Ljava/lang/String;

    iput-object p3, p0, Lv3f;->b:Lswh;

    iput-wide p4, p0, Lv3f;->c:J

    iput-wide p6, p0, Lv3f;->d:J

    iput-object p8, p0, Lv3f;->e:Lm3f;

    return-void

    :cond_14
    sget-object p0, Lt3f;->a:Lt3f;

    invoke-virtual {p0}, Lt3f;->getDescriptor()Lkotlinx/serialization/descriptors/SerialDescriptor;

    move-result-object p0

    invoke-static {p1, v1, p0}, Lx7d;->I(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    const/4 p0, 0x0

    throw p0
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 9

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Lv3f;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Lv3f;

    iget-object v1, p0, Lv3f;->a:Ljava/lang/String;

    iget-object v3, p1, Lv3f;->a:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_17

    return v2

    :cond_17
    iget-object v1, p0, Lv3f;->b:Lswh;

    iget-object v3, p1, Lv3f;->b:Lswh;

    if-eq v1, v3, :cond_1e

    return v2

    :cond_1e
    iget-wide v3, p0, Lv3f;->c:J

    iget-wide v5, p1, Lv3f;->c:J

    cmp-long v1, v3, v5

    if-eqz v1, :cond_27

    return v2

    :cond_27
    iget-wide v3, p0, Lv3f;->d:J

    iget-wide v5, p1, Lv3f;->d:J

    cmp-long v1, v3, v5

    if-eqz v1, :cond_30

    return v2

    :cond_30
    iget-object p0, p0, Lv3f;->e:Lm3f;

    iget-object p1, p1, Lv3f;->e:Lm3f;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_3b

    return v2

    :cond_3b
    return v0
.end method

.method public final hashCode()I
    .registers 6

    iget-object v0, p0, Lv3f;->a:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-object v2, p0, Lv3f;->b:Lswh;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    add-int/2addr v2, v0

    mul-int/2addr v2, v1

    iget-wide v3, p0, Lv3f;->c:J

    invoke-static {v2, v1, v3, v4}, Lz1m;->e(IIJ)I

    move-result v0

    iget-wide v2, p0, Lv3f;->d:J

    invoke-static {v0, v1, v2, v3}, Lz1m;->e(IIJ)I

    move-result v0

    iget-object p0, p0, Lv3f;->e:Lm3f;

    invoke-virtual {p0}, Lm3f;->hashCode()I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
