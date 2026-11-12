.class public Lfp4;
.super Lqtm;
.source "SourceFile"


# instance fields
.field public final e:Ljava/util/List;

.field public final f:Ljava/util/List;

.field public final g:Z


# direct methods
.method public constructor <init>(Lyla;JLjava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/util/List;)V
    .registers 8

    invoke-direct/range {p0 .. p5}, Lqtm;-><init>(Lyla;JLjava/lang/String;Ljava/lang/String;)V

    invoke-static {p6}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Lfp4;->e:Ljava/util/List;

    invoke-static {p7}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p2

    iput-object p2, p0, Lfp4;->f:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_13
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_27

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lyqe;

    invoke-virtual {p2}, Lyqe;->a()Z

    move-result p2

    if-eqz p2, :cond_13

    const/4 p1, 0x1

    goto :goto_28

    :cond_27
    const/4 p1, 0x0

    :goto_28
    iput-boolean p1, p0, Lfp4;->g:Z

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_30

    if-eqz p1, :cond_32

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    if-ne v0, v1, :cond_32

    invoke-super {p0, p1}, Lqtm;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_32

    check-cast p1, Lfp4;

    iget-boolean v0, p0, Lfp4;->g:Z

    iget-boolean v1, p1, Lfp4;->g:Z

    if-ne v0, v1, :cond_32

    iget-object v0, p0, Lfp4;->e:Ljava/util/List;

    iget-object v1, p1, Lfp4;->e:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_32

    iget-object p0, p0, Lfp4;->f:Ljava/util/List;

    iget-object p1, p1, Lfp4;->f:Ljava/util/List;

    invoke-interface {p0, p1}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_32

    :cond_30
    const/4 p0, 0x1

    return p0

    :cond_32
    const/4 p0, 0x0

    return p0
.end method

.method public hashCode()I
    .registers 4

    invoke-super {p0}, Lqtm;->hashCode()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iget-boolean v1, p0, Lfp4;->g:Z

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    iget-object v2, p0, Lfp4;->e:Ljava/util/List;

    iget-object p0, p0, Lfp4;->f:Ljava/util/List;

    filled-new-array {v0, v2, p0, v1}, [Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Ljava/util/Objects;->hash([Ljava/lang/Object;)I

    move-result p0

    return p0
.end method
