.class public Lcom/p1/mobile/putong/live/external/square/search/history/LiveSearchHistoryItemView$a;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/live/external/square/search/history/LiveSearchHistoryItemView;->d(Ll/x20;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Landroid/animation/ValueAnimator;

.field public final synthetic b:Ll/x20;

.field public final synthetic c:Lcom/p1/mobile/putong/live/external/square/search/history/LiveSearchHistoryItemView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/external/square/search/history/LiveSearchHistoryItemView;Landroid/animation/ValueAnimator;Ll/x20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/square/search/history/LiveSearchHistoryItemView$a;->c:Lcom/p1/mobile/putong/live/external/square/search/history/LiveSearchHistoryItemView;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/live/external/square/search/history/LiveSearchHistoryItemView$a;->a:Landroid/animation/ValueAnimator;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/p1/mobile/putong/live/external/square/search/history/LiveSearchHistoryItemView$a;->b:Ll/x20;

    .line 6
    .line 7
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;Z)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/square/search/history/LiveSearchHistoryItemView$a;->a:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/animation/Animator;->removeAllListeners()V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/square/search/history/LiveSearchHistoryItemView$a;->c:Lcom/p1/mobile/putong/live/external/square/search/history/LiveSearchHistoryItemView;

    .line 7
    .line 8
    sget p2, Lcom/p1/mobile/putong/live/external/square/search/history/LiveSearchHistoryItemView;->d:I

    .line 9
    .line 10
    invoke-static {p1, p2}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/square/search/history/LiveSearchHistoryItemView$a;->b:Ll/x20;

    .line 14
    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    invoke-interface {p0}, Ll/x20;->call()V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method
