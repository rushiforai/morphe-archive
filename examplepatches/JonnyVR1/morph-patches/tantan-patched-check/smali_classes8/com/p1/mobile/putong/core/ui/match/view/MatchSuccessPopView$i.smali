.class public Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView$i;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->E(Lcom/p1/mobile/putong/data/User;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Landroid/animation/Animator;

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;Landroid/animation/Animator;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView$i;->b:Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView$i;->a:Landroid/animation/Animator;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView$i;->b:Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->u:Lv/VDraweeView;

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView$i;->b:Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->g:Lv/VText;

    .line 12
    .line 13
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView$i;->b:Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;

    .line 17
    .line 18
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->i:Lv/VText;

    .line 19
    .line 20
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView$i;->b:Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;

    .line 24
    .line 25
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->w:Landroid/view/View;

    .line 26
    .line 27
    const/4 v1, 0x0

    .line 28
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView$i;->b:Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;

    .line 32
    .line 33
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView;->x:Lv/VFrame;

    .line 34
    .line 35
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessPopView$i;->a:Landroid/animation/Animator;

    .line 39
    .line 40
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 41
    .line 42
    .line 43
    return-void
.end method
