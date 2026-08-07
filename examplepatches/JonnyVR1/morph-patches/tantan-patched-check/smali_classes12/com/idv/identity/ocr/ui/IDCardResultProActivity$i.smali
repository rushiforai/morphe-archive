.class Lcom/idv/identity/ocr/ui/IDCardResultProActivity$i;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/idv/identity/platform/IdentityAlertOverlay$d;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/idv/identity/ocr/ui/IDCardResultProActivity;->w1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/idv/identity/ocr/ui/IDCardResultProActivity$m;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ljava/lang/String;

.field final synthetic b:Lcom/idv/identity/ocr/ui/IDCardResultProActivity$m;

.field final synthetic c:Lcom/idv/identity/ocr/ui/IDCardResultProActivity;


# direct methods
.method public constructor <init>(Lcom/idv/identity/ocr/ui/IDCardResultProActivity;Ljava/lang/String;Lcom/idv/identity/ocr/ui/IDCardResultProActivity$m;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/idv/identity/ocr/ui/IDCardResultProActivity$i;->c:Lcom/idv/identity/ocr/ui/IDCardResultProActivity;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/idv/identity/ocr/ui/IDCardResultProActivity$i;->a:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/idv/identity/ocr/ui/IDCardResultProActivity$i;->b:Lcom/idv/identity/ocr/ui/IDCardResultProActivity$m;

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
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/IDCardResultProActivity$i;->a:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "OCR_RESULT"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/idv/identity/platform/log/RecordService;->recordOcrAlertConfirm(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/IDCardResultProActivity$i;->a:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {v0, v1}, Lcom/idv/identity/platform/log/RecordService;->recordOcrAlertClose(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/IDCardResultProActivity$i;->b:Lcom/idv/identity/ocr/ui/IDCardResultProActivity$m;

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-interface {v0}, Lcom/idv/identity/ocr/ui/IDCardResultProActivity$m;->a()V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/IDCardResultProActivity$i;->c:Lcom/idv/identity/ocr/ui/IDCardResultProActivity;

    .line 21
    .line 22
    const/4 v1, 0x1

    .line 23
    invoke-virtual {v0, v1}, Lcom/idv/identity/ocr/ui/IDCardResultProActivity;->a1(Z)V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/IDCardResultProActivity$i;->c:Lcom/idv/identity/ocr/ui/IDCardResultProActivity;

    .line 27
    .line 28
    const/4 v0, 0x0

    .line 29
    invoke-static {p0, v0}, Lcom/idv/identity/ocr/ui/IDCardResultProActivity;->S0(Lcom/idv/identity/ocr/ui/IDCardResultProActivity;Z)Z

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method

.method public onCancel()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/IDCardResultProActivity$i;->a:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "OCR_RESULT"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/idv/identity/platform/log/RecordService;->recordOcrAlertCancel(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/IDCardResultProActivity$i;->a:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {v0, v1}, Lcom/idv/identity/platform/log/RecordService;->recordOcrAlertClose(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/IDCardResultProActivity$i;->b:Lcom/idv/identity/ocr/ui/IDCardResultProActivity$m;

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-interface {v0}, Lcom/idv/identity/ocr/ui/IDCardResultProActivity$m;->onCancel()V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/IDCardResultProActivity$i;->c:Lcom/idv/identity/ocr/ui/IDCardResultProActivity;

    .line 21
    .line 22
    const/4 v1, 0x1

    .line 23
    invoke-virtual {v0, v1}, Lcom/idv/identity/ocr/ui/IDCardResultProActivity;->a1(Z)V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/IDCardResultProActivity$i;->c:Lcom/idv/identity/ocr/ui/IDCardResultProActivity;

    .line 27
    .line 28
    const/4 v0, 0x0

    .line 29
    invoke-static {p0, v0}, Lcom/idv/identity/ocr/ui/IDCardResultProActivity;->S0(Lcom/idv/identity/ocr/ui/IDCardResultProActivity;Z)Z

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method
