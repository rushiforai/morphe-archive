.class public Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->o(IIZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout$a;->b:Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;

    .line 2
    .line 3
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout$a;->a:I

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ljava/lang/Integer;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout$a;->b:Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;

    .line 12
    .line 13
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout$a;->a:I

    .line 14
    .line 15
    invoke-virtual {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->k(II)V

    .line 16
    .line 17
    .line 18
    return-void
.end method
