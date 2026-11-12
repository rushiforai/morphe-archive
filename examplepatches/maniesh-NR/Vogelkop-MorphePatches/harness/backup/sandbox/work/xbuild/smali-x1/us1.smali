.class public final Lus1;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final e:Lus1;


# instance fields
.field public final a:Ljava/util/List;

.field public final b:Lqs1;

.field public final c:Z

.field public final d:Z


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lus1;

    sget-object v1, Ll08;->a:Ll08;

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-direct {v0, v1, v2, v3, v3}, Lus1;-><init>(Ljava/util/List;Lqs1;ZZ)V

    sput-object v0, Lus1;->e:Lus1;

    return-void
.end method

.method public constructor <init>(Ljava/util/List;Lqs1;ZZ)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lus1;->a:Ljava/util/List;

    iput-object p2, p0, Lus1;->b:Lqs1;

    iput-boolean p3, p0, Lus1;->c:Z

    iput-boolean p4, p0, Lus1;->d:Z

    return-void
.end method

.method public static a(Lus1;Ljava/util/ArrayList;Lqs1;ZZI)Lus1;
    .registers 7

    and-int/lit8 v0, p5, 0x1

    if-eqz v0, :cond_6

    iget-object p1, p0, Lus1;->a:Ljava/util/List;

    :cond_6
    and-int/lit8 v0, p5, 0x2

    if-eqz v0, :cond_c

    iget-object p2, p0, Lus1;->b:Lqs1;

    :cond_c
    and-int/lit8 v0, p5, 0x4

    if-eqz v0, :cond_12

    iget-boolean p3, p0, Lus1;->c:Z

    :cond_12
    and-int/lit8 p5, p5, 0x8

    if-eqz p5, :cond_18

    iget-boolean p4, p0, Lus1;->d:Z

    :cond_18
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p0, Lus1;

    invoke-direct {p0, p1, p2, p3, p4}, Lus1;-><init>(Ljava/util/List;Lqs1;ZZ)V

    return-object p0
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_2a

    instance-of v0, p1, Lus1;

    if-eqz v0, :cond_28

    check-cast p1, Lus1;

    iget-object v0, p0, Lus1;->a:Ljava/util/List;

    iget-object v1, p1, Lus1;->a:Ljava/util/List;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_28

    iget-object v0, p0, Lus1;->b:Lqs1;

    iget-object v1, p1, Lus1;->b:Lqs1;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_28

    iget-boolean v0, p0, Lus1;->c:Z

    iget-boolean v1, p1, Lus1;->c:Z

    if-ne v0, v1, :cond_28

    iget-boolean p0, p0, Lus1;->d:Z

    iget-boolean p1, p1, Lus1;->d:Z

    if-eq p0, p1, :cond_2a

    :cond_28
    const/4 p0, 0x0

    return p0

    :cond_2a
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 4

    iget-object v0, p0, Lus1;->a:Ljava/util/List;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-object v2, p0, Lus1;->b:Lqs1;

    if-nez v2, :cond_f

    const/4 v2, 0x0

    goto :goto_13

    :cond_f
    invoke-virtual {v2}, Lqs1;->hashCode()I

    move-result v2

    :goto_13
    add-int/2addr v0, v2

    mul-int/2addr v0, v1

    iget-boolean v2, p0, Lus1;->c:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget-boolean p0, p0, Lus1;->d:Z

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
