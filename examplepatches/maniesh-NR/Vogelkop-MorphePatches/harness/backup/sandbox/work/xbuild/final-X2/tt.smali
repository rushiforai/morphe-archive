.class public final Ltt;
.super Lvt;
.source "SourceFile"


# instance fields
.field public final a:Z

.field public final b:Z

.field public final c:Ljava/util/ArrayList;

.field public final d:Ljava/util/List;

.field public final e:Ljava/util/ArrayList;

.field public final f:Ljava/util/ArrayList;

.field public final g:Ljava/util/ArrayList;


# direct methods
.method public constructor <init>(ZZLjava/util/ArrayList;Ljava/util/List;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;)V
    .registers 8

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Ltt;->a:Z

    iput-boolean p2, p0, Ltt;->b:Z

    iput-object p3, p0, Ltt;->c:Ljava/util/ArrayList;

    iput-object p4, p0, Ltt;->d:Ljava/util/List;

    iput-object p5, p0, Ltt;->e:Ljava/util/ArrayList;

    iput-object p6, p0, Ltt;->f:Ljava/util/ArrayList;

    iput-object p7, p0, Ltt;->g:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_48

    instance-of v0, p1, Ltt;

    if-eqz v0, :cond_46

    check-cast p1, Ltt;

    iget-boolean v0, p0, Ltt;->a:Z

    iget-boolean v1, p1, Ltt;->a:Z

    if-ne v0, v1, :cond_46

    iget-boolean v0, p0, Ltt;->b:Z

    iget-boolean v1, p1, Ltt;->b:Z

    if-ne v0, v1, :cond_46

    iget-object v0, p0, Ltt;->c:Ljava/util/ArrayList;

    iget-object v1, p1, Ltt;->c:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_46

    iget-object v0, p0, Ltt;->d:Ljava/util/List;

    iget-object v1, p1, Ltt;->d:Ljava/util/List;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_46

    iget-object v0, p0, Ltt;->e:Ljava/util/ArrayList;

    iget-object v1, p1, Ltt;->e:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_46

    iget-object v0, p0, Ltt;->f:Ljava/util/ArrayList;

    iget-object v1, p1, Ltt;->f:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_46

    iget-object p0, p0, Ltt;->g:Ljava/util/ArrayList;

    iget-object p1, p1, Ltt;->g:Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_48

    :cond_46
    const/4 p0, 0x0

    return p0

    :cond_48
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 4

    iget-boolean v0, p0, Ltt;->a:Z

    invoke-static {v0}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-boolean v2, p0, Ltt;->b:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget-object v2, p0, Ltt;->c:Ljava/util/ArrayList;

    invoke-static {v2, v0, v1}, Lz1m;->g(Ljava/util/ArrayList;II)I

    move-result v0

    iget-object v2, p0, Ltt;->d:Ljava/util/List;

    invoke-static {v0, v1, v2}, Lrfp;->f(IILjava/util/List;)I

    move-result v0

    iget-object v2, p0, Ltt;->e:Ljava/util/ArrayList;

    invoke-static {v2, v0, v1}, Lz1m;->g(Ljava/util/ArrayList;II)I

    move-result v0

    iget-object v2, p0, Ltt;->f:Ljava/util/ArrayList;

    invoke-static {v2, v0, v1}, Lz1m;->g(Ljava/util/ArrayList;II)I

    move-result v0

    iget-object p0, p0, Ltt;->g:Ljava/util/ArrayList;

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
