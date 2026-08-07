.class public Ll/ayy$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/ayy;->o(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemView;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Z

.field public final synthetic c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemView;

.field public final synthetic d:Ll/ayy;


# direct methods
.method public constructor <init>(Ll/ayy;ZZLcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/ayy$a;->d:Ll/ayy;

    .line 2
    .line 3
    iput-boolean p2, p0, Ll/ayy$a;->a:Z

    .line 4
    .line 5
    iput-boolean p3, p0, Ll/ayy$a;->b:Z

    .line 6
    .line 7
    iput-object p4, p0, Ll/ayy$a;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemView;

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 3

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
    iget-boolean v0, p0, Ll/ayy$a;->a:Z

    .line 12
    .line 13
    iget-object v1, p0, Ll/ayy$a;->d:Ll/ayy;

    .line 14
    .line 15
    if-eqz v0, :cond_2

    .line 16
    .line 17
    iget-boolean v0, p0, Ll/ayy$a;->b:Z

    .line 18
    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget v2, v1, Ll/yxy;->l:I

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    iget v2, v1, Ll/yxy;->j:I

    .line 25
    .line 26
    :goto_0
    if-eqz v0, :cond_1

    .line 27
    .line 28
    iget v0, v1, Ll/yxy;->k:I

    .line 29
    .line 30
    goto :goto_1

    .line 31
    :cond_1
    iget v0, v1, Ll/yxy;->i:I

    .line 32
    .line 33
    :goto_1
    invoke-virtual {v1, v2, v0, p1}, Ll/yxy;->m(III)I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    goto :goto_4

    .line 38
    :cond_2
    iget-boolean v0, p0, Ll/ayy$a;->b:Z

    .line 39
    .line 40
    if-eqz v0, :cond_3

    .line 41
    .line 42
    iget v2, v1, Ll/yxy;->k:I

    .line 43
    .line 44
    goto :goto_2

    .line 45
    :cond_3
    iget v2, v1, Ll/yxy;->i:I

    .line 46
    .line 47
    :goto_2
    if-eqz v0, :cond_4

    .line 48
    .line 49
    iget v0, v1, Ll/yxy;->l:I

    .line 50
    .line 51
    goto :goto_3

    .line 52
    :cond_4
    iget v0, v1, Ll/yxy;->j:I

    .line 53
    .line 54
    :goto_3
    invoke-virtual {v1, v2, v0, p1}, Ll/yxy;->m(III)I

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    :goto_4
    iget-object v1, p0, Ll/ayy$a;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemView;

    .line 59
    .line 60
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemView;->a:Lv/VImage;

    .line 61
    .line 62
    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setColorFilter(I)V

    .line 63
    .line 64
    .line 65
    iget-object v0, p0, Ll/ayy$a;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemView;

    .line 66
    .line 67
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemView;->a:Lv/VImage;

    .line 68
    .line 69
    iget-boolean p0, p0, Ll/ayy$a;->a:Z

    .line 70
    .line 71
    const/high16 v1, 0x42c80000    # 100.0f

    .line 72
    .line 73
    const/high16 v2, -0x3dcc0000    # -45.0f

    .line 74
    .line 75
    if-eqz p0, :cond_5

    .line 76
    .line 77
    const/high16 p0, 0x42340000    # 45.0f

    .line 78
    .line 79
    int-to-float p1, p1

    .line 80
    mul-float/2addr p1, p0

    .line 81
    div-float/2addr p1, v1

    .line 82
    add-float/2addr p1, v2

    .line 83
    goto :goto_5

    .line 84
    :cond_5
    int-to-float p0, p1

    .line 85
    mul-float/2addr p0, v2

    .line 86
    div-float p1, p0, v1

    .line 87
    .line 88
    :goto_5
    invoke-virtual {v0, p1}, Landroid/view/View;->setRotation(F)V

    .line 89
    .line 90
    .line 91
    return-void
.end method
