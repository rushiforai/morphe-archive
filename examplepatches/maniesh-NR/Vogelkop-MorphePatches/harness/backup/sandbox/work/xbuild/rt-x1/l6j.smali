.class public final Ll6j;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:I

.field public final b:Lx6j;

.field public final c:Ljava/lang/String;

.field public final d:Ljava/lang/String;

.field public final e:I

.field public final f:Z

.field public final g:Z

.field public final h:Lehc;


# direct methods
.method public constructor <init>(ILx6j;Ljava/lang/String;Ljava/lang/String;IZZLehc;)V
    .registers 9

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Ll6j;->a:I

    iput-object p2, p0, Ll6j;->b:Lx6j;

    iput-object p3, p0, Ll6j;->c:Ljava/lang/String;

    iput-object p4, p0, Ll6j;->d:Ljava/lang/String;

    iput p5, p0, Ll6j;->e:I

    iput-boolean p6, p0, Ll6j;->f:Z

    iput-boolean p7, p0, Ll6j;->g:Z

    iput-object p8, p0, Ll6j;->h:Lehc;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_4a

    instance-of v0, p1, Ll6j;

    if-eqz v0, :cond_48

    check-cast p1, Ll6j;

    iget v0, p0, Ll6j;->a:I

    iget v1, p1, Ll6j;->a:I

    if-ne v0, v1, :cond_48

    iget-object v0, p0, Ll6j;->b:Lx6j;

    iget-object v1, p1, Ll6j;->b:Lx6j;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_48

    iget-object v0, p0, Ll6j;->c:Ljava/lang/String;

    iget-object v1, p1, Ll6j;->c:Ljava/lang/String;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_48

    iget-object v0, p0, Ll6j;->d:Ljava/lang/String;

    iget-object v1, p1, Ll6j;->d:Ljava/lang/String;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_48

    iget v0, p0, Ll6j;->e:I

    iget v1, p1, Ll6j;->e:I

    if-ne v0, v1, :cond_48

    iget-boolean v0, p0, Ll6j;->f:Z

    iget-boolean v1, p1, Ll6j;->f:Z

    if-ne v0, v1, :cond_48

    iget-boolean v0, p0, Ll6j;->g:Z

    iget-boolean v1, p1, Ll6j;->g:Z

    if-ne v0, v1, :cond_48

    iget-object p0, p0, Ll6j;->h:Lehc;

    iget-object p1, p1, Ll6j;->h:Lehc;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_4a

    :cond_48
    const/4 p0, 0x0

    return p0

    :cond_4a
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 4

    iget v0, p0, Ll6j;->a:I

    invoke-static {v0}, Ljava/lang/Integer;->hashCode(I)I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-object v2, p0, Ll6j;->b:Lx6j;

    invoke-virtual {v2}, Lx6j;->hashCode()I

    move-result v2

    add-int/2addr v2, v0

    mul-int/2addr v2, v1

    iget-object v0, p0, Ll6j;->c:Ljava/lang/String;

    invoke-static {v2, v1, v0}, Lz1m;->f(IILjava/lang/String;)I

    move-result v0

    iget-object v2, p0, Ll6j;->d:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lz1m;->f(IILjava/lang/String;)I

    move-result v0

    iget v2, p0, Ll6j;->e:I

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget-boolean v2, p0, Ll6j;->f:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget-boolean v2, p0, Ll6j;->g:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget-object p0, p0, Ll6j;->h:Lehc;

    invoke-virtual {p0}, Lehc;->hashCode()I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
