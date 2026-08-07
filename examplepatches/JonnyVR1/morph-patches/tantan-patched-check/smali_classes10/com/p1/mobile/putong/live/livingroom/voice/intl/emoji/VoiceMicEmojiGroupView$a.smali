.class public Lcom/p1/mobile/putong/live/livingroom/voice/intl/emoji/VoiceMicEmojiGroupView$a;
.super Landroidx/recyclerview/widget/RecyclerView$n;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/live/livingroom/voice/intl/emoji/VoiceMicEmojiGroupView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$n;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public getItemOffsets(Landroid/graphics/Rect;Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$a0;)V
    .locals 0

    .line 1
    invoke-virtual {p4}, Landroidx/recyclerview/widget/RecyclerView$a0;->c()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    add-int/lit8 p0, p0, -0x1

    .line 6
    .line 7
    invoke-virtual {p3, p2}, Landroidx/recyclerview/widget/RecyclerView;->getChildAdapterPosition(Landroid/view/View;)I

    .line 8
    .line 9
    .line 10
    move-result p2

    .line 11
    const/4 p3, -0x1

    .line 12
    if-ne p2, p3, :cond_0

    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    const/4 p3, 0x0

    .line 16
    iput p3, p1, Landroid/graphics/Rect;->top:I

    .line 17
    .line 18
    iput p3, p1, Landroid/graphics/Rect;->bottom:I

    .line 19
    .line 20
    const/high16 p4, 0x41500000    # 13.0f

    .line 21
    .line 22
    if-nez p2, :cond_1

    .line 23
    .line 24
    invoke-static {p4}, Ll/qa00;->d(F)I

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    iput p0, p1, Landroid/graphics/Rect;->left:I

    .line 29
    .line 30
    iput p3, p1, Landroid/graphics/Rect;->right:I

    .line 31
    .line 32
    return-void

    .line 33
    :cond_1
    if-ne p2, p0, :cond_2

    .line 34
    .line 35
    iput p3, p1, Landroid/graphics/Rect;->left:I

    .line 36
    .line 37
    invoke-static {p4}, Ll/qa00;->d(F)I

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    iput p0, p1, Landroid/graphics/Rect;->right:I

    .line 42
    .line 43
    return-void

    .line 44
    :cond_2
    iput p3, p1, Landroid/graphics/Rect;->right:I

    .line 45
    .line 46
    iput p3, p1, Landroid/graphics/Rect;->left:I

    .line 47
    .line 48
    return-void
.end method
