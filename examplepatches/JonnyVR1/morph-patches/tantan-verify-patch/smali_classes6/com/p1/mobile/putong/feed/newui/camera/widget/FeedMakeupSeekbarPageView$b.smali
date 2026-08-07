.class public Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupSeekbarPageView$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupSeekbarPageView;->h()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupSeekbarPageView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupSeekbarPageView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupSeekbarPageView$b;->a:Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupSeekbarPageView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;IZ)V
    .locals 0

    .line 1
    if-eqz p3, :cond_0

    .line 2
    .line 3
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupSeekbarPageView$b;->a:Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupSeekbarPageView;

    .line 4
    .line 5
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupSeekbarPageView;->d(Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupSeekbarPageView;I)F

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupSeekbarPageView$b;->a:Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupSeekbarPageView;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupSeekbarPageView;->h:Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;

    .line 12
    .line 13
    const/high16 p2, 0x42c80000    # 100.0f

    .line 14
    .line 15
    mul-float/2addr p2, p1

    .line 16
    float-to-int p2, p2

    .line 17
    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;->setText(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->V()Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->X()Lcom/p1/mobile/putong/feed/newui/camera/widget/viewmodel/MakeupSharedViewModel;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    new-instance p2, Landroid/util/Pair;

    .line 33
    .line 34
    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-static {p3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 39
    .line 40
    .line 41
    move-result-object p3

    .line 42
    invoke-direct {p2, p1, p3}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/feed/newui/camera/widget/viewmodel/MakeupSharedViewModel;->k(Landroid/util/Pair;)V

    .line 46
    .line 47
    .line 48
    :cond_0
    return-void
.end method

.method public b(Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;)V
    .locals 0

    .line 1
    return-void
.end method

.method public c(Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedTextSeekBar;)V
    .locals 0

    .line 1
    return-void
.end method
