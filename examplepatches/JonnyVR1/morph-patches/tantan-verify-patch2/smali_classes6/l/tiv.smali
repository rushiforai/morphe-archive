.class public Ll/tiv;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Lcom/p1/mobile/putong/live/base/view/LivingNewTagView;Landroid/view/View;)V
    .locals 1

    .line 1
    check-cast p1, Landroid/view/ViewGroup;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    check-cast p1, Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;

    .line 9
    .line 10
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/view/LivingNewTagView;->a:Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;

    .line 11
    .line 12
    return-void
.end method
