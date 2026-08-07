.class public Lcom/momo/xeengine/cv/bean/XEMutableInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Landroidx/annotation/Keep;
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field private business:Ljava/lang/String;

.field private maskInfo1:Lcom/momo/xeengine/cv/bean/CVSegmentInfo;

.field private maskInfo2:Lcom/momo/xeengine/cv/bean/CVSegmentInfo;

.field private mutableDatas:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/momo/xeengine/cv/bean/XEMutableData;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/momo/xeengine/cv/bean/XEMutableInfo;->business:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public getBusiness()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/cv/bean/XEMutableInfo;->business:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getMaskInfo1()Lcom/momo/xeengine/cv/bean/CVSegmentInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/cv/bean/XEMutableInfo;->maskInfo1:Lcom/momo/xeengine/cv/bean/CVSegmentInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public getMaskInfo2()Lcom/momo/xeengine/cv/bean/CVSegmentInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/cv/bean/XEMutableInfo;->maskInfo2:Lcom/momo/xeengine/cv/bean/CVSegmentInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public getMutableDatas()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/momo/xeengine/cv/bean/XEMutableData;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/cv/bean/XEMutableInfo;->mutableDatas:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public setBusiness(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xeengine/cv/bean/XEMutableInfo;->business:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setMaskInfo1(Lcom/momo/xeengine/cv/bean/CVSegmentInfo;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xeengine/cv/bean/XEMutableInfo;->maskInfo1:Lcom/momo/xeengine/cv/bean/CVSegmentInfo;

    .line 2
    .line 3
    return-void
.end method

.method public setMaskInfo2(Lcom/momo/xeengine/cv/bean/CVSegmentInfo;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xeengine/cv/bean/XEMutableInfo;->maskInfo2:Lcom/momo/xeengine/cv/bean/CVSegmentInfo;

    .line 2
    .line 3
    return-void
.end method

.method public setMutableDatas(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/momo/xeengine/cv/bean/XEMutableData;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/momo/xeengine/cv/bean/XEMutableInfo;->mutableDatas:Ljava/util/List;

    .line 2
    .line 3
    return-void
.end method
