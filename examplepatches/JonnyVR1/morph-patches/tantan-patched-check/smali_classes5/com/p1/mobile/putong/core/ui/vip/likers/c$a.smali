.class public Lcom/p1/mobile/putong/core/ui/vip/likers/c$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/ui/vip/likers/c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/vip/likers/c;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/vip/likers/c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/c$a;->a:Lcom/p1/mobile/putong/core/ui/vip/likers/c;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/c$a;->a:Lcom/p1/mobile/putong/core/ui/vip/likers/c;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->C1(Lcom/p1/mobile/putong/data/Links;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/c$a;->a:Lcom/p1/mobile/putong/core/ui/vip/likers/c;

    .line 8
    .line 9
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 10
    .line 11
    .line 12
    move-result-wide v1

    .line 13
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->b:J

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/c$a;->a:Lcom/p1/mobile/putong/core/ui/vip/likers/c;

    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->f:Z

    .line 19
    .line 20
    return-void
.end method
