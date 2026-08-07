.class public Lcom/immomo/momomediaext/sei/RadioSeiAssist;
.super Lcom/immomo/momomediaext/sei/BaseSei;
.source "SourceFile"


# static fields
.field private static final TAG:Ljava/lang/String; = "RadioSeiAssist"

.field private static final ctyp:Ljava/lang/String; = "8"


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/immomo/momomediaext/sei/BaseSei;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "8"

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/immomo/momomediaext/sei/BaseSei;->setCtyp(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public clearConf()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/sei/BaseSei;->conf:Ljava/util/List;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ljava/util/List;->clear()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public getConf()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/immomo/momomediaext/sei/BaseSei$SeiBean;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/immomo/momomediaext/sei/BaseSei;->conf:Ljava/util/List;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/immomo/momomediaext/sei/BaseSei;->conf:Ljava/util/List;

    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Lcom/immomo/momomediaext/sei/BaseSei;->conf:Ljava/util/List;

    .line 13
    .line 14
    return-object p0
.end method

.method public getInfo()Lcom/immomo/momomediaext/sei/BaseSei$InfoBean;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/immomo/momomediaext/sei/BaseSei;->info:Lcom/immomo/momomediaext/sei/BaseSei$InfoBean;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lcom/immomo/momomediaext/sei/BaseSei$InfoBean;

    .line 6
    .line 7
    invoke-direct {v0}, Lcom/immomo/momomediaext/sei/BaseSei$InfoBean;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/immomo/momomediaext/sei/BaseSei;->info:Lcom/immomo/momomediaext/sei/BaseSei$InfoBean;

    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Lcom/immomo/momomediaext/sei/BaseSei;->info:Lcom/immomo/momomediaext/sei/BaseSei$InfoBean;

    .line 13
    .line 14
    return-object p0
.end method

.method public obtainConfBean()Lcom/immomo/momomediaext/sei/BaseSei$SeiBean;
    .locals 1

    .line 1
    new-instance v0, Lcom/immomo/momomediaext/sei/BaseSei$SeiBean;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/immomo/momomediaext/sei/BaseSei$SeiBean;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/immomo/momomediaext/sei/RadioSeiAssist;->getConf()Ljava/util/List;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    return-object v0
.end method

.method public removeConfBean(Lcom/immomo/momomediaext/sei/BaseSei$SeiBean;)V
    .locals 0

    .line 47
    iget-object p0, p0, Lcom/immomo/momomediaext/sei/BaseSei;->conf:Ljava/util/List;

    if-nez p0, :cond_0

    return-void

    .line 48
    :cond_0
    invoke-interface {p0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    return-void
.end method

.method public removeConfBean(Ljava/lang/String;)Z
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/immomo/momomediaext/sei/BaseSei;->conf:Ljava/util/List;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    goto :goto_1

    .line 7
    :cond_0
    move v0, v1

    .line 8
    :goto_0
    invoke-virtual {p0}, Lcom/immomo/momomediaext/sei/RadioSeiAssist;->getConf()Ljava/util/List;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    if-ge v0, v2, :cond_2

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/immomo/momomediaext/sei/RadioSeiAssist;->getConf()Ljava/util/List;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    check-cast v2, Lcom/immomo/momomediaext/sei/BaseSei$SeiBean;

    .line 27
    .line 28
    invoke-virtual {v2}, Lcom/immomo/momomediaext/sei/BaseSei$SeiBean;->getId()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    if-ne v3, p1, :cond_1

    .line 33
    .line 34
    invoke-virtual {p0}, Lcom/immomo/momomediaext/sei/RadioSeiAssist;->getConf()Ljava/util/List;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-interface {p0, v2}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    const/4 p0, 0x1

    .line 42
    return p0

    .line 43
    :cond_1
    add-int/lit8 v0, v0, 0x1

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_2
    :goto_1
    return v1
.end method

.method public setInfoBean_CTime(J)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/immomo/momomediaext/sei/RadioSeiAssist;->getInfo()Lcom/immomo/momomediaext/sei/BaseSei$InfoBean;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/immomo/momomediaext/sei/BaseSei$InfoBean;->setCtime(J)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public setInfoBean_CType(I)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/immomo/momomediaext/sei/RadioSeiAssist;->getInfo()Lcom/immomo/momomediaext/sei/BaseSei$InfoBean;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Lcom/immomo/momomediaext/sei/BaseSei$InfoBean;->setCtyp(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public setInfoBean_Inv(J)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/immomo/momomediaext/sei/RadioSeiAssist;->getInfo()Lcom/immomo/momomediaext/sei/BaseSei$InfoBean;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/immomo/momomediaext/sei/BaseSei$InfoBean;->setInv(J)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
