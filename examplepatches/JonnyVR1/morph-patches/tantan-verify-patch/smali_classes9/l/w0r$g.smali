.class public Ll/w0r$g;
.super Ll/dq1;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/w0r;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "g"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/dq1<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Lcom/p1/mobile/putong/core/data/StickerPackage;

.field public final d:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Lcom/p1/mobile/putong/core/data/Sticker;",
            ">;"
        }
    .end annotation
.end field

.field public e:Lcom/p1/mobile/android/app/Act;

.field public f:Landroid/widget/PopupWindow;

.field public final synthetic g:Ll/w0r;


# direct methods
.method public constructor <init>(Ll/w0r;Ll/y20;Lcom/p1/mobile/putong/core/data/StickerPackage;Lcom/p1/mobile/android/app/Act;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/core/data/Sticker;",
            ">;",
            "Lcom/p1/mobile/putong/core/data/StickerPackage;",
            "Lcom/p1/mobile/android/app/Act;",
            ")V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/w0r$g;->g:Ll/w0r;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/dq1;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Ll/w0r$g;->d:Ll/y20;

    .line 7
    .line 8
    if-eqz p3, :cond_1

    .line 9
    .line 10
    iget-object p1, p3, Lcom/p1/mobile/putong/core/data/StickerPackage;->stickers:Ljava/util/List;

    .line 11
    .line 12
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    iput-object p3, p0, Ll/w0r$g;->c:Lcom/p1/mobile/putong/core/data/StickerPackage;

    .line 20
    .line 21
    goto :goto_1

    .line 22
    :cond_1
    :goto_0
    invoke-static {}, Lcom/p1/mobile/putong/core/data/StickerPackage;->new_()Lcom/p1/mobile/putong/core/data/StickerPackage;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    iput-object p1, p0, Ll/w0r$g;->c:Lcom/p1/mobile/putong/core/data/StickerPackage;

    .line 27
    .line 28
    new-instance p2, Ljava/util/ArrayList;

    .line 29
    .line 30
    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 31
    .line 32
    .line 33
    iput-object p2, p1, Lcom/p1/mobile/putong/core/data/StickerPackage;->stickers:Ljava/util/List;

    .line 34
    .line 35
    :goto_1
    iget-object p1, p0, Ll/w0r$g;->c:Lcom/p1/mobile/putong/core/data/StickerPackage;

    .line 36
    .line 37
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/StickerPackage;->stickers:Ljava/util/List;

    .line 38
    .line 39
    new-instance p3, Ll/b1r;

    .line 40
    .line 41
    invoke-direct {p3}, Ll/b1r;-><init>()V

    .line 42
    .line 43
    .line 44
    invoke-static {p2, p3}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 45
    .line 46
    .line 47
    move-result-object p2

    .line 48
    iput-object p2, p1, Lcom/p1/mobile/putong/core/data/StickerPackage;->stickers:Ljava/util/List;

    .line 49
    .line 50
    iput-object p4, p0, Ll/w0r$g;->e:Lcom/p1/mobile/android/app/Act;

    .line 51
    .line 52
    return-void
.end method

.method public static synthetic A(Ll/w0r$g;Lcom/p1/mobile/putong/core/data/Sticker;Landroid/widget/PopupWindow;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/w0r$g;->I(Lcom/p1/mobile/putong/core/data/Sticker;Landroid/widget/PopupWindow;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic B(Ll/w0r$g;Landroid/view/View;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/w0r$g;->G(Landroid/view/View;Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic C(Ll/w0r$g;Landroid/content/Context;Lcom/p1/mobile/putong/core/data/Sticker;)Landroid/widget/PopupWindow;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/w0r$g;->F(Landroid/content/Context;Lcom/p1/mobile/putong/core/data/Sticker;)Landroid/widget/PopupWindow;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic D(Ll/w0r$g;Landroid/widget/PopupWindow;Landroid/view/View;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Ll/w0r$g;->L(Landroid/widget/PopupWindow;Landroid/view/View;Landroid/view/View;)V

    return-void
.end method

.method private L(Landroid/widget/PopupWindow;Landroid/view/View;Landroid/view/View;)V
    .locals 10

    .line 1
    new-instance v0, Landroid/graphics/drawable/ColorDrawable;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/drawable/ColorDrawable;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, v0}, Landroid/widget/PopupWindow;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 7
    .line 8
    .line 9
    const/4 v0, 0x2

    .line 10
    new-array v1, v0, [I

    .line 11
    .line 12
    invoke-virtual {p2, v1}, Landroid/view/View;->getLocationInWindow([I)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p1}, Landroid/widget/PopupWindow;->getContentView()Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    const/4 v3, 0x0

    .line 20
    invoke-virtual {v2, v3, v3}, Landroid/view/View;->measure(II)V

    .line 21
    .line 22
    .line 23
    aget v3, v1, v3

    .line 24
    .line 25
    invoke-virtual {p2}, Landroid/view/View;->getWidth()I

    .line 26
    .line 27
    .line 28
    move-result v4

    .line 29
    div-int/2addr v4, v0

    .line 30
    add-int/2addr v4, v3

    .line 31
    invoke-virtual {v2}, Landroid/view/View;->getMeasuredWidth()I

    .line 32
    .line 33
    .line 34
    move-result v5

    .line 35
    div-int/2addr v5, v0

    .line 36
    sub-int/2addr v4, v5

    .line 37
    const/4 v5, 0x1

    .line 38
    aget v6, v1, v5

    .line 39
    .line 40
    invoke-virtual {v2}, Landroid/view/View;->getMeasuredHeight()I

    .line 41
    .line 42
    .line 43
    move-result v7

    .line 44
    sub-int/2addr v6, v7

    .line 45
    invoke-virtual {v2}, Landroid/view/View;->getMeasuredWidth()I

    .line 46
    .line 47
    .line 48
    move-result v7

    .line 49
    add-int/2addr v7, v4

    .line 50
    invoke-static {}, Ll/bnl0;->y0()I

    .line 51
    .line 52
    .line 53
    move-result v8

    .line 54
    sget v9, Ll/qa00;->g:I

    .line 55
    .line 56
    sub-int/2addr v8, v9

    .line 57
    if-le v7, v8, :cond_0

    .line 58
    .line 59
    invoke-static {}, Ll/bnl0;->y0()I

    .line 60
    .line 61
    .line 62
    move-result v4

    .line 63
    sub-int/2addr v4, v9

    .line 64
    invoke-virtual {v2}, Landroid/view/View;->getMeasuredWidth()I

    .line 65
    .line 66
    .line 67
    move-result v7

    .line 68
    sub-int/2addr v4, v7

    .line 69
    goto :goto_0

    .line 70
    :cond_0
    if-ge v4, v9, :cond_1

    .line 71
    .line 72
    move v4, v9

    .line 73
    :cond_1
    :goto_0
    iget-object p0, p0, Ll/w0r$g;->g:Ll/w0r;

    .line 74
    .line 75
    iget-boolean p0, p0, Ll/w0r;->r:Z

    .line 76
    .line 77
    if-eqz p0, :cond_2

    .line 78
    .line 79
    invoke-virtual {v2, v1}, Landroid/view/View;->getLocationInWindow([I)V

    .line 80
    .line 81
    .line 82
    sget p0, Ll/edc0;->i:I

    .line 83
    .line 84
    invoke-virtual {v2, p0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    check-cast p0, Landroid/widget/FrameLayout;

    .line 89
    .line 90
    invoke-virtual {p2}, Landroid/view/View;->getWidth()I

    .line 91
    .line 92
    .line 93
    move-result v1

    .line 94
    div-int/2addr v1, v0

    .line 95
    add-int/2addr v3, v1

    .line 96
    add-int/2addr v9, v4

    .line 97
    sub-int/2addr v3, v9

    .line 98
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    check-cast p0, Landroid/widget/RelativeLayout$LayoutParams;

    .line 103
    .line 104
    iput v3, p0, Landroid/widget/RelativeLayout$LayoutParams;->leftMargin:I

    .line 105
    .line 106
    invoke-virtual {p3}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 107
    .line 108
    .line 109
    move-result-object p0

    .line 110
    invoke-interface {p0, v5}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 111
    .line 112
    .line 113
    new-instance p0, Ll/c1r;

    .line 114
    .line 115
    invoke-direct {p0, p3}, Ll/c1r;-><init>(Landroid/view/View;)V

    .line 116
    .line 117
    .line 118
    invoke-virtual {p1, p0}, Landroid/widget/PopupWindow;->setOnDismissListener(Landroid/widget/PopupWindow$OnDismissListener;)V

    .line 119
    .line 120
    .line 121
    :cond_2
    const/16 p0, 0x33

    .line 122
    .line 123
    invoke-virtual {p1, p2, p0, v4, v6}, Landroid/widget/PopupWindow;->showAtLocation(Landroid/view/View;III)V

    .line 124
    .line 125
    .line 126
    invoke-virtual {p1, v5}, Landroid/widget/PopupWindow;->setOutsideTouchable(Z)V

    .line 127
    .line 128
    .line 129
    invoke-virtual {p1, v5}, Landroid/widget/PopupWindow;->setFocusable(Z)V

    .line 130
    .line 131
    .line 132
    invoke-virtual {p1}, Landroid/widget/PopupWindow;->update()V

    .line 133
    .line 134
    .line 135
    return-void
.end method

.method public static synthetic p(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const/4 v0, 0x0

    .line 16
    invoke-interface {p0, v0}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public static synthetic s(Ll/w0r$g;Lcom/p1/mobile/putong/core/data/Sticker;Landroid/widget/PopupWindow;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/w0r$g;->J(Lcom/p1/mobile/putong/core/data/Sticker;Landroid/widget/PopupWindow;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic t(Ll/w0r$g;Lcom/p1/mobile/putong/core/data/Sticker;ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/w0r$g;->H(Lcom/p1/mobile/putong/core/data/Sticker;ILandroid/view/View;)V

    return-void
.end method

.method public static synthetic w(Landroid/view/View;)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public static synthetic y(Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->Z:Lcom/p1/mobile/putong/core/api/z;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/api/z;->s3(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Sticker;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const-string v0, "default"

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Sticker;->status:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method public static synthetic z(Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->Z:Lcom/p1/mobile/putong/core/api/z;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/api/z;->s3(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Sticker;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    const-string v0, "default"

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Sticker;->status:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0

    .line 28
    :cond_0
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 29
    .line 30
    return-object p0
.end method


# virtual methods
.method public E(Landroid/view/View;Ljava/lang/String;II)V
    .locals 7

    .line 1
    move-object p3, p1

    .line 2
    check-cast p3, Landroid/widget/LinearLayout;

    .line 3
    .line 4
    sget v0, Ll/edc0;->C1:I

    .line 5
    .line 6
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Lv/VDraweeView;

    .line 11
    .line 12
    const-string v1, "p_chat_view"

    .line 13
    .line 14
    const/4 v2, 0x0

    .line 15
    if-nez p4, :cond_6

    .line 16
    .line 17
    iget-object p2, p0, Ll/w0r$g;->g:Ll/w0r;

    .line 18
    .line 19
    invoke-static {p2}, Ll/w0r;->E(Ll/w0r;)Z

    .line 20
    .line 21
    .line 22
    move-result p2

    .line 23
    if-eqz p2, :cond_0

    .line 24
    .line 25
    invoke-virtual {v0, v2}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 26
    .line 27
    .line 28
    sget p2, Ll/ibc0;->B1:I

    .line 29
    .line 30
    invoke-virtual {v0, p2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 31
    .line 32
    .line 33
    goto :goto_4

    .line 34
    :cond_0
    iget-object p2, p0, Ll/w0r$g;->g:Ll/w0r;

    .line 35
    .line 36
    iget-boolean p2, p2, Ll/w0r;->r:Z

    .line 37
    .line 38
    if-eqz p2, :cond_3

    .line 39
    .line 40
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 41
    .line 42
    .line 43
    move-result-object p2

    .line 44
    invoke-virtual {p2}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 45
    .line 46
    .line 47
    move-result-object p2

    .line 48
    invoke-interface {p2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 49
    .line 50
    .line 51
    move-result p2

    .line 52
    if-eqz p2, :cond_1

    .line 53
    .line 54
    sget p2, Ll/ibc0;->d2:I

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_1
    sget p2, Ll/ibc0;->h2:I

    .line 58
    .line 59
    :goto_0
    invoke-virtual {v0, p2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 60
    .line 61
    .line 62
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 63
    .line 64
    .line 65
    move-result-object p2

    .line 66
    invoke-virtual {p2}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 67
    .line 68
    .line 69
    move-result-object p2

    .line 70
    invoke-interface {p2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 71
    .line 72
    .line 73
    move-result p2

    .line 74
    if-eqz p2, :cond_2

    .line 75
    .line 76
    sget p2, Ll/ibc0;->f2:I

    .line 77
    .line 78
    goto :goto_1

    .line 79
    :cond_2
    sget p2, Ll/ibc0;->I3:I

    .line 80
    .line 81
    :goto_1
    invoke-virtual {v0, p2}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 82
    .line 83
    .line 84
    goto :goto_4

    .line 85
    :cond_3
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 86
    .line 87
    .line 88
    move-result-object p2

    .line 89
    invoke-virtual {p2}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 90
    .line 91
    .line 92
    move-result-object p2

    .line 93
    invoke-interface {p2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 94
    .line 95
    .line 96
    move-result p2

    .line 97
    if-eqz p2, :cond_4

    .line 98
    .line 99
    sget p2, Ll/ibc0;->f2:I

    .line 100
    .line 101
    goto :goto_2

    .line 102
    :cond_4
    sget p2, Ll/ibc0;->e2:I

    .line 103
    .line 104
    :goto_2
    invoke-virtual {v0, p2}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 105
    .line 106
    .line 107
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 108
    .line 109
    .line 110
    move-result-object p2

    .line 111
    invoke-virtual {p2}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 112
    .line 113
    .line 114
    move-result-object p2

    .line 115
    invoke-interface {p2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 116
    .line 117
    .line 118
    move-result p2

    .line 119
    if-eqz p2, :cond_5

    .line 120
    .line 121
    sget p2, Ll/ibc0;->d2:I

    .line 122
    .line 123
    goto :goto_3

    .line 124
    :cond_5
    sget p2, Ll/ibc0;->c2:I

    .line 125
    .line 126
    :goto_3
    invoke-virtual {v0, p2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 127
    .line 128
    .line 129
    :goto_4
    sget-object p2, Landroid/widget/ImageView$ScaleType;->CENTER:Landroid/widget/ImageView$ScaleType;

    .line 130
    .line 131
    invoke-virtual {v0, p2}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 132
    .line 133
    .line 134
    const-string p2, "e_chat_collect_gifs_operation"

    .line 135
    .line 136
    invoke-static {p2, v1}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 137
    .line 138
    .line 139
    new-instance p2, Ll/y0r;

    .line 140
    .line 141
    invoke-direct {p2, p0, p1}, Ll/y0r;-><init>(Ll/w0r$g;Landroid/view/View;)V

    .line 142
    .line 143
    .line 144
    invoke-static {p3, p2}, Ll/bnl0;->L(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 145
    .line 146
    .line 147
    new-instance p0, Ll/z0r;

    .line 148
    .line 149
    invoke-direct {p0}, Ll/z0r;-><init>()V

    .line 150
    .line 151
    .line 152
    invoke-virtual {p3, p0}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 153
    .line 154
    .line 155
    return-void

    .line 156
    :cond_6
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 157
    .line 158
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->Z:Lcom/p1/mobile/putong/core/api/z;

    .line 159
    .line 160
    invoke-virtual {v3, p2}, Lcom/p1/mobile/putong/core/api/z;->s3(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Sticker;

    .line 161
    .line 162
    .line 163
    move-result-object p2

    .line 164
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 165
    .line 166
    .line 167
    move-result v3

    .line 168
    if-eqz v3, :cond_a

    .line 169
    .line 170
    iget-object v3, p2, Lcom/p1/mobile/putong/core/data/Sticker;->pictures:Ljava/util/List;

    .line 171
    .line 172
    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    .line 173
    .line 174
    .line 175
    move-result v3

    .line 176
    if-nez v3, :cond_a

    .line 177
    .line 178
    iget-object v3, p0, Ll/w0r$g;->g:Ll/w0r;

    .line 179
    .line 180
    iget-boolean v3, v3, Ll/w0r;->r:Z

    .line 181
    .line 182
    if-eqz v3, :cond_7

    .line 183
    .line 184
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 185
    .line 186
    .line 187
    move-result-object v3

    .line 188
    const/high16 v4, 0x41200000    # 10.0f

    .line 189
    .line 190
    invoke-interface {v3, v0, v4}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->R9(Landroid/view/View;F)V

    .line 191
    .line 192
    .line 193
    :cond_7
    invoke-virtual {v0, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 194
    .line 195
    .line 196
    invoke-virtual {p3, p2}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 197
    .line 198
    .line 199
    iget-object v3, p0, Ll/w0r$g;->g:Ll/w0r;

    .line 200
    .line 201
    iget-boolean v3, v3, Ll/w0r;->r:Z

    .line 202
    .line 203
    if-eqz v3, :cond_8

    .line 204
    .line 205
    const-string v3, "gif_source"

    .line 206
    .line 207
    const-string v4, "collect"

    .line 208
    .line 209
    invoke-static {v3, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 210
    .line 211
    .line 212
    move-result-object v3

    .line 213
    iget-object v4, p2, Lcom/p1/mobile/putong/core/data/Sticker;->pictures:Ljava/util/List;

    .line 214
    .line 215
    invoke-interface {v4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 216
    .line 217
    .line 218
    move-result-object v4

    .line 219
    check-cast v4, Lcom/p1/mobile/putong/data/Picture;

    .line 220
    .line 221
    iget-object v4, v4, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 222
    .line 223
    const-string v5, "gift_url"

    .line 224
    .line 225
    invoke-static {v5, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 226
    .line 227
    .line 228
    move-result-object v4

    .line 229
    new-instance v5, Ljava/lang/StringBuilder;

    .line 230
    .line 231
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 232
    .line 233
    .line 234
    add-int/lit8 v6, p4, 0x1

    .line 235
    .line 236
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 237
    .line 238
    .line 239
    const-string v6, ""

    .line 240
    .line 241
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 242
    .line 243
    .line 244
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 245
    .line 246
    .line 247
    move-result-object v5

    .line 248
    const-string v6, "gifs_order"

    .line 249
    .line 250
    invoke-static {v6, v5}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 251
    .line 252
    .line 253
    move-result-object v5

    .line 254
    filled-new-array {v3, v4, v5}, [Ll/pf60;

    .line 255
    .line 256
    .line 257
    move-result-object v3

    .line 258
    const-string v4, "e_chat_gif_click"

    .line 259
    .line 260
    invoke-static {v4, v1, v3}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 261
    .line 262
    .line 263
    :cond_8
    new-instance v1, Ll/a1r;

    .line 264
    .line 265
    invoke-direct {v1, p0, p2, p4}, Ll/a1r;-><init>(Ll/w0r$g;Lcom/p1/mobile/putong/core/data/Sticker;I)V

    .line 266
    .line 267
    .line 268
    invoke-static {p3, v1}, Ll/bnl0;->L(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 269
    .line 270
    .line 271
    new-instance p4, Ll/w0r$g$a;

    .line 272
    .line 273
    invoke-direct {p4, p0, p1, p2}, Ll/w0r$g$a;-><init>(Ll/w0r$g;Landroid/view/View;Lcom/p1/mobile/putong/core/data/Sticker;)V

    .line 274
    .line 275
    .line 276
    invoke-virtual {p3, p4}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 277
    .line 278
    .line 279
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/Sticker;->source:Lcom/p1/mobile/putong/core/data/StickerSource;

    .line 280
    .line 281
    const-string p3, "shanmeng"

    .line 282
    .line 283
    invoke-static {p1, p3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 284
    .line 285
    .line 286
    move-result p1

    .line 287
    if-eqz p1, :cond_9

    .line 288
    .line 289
    sget-object p0, Ll/uqb0;->G:Ll/fsb0;

    .line 290
    .line 291
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/Sticker;->pictures:Ljava/util/List;

    .line 292
    .line 293
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 294
    .line 295
    .line 296
    move-result-object p1

    .line 297
    check-cast p1, Lcom/p1/mobile/putong/data/Picture;

    .line 298
    .line 299
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 300
    .line 301
    invoke-virtual {p0, v0, p1}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 302
    .line 303
    .line 304
    return-void

    .line 305
    :cond_9
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 306
    .line 307
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/Sticker;->pictures:Ljava/util/List;

    .line 308
    .line 309
    invoke-interface {p2, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 310
    .line 311
    .line 312
    move-result-object p2

    .line 313
    check-cast p2, Lcom/p1/mobile/putong/data/Picture;

    .line 314
    .line 315
    invoke-virtual {p0, p2}, Ll/w0r$g;->M(Lcom/p1/mobile/putong/data/Picture;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 316
    .line 317
    .line 318
    move-result-object p0

    .line 319
    invoke-virtual {p1, v0, p0}, Ll/fsb0;->B0(Lcom/facebook/drawee/view/DraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 320
    .line 321
    .line 322
    return-void

    .line 323
    :cond_a
    sget-object p0, Ll/uqb0;->G:Ll/fsb0;

    .line 324
    .line 325
    invoke-virtual {p0, v0}, Ll/am2;->o(Lcom/facebook/drawee/view/DraweeView;)V

    .line 326
    .line 327
    .line 328
    return-void
.end method

.method public final F(Landroid/content/Context;Lcom/p1/mobile/putong/core/data/Sticker;)Landroid/widget/PopupWindow;
    .locals 6

    .line 1
    iget-object v0, p0, Ll/w0r$g;->g:Ll/w0r;

    .line 2
    .line 3
    iget-boolean v0, v0, Ll/w0r;->r:Z

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-static {p1}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    sget v0, Ll/qec0;->j1:I

    .line 13
    .line 14
    invoke-virtual {p1, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    invoke-static {p1}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    sget v0, Ll/qec0;->i1:I

    .line 24
    .line 25
    invoke-virtual {p1, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    :goto_0
    sget v0, Ll/edc0;->y1:I

    .line 30
    .line 31
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    check-cast v0, Lv/VDraweeView;

    .line 36
    .line 37
    new-instance v1, Landroid/widget/PopupWindow;

    .line 38
    .line 39
    const/4 v2, -0x2

    .line 40
    invoke-direct {v1, p1, v2, v2}, Landroid/widget/PopupWindow;-><init>(Landroid/view/View;II)V

    .line 41
    .line 42
    .line 43
    iget-object v2, p2, Lcom/p1/mobile/putong/core/data/Sticker;->pictures:Ljava/util/List;

    .line 44
    .line 45
    const/4 v3, 0x0

    .line 46
    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    check-cast v2, Lcom/p1/mobile/putong/data/Picture;

    .line 51
    .line 52
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Picture;->attachments:Ljava/util/List;

    .line 53
    .line 54
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 55
    .line 56
    .line 57
    move-result v2

    .line 58
    if-nez v2, :cond_1

    .line 59
    .line 60
    sget-object v2, Ll/uqb0;->G:Ll/fsb0;

    .line 61
    .line 62
    iget-object v4, p2, Lcom/p1/mobile/putong/core/data/Sticker;->pictures:Ljava/util/List;

    .line 63
    .line 64
    invoke-interface {v4, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object v4

    .line 68
    check-cast v4, Lcom/p1/mobile/putong/data/Picture;

    .line 69
    .line 70
    iget-object v4, v4, Lcom/p1/mobile/putong/data/Picture;->attachments:Ljava/util/List;

    .line 71
    .line 72
    invoke-interface {v4, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object v3

    .line 76
    check-cast v3, Lcom/p1/mobile/putong/data/Picture;

    .line 77
    .line 78
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 79
    .line 80
    invoke-virtual {v2, v0, v3}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    :cond_1
    sget v2, Ll/edc0;->D2:I

    .line 84
    .line 85
    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 86
    .line 87
    .line 88
    move-result-object v2

    .line 89
    check-cast v2, Lv/VText;

    .line 90
    .line 91
    sget v3, Ll/edc0;->p0:I

    .line 92
    .line 93
    invoke-virtual {p1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 94
    .line 95
    .line 96
    move-result-object v3

    .line 97
    check-cast v3, Lv/VText;

    .line 98
    .line 99
    invoke-virtual {v2}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 100
    .line 101
    .line 102
    move-result-object v4

    .line 103
    const/4 v5, 0x1

    .line 104
    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 105
    .line 106
    .line 107
    invoke-virtual {v3}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 108
    .line 109
    .line 110
    move-result-object v4

    .line 111
    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 112
    .line 113
    .line 114
    const-string v4, "e_chat_collect_gif_operation"

    .line 115
    .line 116
    const-string v5, "p_chat_view"

    .line 117
    .line 118
    invoke-static {v4, v5}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 119
    .line 120
    .line 121
    new-instance v4, Ll/d1r;

    .line 122
    .line 123
    invoke-direct {v4, p0, p2, v1}, Ll/d1r;-><init>(Ll/w0r$g;Lcom/p1/mobile/putong/core/data/Sticker;Landroid/widget/PopupWindow;)V

    .line 124
    .line 125
    .line 126
    invoke-static {v2, v4}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 127
    .line 128
    .line 129
    new-instance v4, Ll/e1r;

    .line 130
    .line 131
    invoke-direct {v4, p0, p2, v1}, Ll/e1r;-><init>(Ll/w0r$g;Lcom/p1/mobile/putong/core/data/Sticker;Landroid/widget/PopupWindow;)V

    .line 132
    .line 133
    .line 134
    invoke-static {v3, v4}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 135
    .line 136
    .line 137
    iget-object p2, p0, Ll/w0r$g;->g:Ll/w0r;

    .line 138
    .line 139
    iget-boolean v4, p2, Ll/w0r;->r:Z

    .line 140
    .line 141
    if-eqz v4, :cond_2

    .line 142
    .line 143
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 144
    .line 145
    .line 146
    move-result-object p2

    .line 147
    const/high16 v4, 0x41200000    # 10.0f

    .line 148
    .line 149
    invoke-interface {p2, v0, v4}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->R9(Landroid/view/View;F)V

    .line 150
    .line 151
    .line 152
    iget-object p0, p0, Ll/w0r$g;->g:Ll/w0r;

    .line 153
    .line 154
    invoke-static {p0, p1, v2, v3}, Ll/w0r;->H(Ll/w0r;Landroid/view/View;Landroid/widget/TextView;Landroid/widget/TextView;)V

    .line 155
    .line 156
    .line 157
    return-object v1

    .line 158
    :cond_2
    invoke-static {p2, p1, v2, v3}, Ll/w0r;->I(Ll/w0r;Landroid/view/View;Landroid/widget/TextView;Landroid/widget/TextView;)V

    .line 159
    .line 160
    .line 161
    return-object v1
.end method

.method public final synthetic G(Landroid/view/View;Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p2, p0, Ll/w0r$g;->g:Ll/w0r;

    .line 2
    .line 3
    iget-boolean p2, p2, Ll/w0r;->r:Z

    .line 4
    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    const-string p2, "e_chat_collect_gifs_operation"

    .line 8
    .line 9
    const-string v0, "p_chat_view"

    .line 10
    .line 11
    invoke-static {p2, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    new-instance p2, Landroid/content/Intent;

    .line 15
    .line 16
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const-class v1, Lcom/p1/mobile/putong/core/ui/messages/meme/CoreMyCustomMemeAct;

    .line 21
    .line 22
    invoke-direct {p2, v0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {p1, p2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Ll/w0r$g;->e:Lcom/p1/mobile/android/app/Act;

    .line 33
    .line 34
    sget p1, Ll/y7c0;->e:I

    .line 35
    .line 36
    sget p2, Ll/y7c0;->a:I

    .line 37
    .line 38
    invoke-virtual {p0, p1, p2}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public final synthetic H(Lcom/p1/mobile/putong/core/data/Sticker;ILandroid/view/View;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/w0r$g;->g:Ll/w0r;

    .line 2
    .line 3
    iget-boolean v0, v0, Ll/w0r;->r:Z

    .line 4
    .line 5
    const-string v1, "p_chat_view"

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const-string v0, "gif_source"

    .line 10
    .line 11
    const-string v2, "collect"

    .line 12
    .line 13
    invoke-static {v0, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Sticker;->pictures:Ljava/util/List;

    .line 18
    .line 19
    const/4 v2, 0x0

    .line 20
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    check-cast p1, Lcom/p1/mobile/putong/data/Picture;

    .line 25
    .line 26
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 27
    .line 28
    const-string v2, "gift_url"

    .line 29
    .line 30
    invoke-static {v2, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    new-instance v2, Ljava/lang/StringBuilder;

    .line 35
    .line 36
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 37
    .line 38
    .line 39
    add-int/lit8 p2, p2, 0x1

    .line 40
    .line 41
    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    const-string p2, ""

    .line 45
    .line 46
    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object p2

    .line 53
    const-string v2, "gifs_order"

    .line 54
    .line 55
    invoke-static {v2, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 56
    .line 57
    .line 58
    move-result-object p2

    .line 59
    filled-new-array {v0, p1, p2}, [Ll/pf60;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    const-string p2, "e_chat_gif_click"

    .line 64
    .line 65
    invoke-static {p2, v1, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 66
    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_0
    iget-object p1, p0, Ll/w0r$g;->c:Lcom/p1/mobile/putong/core/data/StickerPackage;

    .line 70
    .line 71
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/StickerPackage;->id:Ljava/lang/String;

    .line 72
    .line 73
    const-string v0, "stickers_id"

    .line 74
    .line 75
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    const-string v0, "sticker_rank"

    .line 80
    .line 81
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 82
    .line 83
    .line 84
    move-result-object p2

    .line 85
    invoke-static {v0, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 86
    .line 87
    .line 88
    move-result-object p2

    .line 89
    filled-new-array {p1, p2}, [Ll/pf60;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    const-string p2, "e_stickers"

    .line 94
    .line 95
    invoke-static {p2, v1, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 96
    .line 97
    .line 98
    :goto_0
    iget-object p0, p0, Ll/w0r$g;->d:Ll/y20;

    .line 99
    .line 100
    invoke-virtual {p3}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    check-cast p1, Lcom/p1/mobile/putong/core/data/Sticker;

    .line 105
    .line 106
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 107
    .line 108
    .line 109
    return-void
.end method

.method public final synthetic I(Lcom/p1/mobile/putong/core/data/Sticker;Landroid/widget/PopupWindow;Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/w0r$g;->g:Ll/w0r;

    .line 2
    .line 3
    iget-boolean p0, p0, Ll/w0r;->r:Z

    .line 4
    .line 5
    const-string p3, "p_chat_view"

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const-string p0, "collect_operation"

    .line 10
    .line 11
    const-string v0, "top"

    .line 12
    .line 13
    invoke-static {p0, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    filled-new-array {p0}, [Ll/pf60;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const-string v0, "e_chat_collect_gif_operation"

    .line 22
    .line 23
    invoke-static {v0, p3, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    const-string p0, "stickers_id_new"

    .line 28
    .line 29
    iget-object v0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 30
    .line 31
    invoke-static {p0, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    filled-new-array {p0}, [Ll/pf60;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    const-string v0, "e_stickers_move_to_front"

    .line 40
    .line 41
    invoke-static {v0, p3, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 42
    .line 43
    .line 44
    :goto_0
    invoke-virtual {p2}, Landroid/widget/PopupWindow;->dismiss()V

    .line 45
    .line 46
    .line 47
    invoke-static {}, Lcom/p1/mobile/putong/core/data/UserSticker;->new_()Lcom/p1/mobile/putong/core/data/UserSticker;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    new-instance p2, Ljava/util/ArrayList;

    .line 52
    .line 53
    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 54
    .line 55
    .line 56
    iput-object p2, p0, Lcom/p1/mobile/putong/core/data/UserSticker;->favoriteStickers:Ljava/util/List;

    .line 57
    .line 58
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 59
    .line 60
    invoke-interface {p2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 64
    .line 65
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->Z:Lcom/p1/mobile/putong/core/api/z;

    .line 66
    .line 67
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/z;->T:Lcom/p1/mobile/putong/core/api/z$c;

    .line 68
    .line 69
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/api/z$c;->W(Lcom/p1/mobile/putong/core/data/UserSticker;)Lrx/c;

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method public final synthetic J(Lcom/p1/mobile/putong/core/data/Sticker;Landroid/widget/PopupWindow;Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/w0r$g;->g:Ll/w0r;

    .line 2
    .line 3
    iget-boolean p0, p0, Ll/w0r;->r:Z

    .line 4
    .line 5
    const-string p3, "p_chat_view"

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const-string p0, "collect_operation"

    .line 10
    .line 11
    const-string v0, "delete"

    .line 12
    .line 13
    invoke-static {p0, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    filled-new-array {p0}, [Ll/pf60;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const-string v0, "e_chat_collect_gif_operation"

    .line 22
    .line 23
    invoke-static {v0, p3, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    const-string p0, "stickers_id_new"

    .line 28
    .line 29
    iget-object v0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 30
    .line 31
    invoke-static {p0, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    filled-new-array {p0}, [Ll/pf60;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    const-string v0, "e_stickers_delete"

    .line 40
    .line 41
    invoke-static {v0, p3, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 42
    .line 43
    .line 44
    :goto_0
    invoke-virtual {p2}, Landroid/widget/PopupWindow;->dismiss()V

    .line 45
    .line 46
    .line 47
    invoke-static {}, Lcom/p1/mobile/putong/core/data/UserSticker;->new_()Lcom/p1/mobile/putong/core/data/UserSticker;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    new-instance p2, Ljava/util/ArrayList;

    .line 52
    .line 53
    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 54
    .line 55
    .line 56
    iput-object p2, p0, Lcom/p1/mobile/putong/core/data/UserSticker;->favoriteStickers:Ljava/util/List;

    .line 57
    .line 58
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 59
    .line 60
    invoke-interface {p2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 64
    .line 65
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->Z:Lcom/p1/mobile/putong/core/api/z;

    .line 66
    .line 67
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/z;->T:Lcom/p1/mobile/putong/core/api/z$c;

    .line 68
    .line 69
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/api/z$c;->P(Lcom/p1/mobile/putong/core/data/UserSticker;)Lrx/c;

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method public K(Lcom/p1/mobile/putong/core/data/StickerPackage;)V
    .locals 2

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/StickerPackage;->stickers:Ljava/util/List;

    .line 4
    .line 5
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iput-object p1, p0, Ll/w0r$g;->c:Lcom/p1/mobile/putong/core/data/StickerPackage;

    .line 13
    .line 14
    goto :goto_1

    .line 15
    :cond_1
    :goto_0
    invoke-static {}, Lcom/p1/mobile/putong/core/data/StickerPackage;->new_()Lcom/p1/mobile/putong/core/data/StickerPackage;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    iput-object p1, p0, Ll/w0r$g;->c:Lcom/p1/mobile/putong/core/data/StickerPackage;

    .line 20
    .line 21
    new-instance v0, Ljava/util/ArrayList;

    .line 22
    .line 23
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 24
    .line 25
    .line 26
    iput-object v0, p1, Lcom/p1/mobile/putong/core/data/StickerPackage;->stickers:Ljava/util/List;

    .line 27
    .line 28
    :goto_1
    iget-object p1, p0, Ll/w0r$g;->c:Lcom/p1/mobile/putong/core/data/StickerPackage;

    .line 29
    .line 30
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/StickerPackage;->stickers:Ljava/util/List;

    .line 31
    .line 32
    new-instance v1, Ll/x0r;

    .line 33
    .line 34
    invoke-direct {v1}, Ll/x0r;-><init>()V

    .line 35
    .line 36
    .line 37
    invoke-static {v0, v1}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    iput-object v0, p1, Lcom/p1/mobile/putong/core/data/StickerPackage;->stickers:Ljava/util/List;

    .line 42
    .line 43
    invoke-virtual {p0}, Landroid/widget/BaseAdapter;->notifyDataSetChanged()V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public M(Lcom/p1/mobile/putong/data/Picture;)Lcom/p1/mobile/putong/data/Picture$ImageUri;
    .locals 1

    .line 1
    invoke-static {}, Ll/bnl0;->y0()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/high16 v0, 0x41400000    # 12.0f

    .line 6
    .line 7
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    mul-int/lit8 v0, v0, 0x5

    .line 12
    .line 13
    sub-int/2addr p0, v0

    .line 14
    div-int/lit8 p0, p0, 0x4

    .line 15
    .line 16
    const-string v0, ".png"

    .line 17
    .line 18
    invoke-virtual {p1, p0, v0}, Lcom/p1/mobile/putong/data/Picture;->aboutWidth(ILjava/lang/String;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public getCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w0r$g;->c:Lcom/p1/mobile/putong/core/data/StickerPackage;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/StickerPackage;->stickers:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    add-int/lit8 p0, p0, 0x1

    .line 10
    .line 11
    return p0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return-object p0

    .line 5
    :cond_0
    iget-object p0, p0, Ll/w0r$g;->c:Lcom/p1/mobile/putong/core/data/StickerPackage;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/StickerPackage;->stickers:Ljava/util/List;

    .line 8
    .line 9
    add-int/lit8 p1, p1, -0x1

    .line 10
    .line 11
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public getItemId(I)J
    .locals 0

    .line 1
    int-to-long p0, p1

    .line 2
    return-wide p0
.end method

.method public bridge synthetic j(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/w0r$g;->E(Landroid/view/View;Ljava/lang/String;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public m(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 1

    .line 1
    iget-object p2, p0, Ll/w0r$g;->g:Ll/w0r;

    .line 2
    .line 3
    iget-boolean p2, p2, Ll/w0r;->r:Z

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    if-eqz p2, :cond_0

    .line 7
    .line 8
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-static {p1}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    sget p2, Ll/qec0;->j2:I

    .line 17
    .line 18
    invoke-virtual {p1, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-static {p1}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    sget p2, Ll/qec0;->q2:I

    .line 32
    .line 33
    invoke-virtual {p1, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    :goto_0
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 38
    .line 39
    .line 40
    move-result-object p2

    .line 41
    iget-object p0, p0, Ll/w0r$g;->g:Ll/w0r;

    .line 42
    .line 43
    iget-boolean p0, p0, Ll/w0r;->r:Z

    .line 44
    .line 45
    if-eqz p0, :cond_1

    .line 46
    .line 47
    invoke-static {}, Ll/bnl0;->y0()I

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    const/high16 v0, 0x40800000    # 4.0f

    .line 52
    .line 53
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    sub-int/2addr p0, v0

    .line 58
    div-int/lit8 p0, p0, 0x4

    .line 59
    .line 60
    goto :goto_1

    .line 61
    :cond_1
    invoke-static {}, Ll/bnl0;->y0()I

    .line 62
    .line 63
    .line 64
    move-result p0

    .line 65
    div-int/lit8 p0, p0, 0x4

    .line 66
    .line 67
    :goto_1
    if-nez p2, :cond_2

    .line 68
    .line 69
    new-instance p2, Landroid/view/ViewGroup$LayoutParams;

    .line 70
    .line 71
    invoke-direct {p2, p0, p0}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 72
    .line 73
    .line 74
    :cond_2
    iput p0, p2, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 75
    .line 76
    iput p0, p2, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 77
    .line 78
    invoke-virtual {p1, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 79
    .line 80
    .line 81
    return-object p1
.end method
