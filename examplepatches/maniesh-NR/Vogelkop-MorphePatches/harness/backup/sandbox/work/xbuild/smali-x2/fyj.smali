.class public final Lfyj;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ldyj;

.field public final b:B

.field public final c:Ljxj;

.field public final d:Z

.field public final e:Z


# direct methods
.method public constructor <init>(Ldyj;ILjxj;ZI)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lfyj;->a:Ldyj;

    iput-byte p2, p0, Lfyj;->b:B

    iput-object p3, p0, Lfyj;->c:Ljxj;

    iput-boolean p4, p0, Lfyj;->d:Z

    iput-boolean p5, p0, Lfyj;->e:Z

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_2c

    instance-of v0, p1, Lfyj;

    if-eqz v0, :cond_2a

    check-cast p1, Lfyj;

    iget-object v0, p0, Lfyj;->a:Ldyj;

    iget-object v1, p1, Lfyj;->a:Ldyj;

    if-ne v0, v1, :cond_2a

    iget-byte v0, p0, Lfyj;->b:B

    iget-byte v1, p1, Lfyj;->b:B

    if-ne v0, v1, :cond_2a

    iget-object v0, p0, Lfyj;->c:Ljxj;

    iget-object v1, p1, Lfyj;->c:Ljxj;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2a

    iget-boolean v0, p0, Lfyj;->d:Z

    iget-boolean v1, p1, Lfyj;->d:Z

    if-ne v0, v1, :cond_2a

    iget-boolean p0, p0, Lfyj;->e:Z

    iget-boolean p1, p1, Lfyj;->e:Z

    if-eq p0, p1, :cond_2c

    :cond_2a
    const/4 p0, 0x0

    return p0

    :cond_2c
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 4

    iget-object v0, p0, Lfyj;->a:Ldyj;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-byte v2, p0, Lfyj;->b:B

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget-object v2, p0, Lfyj;->c:Ljxj;

    if-nez v2, :cond_15

    const/4 v2, 0x0

    goto :goto_19

    :cond_15
    invoke-virtual {v2}, Ljxj;->hashCode()I

    move-result v2

    :goto_19
    add-int/2addr v0, v2

    mul-int/2addr v0, v1

    iget-boolean v2, p0, Lfyj;->d:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget-boolean p0, p0, Lfyj;->e:Z

    invoke-static {p0}, Ljava/lang/Integer;->hashCode(I)I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
