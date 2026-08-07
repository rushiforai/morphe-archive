.class Lcom/p1/mobile/putong/core/newui/helpcenter/NewHelpCenterFrag$LiveQuestion;
.super Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$Question;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/newui/helpcenter/NewHelpCenterFrag;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "LiveQuestion"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x0

    .line 3
    const-string v2, "about_live"

    .line 4
    .line 5
    invoke-direct {p0, v2, v0, v1}, Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$Question;-><init>(Ljava/lang/String;ILjava/util/List;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public getTitle()Ljava/lang/CharSequence;
    .locals 0

    .line 1
    const-string p0, "\u76f4\u64ad\u529f\u80fd\u600e\u4e48\u73a9"

    .line 2
    .line 3
    return-object p0
.end method
