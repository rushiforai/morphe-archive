.class public Lcom/immomo/momomediaext/sei/BaseSei$InfoBean;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/immomo/momomediaext/sei/BaseSei;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "InfoBean"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/immomo/momomediaext/sei/BaseSei$InfoBean$HostconBean;,
        Lcom/immomo/momomediaext/sei/BaseSei$InfoBean$PostBean;,
        Lcom/immomo/momomediaext/sei/BaseSei$InfoBean$VerBean;,
        Lcom/immomo/momomediaext/sei/BaseSei$InfoBean$AnimalsBean;
    }
.end annotation


# instance fields
.field private ctime:J

.field private ctyp:I

.field private cuids:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/immomo/momomediaext/sei/BaseSei$SeiBean;",
            ">;"
        }
    .end annotation
.end field

.field private d:Ljava/lang/String;

.field private hostcon:Lcom/immomo/momomediaext/sei/BaseSei$InfoBean$HostconBean;

.field private inv:J

.field private mfuid:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/immomo/momomediaext/sei/BaseSei$SeiBean;",
            ">;"
        }
    .end annotation
.end field

.field private pkst:I

.field private post:Lcom/immomo/momomediaext/sei/BaseSei$InfoBean$PostBean;

.field private screens:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/immomo/momomediaext/sei/BaseSei$SeiBean;",
            ">;"
        }
    .end annotation
.end field

.field private styp:I

.field private test:Ljava/lang/String;

.field private ver:Lcom/immomo/momomediaext/sei/BaseSei$InfoBean$VerBean;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Lcom/immomo/momomediaext/sei/BaseSei$InfoBean;->ctime:J

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public getCtime()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/immomo/momomediaext/sei/BaseSei$InfoBean;->ctime:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getCtyp()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/momomediaext/sei/BaseSei$InfoBean;->ctyp:I

    .line 2
    .line 3
    return p0
.end method

.method public getCuids()Ljava/util/List;
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
    iget-object v0, p0, Lcom/immomo/momomediaext/sei/BaseSei$InfoBean;->cuids:Ljava/util/List;

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
    iput-object v0, p0, Lcom/immomo/momomediaext/sei/BaseSei$InfoBean;->cuids:Ljava/util/List;

    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Lcom/immomo/momomediaext/sei/BaseSei$InfoBean;->cuids:Ljava/util/List;

    .line 13
    .line 14
    return-object p0
.end method

.method public getD()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/sei/BaseSei$InfoBean;->d:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getHostcon()Lcom/immomo/momomediaext/sei/BaseSei$InfoBean$HostconBean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/sei/BaseSei$InfoBean;->hostcon:Lcom/immomo/momomediaext/sei/BaseSei$InfoBean$HostconBean;

    .line 2
    .line 3
    return-object p0
.end method

.method public getInv()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/immomo/momomediaext/sei/BaseSei$InfoBean;->inv:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getMfuid()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/immomo/momomediaext/sei/BaseSei$SeiBean;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/sei/BaseSei$InfoBean;->mfuid:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPkst()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/momomediaext/sei/BaseSei$InfoBean;->pkst:I

    .line 2
    .line 3
    return p0
.end method

.method public getPost()Lcom/immomo/momomediaext/sei/BaseSei$InfoBean$PostBean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/sei/BaseSei$InfoBean;->post:Lcom/immomo/momomediaext/sei/BaseSei$InfoBean$PostBean;

    .line 2
    .line 3
    return-object p0
.end method

.method public getScreens()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/immomo/momomediaext/sei/BaseSei$SeiBean;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/sei/BaseSei$InfoBean;->screens:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public getStyp()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/momomediaext/sei/BaseSei$InfoBean;->styp:I

    .line 2
    .line 3
    return p0
.end method

.method public getTest()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/sei/BaseSei$InfoBean;->test:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getVer()Lcom/immomo/momomediaext/sei/BaseSei$InfoBean$VerBean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/sei/BaseSei$InfoBean;->ver:Lcom/immomo/momomediaext/sei/BaseSei$InfoBean$VerBean;

    .line 2
    .line 3
    return-object p0
.end method

.method public setCtime(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/immomo/momomediaext/sei/BaseSei$InfoBean;->ctime:J

    .line 2
    .line 3
    return-void
.end method

.method public setCtyp(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/momomediaext/sei/BaseSei$InfoBean;->ctyp:I

    .line 2
    .line 3
    return-void
.end method

.method public setCuids(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/immomo/momomediaext/sei/BaseSei$SeiBean;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/immomo/momomediaext/sei/BaseSei$InfoBean;->cuids:Ljava/util/List;

    .line 2
    .line 3
    return-void
.end method

.method public setD(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/momomediaext/sei/BaseSei$InfoBean;->d:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setHostcon(Lcom/immomo/momomediaext/sei/BaseSei$InfoBean$HostconBean;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/momomediaext/sei/BaseSei$InfoBean;->hostcon:Lcom/immomo/momomediaext/sei/BaseSei$InfoBean$HostconBean;

    .line 2
    .line 3
    return-void
.end method

.method public setInv(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/immomo/momomediaext/sei/BaseSei$InfoBean;->inv:J

    .line 2
    .line 3
    return-void
.end method

.method public setMfuid(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/immomo/momomediaext/sei/BaseSei$SeiBean;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/immomo/momomediaext/sei/BaseSei$InfoBean;->mfuid:Ljava/util/List;

    .line 2
    .line 3
    return-void
.end method

.method public setPkst(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/momomediaext/sei/BaseSei$InfoBean;->pkst:I

    .line 2
    .line 3
    return-void
.end method

.method public setPost(Lcom/immomo/momomediaext/sei/BaseSei$InfoBean$PostBean;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/momomediaext/sei/BaseSei$InfoBean;->post:Lcom/immomo/momomediaext/sei/BaseSei$InfoBean$PostBean;

    .line 2
    .line 3
    return-void
.end method

.method public setScreens(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/immomo/momomediaext/sei/BaseSei$SeiBean;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/immomo/momomediaext/sei/BaseSei$InfoBean;->screens:Ljava/util/List;

    .line 2
    .line 3
    return-void
.end method

.method public setStyp(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/momomediaext/sei/BaseSei$InfoBean;->styp:I

    .line 2
    .line 3
    return-void
.end method

.method public setTest(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/momomediaext/sei/BaseSei$InfoBean;->test:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setVer(Lcom/immomo/momomediaext/sei/BaseSei$InfoBean$VerBean;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/momomediaext/sei/BaseSei$InfoBean;->ver:Lcom/immomo/momomediaext/sei/BaseSei$InfoBean$VerBean;

    .line 2
    .line 3
    return-void
.end method
