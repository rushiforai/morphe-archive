.class public Lcom/p1/mobile/putong/live/external/intl/feedback/bean/IntlFeedbackPageData;
.super Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/live/external/intl/feedback/bean/IntlFeedbackPageData$GroupsDTO;
    }
.end annotation


# instance fields
.field private conversationId:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "conversationId"
    .end annotation
.end field

.field private feedbackUrl:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "feedbackUrl"
    .end annotation
.end field

.field private gradeLimit:Ljava/lang/Integer;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "gradeLimit"
    .end annotation
.end field

.field private groups:Ljava/util/List;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "groups"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/external/intl/feedback/bean/IntlFeedbackPageData$GroupsDTO;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public getConversationId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/feedback/bean/IntlFeedbackPageData;->conversationId:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getFeedbackUrl()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/feedback/bean/IntlFeedbackPageData;->feedbackUrl:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getGradeLimit()Ljava/lang/Integer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/feedback/bean/IntlFeedbackPageData;->gradeLimit:Ljava/lang/Integer;

    .line 2
    .line 3
    return-object p0
.end method

.method public getGroups()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/external/intl/feedback/bean/IntlFeedbackPageData$GroupsDTO;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/feedback/bean/IntlFeedbackPageData;->groups:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public setConversationId(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/feedback/bean/IntlFeedbackPageData;->conversationId:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setFeedbackUrl(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/feedback/bean/IntlFeedbackPageData;->feedbackUrl:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setGradeLimit(Ljava/lang/Integer;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/feedback/bean/IntlFeedbackPageData;->gradeLimit:Ljava/lang/Integer;

    .line 2
    .line 3
    return-void
.end method

.method public setGroups(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/external/intl/feedback/bean/IntlFeedbackPageData$GroupsDTO;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/feedback/bean/IntlFeedbackPageData;->groups:Ljava/util/List;

    .line 2
    .line 3
    return-void
.end method
