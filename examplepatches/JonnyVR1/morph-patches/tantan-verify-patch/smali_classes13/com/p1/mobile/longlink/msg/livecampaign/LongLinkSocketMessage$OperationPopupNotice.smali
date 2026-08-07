.class public final Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNoticeOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "OperationPopupNotice"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice$OperationPopupType;,
        Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;",
        "Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNoticeOrBuilder;"
    }
.end annotation


# static fields
.field private static final DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;

.field public static final DRAWER_FIELD_NUMBER:I = 0x4

.field public static final H5POPUP_FIELD_NUMBER:I = 0x5

.field public static final OPERATIONTYPE_FIELD_NUMBER:I = 0x1

.field private static volatile PARSER:Ll/ng60; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;",
            ">;"
        }
    .end annotation
.end field

.field public static final POPUPTYPE_FIELD_NUMBER:I = 0x2

.field public static final TEXTDRAWER_FIELD_NUMBER:I = 0x3

.field public static final TIMESTAMP_FIELD_NUMBER:I = 0x6


# instance fields
.field private drawer_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;

.field private h5PopUp_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5PopUp;

.field private operationType_:Ljava/lang/String;

.field private popupType_:I

.field private textDrawer_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawer;

.field private timestamp_:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->makeImmutable()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessageLite;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->operationType_:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->clearDrawer()V

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->clearH5PopUp()V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->clearOperationType()V

    return-void
.end method

.method private clearDrawer()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->drawer_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;

    .line 3
    .line 4
    return-void
.end method

.method private clearH5PopUp()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->h5PopUp_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5PopUp;

    .line 3
    .line 4
    return-void
.end method

.method private clearOperationType()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->getOperationType()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->operationType_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearPopupType()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->popupType_:I

    .line 3
    .line 4
    return-void
.end method

.method private clearTextDrawer()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->textDrawer_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawer;

    .line 3
    .line 4
    return-void
.end method

.method private clearTimestamp()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->timestamp_:J

    .line 4
    .line 5
    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->clearPopupType()V

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->clearTextDrawer()V

    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->clearTimestamp()V

    return-void
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->mergeDrawer(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;)V

    return-void
.end method

.method public static getDefaultInstance()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;

    .line 2
    .line 3
    return-object v0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5PopUp;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->mergeH5PopUp(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5PopUp;)V

    return-void
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawer;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->mergeTextDrawer(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawer;)V

    return-void
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->setDrawer(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer$Builder;)V

    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->setDrawer(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;)V

    return-void
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5PopUp$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->setH5PopUp(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5PopUp$Builder;)V

    return-void
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5PopUp;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->setH5PopUp(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5PopUp;)V

    return-void
.end method

.method private mergeDrawer(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->drawer_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->drawer_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->newBuilder(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer$Builder;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0, p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    check-cast p1, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer$Builder;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;

    .line 28
    .line 29
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->drawer_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->drawer_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;

    .line 33
    .line 34
    return-void
.end method

.method private mergeH5PopUp(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5PopUp;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->h5PopUp_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5PopUp;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5PopUp;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5PopUp;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->h5PopUp_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5PopUp;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5PopUp;->newBuilder(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5PopUp;)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5PopUp$Builder;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0, p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    check-cast p1, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5PopUp$Builder;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5PopUp;

    .line 28
    .line 29
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->h5PopUp_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5PopUp;

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->h5PopUp_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5PopUp;

    .line 33
    .line 34
    return-void
.end method

.method private mergeTextDrawer(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawer;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->textDrawer_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawer;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawer;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawer;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->textDrawer_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawer;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawer;->newBuilder(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawer;)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawer$Builder;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0, p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    check-cast p1, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawer$Builder;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawer;

    .line 28
    .line 29
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->textDrawer_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawer;

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->textDrawer_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawer;

    .line 33
    .line 34
    return-void
.end method

.method public static bridge synthetic n(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->setOperationType(Ljava/lang/String;)V

    return-void
.end method

.method public static newBuilder()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice$Builder;
    .locals 1

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice$Builder;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice$Builder;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice$Builder;

    .line 14
    .line 15
    return-object p0
.end method

.method public static bridge synthetic o(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->setOperationTypeBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic p(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice$OperationPopupType;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->setPopupType(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice$OperationPopupType;)V

    return-void
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 11
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 12
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;

    return-object p0
.end method

.method public static parser()Ll/ng60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->getParserForType()Ll/ng60;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    return-object v0
.end method

.method public static bridge synthetic q(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->setPopupTypeValue(I)V

    return-void
.end method

.method public static bridge synthetic r(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawer$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->setTextDrawer(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawer$Builder;)V

    return-void
.end method

.method public static bridge synthetic s(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawer;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->setTextDrawer(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawer;)V

    return-void
.end method

.method private setDrawer(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer$Builder;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->drawer_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;

    .line 8
    .line 9
    return-void
.end method

.method private setDrawer(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;)V
    .locals 0

    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->drawer_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;

    return-void
.end method

.method private setH5PopUp(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5PopUp$Builder;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5PopUp;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->h5PopUp_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5PopUp;

    .line 8
    .line 9
    return-void
.end method

.method private setH5PopUp(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5PopUp;)V
    .locals 0

    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->h5PopUp_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5PopUp;

    return-void
.end method

.method private setOperationType(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->operationType_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setOperationTypeBytes(Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Lcom/google/protobuf/a;->checkByteStringIsUtf8(Lcom/google/protobuf/ByteString;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/google/protobuf/ByteString;->toStringUtf8()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->operationType_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setPopupType(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice$OperationPopupType;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice$OperationPopupType;->getNumber()I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    iput p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->popupType_:I

    .line 9
    .line 10
    return-void
.end method

.method private setPopupTypeValue(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->popupType_:I

    .line 2
    .line 3
    return-void
.end method

.method private setTextDrawer(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawer$Builder;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawer;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->textDrawer_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawer;

    .line 8
    .line 9
    return-void
.end method

.method private setTextDrawer(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawer;)V
    .locals 0

    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->textDrawer_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawer;

    return-void
.end method

.method private setTimestamp(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->timestamp_:J

    .line 2
    .line 3
    return-void
.end method

.method public static bridge synthetic t(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->setTimestamp(J)V

    return-void
.end method

.method public static bridge synthetic u()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;

    return-object v0
.end method


# virtual methods
.method public final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 8

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    aget p1, v0, p1

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    const/4 v0, 0x0

    .line 11
    const/4 v2, 0x1

    .line 12
    packed-switch p1, :pswitch_data_0

    .line 13
    .line 14
    .line 15
    invoke-static {}, Ll/l710;->a()V

    .line 16
    .line 17
    .line 18
    return-object v1

    .line 19
    :pswitch_0
    sget-object p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->PARSER:Ll/ng60;

    .line 20
    .line 21
    if-nez p0, :cond_1

    .line 22
    .line 23
    const-class p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;

    .line 24
    .line 25
    monitor-enter p0

    .line 26
    :try_start_0
    sget-object p1, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->PARSER:Ll/ng60;

    .line 27
    .line 28
    if-nez p1, :cond_0

    .line 29
    .line 30
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$c;

    .line 31
    .line 32
    sget-object p2, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;

    .line 33
    .line 34
    invoke-direct {p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$c;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 35
    .line 36
    .line 37
    sput-object p1, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->PARSER:Ll/ng60;

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :catchall_0
    move-exception v0

    .line 41
    move-object p1, v0

    .line 42
    goto :goto_1

    .line 43
    :cond_0
    :goto_0
    monitor-exit p0

    .line 44
    goto :goto_2

    .line 45
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 46
    throw p1

    .line 47
    :cond_1
    :goto_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->PARSER:Ll/ng60;

    .line 48
    .line 49
    return-object p0

    .line 50
    :pswitch_1
    check-cast p2, Lcom/google/protobuf/e;

    .line 51
    .line 52
    check-cast p3, Lcom/google/protobuf/h;

    .line 53
    .line 54
    :cond_2
    :goto_3
    if-nez v0, :cond_d

    .line 55
    .line 56
    :try_start_1
    invoke-virtual {p2}, Lcom/google/protobuf/e;->M()I

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    if-eqz p1, :cond_3

    .line 61
    .line 62
    const/16 v3, 0xa

    .line 63
    .line 64
    if-eq p1, v3, :cond_c

    .line 65
    .line 66
    const/16 v3, 0x10

    .line 67
    .line 68
    if-eq p1, v3, :cond_b

    .line 69
    .line 70
    const/16 v3, 0x1a

    .line 71
    .line 72
    if-eq p1, v3, :cond_9

    .line 73
    .line 74
    const/16 v3, 0x22

    .line 75
    .line 76
    if-eq p1, v3, :cond_7

    .line 77
    .line 78
    const/16 v3, 0x2a

    .line 79
    .line 80
    if-eq p1, v3, :cond_5

    .line 81
    .line 82
    const/16 v3, 0x30

    .line 83
    .line 84
    if-eq p1, v3, :cond_4

    .line 85
    .line 86
    invoke-virtual {p2, p1}, Lcom/google/protobuf/e;->R(I)Z

    .line 87
    .line 88
    .line 89
    move-result p1

    .line 90
    if-nez p1, :cond_2

    .line 91
    .line 92
    :cond_3
    move v0, v2

    .line 93
    goto :goto_3

    .line 94
    :catch_0
    move-exception v0

    .line 95
    move-object p1, v0

    .line 96
    goto/16 :goto_7

    .line 97
    .line 98
    :catch_1
    move-exception v0

    .line 99
    move-object p1, v0

    .line 100
    goto/16 :goto_8

    .line 101
    .line 102
    :cond_4
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    .line 103
    .line 104
    .line 105
    move-result-wide v3

    .line 106
    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->timestamp_:J

    .line 107
    .line 108
    goto :goto_3

    .line 109
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->h5PopUp_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5PopUp;

    .line 110
    .line 111
    if-eqz p1, :cond_6

    .line 112
    .line 113
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 114
    .line 115
    .line 116
    move-result-object p1

    .line 117
    check-cast p1, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5PopUp$Builder;

    .line 118
    .line 119
    goto :goto_4

    .line 120
    :cond_6
    move-object p1, v1

    .line 121
    :goto_4
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5PopUp;->parser()Ll/ng60;

    .line 122
    .line 123
    .line 124
    move-result-object v3

    .line 125
    invoke-virtual {p2, v3, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    .line 126
    .line 127
    .line 128
    move-result-object v3

    .line 129
    check-cast v3, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5PopUp;

    .line 130
    .line 131
    iput-object v3, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->h5PopUp_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5PopUp;

    .line 132
    .line 133
    if-eqz p1, :cond_2

    .line 134
    .line 135
    invoke-virtual {p1, v3}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 136
    .line 137
    .line 138
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 139
    .line 140
    .line 141
    move-result-object p1

    .line 142
    check-cast p1, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5PopUp;

    .line 143
    .line 144
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->h5PopUp_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5PopUp;

    .line 145
    .line 146
    goto :goto_3

    .line 147
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->drawer_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;

    .line 148
    .line 149
    if-eqz p1, :cond_8

    .line 150
    .line 151
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 152
    .line 153
    .line 154
    move-result-object p1

    .line 155
    check-cast p1, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer$Builder;

    .line 156
    .line 157
    goto :goto_5

    .line 158
    :cond_8
    move-object p1, v1

    .line 159
    :goto_5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->parser()Ll/ng60;

    .line 160
    .line 161
    .line 162
    move-result-object v3

    .line 163
    invoke-virtual {p2, v3, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    .line 164
    .line 165
    .line 166
    move-result-object v3

    .line 167
    check-cast v3, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;

    .line 168
    .line 169
    iput-object v3, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->drawer_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;

    .line 170
    .line 171
    if-eqz p1, :cond_2

    .line 172
    .line 173
    invoke-virtual {p1, v3}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 174
    .line 175
    .line 176
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 177
    .line 178
    .line 179
    move-result-object p1

    .line 180
    check-cast p1, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;

    .line 181
    .line 182
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->drawer_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;

    .line 183
    .line 184
    goto/16 :goto_3

    .line 185
    .line 186
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->textDrawer_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawer;

    .line 187
    .line 188
    if-eqz p1, :cond_a

    .line 189
    .line 190
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 191
    .line 192
    .line 193
    move-result-object p1

    .line 194
    check-cast p1, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawer$Builder;

    .line 195
    .line 196
    goto :goto_6

    .line 197
    :cond_a
    move-object p1, v1

    .line 198
    :goto_6
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawer;->parser()Ll/ng60;

    .line 199
    .line 200
    .line 201
    move-result-object v3

    .line 202
    invoke-virtual {p2, v3, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    .line 203
    .line 204
    .line 205
    move-result-object v3

    .line 206
    check-cast v3, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawer;

    .line 207
    .line 208
    iput-object v3, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->textDrawer_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawer;

    .line 209
    .line 210
    if-eqz p1, :cond_2

    .line 211
    .line 212
    invoke-virtual {p1, v3}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 213
    .line 214
    .line 215
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 216
    .line 217
    .line 218
    move-result-object p1

    .line 219
    check-cast p1, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawer;

    .line 220
    .line 221
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->textDrawer_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawer;

    .line 222
    .line 223
    goto/16 :goto_3

    .line 224
    .line 225
    :cond_b
    invoke-virtual {p2}, Lcom/google/protobuf/e;->p()I

    .line 226
    .line 227
    .line 228
    move-result p1

    .line 229
    iput p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->popupType_:I

    .line 230
    .line 231
    goto/16 :goto_3

    .line 232
    .line 233
    :cond_c
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 234
    .line 235
    .line 236
    move-result-object p1

    .line 237
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->operationType_:Ljava/lang/String;
    :try_end_1
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 238
    .line 239
    goto/16 :goto_3

    .line 240
    .line 241
    :catchall_1
    move-exception v0

    .line 242
    move-object p0, v0

    .line 243
    throw p0

    .line 244
    :goto_7
    new-instance p2, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 245
    .line 246
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 247
    .line 248
    .line 249
    move-result-object p1

    .line 250
    invoke-direct {p2, p1}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 251
    .line 252
    .line 253
    invoke-virtual {p2, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 254
    .line 255
    .line 256
    move-result-object p0

    .line 257
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 258
    .line 259
    .line 260
    return-object v1

    .line 261
    :goto_8
    invoke-virtual {p1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 262
    .line 263
    .line 264
    move-result-object p0

    .line 265
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 266
    .line 267
    .line 268
    return-object v1

    .line 269
    :cond_d
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;

    .line 270
    .line 271
    return-object p0

    .line 272
    :pswitch_3
    check-cast p2, Lcom/google/protobuf/GeneratedMessageLite$h;

    .line 273
    .line 274
    check-cast p3, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;

    .line 275
    .line 276
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->operationType_:Ljava/lang/String;

    .line 277
    .line 278
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 279
    .line 280
    .line 281
    move-result p1

    .line 282
    xor-int/2addr p1, v2

    .line 283
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->operationType_:Ljava/lang/String;

    .line 284
    .line 285
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->operationType_:Ljava/lang/String;

    .line 286
    .line 287
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    .line 288
    .line 289
    .line 290
    move-result v3

    .line 291
    xor-int/2addr v3, v2

    .line 292
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->operationType_:Ljava/lang/String;

    .line 293
    .line 294
    invoke-interface {p2, p1, v1, v3, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 295
    .line 296
    .line 297
    move-result-object p1

    .line 298
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->operationType_:Ljava/lang/String;

    .line 299
    .line 300
    iget p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->popupType_:I

    .line 301
    .line 302
    if-eqz p1, :cond_e

    .line 303
    .line 304
    move v1, v2

    .line 305
    goto :goto_9

    .line 306
    :cond_e
    move v1, v0

    .line 307
    :goto_9
    iget v3, p3, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->popupType_:I

    .line 308
    .line 309
    if-eqz v3, :cond_f

    .line 310
    .line 311
    move v4, v2

    .line 312
    goto :goto_a

    .line 313
    :cond_f
    move v4, v0

    .line 314
    :goto_a
    invoke-interface {p2, v1, p1, v4, v3}, Lcom/google/protobuf/GeneratedMessageLite$h;->e(ZIZI)I

    .line 315
    .line 316
    .line 317
    move-result p1

    .line 318
    iput p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->popupType_:I

    .line 319
    .line 320
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->textDrawer_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawer;

    .line 321
    .line 322
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->textDrawer_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawer;

    .line 323
    .line 324
    invoke-interface {p2, p1, v1}, Lcom/google/protobuf/GeneratedMessageLite$h;->o(Lcom/google/protobuf/q;Lcom/google/protobuf/q;)Lcom/google/protobuf/q;

    .line 325
    .line 326
    .line 327
    move-result-object p1

    .line 328
    check-cast p1, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawer;

    .line 329
    .line 330
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->textDrawer_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawer;

    .line 331
    .line 332
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->drawer_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;

    .line 333
    .line 334
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->drawer_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;

    .line 335
    .line 336
    invoke-interface {p2, p1, v1}, Lcom/google/protobuf/GeneratedMessageLite$h;->o(Lcom/google/protobuf/q;Lcom/google/protobuf/q;)Lcom/google/protobuf/q;

    .line 337
    .line 338
    .line 339
    move-result-object p1

    .line 340
    check-cast p1, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;

    .line 341
    .line 342
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->drawer_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;

    .line 343
    .line 344
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->h5PopUp_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5PopUp;

    .line 345
    .line 346
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->h5PopUp_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5PopUp;

    .line 347
    .line 348
    invoke-interface {p2, p1, v1}, Lcom/google/protobuf/GeneratedMessageLite$h;->o(Lcom/google/protobuf/q;Lcom/google/protobuf/q;)Lcom/google/protobuf/q;

    .line 349
    .line 350
    .line 351
    move-result-object p1

    .line 352
    check-cast p1, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5PopUp;

    .line 353
    .line 354
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->h5PopUp_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5PopUp;

    .line 355
    .line 356
    move p1, v2

    .line 357
    iget-wide v2, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->timestamp_:J

    .line 358
    .line 359
    const-wide/16 v4, 0x0

    .line 360
    .line 361
    cmp-long v1, v2, v4

    .line 362
    .line 363
    if-eqz v1, :cond_10

    .line 364
    .line 365
    move v1, p1

    .line 366
    goto :goto_b

    .line 367
    :cond_10
    move v1, v0

    .line 368
    :goto_b
    iget-wide v6, p3, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->timestamp_:J

    .line 369
    .line 370
    cmp-long p3, v6, v4

    .line 371
    .line 372
    if-eqz p3, :cond_11

    .line 373
    .line 374
    move v4, p1

    .line 375
    move-object v0, p2

    .line 376
    move-wide v5, v6

    .line 377
    goto :goto_c

    .line 378
    :cond_11
    move v4, v0

    .line 379
    move-wide v5, v6

    .line 380
    move-object v0, p2

    .line 381
    :goto_c
    invoke-interface/range {v0 .. v6}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    .line 382
    .line 383
    .line 384
    move-result-wide p1

    .line 385
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->timestamp_:J

    .line 386
    .line 387
    sget-object p1, Lcom/google/protobuf/GeneratedMessageLite$g;->INSTANCE:Lcom/google/protobuf/GeneratedMessageLite$g;

    .line 388
    .line 389
    return-object p0

    .line 390
    :pswitch_4
    new-instance p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice$Builder;

    .line 391
    .line 392
    invoke-direct {p0, v1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice$Builder;-><init>(Ll/v3w;)V

    .line 393
    .line 394
    .line 395
    return-object p0

    .line 396
    :pswitch_5
    return-object v1

    .line 397
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;

    .line 398
    .line 399
    return-object p0

    .line 400
    :pswitch_7
    new-instance p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;

    .line 401
    .line 402
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;-><init>()V

    .line 403
    .line 404
    .line 405
    return-object p0

    .line 406
    nop

    .line 407
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_1
        :pswitch_2
        :pswitch_0
    .end packed-switch
.end method

.method public getDrawer()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->drawer_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    return-object p0
.end method

.method public getH5PopUp()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5PopUp;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->h5PopUp_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5PopUp;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5PopUp;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5PopUp;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    return-object p0
.end method

.method public getOperationType()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->operationType_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getOperationTypeBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->operationType_:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/google/protobuf/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/google/protobuf/ByteString;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getPopupType()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice$OperationPopupType;
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->popupType_:I

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice$OperationPopupType;->forNumber(I)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice$OperationPopupType;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    sget-object p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice$OperationPopupType;->UNRECOGNIZED:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice$OperationPopupType;

    .line 10
    .line 11
    :cond_0
    return-object p0
.end method

.method public getPopupTypeValue()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->popupType_:I

    .line 2
    .line 3
    return p0
.end method

.method public getSerializedSize()I
    .locals 5

    .line 1
    iget v0, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-eq v0, v1, :cond_0

    .line 5
    .line 6
    return v0

    .line 7
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->operationType_:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    const/4 v0, 0x1

    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->getOperationType()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-static {v0, v1}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    goto :goto_0

    .line 25
    :cond_1
    const/4 v0, 0x0

    .line 26
    :goto_0
    iget v1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->popupType_:I

    .line 27
    .line 28
    sget-object v2, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice$OperationPopupType;->Unknown:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice$OperationPopupType;

    .line 29
    .line 30
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice$OperationPopupType;->getNumber()I

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    if-eq v1, v2, :cond_2

    .line 35
    .line 36
    const/4 v1, 0x2

    .line 37
    iget v2, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->popupType_:I

    .line 38
    .line 39
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->m(II)I

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    add-int/2addr v0, v1

    .line 44
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->textDrawer_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawer;

    .line 45
    .line 46
    if-eqz v1, :cond_3

    .line 47
    .line 48
    const/4 v1, 0x3

    .line 49
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->getTextDrawer()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawer;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    add-int/2addr v0, v1

    .line 58
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->drawer_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;

    .line 59
    .line 60
    if-eqz v1, :cond_4

    .line 61
    .line 62
    const/4 v1, 0x4

    .line 63
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->getDrawer()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    add-int/2addr v0, v1

    .line 72
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->h5PopUp_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5PopUp;

    .line 73
    .line 74
    if-eqz v1, :cond_5

    .line 75
    .line 76
    const/4 v1, 0x5

    .line 77
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->getH5PopUp()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5PopUp;

    .line 78
    .line 79
    .line 80
    move-result-object v2

    .line 81
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 82
    .line 83
    .line 84
    move-result v1

    .line 85
    add-int/2addr v0, v1

    .line 86
    :cond_5
    iget-wide v1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->timestamp_:J

    .line 87
    .line 88
    const-wide/16 v3, 0x0

    .line 89
    .line 90
    cmp-long v3, v1, v3

    .line 91
    .line 92
    if-eqz v3, :cond_6

    .line 93
    .line 94
    const/4 v3, 0x6

    .line 95
    invoke-static {v3, v1, v2}, Lcom/google/protobuf/CodedOutputStream;->v(IJ)I

    .line 96
    .line 97
    .line 98
    move-result v1

    .line 99
    add-int/2addr v0, v1

    .line 100
    :cond_6
    iput v0, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 101
    .line 102
    return v0
.end method

.method public getTextDrawer()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->textDrawer_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawer;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawer;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawer;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    return-object p0
.end method

.method public getTimestamp()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->timestamp_:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public hasDrawer()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->drawer_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public hasH5PopUp()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->h5PopUp_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5PopUp;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public hasTextDrawer()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->textDrawer_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawer;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public writeTo(Lcom/google/protobuf/CodedOutputStream;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->operationType_:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->getOperationType()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    iget v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->popupType_:I

    .line 18
    .line 19
    sget-object v1, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice$OperationPopupType;->Unknown:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice$OperationPopupType;

    .line 20
    .line 21
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice$OperationPopupType;->getNumber()I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-eq v0, v1, :cond_1

    .line 26
    .line 27
    const/4 v0, 0x2

    .line 28
    iget v1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->popupType_:I

    .line 29
    .line 30
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->i0(II)V

    .line 31
    .line 32
    .line 33
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->textDrawer_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawer;

    .line 34
    .line 35
    if-eqz v0, :cond_2

    .line 36
    .line 37
    const/4 v0, 0x3

    .line 38
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->getTextDrawer()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawer;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 43
    .line 44
    .line 45
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->drawer_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;

    .line 46
    .line 47
    if-eqz v0, :cond_3

    .line 48
    .line 49
    const/4 v0, 0x4

    .line 50
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->getDrawer()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 55
    .line 56
    .line 57
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->h5PopUp_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5PopUp;

    .line 58
    .line 59
    if-eqz v0, :cond_4

    .line 60
    .line 61
    const/4 v0, 0x5

    .line 62
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->getH5PopUp()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5PopUp;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 67
    .line 68
    .line 69
    :cond_4
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->timestamp_:J

    .line 70
    .line 71
    const-wide/16 v2, 0x0

    .line 72
    .line 73
    cmp-long p0, v0, v2

    .line 74
    .line 75
    if-eqz p0, :cond_5

    .line 76
    .line 77
    const/4 p0, 0x6

    .line 78
    invoke-virtual {p1, p0, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->u0(IJ)V

    .line 79
    .line 80
    .line 81
    :cond_5
    return-void
.end method
