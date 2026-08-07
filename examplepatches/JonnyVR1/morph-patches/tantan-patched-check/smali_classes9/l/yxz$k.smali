.class public Ll/yxz$k;
.super Ll/gt0$j;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/yxz;->q5(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/yxz;


# direct methods
.method public constructor <init>(Ll/yxz;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/yxz$k;->a:Ll/yxz;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/gt0$j;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/gt0$j;->onAnimationStart(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/yxz$k;->a:Ll/yxz;

    .line 5
    .line 6
    iget-object p0, p0, Ll/qzz;->a:Landroid/widget/LinearLayout;

    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
