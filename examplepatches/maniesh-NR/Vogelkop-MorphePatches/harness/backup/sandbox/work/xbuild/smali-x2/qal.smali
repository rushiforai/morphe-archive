.class public final Lqal;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/CharSequence;

.field public final b:I

.field public final c:I

.field public final d:Lnal;


# direct methods
.method public constructor <init>(Ljava/lang/CharSequence;IILnal;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lqal;->a:Ljava/lang/CharSequence;

    iput p2, p0, Lqal;->b:I

    iput p3, p0, Lqal;->c:I

    iput-object p4, p0, Lqal;->d:Lnal;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_26

    instance-of v0, p1, Lqal;

    if-eqz v0, :cond_24

    check-cast p1, Lqal;

    iget-object v0, p0, Lqal;->a:Ljava/lang/CharSequence;

    iget-object v1, p1, Lqal;->a:Ljava/lang/CharSequence;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_24

    iget v0, p0, Lqal;->b:I

    iget v1, p1, Lqal;->b:I

    if-ne v0, v1, :cond_24

    iget v0, p0, Lqal;->c:I

    iget v1, p1, Lqal;->c:I

    if-ne v0, v1, :cond_24

    iget-object p0, p0, Lqal;->d:Lnal;

    iget-object p1, p1, Lqal;->d:Lnal;

    if-eq p0, p1, :cond_26

    :cond_24
    const/4 p0, 0x0

    return p0

    :cond_26
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 4

    iget-object v0, p0, Lqal;->a:Ljava/lang/CharSequence;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget v2, p0, Lqal;->b:I

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget v2, p0, Lqal;->c:I

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget-object p0, p0, Lqal;->d:Lnal;

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
