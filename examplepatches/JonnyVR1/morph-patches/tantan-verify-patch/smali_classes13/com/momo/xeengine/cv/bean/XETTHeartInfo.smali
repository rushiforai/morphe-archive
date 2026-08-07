.class public Lcom/momo/xeengine/cv/bean/XETTHeartInfo;
.super Lcom/momo/xeengine/cv/bean/CVSegmentInfo;
.source "SourceFile"


# annotations
.annotation build Landroidx/annotation/Keep;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momo/xeengine/cv/bean/XETTHeartInfo$XETTHeartDataBlock;
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field private dataBlocks:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/momo/xeengine/cv/bean/XETTHeartInfo$XETTHeartDataBlock;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public getDataBlocks()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/momo/xeengine/cv/bean/XETTHeartInfo$XETTHeartDataBlock;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/cv/bean/XETTHeartInfo;->dataBlocks:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public setDataBlocks(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/momo/xeengine/cv/bean/XETTHeartInfo$XETTHeartDataBlock;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/momo/xeengine/cv/bean/XETTHeartInfo;->dataBlocks:Ljava/util/List;

    .line 2
    .line 3
    return-void
.end method
