.class public final Lq85;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Z

.field public final b:Leri;

.field public final c:Lo24;

.field public final d:Lo24;

.field public final e:Lzm8;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    sget-byte v0, Ljf;->g:B

    return-void
.end method

.method public constructor <init>(ZLeri;Lo24;Lo24;Lzm8;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Lq85;->a:Z

    iput-object p2, p0, Lq85;->b:Leri;

    iput-object p3, p0, Lq85;->c:Lo24;

    iput-object p4, p0, Lq85;->d:Lo24;

    iput-object p5, p0, Lq85;->e:Lzm8;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_38

    instance-of v0, p1, Lq85;

    if-eqz v0, :cond_36

    check-cast p1, Lq85;

    iget-boolean v0, p0, Lq85;->a:Z

    iget-boolean v1, p1, Lq85;->a:Z

    if-ne v0, v1, :cond_36

    iget-object v0, p0, Lq85;->b:Leri;

    iget-object v1, p1, Lq85;->b:Leri;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_36

    iget-object v0, p0, Lq85;->c:Lo24;

    iget-object v1, p1, Lq85;->c:Lo24;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_36

    iget-object v0, p0, Lq85;->d:Lo24;

    iget-object v1, p1, Lq85;->d:Lo24;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_36

    iget-object p0, p0, Lq85;->e:Lzm8;

    iget-object p1, p1, Lq85;->e:Lzm8;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_38

    :cond_36
    const/4 p0, 0x0

    return p0

    :cond_38
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 4

    iget-boolean v0, p0, Lq85;->a:Z

    invoke-static {v0}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lq85;->b:Leri;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    const/4 v0, 0x0

    iget-object v2, p0, Lq85;->c:Lo24;

    if-nez v2, :cond_18

    move v2, v0

    goto :goto_1c

    :cond_18
    invoke-virtual {v2}, Lo24;->hashCode()I

    move-result v2

    :goto_1c
    add-int/2addr v1, v2

    mul-int/lit8 v1, v1, 0x1f

    iget-object v2, p0, Lq85;->d:Lo24;

    if-nez v2, :cond_25

    move v2, v0

    goto :goto_29

    :cond_25
    invoke-virtual {v2}, Lo24;->hashCode()I

    move-result v2

    :goto_29
    add-int/2addr v1, v2

    mul-int/lit8 v1, v1, 0x1f

    iget-object p0, p0, Lq85;->e:Lzm8;

    if-eqz p0, :cond_34

    invoke-virtual {p0}, Lzm8;->hashCode()I

    move-result v0

    :cond_34
    add-int/2addr v1, v0

    return v1
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
