.class public final Lak;
.super Lc09;
.source "SourceFile"


# instance fields
.field public final W:Ljava/lang/String;

.field public final X:Lpxh;

.field public final Y:Lpxh;

.field public final Z:Landroid/net/Uri;

.field public final a0:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;Lpxh;Lpxh;Landroid/net/Uri;Z)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lak;->W:Ljava/lang/String;

    iput-object p2, p0, Lak;->X:Lpxh;

    iput-object p3, p0, Lak;->Y:Lpxh;

    iput-object p4, p0, Lak;->Z:Landroid/net/Uri;

    iput-boolean p5, p0, Lak;->a0:Z

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_38

    instance-of v0, p1, Lak;

    if-eqz v0, :cond_36

    check-cast p1, Lak;

    iget-object v0, p0, Lak;->W:Ljava/lang/String;

    iget-object v1, p1, Lak;->W:Ljava/lang/String;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_36

    iget-object v0, p0, Lak;->X:Lpxh;

    iget-object v1, p1, Lak;->X:Lpxh;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_36

    iget-object v0, p0, Lak;->Y:Lpxh;

    iget-object v1, p1, Lak;->Y:Lpxh;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_36

    iget-object v0, p0, Lak;->Z:Landroid/net/Uri;

    iget-object v1, p1, Lak;->Z:Landroid/net/Uri;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_36

    iget-boolean p0, p0, Lak;->a0:Z

    iget-boolean p1, p1, Lak;->a0:Z

    if-eq p0, p1, :cond_38

    :cond_36
    const/4 p0, 0x0

    return p0

    :cond_38
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 3

    iget-object v0, p0, Lak;->W:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lak;->X:Lpxh;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object v0, p0, Lak;->Y:Lpxh;

    if-nez v0, :cond_17

    const/4 v0, 0x0

    goto :goto_1b

    :cond_17
    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    :goto_1b
    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object v0, p0, Lak;->Z:Landroid/net/Uri;

    invoke-virtual {v0}, Landroid/net/Uri;->hashCode()I

    move-result v0

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-boolean p0, p0, Lak;->a0:Z

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
