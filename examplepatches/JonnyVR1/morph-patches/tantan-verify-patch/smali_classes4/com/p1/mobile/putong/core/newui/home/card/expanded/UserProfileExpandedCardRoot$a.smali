.class public Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot$a;
.super Lcom/tantan/library/svga/AnimListener;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->k1(ZFLcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Landroid/view/View;

.field public final synthetic b:Landroid/animation/AnimatorSet;

.field public final synthetic c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;Landroid/view/View;Landroid/animation/AnimatorSet;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot$a;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot$a;->a:Landroid/view/View;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot$a;->b:Landroid/animation/AnimatorSet;

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/tantan/library/svga/AnimListener;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public onFinished()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/tantan/library/svga/AnimListener;->onFinished()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot$a;->b:Landroid/animation/AnimatorSet;

    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->cancel()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onStart()V
    .locals 4

    .line 1
    invoke-super {p0}, Lcom/tantan/library/svga/AnimListener;->onStart()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot$a;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;

    .line 5
    .line 6
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->G:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedOpAnimView;

    .line 7
    .line 8
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot$a$a;

    .line 9
    .line 10
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot$a$a;-><init>(Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot$a;)V

    .line 11
    .line 12
    .line 13
    const-wide/16 v2, 0xa7

    .line 14
    .line 15
    invoke-virtual {v0, v1, v2, v3}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 16
    .line 17
    .line 18
    return-void
.end method
