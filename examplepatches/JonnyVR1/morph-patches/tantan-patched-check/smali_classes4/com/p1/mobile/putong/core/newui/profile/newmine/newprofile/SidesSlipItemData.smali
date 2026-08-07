.class public Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;


# instance fields
.field private deepLink:Ljava/lang/String;

.field private iconUrl:Ljava/lang/String;

.field private index:I

.field private nativeIcon:I

.field private omsId:Ljava/lang/String;

.field private showDot:Ljava/lang/Boolean;

.field private title:Ljava/lang/String;

.field private type:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "native"

    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;->type:Ljava/lang/String;

    .line 7
    .line 8
    const-string v0, ""

    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;->title:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;->iconUrl:Ljava/lang/String;

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    iput v1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;->nativeIcon:I

    .line 16
    .line 17
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;->showDot:Ljava/lang/Boolean;

    .line 20
    .line 21
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;->deepLink:Ljava/lang/String;

    .line 22
    .line 23
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;->omsId:Ljava/lang/String;

    .line 24
    .line 25
    return-void
.end method


# virtual methods
.method public getDeepLink()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;->deepLink:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getIconUrl()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;->iconUrl:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getIndex()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;->index:I

    .line 2
    .line 3
    return p0
.end method

.method public getNativeIcon()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;->nativeIcon:I

    .line 2
    .line 3
    return p0
.end method

.method public getOmsId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;->omsId:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getShowDot()Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;->showDot:Ljava/lang/Boolean;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTitle()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;->title:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getType()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;->type:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public setDeepLink(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;->deepLink:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setIconUrl(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;->iconUrl:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setIndex(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;->index:I

    .line 2
    .line 3
    return-void
.end method

.method public setNativeIcon(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;->nativeIcon:I

    .line 2
    .line 3
    return-void
.end method

.method public setOmsId(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;->omsId:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setShowDot(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;->showDot:Ljava/lang/Boolean;

    .line 2
    .line 3
    return-void
.end method

.method public setTitle(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;->title:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setType(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;->type:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method
