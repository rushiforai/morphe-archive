.class public final Ljf;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final g:B


# instance fields
.field public final a:Lkotlin/jvm/functions/Function2;

.field public final b:Lkotlin/jvm/functions/Function2;

.field public final c:Lxc;

.field public final d:Z

.field public final e:Lpc;

.field public final f:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    sget-object v0, Lxc;->g:Lxc;

    const/16 v0, 0x8

    sput-byte v0, Ljf;->g:B

    return-void
.end method

.method public constructor <init>(Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lxc;ZLpc;Z)V
    .registers 7

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    iput-object p1, p0, Ljf;->a:Lkotlin/jvm/functions/Function2;

    .line 31
    iput-object p2, p0, Ljf;->b:Lkotlin/jvm/functions/Function2;

    .line 32
    iput-object p3, p0, Ljf;->c:Lxc;

    .line 33
    iput-boolean p4, p0, Ljf;->d:Z

    .line 34
    iput-object p5, p0, Ljf;->e:Lpc;

    .line 35
    iput-boolean p6, p0, Ljf;->f:Z

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;ZZI)V
    .registers 13

    and-int/lit8 v0, p5, 0x2

    if-eqz v0, :cond_5

    const/4 p2, 0x0

    :cond_5
    move-object v2, p2

    and-int/lit8 p2, p5, 0x8

    const/4 v0, 0x1

    if-eqz p2, :cond_d

    move v4, v0

    goto :goto_e

    :cond_d
    move v4, p3

    :goto_e
    and-int/lit8 p5, p5, 0x20

    if-eqz p5, :cond_14

    move v6, v0

    goto :goto_15

    :cond_14
    move v6, p4

    :goto_15
    const/4 v3, 0x0

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    invoke-direct/range {v0 .. v6}, Ljf;-><init>(Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lxc;ZLpc;Z)V

    return-void
.end method

.method public static a(Ljf;Lg9;Lxc;Lpc;ZI)Ljf;
    .registers 13

    and-int/lit8 v0, p5, 0x1

    if-eqz v0, :cond_6

    iget-object p1, p0, Ljf;->a:Lkotlin/jvm/functions/Function2;

    :cond_6
    move-object v1, p1

    iget-object v2, p0, Ljf;->b:Lkotlin/jvm/functions/Function2;

    and-int/lit8 p1, p5, 0x4

    if-eqz p1, :cond_f

    iget-object p2, p0, Ljf;->c:Lxc;

    :cond_f
    move-object v3, p2

    iget-boolean v4, p0, Ljf;->d:Z

    and-int/lit8 p1, p5, 0x10

    if-eqz p1, :cond_18

    iget-object p3, p0, Ljf;->e:Lpc;

    :cond_18
    move-object v5, p3

    and-int/lit8 p5, p5, 0x20

    if-eqz p5, :cond_1f

    iget-boolean p4, p0, Ljf;->f:Z

    :cond_1f
    move v6, p4

    new-instance v0, Ljf;

    invoke-direct/range {v0 .. v6}, Ljf;-><init>(Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lxc;ZLpc;Z)V

    return-object v0
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Ljf;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Ljf;

    iget-object v1, p0, Ljf;->a:Lkotlin/jvm/functions/Function2;

    iget-object v3, p1, Ljf;->a:Lkotlin/jvm/functions/Function2;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_17

    return v2

    :cond_17
    iget-object v1, p0, Ljf;->b:Lkotlin/jvm/functions/Function2;

    iget-object v3, p1, Ljf;->b:Lkotlin/jvm/functions/Function2;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_22

    return v2

    :cond_22
    iget-object v1, p0, Ljf;->c:Lxc;

    iget-object v3, p1, Ljf;->c:Lxc;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2d

    return v2

    :cond_2d
    iget-boolean v1, p0, Ljf;->d:Z

    iget-boolean v3, p1, Ljf;->d:Z

    if-eq v1, v3, :cond_34

    return v2

    :cond_34
    iget-object v1, p0, Ljf;->e:Lpc;

    iget-object v3, p1, Ljf;->e:Lpc;

    if-eq v1, v3, :cond_3b

    return v2

    :cond_3b
    iget-boolean p0, p0, Ljf;->f:Z

    iget-boolean p1, p1, Ljf;->f:Z

    if-eq p0, p1, :cond_42

    return v2

    :cond_42
    return v0
.end method

.method public final hashCode()I
    .registers 5

    iget-object v0, p0, Ljf;->a:Lkotlin/jvm/functions/Function2;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    const/4 v2, 0x0

    iget-object v3, p0, Ljf;->b:Lkotlin/jvm/functions/Function2;

    if-nez v3, :cond_10

    move v3, v2

    goto :goto_14

    :cond_10
    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    move-result v3

    :goto_14
    add-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget-object v3, p0, Ljf;->c:Lxc;

    if-nez v3, :cond_1c

    move v3, v2

    goto :goto_20

    :cond_1c
    invoke-virtual {v3}, Lxc;->hashCode()I

    move-result v3

    :goto_20
    add-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget-boolean v3, p0, Ljf;->d:Z

    invoke-static {v0, v1, v3}, Lfki;->k(IIZ)I

    move-result v0

    iget-object v3, p0, Ljf;->e:Lpc;

    if-eqz v3, :cond_30

    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    move-result v2

    :cond_30
    add-int/2addr v0, v2

    mul-int/2addr v0, v1

    iget-boolean p0, p0, Ljf;->f:Z

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
