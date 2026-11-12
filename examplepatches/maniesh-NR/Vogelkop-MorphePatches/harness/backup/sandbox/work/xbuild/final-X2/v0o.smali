.class public final Lv0o;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lh2j;
.end annotation


# static fields
.field public static final Companion:Lu0o;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/lang/String;

.field public final c:Ljava/lang/String;

.field public final d:Ljava/lang/String;

.field public final e:Ljava/lang/Long;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lu0o;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lv0o;->Companion:Lu0o;

    return-void
.end method

.method public synthetic constructor <init>(ILjava/lang/Long;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 10

    and-int/lit8 v0, p1, 0xf

    const/4 v1, 0x0

    const/16 v2, 0xf

    if-ne v2, v0, :cond_1c

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p3, p0, Lv0o;->a:Ljava/lang/String;

    iput-object p4, p0, Lv0o;->b:Ljava/lang/String;

    iput-object p5, p0, Lv0o;->c:Ljava/lang/String;

    iput-object p6, p0, Lv0o;->d:Ljava/lang/String;

    and-int/lit8 p1, p1, 0x10

    if-nez p1, :cond_19

    iput-object v1, p0, Lv0o;->e:Ljava/lang/Long;

    return-void

    :cond_19
    iput-object p2, p0, Lv0o;->e:Ljava/lang/Long;

    return-void

    :cond_1c
    sget-object p0, Lt0o;->a:Lt0o;

    invoke-virtual {p0}, Lt0o;->getDescriptor()Lkotlinx/serialization/descriptors/SerialDescriptor;

    move-result-object p0

    invoke-static {p1, v2, p0}, Lx7d;->I(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    throw v1
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;)V
    .registers 6

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    iput-object p1, p0, Lv0o;->a:Ljava/lang/String;

    .line 40
    iput-object p2, p0, Lv0o;->b:Ljava/lang/String;

    .line 41
    iput-object p3, p0, Lv0o;->c:Ljava/lang/String;

    .line 42
    iput-object p4, p0, Lv0o;->d:Ljava/lang/String;

    .line 43
    iput-object p5, p0, Lv0o;->e:Ljava/lang/Long;

    return-void
.end method

.method public static a(Lv0o;Ljava/lang/Long;I)Lv0o;
    .registers 10

    and-int/lit8 v0, p2, 0x1

    if-eqz v0, :cond_8

    iget-object v0, p0, Lv0o;->a:Ljava/lang/String;

    :goto_6
    move-object v2, v0

    goto :goto_b

    :cond_8
    const-string v0, "ZZ"

    goto :goto_6

    :goto_b
    iget-object v3, p0, Lv0o;->b:Ljava/lang/String;

    iget-object v4, p0, Lv0o;->c:Ljava/lang/String;

    iget-object v5, p0, Lv0o;->d:Ljava/lang/String;

    and-int/lit8 p2, p2, 0x10

    if-eqz p2, :cond_17

    iget-object p1, p0, Lv0o;->e:Ljava/lang/Long;

    :cond_17
    move-object v6, p1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Lv0o;

    invoke-direct/range {v1 .. v6}, Lv0o;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;)V

    return-object v1
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Lv0o;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Lv0o;

    iget-object v1, p0, Lv0o;->a:Ljava/lang/String;

    iget-object v3, p1, Lv0o;->a:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_17

    return v2

    :cond_17
    iget-object v1, p0, Lv0o;->b:Ljava/lang/String;

    iget-object v3, p1, Lv0o;->b:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_22

    return v2

    :cond_22
    iget-object v1, p0, Lv0o;->c:Ljava/lang/String;

    iget-object v3, p1, Lv0o;->c:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2d

    return v2

    :cond_2d
    iget-object v1, p0, Lv0o;->d:Ljava/lang/String;

    iget-object v3, p1, Lv0o;->d:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_38

    return v2

    :cond_38
    iget-object p0, p0, Lv0o;->e:Ljava/lang/Long;

    iget-object p1, p1, Lv0o;->e:Ljava/lang/Long;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_43

    return v2

    :cond_43
    return v0
.end method

.method public final hashCode()I
    .registers 4

    iget-object v0, p0, Lv0o;->a:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-object v2, p0, Lv0o;->b:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lz1m;->f(IILjava/lang/String;)I

    move-result v0

    iget-object v2, p0, Lv0o;->c:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lz1m;->f(IILjava/lang/String;)I

    move-result v0

    iget-object v2, p0, Lv0o;->d:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lz1m;->f(IILjava/lang/String;)I

    move-result v0

    iget-object p0, p0, Lv0o;->e:Ljava/lang/Long;

    if-nez p0, :cond_21

    const/4 p0, 0x0

    goto :goto_25

    :cond_21
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    :goto_25
    add-int/2addr v0, p0

    return v0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
