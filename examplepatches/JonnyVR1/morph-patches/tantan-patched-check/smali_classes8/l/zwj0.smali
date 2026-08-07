.class public final synthetic Ll/zwj0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UndoFlipFrameLayout;

.field public final synthetic b:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UndoFlipFrameLayout;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zwj0;->a:Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UndoFlipFrameLayout;

    iput-object p2, p0, Ll/zwj0;->b:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/zwj0;->a:Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UndoFlipFrameLayout;

    iget-object p0, p0, Ll/zwj0;->b:Ljava/util/List;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UndoFlipFrameLayout;->b(Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UndoFlipFrameLayout;Ljava/util/List;Landroid/animation/ValueAnimator;)V

    return-void
.end method
