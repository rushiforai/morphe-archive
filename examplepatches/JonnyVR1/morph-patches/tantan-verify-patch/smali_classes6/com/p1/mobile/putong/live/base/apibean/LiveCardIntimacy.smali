.class public Lcom/p1/mobile/putong/live/base/apibean/LiveCardIntimacy;
.super Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;
.source "SourceFile"


# instance fields
.field icon:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "icon"
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveCardIntimacy;->icon:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public getIcon()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveCardIntimacy;->icon:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public setIcon(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveCardIntimacy;->icon:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method
