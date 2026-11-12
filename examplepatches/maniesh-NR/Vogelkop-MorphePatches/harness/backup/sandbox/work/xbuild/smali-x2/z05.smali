.class public final Lz05;
.super Lfp4;
.source "SourceFile"


# instance fields
.field public final h:Ljava/util/List;

.field public final i:Lbre;

.field public final j:Z

.field public final k:Z


# direct methods
.method public constructor <init>(Lyla;JLjava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/util/List;Ljava/util/List;IZZ)V
    .registers 12

    invoke-direct/range {p0 .. p7}, Lfp4;-><init>(Lyla;JLjava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/util/List;)V

    invoke-static {p8}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Lz05;->h:Ljava/util/List;

    const/4 p2, -0x1

    const/4 p3, 0x0

    if-eq p9, p2, :cond_1c

    if-ltz p9, :cond_1c

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p2

    if-ge p9, p2, :cond_1c

    invoke-interface {p1, p9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    move-object p3, p1

    check-cast p3, Lbre;

    :cond_1c
    iput-object p3, p0, Lz05;->i:Lbre;

    iput-boolean p10, p0, Lz05;->j:Z

    if-eqz p3, :cond_26

    if-eqz p11, :cond_26

    const/4 p1, 0x1

    goto :goto_27

    :cond_26
    const/4 p1, 0x0

    :goto_27
    iput-boolean p1, p0, Lz05;->k:Z

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_34

    if-eqz p1, :cond_36

    const-class v0, Lz05;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    if-ne v0, v1, :cond_36

    invoke-super {p0, p1}, Lfp4;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_36

    check-cast p1, Lz05;

    iget-boolean v0, p0, Lz05;->j:Z

    iget-boolean v1, p1, Lz05;->j:Z

    if-ne v0, v1, :cond_36

    iget-boolean v0, p0, Lz05;->k:Z

    iget-boolean v1, p1, Lz05;->k:Z

    if-ne v0, v1, :cond_36

    iget-object v0, p0, Lz05;->h:Ljava/util/List;

    iget-object v1, p1, Lz05;->h:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_36

    iget-object p0, p0, Lz05;->i:Lbre;

    iget-object p1, p1, Lz05;->i:Lbre;

    invoke-static {p0, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_36

    :cond_34
    const/4 p0, 0x1

    return p0

    :cond_36
    const/4 p0, 0x0

    return p0
.end method

.method public final hashCode()I
    .registers 5

    invoke-super {p0}, Lfp4;->hashCode()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iget-boolean v1, p0, Lz05;->j:Z

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    iget-boolean v2, p0, Lz05;->k:Z

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    iget-object v3, p0, Lz05;->h:Ljava/util/List;

    iget-object p0, p0, Lz05;->i:Lbre;

    filled-new-array {v0, v3, p0, v1, v2}, [Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Ljava/util/Objects;->hash([Ljava/lang/Object;)I

    move-result p0

    return p0
.end method
