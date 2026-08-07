.class public Lcom/tencent/could/huiyansdk/manager/d;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tencent/could/huiyansdk/manager/d$c;,
        Lcom/tencent/could/huiyansdk/manager/d$a;,
        Lcom/tencent/could/huiyansdk/manager/d$b;
    }
.end annotation


# instance fields
.field public a:Landroid/hardware/SensorManager;

.field public b:Lcom/tencent/could/huiyansdk/manager/d$a;

.field public c:Z

.field public d:Lcom/tencent/could/huiyansdk/manager/d$c;


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
    iput-boolean v0, p0, Lcom/tencent/could/huiyansdk/manager/d;->c:Z

    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public a()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/tencent/could/huiyansdk/manager/d;->c:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/manager/d;->a:Landroid/hardware/SensorManager;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 v1, 0x0

    .line 11
    iput-boolean v1, p0, Lcom/tencent/could/huiyansdk/manager/d;->c:Z

    .line 12
    .line 13
    iget-object v1, p0, Lcom/tencent/could/huiyansdk/manager/d;->b:Lcom/tencent/could/huiyansdk/manager/d$a;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;)V

    .line 16
    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    iput-object v0, p0, Lcom/tencent/could/huiyansdk/manager/d;->d:Lcom/tencent/could/huiyansdk/manager/d$c;

    .line 20
    .line 21
    :cond_1
    :goto_0
    return-void
.end method
