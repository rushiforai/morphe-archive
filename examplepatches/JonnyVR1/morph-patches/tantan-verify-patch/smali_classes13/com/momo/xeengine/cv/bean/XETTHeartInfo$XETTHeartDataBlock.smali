.class public Lcom/momo/xeengine/cv/bean/XETTHeartInfo$XETTHeartDataBlock;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/xeengine/cv/bean/XETTHeartInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "XETTHeartDataBlock"
.end annotation


# instance fields
.field private alphas:[F

.field public cx:F

.field public cy:F

.field private distances:[F

.field public intensity:F

.field final synthetic this$0:Lcom/momo/xeengine/cv/bean/XETTHeartInfo;


# direct methods
.method public constructor <init>(Lcom/momo/xeengine/cv/bean/XETTHeartInfo;)V
    .locals 0

    .line 13
    iput-object p1, p0, Lcom/momo/xeengine/cv/bean/XETTHeartInfo$XETTHeartDataBlock;->this$0:Lcom/momo/xeengine/cv/bean/XETTHeartInfo;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lcom/momo/xeengine/cv/bean/XETTHeartInfo;FFF)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xeengine/cv/bean/XETTHeartInfo$XETTHeartDataBlock;->this$0:Lcom/momo/xeengine/cv/bean/XETTHeartInfo;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput p2, p0, Lcom/momo/xeengine/cv/bean/XETTHeartInfo$XETTHeartDataBlock;->cx:F

    .line 7
    .line 8
    iput p3, p0, Lcom/momo/xeengine/cv/bean/XETTHeartInfo$XETTHeartDataBlock;->cy:F

    .line 9
    .line 10
    iput p4, p0, Lcom/momo/xeengine/cv/bean/XETTHeartInfo$XETTHeartDataBlock;->intensity:F

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public getAlphas()[F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/cv/bean/XETTHeartInfo$XETTHeartDataBlock;->alphas:[F

    .line 2
    .line 3
    return-object p0
.end method

.method public getDistances()[F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/cv/bean/XETTHeartInfo$XETTHeartDataBlock;->distances:[F

    .line 2
    .line 3
    return-object p0
.end method

.method public setAlphas([F)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xeengine/cv/bean/XETTHeartInfo$XETTHeartDataBlock;->alphas:[F

    .line 2
    .line 3
    return-void
.end method

.method public setDistances([F)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xeengine/cv/bean/XETTHeartInfo$XETTHeartDataBlock;->distances:[F

    .line 2
    .line 3
    return-void
.end method
