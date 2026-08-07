.class public Lcom/p1/mobile/putong/feed/newui/featured/FeedCountDownView$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/feed/newui/featured/FeedCountDownView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation


# instance fields
.field public a:J

.field public b:Ljava/lang/Runnable;

.field public final synthetic c:Lcom/p1/mobile/putong/feed/newui/featured/FeedCountDownView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/featured/FeedCountDownView;J)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/featured/FeedCountDownView$a;->c:Lcom/p1/mobile/putong/feed/newui/featured/FeedCountDownView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance p1, Ll/nxg;

    .line 7
    .line 8
    invoke-direct {p1, p0}, Ll/nxg;-><init>(Lcom/p1/mobile/putong/feed/newui/featured/FeedCountDownView$a;)V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/featured/FeedCountDownView$a;->b:Ljava/lang/Runnable;

    .line 12
    .line 13
    iput-wide p2, p0, Lcom/p1/mobile/putong/feed/newui/featured/FeedCountDownView$a;->a:J

    .line 14
    .line 15
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/feed/newui/featured/FeedCountDownView$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/featured/FeedCountDownView$a;->b()V

    return-void
.end method


# virtual methods
.method public final synthetic b()V
    .locals 5

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/putong/feed/newui/featured/FeedCountDownView$a;->a:J

    .line 2
    .line 3
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 4
    .line 5
    .line 6
    move-result-wide v2

    .line 7
    sub-long/2addr v0, v2

    .line 8
    const-wide/16 v2, 0x0

    .line 9
    .line 10
    cmp-long v0, v0, v2

    .line 11
    .line 12
    if-gtz v0, :cond_0

    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/featured/FeedCountDownView$a;->c:Lcom/p1/mobile/putong/feed/newui/featured/FeedCountDownView;

    .line 16
    .line 17
    iget-wide v1, p0, Lcom/p1/mobile/putong/feed/newui/featured/FeedCountDownView$a;->a:J

    .line 18
    .line 19
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 20
    .line 21
    .line 22
    move-result-wide v3

    .line 23
    sub-long/2addr v1, v3

    .line 24
    invoke-static {v0, v1, v2}, Lcom/p1/mobile/putong/feed/newui/featured/FeedCountDownView;->Q(Lcom/p1/mobile/putong/feed/newui/featured/FeedCountDownView;J)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/featured/FeedCountDownView$a;->c:Lcom/p1/mobile/putong/feed/newui/featured/FeedCountDownView;

    .line 28
    .line 29
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/featured/FeedCountDownView;->P(Lcom/p1/mobile/putong/feed/newui/featured/FeedCountDownView;)Lcom/p1/mobile/putong/feed/newui/featured/FeedCountDownView$a;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/featured/FeedCountDownView$a;->b:Ljava/lang/Runnable;

    .line 34
    .line 35
    const-wide/16 v1, 0x3e8

    .line 36
    .line 37
    invoke-virtual {p0, v0, v1, v2}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public c()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/featured/FeedCountDownView$a;->c:Lcom/p1/mobile/putong/feed/newui/featured/FeedCountDownView;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/featured/FeedCountDownView$a;->b:Ljava/lang/Runnable;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 6
    .line 7
    .line 8
    return-void
.end method
