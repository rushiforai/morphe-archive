.class Lcom/idv/identity/ocr/ui/CardScanActivity$n;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/idv/identity/platform/IdentityAlertOverlay$d;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/idv/identity/ocr/ui/CardScanActivity;->h3(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/idv/identity/ocr/ui/CardScanActivity$x;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ljava/lang/String;

.field final synthetic b:Lcom/idv/identity/ocr/ui/CardScanActivity$x;

.field final synthetic c:Lcom/idv/identity/ocr/ui/CardScanActivity;


# direct methods
.method public constructor <init>(Lcom/idv/identity/ocr/ui/CardScanActivity;Ljava/lang/String;Lcom/idv/identity/ocr/ui/CardScanActivity$x;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$n;->c:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$n;->a:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$n;->b:Lcom/idv/identity/ocr/ui/CardScanActivity$x;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$n;->a:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/idv/identity/platform/log/RecordService;->recordOcrAlertConfirm(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$n;->a:Ljava/lang/String;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/idv/identity/platform/log/RecordService;->recordOcrAlertClose(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$n;->b:Lcom/idv/identity/ocr/ui/CardScanActivity$x;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-interface {v0}, Lcom/idv/identity/ocr/ui/CardScanActivity$x;->a()V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$n;->c:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 19
    .line 20
    const/4 v1, 0x1

    .line 21
    invoke-static {v0, v1}, Lcom/idv/identity/ocr/ui/CardScanActivity;->j1(Lcom/idv/identity/ocr/ui/CardScanActivity;Z)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$n;->c:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 25
    .line 26
    const/4 v1, 0x0

    .line 27
    invoke-static {v0, v1}, Lcom/idv/identity/ocr/ui/CardScanActivity;->t1(Lcom/idv/identity/ocr/ui/CardScanActivity;Z)Z

    .line 28
    .line 29
    .line 30
    :cond_0
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$n;->c:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 31
    .line 32
    invoke-static {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->W0(Lcom/idv/identity/ocr/ui/CardScanActivity;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public onCancel()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$n;->a:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/idv/identity/platform/log/RecordService;->recordOcrAlertCancel(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$n;->a:Ljava/lang/String;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/idv/identity/platform/log/RecordService;->recordOcrAlertClose(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$n;->b:Lcom/idv/identity/ocr/ui/CardScanActivity$x;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-interface {v0}, Lcom/idv/identity/ocr/ui/CardScanActivity$x;->onCancel()V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$n;->c:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 19
    .line 20
    const/4 v1, 0x1

    .line 21
    invoke-static {v0, v1}, Lcom/idv/identity/ocr/ui/CardScanActivity;->j1(Lcom/idv/identity/ocr/ui/CardScanActivity;Z)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$n;->c:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 25
    .line 26
    const/4 v1, 0x0

    .line 27
    invoke-static {v0, v1}, Lcom/idv/identity/ocr/ui/CardScanActivity;->t1(Lcom/idv/identity/ocr/ui/CardScanActivity;Z)Z

    .line 28
    .line 29
    .line 30
    :cond_0
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$n;->c:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 31
    .line 32
    invoke-static {v0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->u1(Lcom/idv/identity/ocr/ui/CardScanActivity;)Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-nez v0, :cond_1

    .line 41
    .line 42
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$n;->c:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 43
    .line 44
    invoke-static {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->W0(Lcom/idv/identity/ocr/ui/CardScanActivity;)V

    .line 45
    .line 46
    .line 47
    :cond_1
    return-void
.end method
