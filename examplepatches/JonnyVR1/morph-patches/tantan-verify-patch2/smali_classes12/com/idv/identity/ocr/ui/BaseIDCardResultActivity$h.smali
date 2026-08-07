.class Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$o;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->onBackPressed()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;


# direct methods
.method public constructor <init>(Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$h;->a:Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;

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
    const-string v2, "type"

    .line 8
    .line 9
    const-string v3, "keyBack"

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
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$h;->a:Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;

    .line 21
    .line 22
    sget-object v1, Ll/dfm;->f:Ljava/lang/String;

    .line 23
    .line 24
    invoke-static {v0, v1}, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->P0(Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$h;->a:Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;

    .line 28
    .line 29
    invoke-static {p0}, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->R0(Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public onCancel()V
    .locals 0

    return-void
.end method
