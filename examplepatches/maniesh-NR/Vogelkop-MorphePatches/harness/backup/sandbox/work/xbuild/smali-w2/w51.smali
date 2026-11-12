.class public final Lw51;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Ln27;

.field public final c:J

.field public final d:Lzvf;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ln27;JLzvf;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lw51;->a:Landroid/content/Context;

    iput-object p2, p0, Lw51;->b:Ln27;

    iput-wide p3, p0, Lw51;->c:J

    iput-object p5, p0, Lw51;->d:Lzvf;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    if-eq p0, p1, :cond_40

    if-eqz p1, :cond_9

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    goto :goto_a

    :cond_9
    const/4 v0, 0x0

    :goto_a
    const-class v1, Lw51;

    invoke-virtual {v1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3e

    check-cast p1, Lw51;

    iget-object v0, p0, Lw51;->a:Landroid/content/Context;

    iget-object v1, p1, Lw51;->a:Landroid/content/Context;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3e

    iget-object v0, p0, Lw51;->b:Ln27;

    iget-object v1, p1, Lw51;->b:Ln27;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3e

    iget-wide v0, p1, Lw51;->c:J

    sget v2, Lu95;->h:I

    iget-wide v2, p0, Lw51;->c:J

    invoke-static {v2, v3, v0, v1}, Ljgm;->a(JJ)Z

    move-result v0

    if-eqz v0, :cond_3e

    iget-object p0, p0, Lw51;->d:Lzvf;

    iget-object p1, p1, Lw51;->d:Lzvf;

    invoke-virtual {p0, p1}, Lzvf;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_40

    :cond_3e
    const/4 p0, 0x0

    return p0

    :cond_40
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 6

    iget-object v0, p0, Lw51;->a:Landroid/content/Context;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-object v2, p0, Lw51;->b:Ln27;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    add-int/2addr v2, v0

    mul-int/2addr v2, v1

    sget v0, Lu95;->h:I

    sget-object v0, Ljgm;->b:Ligm;

    iget-wide v3, p0, Lw51;->c:J

    invoke-static {v2, v1, v3, v4}, Lz1m;->e(IIJ)I

    move-result v0

    iget-object p0, p0, Lw51;->d:Lzvf;

    invoke-virtual {p0}, Lzvf;->hashCode()I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method
