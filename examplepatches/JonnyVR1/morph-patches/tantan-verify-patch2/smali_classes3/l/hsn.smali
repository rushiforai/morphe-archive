.class public Ll/hsn;
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

.method public static a(Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;Landroid/view/View;)V
    .locals 3

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
    move-result-object v1

    .line 8
    check-cast v1, Lv/VImage;

    .line 9
    .line 10
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;->a:Lv/VImage;

    .line 11
    .line 12
    const/4 v1, 0x2

    .line 13
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Lv/VText;

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;->b:Lv/VText;

    .line 20
    .line 21
    const/4 v1, 0x3

    .line 22
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    check-cast v1, Lv/VText;

    .line 27
    .line 28
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;->c:Lv/VText;

    .line 29
    .line 30
    const/4 v1, 0x4

    .line 31
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    check-cast v1, Lv/VRecyclerView;

    .line 36
    .line 37
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;->d:Lv/VRecyclerView;

    .line 38
    .line 39
    const/4 v1, 0x5

    .line 40
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    check-cast v2, Landroid/view/ViewGroup;

    .line 45
    .line 46
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    check-cast v0, Lv/VEditText;

    .line 51
    .line 52
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;->e:Lv/VEditText;

    .line 53
    .line 54
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    check-cast v0, Landroid/view/ViewGroup;

    .line 59
    .line 60
    const/4 v1, 0x1

    .line 61
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    check-cast v0, Lv/VText;

    .line 66
    .line 67
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;->f:Lv/VText;

    .line 68
    .line 69
    const/16 v0, 0x8

    .line 70
    .line 71
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    check-cast v0, Lv/VText;

    .line 76
    .line 77
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;->g:Lv/VText;

    .line 78
    .line 79
    const/16 v0, 0x9

    .line 80
    .line 81
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    check-cast v0, Lv/VText;

    .line 86
    .line 87
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;->h:Lv/VText;

    .line 88
    .line 89
    const/16 v0, 0xa

    .line 90
    .line 91
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    check-cast p1, Lv/VText;

    .line 96
    .line 97
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;->i:Lv/VText;

    .line 98
    .line 99
    return-void
.end method

.method public static b(Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    sget v0, Ll/kec0;->Hd:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-static {p0, p1}, Ll/hsn;->a(Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;Landroid/view/View;)V

    .line 9
    .line 10
    .line 11
    return-object p1
.end method
