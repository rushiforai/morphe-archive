.class Lcom/idv/identity/platform/CardGuideActivity$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/idv/identity/platform/IdentityAlertOverlay$d;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/idv/identity/platform/CardGuideActivity;->k1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/idv/identity/platform/CardGuideActivity$k;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/idv/identity/platform/CardGuideActivity$k;

.field final synthetic b:Lcom/idv/identity/platform/CardGuideActivity;


# direct methods
.method public constructor <init>(Lcom/idv/identity/platform/CardGuideActivity;Lcom/idv/identity/platform/CardGuideActivity$k;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/idv/identity/platform/CardGuideActivity$a;->b:Lcom/idv/identity/platform/CardGuideActivity;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/idv/identity/platform/CardGuideActivity$a;->a:Lcom/idv/identity/platform/CardGuideActivity$k;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/idv/identity/platform/CardGuideActivity$a;->b:Lcom/idv/identity/platform/CardGuideActivity;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Lcom/idv/identity/platform/CardGuideActivity;->P0(Lcom/idv/identity/platform/CardGuideActivity;Z)V

    .line 5
    .line 6
    .line 7
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sget-object v1, Lcom/idv/identity/platform/log/RecordLevel;->LOG_INFO:Lcom/idv/identity/platform/log/RecordLevel;

    .line 12
    .line 13
    const-string v2, "PAGER_BEHAVIOR"

    .line 14
    .line 15
    const-string v3, "exitConfirmBtn"

    .line 16
    .line 17
    const-string v4, "GUIDE"

    .line 18
    .line 19
    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/idv/identity/platform/log/RecordService;->recordEventBehavior(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    const-string v3, "exitAlertClose"

    .line 27
    .line 28
    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/idv/identity/platform/log/RecordService;->recordEventBehavior(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Lcom/idv/identity/platform/CardGuideActivity$a;->a:Lcom/idv/identity/platform/CardGuideActivity$k;

    .line 32
    .line 33
    if-eqz p0, :cond_0

    .line 34
    .line 35
    invoke-interface {p0}, Lcom/idv/identity/platform/CardGuideActivity$k;->a()V

    .line 36
    .line 37
    .line 38
    :cond_0
    return-void
.end method

.method public onCancel()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/idv/identity/platform/CardGuideActivity$a;->b:Lcom/idv/identity/platform/CardGuideActivity;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Lcom/idv/identity/platform/CardGuideActivity;->P0(Lcom/idv/identity/platform/CardGuideActivity;Z)V

    .line 5
    .line 6
    .line 7
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sget-object v1, Lcom/idv/identity/platform/log/RecordLevel;->LOG_INFO:Lcom/idv/identity/platform/log/RecordLevel;

    .line 12
    .line 13
    const-string v2, "PAGER_BEHAVIOR"

    .line 14
    .line 15
    const-string v3, "exitCancelBtn"

    .line 16
    .line 17
    const-string v4, "GUIDE"

    .line 18
    .line 19
    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/idv/identity/platform/log/RecordService;->recordEventBehavior(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    const-string v3, "exitAlertClose"

    .line 27
    .line 28
    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/idv/identity/platform/log/RecordService;->recordEventBehavior(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Lcom/idv/identity/platform/CardGuideActivity$a;->a:Lcom/idv/identity/platform/CardGuideActivity$k;

    .line 32
    .line 33
    if-eqz p0, :cond_0

    .line 34
    .line 35
    invoke-interface {p0}, Lcom/idv/identity/platform/CardGuideActivity$k;->onCancel()V

    .line 36
    .line 37
    .line 38
    :cond_0
    return-void
.end method
