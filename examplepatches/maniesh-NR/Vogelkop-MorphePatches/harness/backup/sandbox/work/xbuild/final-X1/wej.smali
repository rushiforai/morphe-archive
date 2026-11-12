.class public final Lwej;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lh2j;
.end annotation


# static fields
.field public static final Companion:Lvej;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final d:[Ll4c;


# instance fields
.field public final a:Ldfj;

.field public final b:Ljava/lang/String;

.field public final c:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    new-instance v0, Lvej;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lwej;->Companion:Lvej;

    sget-object v0, Lf7c;->b:Lf7c;

    new-instance v1, Lgzh;

    const/16 v2, 0x16

    invoke-direct {v1, v2}, Lgzh;-><init>(B)V

    invoke-static {v0, v1}, Lz4c;->a(Lf7c;Lkotlin/jvm/functions/Function0;)Ll4c;

    move-result-object v0

    const/4 v1, 0x3

    new-array v1, v1, [Ll4c;

    const/4 v2, 0x0

    aput-object v0, v1, v2

    const/4 v0, 0x1

    const/4 v2, 0x0

    aput-object v2, v1, v0

    const/4 v0, 0x2

    aput-object v2, v1, v0

    sput-object v1, Lwej;->d:[Ll4c;

    return-void
.end method

.method public synthetic constructor <init>(ILdfj;Ljava/lang/String;Ljava/lang/String;)V
    .registers 8

    and-int/lit8 v0, p1, 0x1

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-ne v2, v0, :cond_1e

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lwej;->a:Ldfj;

    and-int/lit8 p2, p1, 0x2

    if-nez p2, :cond_12

    iput-object v1, p0, Lwej;->b:Ljava/lang/String;

    goto :goto_14

    :cond_12
    iput-object p3, p0, Lwej;->b:Ljava/lang/String;

    :goto_14
    and-int/lit8 p1, p1, 0x4

    if-nez p1, :cond_1b

    iput-object v1, p0, Lwej;->c:Ljava/lang/String;

    return-void

    :cond_1b
    iput-object p4, p0, Lwej;->c:Ljava/lang/String;

    return-void

    :cond_1e
    sget-object p0, Luej;->a:Luej;

    invoke-virtual {p0}, Luej;->getDescriptor()Lkotlinx/serialization/descriptors/SerialDescriptor;

    move-result-object p0

    invoke-static {p1, v2, p0}, Lx7d;->I(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    throw v1
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Lwej;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Lwej;

    iget-object v1, p0, Lwej;->a:Ldfj;

    iget-object v3, p1, Lwej;->a:Ldfj;

    if-eq v1, v3, :cond_13

    return v2

    :cond_13
    iget-object v1, p0, Lwej;->b:Ljava/lang/String;

    iget-object v3, p1, Lwej;->b:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1e

    return v2

    :cond_1e
    iget-object p0, p0, Lwej;->c:Ljava/lang/String;

    iget-object p1, p1, Lwej;->c:Ljava/lang/String;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_29

    return v2

    :cond_29
    return v0
.end method

.method public final hashCode()I
    .registers 4

    iget-object v0, p0, Lwej;->a:Ldfj;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    const/4 v1, 0x0

    iget-object v2, p0, Lwej;->b:Ljava/lang/String;

    if-nez v2, :cond_f

    move v2, v1

    goto :goto_13

    :cond_f
    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    :goto_13
    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    iget-object p0, p0, Lwej;->c:Ljava/lang/String;

    if-eqz p0, :cond_1e

    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result v1

    :cond_1e
    add-int/2addr v0, v1

    return v0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
