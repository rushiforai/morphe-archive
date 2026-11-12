.class public final Lsb2;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lh2j;
.end annotation


# static fields
.field public static final Companion:Lrb2;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final c:[Ll4c;


# instance fields
.field public final a:Ljava/util/List;

.field public final b:Lxb2;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    new-instance v0, Lrb2;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lsb2;->Companion:Lrb2;

    sget-object v0, Lxb2;->Companion:Lwb2;

    sget-object v0, Lf7c;->b:Lf7c;

    new-instance v1, Lvk1;

    const/16 v2, 0x12

    invoke-direct {v1, v2}, Lvk1;-><init>(B)V

    invoke-static {v0, v1}, Lz4c;->a(Lf7c;Lkotlin/jvm/functions/Function0;)Ll4c;

    move-result-object v0

    const/4 v1, 0x2

    new-array v1, v1, [Ll4c;

    const/4 v2, 0x0

    aput-object v0, v1, v2

    const/4 v0, 0x0

    const/4 v2, 0x1

    aput-object v0, v1, v2

    sput-object v1, Lsb2;->c:[Ll4c;

    return-void
.end method

.method public constructor <init>(ILjava/util/List;Lxb2;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    and-int/lit8 v0, p1, 0x1

    if-nez v0, :cond_9

    sget-object p2, Ll08;->a:Ll08;

    :cond_9
    iput-object p2, p0, Lsb2;->a:Ljava/util/List;

    and-int/lit8 p1, p1, 0x2

    if-nez p1, :cond_13

    const/4 p1, 0x0

    iput-object p1, p0, Lsb2;->b:Lxb2;

    return-void

    :cond_13
    iput-object p3, p0, Lsb2;->b:Lxb2;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Lsb2;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Lsb2;

    iget-object v1, p0, Lsb2;->a:Ljava/util/List;

    iget-object v3, p1, Lsb2;->a:Ljava/util/List;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_17

    return v2

    :cond_17
    iget-object p0, p0, Lsb2;->b:Lxb2;

    iget-object p1, p1, Lsb2;->b:Lxb2;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_22

    return v2

    :cond_22
    return v0
.end method

.method public final hashCode()I
    .registers 2

    iget-object v0, p0, Lsb2;->a:Ljava/util/List;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object p0, p0, Lsb2;->b:Lxb2;

    if-nez p0, :cond_e

    const/4 p0, 0x0

    goto :goto_12

    :cond_e
    invoke-virtual {p0}, Lxb2;->hashCode()I

    move-result p0

    :goto_12
    add-int/2addr v0, p0

    return v0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
