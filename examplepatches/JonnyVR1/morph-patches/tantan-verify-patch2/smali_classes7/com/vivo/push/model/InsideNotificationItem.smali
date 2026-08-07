.class public Lcom/vivo/push/model/InsideNotificationItem;
.super Lcom/vivo/push/model/UPSNotificationMessage;
.source "SourceFile"


# instance fields
.field private mAppType:I

.field private mDisplayStyle:I

.field private mInnerPriority:I

.field private mIsShowBigPicOnMobileNet:Z

.field private mMessageType:I

.field private mNotifyDisplayStatus:I

.field private mReactPackage:Ljava/lang/String;

.field private mSuitReactVersion:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/vivo/push/model/UPSNotificationMessage;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private parsingNotifyStyle()I
    .locals 2

    .line 1
    iget p0, p0, Lcom/vivo/push/model/InsideNotificationItem;->mDisplayStyle:I

    .line 2
    .line 3
    and-int/lit8 v0, p0, 0x20

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    and-int/lit8 p0, p0, 0x10

    .line 10
    .line 11
    if-eqz p0, :cond_1

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_1
    return v1
.end method


# virtual methods
.method public getAppType()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/vivo/push/model/InsideNotificationItem;->mAppType:I

    .line 2
    .line 3
    return p0
.end method

.method public getDisplayStyle()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/vivo/push/model/InsideNotificationItem;->mDisplayStyle:I

    .line 2
    .line 3
    return p0
.end method

.method public getInnerPriority()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/vivo/push/model/InsideNotificationItem;->mInnerPriority:I

    .line 2
    .line 3
    return p0
.end method

.method public getMessageType()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/vivo/push/model/InsideNotificationItem;->mMessageType:I

    .line 2
    .line 3
    return p0
.end method

.method public getNotifyDisplayStatus()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/vivo/push/model/InsideNotificationItem;->mNotifyDisplayStatus:I

    .line 2
    .line 3
    return p0
.end method

.method public getReactPackage()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/vivo/push/model/InsideNotificationItem;->mReactPackage:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSuitReactVersion()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/vivo/push/model/InsideNotificationItem;->mSuitReactVersion:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public isShowBigPicOnMobileNet()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/vivo/push/model/InsideNotificationItem;->mIsShowBigPicOnMobileNet:Z

    .line 2
    .line 3
    return p0
.end method

.method public setAppType(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/vivo/push/model/InsideNotificationItem;->mAppType:I

    .line 2
    .line 3
    return-void
.end method

.method public setDisplayStyle(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/vivo/push/model/InsideNotificationItem;->mDisplayStyle:I

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/vivo/push/model/InsideNotificationItem;->parsingNotifyStyle()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    iput p1, p0, Lcom/vivo/push/model/InsideNotificationItem;->mNotifyDisplayStatus:I

    .line 8
    .line 9
    return-void
.end method

.method public setInnerPriority(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/vivo/push/model/InsideNotificationItem;->mInnerPriority:I

    .line 2
    .line 3
    return-void
.end method

.method public setIsShowBigPicOnMobileNet(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/vivo/push/model/InsideNotificationItem;->mIsShowBigPicOnMobileNet:Z

    .line 2
    .line 3
    return-void
.end method

.method public setMessageType(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/vivo/push/model/InsideNotificationItem;->mMessageType:I

    .line 2
    .line 3
    return-void
.end method

.method public setReactPackage(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/vivo/push/model/InsideNotificationItem;->mReactPackage:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setSuitReactVersion(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/vivo/push/model/InsideNotificationItem;->mSuitReactVersion:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method
