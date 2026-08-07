.class Lcom/idv/identity/platform/FinalVerifyActivity$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/idv/identity/platform/FinalVerifyActivity$f;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/idv/identity/platform/FinalVerifyActivity;->U0()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/idv/identity/platform/FinalVerifyActivity;


# direct methods
.method public constructor <init>(Lcom/idv/identity/platform/FinalVerifyActivity;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/idv/identity/platform/FinalVerifyActivity$c;->a:Lcom/idv/identity/platform/FinalVerifyActivity;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a()V
    .locals 4

    .line 1
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/idv/identity/platform/log/RecordLevel;->LOG_INFO:Lcom/idv/identity/platform/log/RecordLevel;

    .line 6
    .line 7
    const-string v2, "status"

    .line 8
    .line 9
    const-string v3, "retry_onOK"

    .line 10
    .line 11
    filled-new-array {v2, v3}, [Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    const-string v3, "finalVerifyNetError"

    .line 16
    .line 17
    invoke-virtual {v0, v1, v3, v2}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lcom/idv/identity/platform/FinalVerifyActivity$c;->a:Lcom/idv/identity/platform/FinalVerifyActivity;

    .line 21
    .line 22
    const/4 v0, 0x1

    .line 23
    invoke-static {p0, v0}, Lcom/idv/identity/platform/FinalVerifyActivity;->N0(Lcom/idv/identity/platform/FinalVerifyActivity;Z)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public onCancel()V
    .locals 4

    .line 1
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/idv/identity/platform/log/RecordLevel;->LOG_INFO:Lcom/idv/identity/platform/log/RecordLevel;

    .line 6
    .line 7
    const-string v2, "type"

    .line 8
    .line 9
    const-string v3, "verify fail onCancel"

    .line 10
    .line 11
    filled-new-array {v2, v3}, [Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    const-string v3, "userBack"

    .line 16
    .line 17
    invoke-virtual {v0, v1, v3, v2}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lcom/idv/identity/platform/FinalVerifyActivity$c;->a:Lcom/idv/identity/platform/FinalVerifyActivity;

    .line 21
    .line 22
    sget-object v0, Ll/dfm;->n:Ljava/lang/String;

    .line 23
    .line 24
    invoke-static {p0, v0}, Lcom/idv/identity/platform/FinalVerifyActivity;->P0(Lcom/idv/identity/platform/FinalVerifyActivity;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method
