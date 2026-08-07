.class public Lcom/p1/mobile/putong/live/livingroom/common/roomsuggest/view/LiveRoomSuggestSubView$b;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/live/livingroom/common/roomsuggest/view/LiveRoomSuggestSubView;->V()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/common/roomsuggest/view/LiveRoomSuggestSubView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/common/roomsuggest/view/LiveRoomSuggestSubView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/roomsuggest/view/LiveRoomSuggestSubView$b;->a:Lcom/p1/mobile/putong/live/livingroom/common/roomsuggest/view/LiveRoomSuggestSubView;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationEnd(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/roomsuggest/view/LiveRoomSuggestSubView$b;->a:Lcom/p1/mobile/putong/live/livingroom/common/roomsuggest/view/LiveRoomSuggestSubView;

    .line 5
    .line 6
    const/high16 v0, 0x3f800000    # 1.0f

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Landroid/view/View;->setAlpha(F)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/roomsuggest/view/LiveRoomSuggestSubView$b;->a:Lcom/p1/mobile/putong/live/livingroom/common/roomsuggest/view/LiveRoomSuggestSubView;

    .line 12
    .line 13
    const/16 p1, 0x8

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 16
    .line 17
    .line 18
    return-void
.end method
