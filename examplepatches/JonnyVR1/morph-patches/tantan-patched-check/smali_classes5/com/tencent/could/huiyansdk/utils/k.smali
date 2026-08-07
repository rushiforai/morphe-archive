.class public Lcom/tencent/could/huiyansdk/utils/k;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tencent/could/huiyansdk/utils/k$b;
    }
.end annotation


# instance fields
.field public a:Landroid/os/CountDownTimer;

.field public b:Lcom/tencent/could/huiyansdk/callback/c;

.field public c:Z

.field public d:J


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/tencent/could/huiyansdk/utils/k;->c:Z

    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public a(J)V
    .locals 6

    .line 1
    sget-object v0, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "start count down: "

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    const/4 v2, 0x1

    .line 18
    const-string v3, "TimeOutHelper"

    .line 19
    .line 20
    invoke-virtual {v0, v2, v3, v1}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/utils/k;->a:Landroid/os/CountDownTimer;

    .line 24
    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    invoke-virtual {v0}, Landroid/os/CountDownTimer;->cancel()V

    .line 28
    .line 29
    .line 30
    :cond_0
    iput-wide p1, p0, Lcom/tencent/could/huiyansdk/utils/k;->d:J

    .line 31
    .line 32
    const/4 v0, 0x0

    .line 33
    iput-boolean v0, p0, Lcom/tencent/could/huiyansdk/utils/k;->c:Z

    .line 34
    .line 35
    const-wide/16 v0, 0x0

    .line 36
    .line 37
    cmp-long v0, p1, v0

    .line 38
    .line 39
    if-lez v0, :cond_1

    .line 40
    .line 41
    const-wide/16 v0, 0x1

    .line 42
    .line 43
    sub-long/2addr p1, v0

    .line 44
    :cond_1
    move-wide v2, p1

    .line 45
    new-instance v0, Lcom/tencent/could/huiyansdk/utils/k$a;

    .line 46
    .line 47
    const-wide/16 v4, 0x3e8

    .line 48
    .line 49
    move-object v1, p0

    .line 50
    invoke-direct/range {v0 .. v5}, Lcom/tencent/could/huiyansdk/utils/k$a;-><init>(Lcom/tencent/could/huiyansdk/utils/k;JJ)V

    .line 51
    .line 52
    .line 53
    iput-object v0, v1, Lcom/tencent/could/huiyansdk/utils/k;->a:Landroid/os/CountDownTimer;

    .line 54
    .line 55
    invoke-virtual {v0}, Landroid/os/CountDownTimer;->start()Landroid/os/CountDownTimer;

    .line 56
    .line 57
    .line 58
    return-void
.end method
