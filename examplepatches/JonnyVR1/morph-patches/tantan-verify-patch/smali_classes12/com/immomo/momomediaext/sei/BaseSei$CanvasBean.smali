.class public Lcom/immomo/momomediaext/sei/BaseSei$CanvasBean;
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
    name = "CanvasBean"
.end annotation


# instance fields
.field private bgrgb:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private h:I

.field private w:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public getBgrgb()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/sei/BaseSei$CanvasBean;->bgrgb:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public getH()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/momomediaext/sei/BaseSei$CanvasBean;->h:I

    .line 2
    .line 3
    return p0
.end method

.method public getW()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/momomediaext/sei/BaseSei$CanvasBean;->w:I

    .line 2
    .line 3
    return p0
.end method

.method public setBgrgb(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/immomo/momomediaext/sei/BaseSei$CanvasBean;->bgrgb:Ljava/util/List;

    .line 2
    .line 3
    return-void
.end method

.method public setH(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/momomediaext/sei/BaseSei$CanvasBean;->h:I

    .line 2
    .line 3
    return-void
.end method

.method public setW(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/momomediaext/sei/BaseSei$CanvasBean;->w:I

    .line 2
    .line 3
    return-void
.end method
