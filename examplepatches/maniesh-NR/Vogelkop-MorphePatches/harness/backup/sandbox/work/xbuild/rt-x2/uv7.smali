.class public final Luv7;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Z

.field public final b:Llbf;

.field public final c:Lvv7;

.field public final d:Lyl2;

.field public final e:Lpvb;


# direct methods
.method public constructor <init>(ZLlbf;Lvv7;Lyl2;Lpvb;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Luv7;->a:Z

    iput-object p2, p0, Luv7;->b:Llbf;

    iput-object p3, p0, Luv7;->c:Lvv7;

    iput-object p4, p0, Luv7;->d:Lyl2;

    iput-object p5, p0, Luv7;->e:Lpvb;

    return-void
.end method

.method public static a(Luv7;ZLlbf;Lvv7;Lyl2;Lpvb;I)Luv7;
    .registers 13

    and-int/lit8 v0, p6, 0x1

    if-eqz v0, :cond_6

    iget-boolean p1, p0, Luv7;->a:Z

    :cond_6
    move v1, p1

    and-int/lit8 p1, p6, 0x2

    if-eqz p1, :cond_d

    iget-object p2, p0, Luv7;->b:Llbf;

    :cond_d
    move-object v2, p2

    and-int/lit8 p1, p6, 0x4

    if-eqz p1, :cond_14

    iget-object p3, p0, Luv7;->c:Lvv7;

    :cond_14
    move-object v3, p3

    and-int/lit8 p1, p6, 0x8

    if-eqz p1, :cond_1b

    iget-object p4, p0, Luv7;->d:Lyl2;

    :cond_1b
    move-object v4, p4

    and-int/lit8 p6, p6, 0x10

    if-eqz p6, :cond_22

    iget-object p5, p0, Luv7;->e:Lpvb;

    :cond_22
    move-object v5, p5

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Luv7;

    invoke-direct/range {v0 .. v5}, Luv7;-><init>(ZLlbf;Lvv7;Lyl2;Lpvb;)V

    return-object v0
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_30

    instance-of v0, p1, Luv7;

    if-eqz v0, :cond_2e

    check-cast p1, Luv7;

    iget-boolean v0, p0, Luv7;->a:Z

    iget-boolean v1, p1, Luv7;->a:Z

    if-ne v0, v1, :cond_2e

    iget-object v0, p0, Luv7;->b:Llbf;

    iget-object v1, p1, Luv7;->b:Llbf;

    if-ne v0, v1, :cond_2e

    iget-object v0, p0, Luv7;->c:Lvv7;

    iget-object v1, p1, Luv7;->c:Lvv7;

    if-ne v0, v1, :cond_2e

    iget-object v0, p0, Luv7;->d:Lyl2;

    iget-object v1, p1, Luv7;->d:Lyl2;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2e

    iget-object p0, p0, Luv7;->e:Lpvb;

    iget-object p1, p1, Luv7;->e:Lpvb;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_30

    :cond_2e
    const/4 p0, 0x0

    return p0

    :cond_30
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 4

    iget-boolean v0, p0, Luv7;->a:Z

    invoke-static {v0}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Luv7;->b:Llbf;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object v0, p0, Luv7;->c:Lvv7;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    const/4 v1, 0x0

    iget-object v2, p0, Luv7;->d:Lyl2;

    if-nez v2, :cond_21

    move v2, v1

    goto :goto_25

    :cond_21
    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    :goto_25
    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    iget-object p0, p0, Luv7;->e:Lpvb;

    if-eqz p0, :cond_30

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v1

    :cond_30
    add-int/2addr v0, v1

    return v0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
