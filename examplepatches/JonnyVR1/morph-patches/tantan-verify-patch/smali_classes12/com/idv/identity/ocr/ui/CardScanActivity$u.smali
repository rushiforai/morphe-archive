.class Lcom/idv/identity/ocr/ui/CardScanActivity$u;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/idv/identity/ocr/ui/CardScanActivity$x;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/idv/identity/ocr/ui/CardScanActivity;->y2()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/idv/identity/ocr/ui/CardScanActivity;


# direct methods
.method public constructor <init>(Lcom/idv/identity/ocr/ui/CardScanActivity;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$u;->a:Lcom/idv/identity/ocr/ui/CardScanActivity;

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
    const-string v3, "onMessageOCRError"

    .line 16
    .line 17
    invoke-virtual {v0, v1, v3, v2}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$u;->a:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 21
    .line 22
    invoke-static {v0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->u1(Lcom/idv/identity/ocr/ui/CardScanActivity;)Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    const/4 v1, 0x0

    .line 27
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$u;->a:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 31
    .line 32
    invoke-static {v0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->S0(Lcom/idv/identity/ocr/ui/CardScanActivity;)Lcom/idv/identity/ocr/OcrType;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-static {v0, v1}, Lcom/idv/identity/ocr/ui/CardScanActivity;->B1(Lcom/idv/identity/ocr/ui/CardScanActivity;Lcom/idv/identity/ocr/OcrType;)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$u;->a:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 40
    .line 41
    invoke-static {v0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->W0(Lcom/idv/identity/ocr/ui/CardScanActivity;)V

    .line 42
    .line 43
    .line 44
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$u;->a:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 45
    .line 46
    invoke-static {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->X0(Lcom/idv/identity/ocr/ui/CardScanActivity;)V

    .line 47
    .line 48
    .line 49
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
    const-string v3, "closeButton"

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
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$u;->a:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 21
    .line 22
    sget-object v0, Ll/dfm;->f:Ljava/lang/String;

    .line 23
    .line 24
    invoke-static {p0, v0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->V0(Lcom/idv/identity/ocr/ui/CardScanActivity;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method
