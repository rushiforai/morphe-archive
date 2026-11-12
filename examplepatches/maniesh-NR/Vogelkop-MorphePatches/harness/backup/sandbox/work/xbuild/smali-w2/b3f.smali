.class public final Lb3f;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljwk;

.field public final b:Ljwk;

.field public final c:Ljwk;

.field public final d:Ljwk;

.field public final e:Ljwk;

.field public final f:Ljwk;

.field public final g:Ljwk;

.field public final h:Lw0f;


# direct methods
.method public constructor <init>(Ljwk;Ljwk;Ljwk;Ljwk;Ljwk;Ljwk;Ljwk;Lw0f;)V
    .registers 9

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lb3f;->a:Ljwk;

    iput-object p2, p0, Lb3f;->b:Ljwk;

    iput-object p3, p0, Lb3f;->c:Ljwk;

    iput-object p4, p0, Lb3f;->d:Ljwk;

    iput-object p5, p0, Lb3f;->e:Ljwk;

    iput-object p6, p0, Lb3f;->f:Ljwk;

    iput-object p7, p0, Lb3f;->g:Ljwk;

    iput-object p8, p0, Lb3f;->h:Lw0f;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_56

    instance-of v0, p1, Lb3f;

    if-eqz v0, :cond_54

    check-cast p1, Lb3f;

    iget-object v0, p0, Lb3f;->a:Ljwk;

    iget-object v1, p1, Lb3f;->a:Ljwk;

    invoke-virtual {v0, v1}, Ljwk;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_54

    iget-object v0, p0, Lb3f;->b:Ljwk;

    iget-object v1, p1, Lb3f;->b:Ljwk;

    invoke-virtual {v0, v1}, Ljwk;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_54

    iget-object v0, p0, Lb3f;->c:Ljwk;

    iget-object v1, p1, Lb3f;->c:Ljwk;

    invoke-virtual {v0, v1}, Ljwk;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_54

    iget-object v0, p0, Lb3f;->d:Ljwk;

    iget-object v1, p1, Lb3f;->d:Ljwk;

    invoke-virtual {v0, v1}, Ljwk;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_54

    iget-object v0, p0, Lb3f;->e:Ljwk;

    iget-object v1, p1, Lb3f;->e:Ljwk;

    invoke-virtual {v0, v1}, Ljwk;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_54

    iget-object v0, p0, Lb3f;->f:Ljwk;

    iget-object v1, p1, Lb3f;->f:Ljwk;

    invoke-virtual {v0, v1}, Ljwk;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_54

    iget-object v0, p0, Lb3f;->g:Ljwk;

    iget-object v1, p1, Lb3f;->g:Ljwk;

    invoke-virtual {v0, v1}, Ljwk;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_54

    iget-object p0, p0, Lb3f;->h:Lw0f;

    iget-object p1, p1, Lb3f;->h:Lw0f;

    if-eq p0, p1, :cond_56

    :cond_54
    const/4 p0, 0x0

    return p0

    :cond_56
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 3

    iget-object v0, p0, Lb3f;->a:Ljwk;

    invoke-virtual {v0}, Ljwk;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lb3f;->b:Ljwk;

    invoke-virtual {v1}, Ljwk;->hashCode()I

    move-result v1

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object v0, p0, Lb3f;->c:Ljwk;

    invoke-virtual {v0}, Ljwk;->hashCode()I

    move-result v0

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lb3f;->d:Ljwk;

    invoke-virtual {v1}, Ljwk;->hashCode()I

    move-result v1

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object v0, p0, Lb3f;->e:Ljwk;

    invoke-virtual {v0}, Ljwk;->hashCode()I

    move-result v0

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lb3f;->f:Ljwk;

    invoke-virtual {v1}, Ljwk;->hashCode()I

    move-result v1

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object v0, p0, Lb3f;->g:Ljwk;

    invoke-virtual {v0}, Ljwk;->hashCode()I

    move-result v0

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object p0, p0, Lb3f;->h:Lw0f;

    if-nez p0, :cond_44

    const/4 p0, 0x0

    goto :goto_48

    :cond_44
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    :goto_48
    add-int/2addr v0, p0

    return v0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
