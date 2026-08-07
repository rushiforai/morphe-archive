.class Lcom/idv/identity/ocr/ui/CardScanActivity$a$a$a$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/idv/identity/ocr/ui/CardScanActivity$a$a$a;->b(Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ljava/lang/String;

.field final synthetic b:Ljava/lang/String;

.field final synthetic c:Lcom/idv/identity/ocr/ui/CardScanActivity$a$a$a;


# direct methods
.method public constructor <init>(Lcom/idv/identity/ocr/ui/CardScanActivity$a$a$a;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$a$a$a$a;->c:Lcom/idv/identity/ocr/ui/CardScanActivity$a$a$a;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$a$a$a$a;->a:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$a$a$a$a;->b:Ljava/lang/String;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

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
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 8
    .line 9
    .line 10
    move-result-wide v2

    .line 11
    iget-object v4, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$a$a$a$a;->c:Lcom/idv/identity/ocr/ui/CardScanActivity$a$a$a;

    .line 12
    .line 13
    iget-wide v4, v4, Lcom/idv/identity/ocr/ui/CardScanActivity$a$a$a;->a:J

    .line 14
    .line 15
    sub-long/2addr v2, v4

    .line 16
    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    const-string v3, "status"

    .line 21
    .line 22
    const-string v4, "onCompressSuccess"

    .line 23
    .line 24
    const-string v5, "compress time"

    .line 25
    .line 26
    filled-new-array {v3, v4, v5, v2}, [Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    const-string v3, "takeSuccess"

    .line 31
    .line 32
    invoke-virtual {v0, v1, v3, v2}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$a$a$a$a;->c:Lcom/idv/identity/ocr/ui/CardScanActivity$a$a$a;

    .line 36
    .line 37
    iget-object v0, v0, Lcom/idv/identity/ocr/ui/CardScanActivity$a$a$a;->b:Lcom/idv/identity/ocr/ui/CardScanActivity$a$a;

    .line 38
    .line 39
    iget-object v0, v0, Lcom/idv/identity/ocr/ui/CardScanActivity$a$a;->b:Lcom/idv/identity/ocr/ui/CardScanActivity$a;

    .line 40
    .line 41
    iget-object v0, v0, Lcom/idv/identity/ocr/ui/CardScanActivity$a;->a:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 42
    .line 43
    iget-object v1, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$a$a$a$a;->a:Ljava/lang/String;

    .line 44
    .line 45
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$a$a$a$a;->b:Ljava/lang/String;

    .line 46
    .line 47
    invoke-static {v0, v1, p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->h1(Lcom/idv/identity/ocr/ui/CardScanActivity;Ljava/lang/String;Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method
