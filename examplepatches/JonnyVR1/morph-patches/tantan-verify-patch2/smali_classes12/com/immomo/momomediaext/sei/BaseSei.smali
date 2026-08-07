.class public Lcom/immomo/momomediaext/sei/BaseSei;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/immomo/momomediaext/sei/BaseSei$InfoBean;,
        Lcom/immomo/momomediaext/sei/BaseSei$CanvasBean;,
        Lcom/immomo/momomediaext/sei/BaseSei$SeiBean;
    }
.end annotation


# static fields
.field public static final CONF:Ljava/lang/String; = "conf"

.field public static final CTIME:Ljava/lang/String; = "ctime"

.field public static final CTYPE:Ljava/lang/String; = "ctyp"

.field public static final EXT:Ljava/lang/String; = "ext"

.field public static final H:Ljava/lang/String; = "h"

.field public static final ID:Ljava/lang/String; = "id"

.field public static final INFO:Ljava/lang/String; = "info"

.field public static final INV:Ljava/lang/String; = "inv"

.field public static final MID:Ljava/lang/String; = "mid"

.field public static final MU:Ljava/lang/String; = "mu"

.field public static final OL:Ljava/lang/String; = "ol"

.field public static final ShortSei:Ljava/lang/String; = "shortSei"

.field public static final VO:Ljava/lang/String; = "vo"

.field public static final W:Ljava/lang/String; = "w"

.field public static final X:Ljava/lang/String; = "x"

.field public static final Y:Ljava/lang/String; = "y"

.field public static final Z:Ljava/lang/String; = "z"


# instance fields
.field protected canvas:Lcom/immomo/momomediaext/sei/BaseSei$CanvasBean;

.field protected conf:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/immomo/momomediaext/sei/BaseSei$SeiBean;",
            ">;"
        }
    .end annotation
.end field

.field private ctyp:Ljava/lang/String;

.field private ext:Ljava/lang/String;

.field protected has:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/immomo/momomediaext/sei/BaseSei$SeiBean;",
            ">;"
        }
    .end annotation
.end field

.field protected info:Lcom/immomo/momomediaext/sei/BaseSei$InfoBean;

.field private inv:Ljava/lang/String;

.field private mid:Ljava/lang/String;

.field private shortSei:I

.field private styp:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Lcom/immomo/momomediaext/sei/BaseSei;->ctyp:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/immomo/momomediaext/sei/BaseSei;->styp:Ljava/lang/String;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/immomo/momomediaext/sei/BaseSei;->inv:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/immomo/momomediaext/sei/BaseSei;->mid:Ljava/lang/String;

    .line 13
    .line 14
    iput-object v0, p0, Lcom/immomo/momomediaext/sei/BaseSei;->ext:Ljava/lang/String;

    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    iput v0, p0, Lcom/immomo/momomediaext/sei/BaseSei;->shortSei:I

    .line 18
    .line 19
    return-void
.end method


# virtual methods
.method public getCanvas()Lcom/immomo/momomediaext/sei/BaseSei$CanvasBean;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/immomo/momomediaext/sei/BaseSei;->canvas:Lcom/immomo/momomediaext/sei/BaseSei$CanvasBean;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lcom/immomo/momomediaext/sei/BaseSei$CanvasBean;

    .line 6
    .line 7
    invoke-direct {v0}, Lcom/immomo/momomediaext/sei/BaseSei$CanvasBean;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/immomo/momomediaext/sei/BaseSei;->canvas:Lcom/immomo/momomediaext/sei/BaseSei$CanvasBean;

    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Lcom/immomo/momomediaext/sei/BaseSei;->canvas:Lcom/immomo/momomediaext/sei/BaseSei$CanvasBean;

    .line 13
    .line 14
    return-object p0
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

.method public getCtyp()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/sei/BaseSei;->ctyp:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getExt()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/sei/BaseSei;->ext:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getHas()Ljava/util/List;
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
    iget-object v0, p0, Lcom/immomo/momomediaext/sei/BaseSei;->has:Ljava/util/List;

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
    iput-object v0, p0, Lcom/immomo/momomediaext/sei/BaseSei;->has:Ljava/util/List;

    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Lcom/immomo/momomediaext/sei/BaseSei;->has:Ljava/util/List;

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

.method public getInv()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/sei/BaseSei;->inv:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getMid()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/sei/BaseSei;->mid:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getShortSei()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/momomediaext/sei/BaseSei;->shortSei:I

    .line 2
    .line 3
    return p0
.end method

.method public setCtyp(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/momomediaext/sei/BaseSei;->ctyp:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setExt(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/momomediaext/sei/BaseSei;->ext:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setInv(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/momomediaext/sei/BaseSei;->inv:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setMid(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/momomediaext/sei/BaseSei;->mid:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setShortSei(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/momomediaext/sei/BaseSei;->shortSei:I

    .line 2
    .line 3
    return-void
.end method

.method public setStyp(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/momomediaext/sei/BaseSei;->styp:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method
