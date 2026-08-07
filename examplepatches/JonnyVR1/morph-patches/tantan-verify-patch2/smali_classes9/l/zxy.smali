.class public Ll/zxy;
.super Ll/yxy;
.source "SourceFile"


# instance fields
.field public m:I


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemType;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/yxy;-><init>(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemType;I)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput p1, p0, Ll/zxy;->m:I

    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemType;II)V
    .locals 0

    .line 8
    invoke-direct {p0, p1, p2, p3}, Ll/yxy;-><init>(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemType;II)V

    const/4 p1, 0x0

    .line 9
    iput p1, p0, Ll/zxy;->m:I

    return-void
.end method


# virtual methods
.method public c(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemView;II)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/yxy;->c(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemView;II)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Ll/zxy;->o(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemView;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final o(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemView;)V
    .locals 4

    .line 1
    iget v0, p0, Ll/zxy;->m:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    and-int/2addr v0, v1

    .line 5
    const/4 v2, 0x0

    .line 6
    if-lez v0, :cond_0

    .line 7
    .line 8
    move v0, v1

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    move v0, v2

    .line 11
    :goto_0
    iget v3, p0, Ll/rxy;->f:I

    .line 12
    .line 13
    and-int/2addr v3, v1

    .line 14
    if-lez v3, :cond_1

    .line 15
    .line 16
    goto :goto_1

    .line 17
    :cond_1
    move v1, v2

    .line 18
    :goto_1
    if-eq v0, v1, :cond_2

    .line 19
    .line 20
    const/16 v1, 0x64

    .line 21
    .line 22
    filled-new-array {v2, v1}, [I

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-static {v1}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    const-wide/16 v2, 0x96

    .line 31
    .line 32
    invoke-virtual {v1, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    new-instance v2, Ll/zxy$a;

    .line 37
    .line 38
    invoke-direct {v2, p0, v0, p1}, Ll/zxy$a;-><init>(Ll/zxy;ZLcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemView;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v1}, Landroid/animation/ValueAnimator;->start()V

    .line 45
    .line 46
    .line 47
    :cond_2
    iget p1, p0, Ll/rxy;->f:I

    .line 48
    .line 49
    iput p1, p0, Ll/zxy;->m:I

    .line 50
    .line 51
    return-void
.end method
