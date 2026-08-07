.class public Ll/wwm;
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

.method public static a(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaMediaItemView;Landroid/view/View;)V
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
    move-result-object v0

    .line 8
    check-cast v0, Lv/VDraweeView;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaMediaItemView;->a:Lv/VDraweeView;

    .line 11
    .line 12
    const/4 v0, 0x1

    .line 13
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Landroid/widget/ImageView;

    .line 18
    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaMediaItemView;->b:Landroid/widget/ImageView;

    .line 20
    .line 21
    const/4 v0, 0x2

    .line 22
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    check-cast v0, Lv/VText;

    .line 27
    .line 28
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaMediaItemView;->c:Lv/VText;

    .line 29
    .line 30
    const/4 v0, 0x3

    .line 31
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaMediaItemView;->d:Landroid/view/View;

    .line 36
    .line 37
    const/4 v0, 0x4

    .line 38
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/mediapicker/MarkView;

    .line 43
    .line 44
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaMediaItemView;->e:Lcom/p1/mobile/putong/feed/newui/mediapicker/MarkView;

    .line 45
    .line 46
    return-void
.end method
