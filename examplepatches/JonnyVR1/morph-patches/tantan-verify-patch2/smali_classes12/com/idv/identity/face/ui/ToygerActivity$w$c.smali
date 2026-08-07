.class Lcom/idv/identity/face/ui/ToygerActivity$w$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/idv/identity/face/ui/ToygerActivity$x;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/idv/identity/face/ui/ToygerActivity$w;->a()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/idv/identity/face/ui/ToygerActivity$w;


# direct methods
.method public constructor <init>(Lcom/idv/identity/face/ui/ToygerActivity$w;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/idv/identity/face/ui/ToygerActivity$w$c;->a:Lcom/idv/identity/face/ui/ToygerActivity$w;

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
    new-instance v2, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v3, "time out, user retry:"

    .line 10
    .line 11
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget-object v3, p0, Lcom/idv/identity/face/ui/ToygerActivity$w$c;->a:Lcom/idv/identity/face/ui/ToygerActivity$w;

    .line 15
    .line 16
    iget-object v3, v3, Lcom/idv/identity/face/ui/ToygerActivity$w;->b:Lcom/idv/identity/face/ui/ToygerActivity;

    .line 17
    .line 18
    iget v3, v3, Lcom/idv/identity/face/ui/ToygerActivity;->e:I

    .line 19
    .line 20
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    const-string v3, "status"

    .line 28
    .line 29
    filled-new-array {v3, v2}, [Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    const-string v3, "faceScan"

    .line 34
    .line 35
    invoke-virtual {v0, v1, v3, v2}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Lcom/idv/identity/face/ui/ToygerActivity$w$c;->a:Lcom/idv/identity/face/ui/ToygerActivity$w;

    .line 39
    .line 40
    iget-object p0, p0, Lcom/idv/identity/face/ui/ToygerActivity$w;->b:Lcom/idv/identity/face/ui/ToygerActivity;

    .line 41
    .line 42
    invoke-static {p0}, Lcom/idv/identity/face/ui/ToygerActivity;->a1(Lcom/idv/identity/face/ui/ToygerActivity;)V

    .line 43
    .line 44
    .line 45
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
    const-string v2, "status"

    .line 8
    .line 9
    const-string v3, "time out, user back"

    .line 10
    .line 11
    filled-new-array {v2, v3}, [Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    const-string v3, "faceScan"

    .line 16
    .line 17
    invoke-virtual {v0, v1, v3, v2}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lcom/idv/identity/face/ui/ToygerActivity$w$c;->a:Lcom/idv/identity/face/ui/ToygerActivity$w;

    .line 21
    .line 22
    iget-object p0, p0, Lcom/idv/identity/face/ui/ToygerActivity$w;->b:Lcom/idv/identity/face/ui/ToygerActivity;

    .line 23
    .line 24
    sget-object v0, Ll/dfm;->f:Ljava/lang/String;

    .line 25
    .line 26
    invoke-static {p0, v0}, Lcom/idv/identity/face/ui/ToygerActivity;->v1(Lcom/idv/identity/face/ui/ToygerActivity;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method
