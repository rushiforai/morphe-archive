.class Lcom/idv/identity/ocr/ui/CardScanActivity$a$a$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/jt5$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/idv/identity/ocr/ui/CardScanActivity$a$a;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:J

.field final synthetic b:Lcom/idv/identity/ocr/ui/CardScanActivity$a$a;


# direct methods
.method public constructor <init>(Lcom/idv/identity/ocr/ui/CardScanActivity$a$a;J)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$a$a$a;->b:Lcom/idv/identity/ocr/ui/CardScanActivity$a$a;

    .line 2
    .line 3
    iput-wide p2, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$a$a$a;->a:J

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;Ljava/lang/String;)V
    .locals 5

    .line 1
    iget-object p1, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$a$a$a;->b:Lcom/idv/identity/ocr/ui/CardScanActivity$a$a;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/idv/identity/ocr/ui/CardScanActivity$a$a;->b:Lcom/idv/identity/ocr/ui/CardScanActivity$a;

    .line 4
    .line 5
    iget-object p1, p1, Lcom/idv/identity/ocr/ui/CardScanActivity$a;->a:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-virtual {p1, v0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->g3(Z)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$a$a$a;->b:Lcom/idv/identity/ocr/ui/CardScanActivity$a$a;

    .line 12
    .line 13
    iget-object p1, p1, Lcom/idv/identity/ocr/ui/CardScanActivity$a$a;->b:Lcom/idv/identity/ocr/ui/CardScanActivity$a;

    .line 14
    .line 15
    iget-object p1, p1, Lcom/idv/identity/ocr/ui/CardScanActivity$a;->a:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 16
    .line 17
    const/4 v1, 0x1

    .line 18
    invoke-static {p1, v1}, Lcom/idv/identity/ocr/ui/CardScanActivity;->j1(Lcom/idv/identity/ocr/ui/CardScanActivity;Z)V

    .line 19
    .line 20
    .line 21
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    sget-object v1, Lcom/idv/identity/platform/log/RecordLevel;->LOG_ERROR:Lcom/idv/identity/platform/log/RecordLevel;

    .line 26
    .line 27
    const-string v2, "compressError"

    .line 28
    .line 29
    const-string v3, "msg"

    .line 30
    .line 31
    const-string v4, "status"

    .line 32
    .line 33
    filled-new-array {v4, v2, v3, p2}, [Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p2

    .line 37
    const-string v2, "takeSuccess"

    .line 38
    .line 39
    invoke-virtual {p1, v1, v2, p2}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    iget-object p1, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$a$a$a;->b:Lcom/idv/identity/ocr/ui/CardScanActivity$a$a;

    .line 43
    .line 44
    iget-object p1, p1, Lcom/idv/identity/ocr/ui/CardScanActivity$a$a;->b:Lcom/idv/identity/ocr/ui/CardScanActivity$a;

    .line 45
    .line 46
    iget-object p1, p1, Lcom/idv/identity/ocr/ui/CardScanActivity$a;->a:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 47
    .line 48
    iget-object p1, p1, Lcom/idv/identity/ocr/ui/CardScanActivity;->u:Ljava/lang/String;

    .line 49
    .line 50
    sget-object p2, Lcom/idv/identity/ocr/ui/CardScanActivity;->J0:Ljava/lang/String;

    .line 51
    .line 52
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    if-eqz p1, :cond_0

    .line 57
    .line 58
    iget-object p1, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$a$a$a;->b:Lcom/idv/identity/ocr/ui/CardScanActivity$a$a;

    .line 59
    .line 60
    iget-object p1, p1, Lcom/idv/identity/ocr/ui/CardScanActivity$a$a;->b:Lcom/idv/identity/ocr/ui/CardScanActivity$a;

    .line 61
    .line 62
    iget-object p1, p1, Lcom/idv/identity/ocr/ui/CardScanActivity$a;->a:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 63
    .line 64
    invoke-static {p1}, Lcom/idv/identity/ocr/ui/CardScanActivity;->u1(Lcom/idv/identity/ocr/ui/CardScanActivity;)Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    invoke-virtual {p1, v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 69
    .line 70
    .line 71
    iget-object p1, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$a$a$a;->b:Lcom/idv/identity/ocr/ui/CardScanActivity$a$a;

    .line 72
    .line 73
    iget-object p1, p1, Lcom/idv/identity/ocr/ui/CardScanActivity$a$a;->b:Lcom/idv/identity/ocr/ui/CardScanActivity$a;

    .line 74
    .line 75
    iget-object p1, p1, Lcom/idv/identity/ocr/ui/CardScanActivity$a;->a:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 76
    .line 77
    invoke-static {p1}, Lcom/idv/identity/ocr/ui/CardScanActivity;->P0(Lcom/idv/identity/ocr/ui/CardScanActivity;)Lcom/idv/identity/ocr/IdentityScanView;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    if-eqz p1, :cond_0

    .line 82
    .line 83
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$a$a$a;->b:Lcom/idv/identity/ocr/ui/CardScanActivity$a$a;

    .line 84
    .line 85
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$a$a;->b:Lcom/idv/identity/ocr/ui/CardScanActivity$a;

    .line 86
    .line 87
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$a;->a:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 88
    .line 89
    invoke-static {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->P0(Lcom/idv/identity/ocr/ui/CardScanActivity;)Lcom/idv/identity/ocr/IdentityScanView;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    invoke-virtual {p0}, Lcom/idv/identity/ocr/IdentityScanView;->i()V

    .line 94
    .line 95
    .line 96
    :cond_0
    return-void
.end method

.method public b(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$a$a$a;->b:Lcom/idv/identity/ocr/ui/CardScanActivity$a$a;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/idv/identity/ocr/ui/CardScanActivity$a$a;->b:Lcom/idv/identity/ocr/ui/CardScanActivity$a;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/idv/identity/ocr/ui/CardScanActivity$a;->a:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/idv/identity/ocr/ui/CardScanActivity;->p0:Landroid/os/Handler;

    .line 8
    .line 9
    new-instance v1, Lcom/idv/identity/ocr/ui/CardScanActivity$a$a$a$a;

    .line 10
    .line 11
    invoke-direct {v1, p0, p1, p2}, Lcom/idv/identity/ocr/ui/CardScanActivity$a$a$a$a;-><init>(Lcom/idv/identity/ocr/ui/CardScanActivity$a$a$a;Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 15
    .line 16
    .line 17
    return-void
.end method
