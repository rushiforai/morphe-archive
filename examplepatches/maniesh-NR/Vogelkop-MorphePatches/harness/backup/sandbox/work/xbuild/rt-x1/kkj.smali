.class public final Lkkj;
.super Ljkj;
.source "SourceFile"

# interfaces
.implements Lml3;


# instance fields
.field public final d:Ljava/util/ArrayList;

.field public final e:Z

.field public final f:Ljava/lang/String;


# direct methods
.method public constructor <init>(JLjava/lang/String;Ljava/lang/String;Z)V
    .registers 7

    const/4 v0, 0x1

    invoke-direct {p0, p1, p2, v0, p3}, Ljkj;-><init>(JZLjava/lang/String;)V

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lkkj;->d:Ljava/util/ArrayList;

    iput-boolean p5, p0, Lkkj;->e:Z

    iput-object p4, p0, Lkkj;->f:Ljava/lang/String;

    return-void
.end method

.method public static k(Lml3;Ljava/lang/String;Ljava/lang/String;)Lkkj;
    .registers 9

    invoke-interface {p0}, Lal3;->getId()J

    move-result-wide v1

    invoke-interface {p0}, Lml3;->h()Z

    move-result v5

    new-instance v0, Lkkj;

    move-object v3, p1

    move-object v4, p2

    invoke-direct/range {v0 .. v5}, Lkkj;-><init>(JLjava/lang/String;Ljava/lang/String;Z)V

    invoke-interface {p0}, Lml3;->i()Ljava/util/List;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_17
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_2d

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lal3;

    iget-object p2, v0, Lkkj;->d:Ljava/util/ArrayList;

    invoke-static {p1}, Ljkj;->j(Lal3;)Ljkj;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_17

    :cond_2d
    return-object v0
.end method


# virtual methods
.method public final b()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lkkj;->f:Ljava/lang/String;

    return-object p0
.end method

.method public final c(Lzk3;)Z
    .registers 6

    invoke-interface {p1, p0}, Lzk3;->c(Lol3;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1e

    iget-object p0, p0, Lkkj;->d:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    move v2, v1

    :cond_e
    if-ge v2, v0, :cond_1f

    invoke-virtual {p0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v2, v2, 0x1

    check-cast v3, Lal3;

    invoke-interface {v3, p1}, Lal3;->c(Lzk3;)Z

    move-result v3

    if-nez v3, :cond_e

    :cond_1e
    return v1

    :cond_1f
    const/4 p0, 0x1

    return p0
.end method

.method public final d()J
    .registers 3

    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public final h()Z
    .registers 1

    iget-boolean p0, p0, Lkkj;->e:Z

    return p0
.end method

.method public final i()Ljava/util/List;
    .registers 1

    iget-object p0, p0, Lkkj;->d:Ljava/util/ArrayList;

    invoke-static {p0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public final isEmpty()Z
    .registers 1

    iget-object p0, p0, Lkkj;->d:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p0

    if-nez p0, :cond_a

    const/4 p0, 0x1

    return p0

    :cond_a
    const/4 p0, 0x0

    return p0
.end method

.method public final writeToParcel(Landroid/os/Parcel;I)V
    .registers 3

    invoke-super {p0, p1, p2}, Ljkj;->writeToParcel(Landroid/os/Parcel;I)V

    iget-boolean p0, p0, Lkkj;->e:Z

    invoke-virtual {p1, p0}, Landroid/os/Parcel;->writeInt(I)V

    return-void
.end method
