.class public Lcom/p1/mobile/putong/core/ui/messages/view/GroupMemberAvatarFrame;
.super Lv/VFrame_Squared;
.source "SourceFile"


# instance fields
.field public a:F


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VFrame_Squared;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const p1, 0x3f4ccccd    # 0.8f

    .line 5
    .line 6
    .line 7
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/GroupMemberAvatarFrame;->a:F

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 10
    invoke-direct {p0, p1, p2}, Lv/VFrame_Squared;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const p1, 0x3f4ccccd    # 0.8f

    .line 11
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/GroupMemberAvatarFrame;->a:F

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 12
    invoke-direct {p0, p1, p2, p3}, Lv/VFrame_Squared;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const p1, 0x3f4ccccd    # 0.8f

    .line 13
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/GroupMemberAvatarFrame;->a:F

    return-void
.end method


# virtual methods
.method public onMeasure(II)V
    .locals 2

    .line 1
    invoke-super {p0, p1, p2}, Lv/VFrame_Squared;->onMeasure(II)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    if-lez p1, :cond_0

    .line 9
    .line 10
    const/4 p1, 0x0

    .line 11
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 16
    .line 17
    .line 18
    move-result p2

    .line 19
    int-to-float p2, p2

    .line 20
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/GroupMemberAvatarFrame;->a:F

    .line 21
    .line 22
    mul-float/2addr p2, v0

    .line 23
    float-to-int p2, p2

    .line 24
    invoke-static {p2}, Ll/dox;->b(I)I

    .line 25
    .line 26
    .line 27
    move-result p2

    .line 28
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    int-to-float v0, v0

    .line 33
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/GroupMemberAvatarFrame;->a:F

    .line 34
    .line 35
    mul-float/2addr v0, v1

    .line 36
    float-to-int v0, v0

    .line 37
    invoke-static {v0}, Ll/dox;->b(I)I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    invoke-virtual {p0, p1, p2, v0}, Landroid/view/ViewGroup;->measureChild(Landroid/view/View;II)V

    .line 42
    .line 43
    .line 44
    :cond_0
    return-void
.end method
