.class public Ll/w0r$l;
.super Landroidx/recyclerview/widget/RecyclerView$Adapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/w0r;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "l"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/w0r$l$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/recyclerview/widget/RecyclerView$Adapter<",
        "Landroidx/recyclerview/widget/RecyclerView$e0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Sticker;",
            ">;"
        }
    .end annotation
.end field

.field public b:Lcom/p1/mobile/android/app/Act;

.field public final synthetic c:Ll/w0r;


# direct methods
.method public constructor <init>(Ll/w0r;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/w0r$l;->c:Ll/w0r;

    .line 2
    .line 3
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Ll/w0r$l;->b:Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    new-instance p1, Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object p1, p0, Ll/w0r$l;->a:Ljava/util/List;

    .line 14
    .line 15
    return-void
.end method

.method public static synthetic A(Ll/w0r$l;Lcom/p1/mobile/putong/core/data/Sticker;ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/w0r$l;->J(Lcom/p1/mobile/putong/core/data/Sticker;ILandroid/view/View;)V

    return-void
.end method

.method public static synthetic C(Ll/w0r$l;IILandroid/content/Intent;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/w0r$l;->H(IILandroid/content/Intent;)Z

    move-result p0

    return p0
.end method

.method public static synthetic D(Ll/w0r$l;Landroid/widget/FrameLayout;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/w0r$l;->I(Landroid/widget/FrameLayout;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic E(Ll/w0r$l;Lcom/p1/mobile/putong/core/data/Sticker;Landroid/widget/PopupWindow;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/w0r$l;->G(Lcom/p1/mobile/putong/core/data/Sticker;Landroid/widget/PopupWindow;Landroid/view/View;)V

    return-void
.end method

.method private F(Landroid/content/Context;Lcom/p1/mobile/putong/core/data/Sticker;)Landroid/widget/PopupWindow;
    .locals 6

    .line 1
    invoke-static {p1}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    sget v0, Ll/qec0;->k1:I

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {p1, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    sget v0, Ll/edc0;->y1:I

    .line 13
    .line 14
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Lv/VDraweeView;

    .line 19
    .line 20
    new-instance v2, Landroid/widget/PopupWindow;

    .line 21
    .line 22
    const/4 v3, -0x2

    .line 23
    invoke-direct {v2, p1, v3, v3}, Landroid/widget/PopupWindow;-><init>(Landroid/view/View;II)V

    .line 24
    .line 25
    .line 26
    iget-object v3, p2, Lcom/p1/mobile/putong/core/data/Sticker;->pictures:Ljava/util/List;

    .line 27
    .line 28
    const/4 v4, 0x0

    .line 29
    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    check-cast v3, Lcom/p1/mobile/putong/data/Picture;

    .line 34
    .line 35
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Picture;->attachments:Ljava/util/List;

    .line 36
    .line 37
    invoke-static {v3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 38
    .line 39
    .line 40
    move-result v3

    .line 41
    if-nez v3, :cond_0

    .line 42
    .line 43
    sget-object v3, Ll/uqb0;->G:Ll/fsb0;

    .line 44
    .line 45
    iget-object v5, p2, Lcom/p1/mobile/putong/core/data/Sticker;->pictures:Ljava/util/List;

    .line 46
    .line 47
    invoke-interface {v5, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v5

    .line 51
    check-cast v5, Lcom/p1/mobile/putong/data/Picture;

    .line 52
    .line 53
    iget-object v5, v5, Lcom/p1/mobile/putong/data/Picture;->attachments:Ljava/util/List;

    .line 54
    .line 55
    invoke-interface {v5, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v4

    .line 59
    check-cast v4, Lcom/p1/mobile/putong/data/Picture;

    .line 60
    .line 61
    iget-object v4, v4, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 62
    .line 63
    invoke-virtual {v3, v0, v4}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    :cond_0
    sget v3, Ll/edc0;->c:I

    .line 67
    .line 68
    invoke-virtual {p1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 69
    .line 70
    .line 71
    move-result-object v3

    .line 72
    check-cast v3, Lv/VText;

    .line 73
    .line 74
    invoke-virtual {v3}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 75
    .line 76
    .line 77
    move-result-object v4

    .line 78
    const/4 v5, 0x1

    .line 79
    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 80
    .line 81
    .line 82
    new-instance v4, Ll/o1r;

    .line 83
    .line 84
    invoke-direct {v4, p0, p2, v2}, Ll/o1r;-><init>(Ll/w0r$l;Lcom/p1/mobile/putong/core/data/Sticker;Landroid/widget/PopupWindow;)V

    .line 85
    .line 86
    .line 87
    invoke-static {v3, v4}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 88
    .line 89
    .line 90
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 91
    .line 92
    .line 93
    move-result-object p2

    .line 94
    const/high16 v4, 0x41200000    # 10.0f

    .line 95
    .line 96
    invoke-interface {p2, v0, v4}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->R9(Landroid/view/View;F)V

    .line 97
    .line 98
    .line 99
    iget-object p0, p0, Ll/w0r$l;->c:Ll/w0r;

    .line 100
    .line 101
    invoke-static {p0, p1, v3, v1}, Ll/w0r;->H(Ll/w0r;Landroid/view/View;Landroid/widget/TextView;Landroid/widget/TextView;)V

    .line 102
    .line 103
    .line 104
    return-object v2
.end method

.method private L(Landroid/widget/PopupWindow;Landroid/view/View;Landroid/view/View;)V
    .locals 9

    .line 1
    new-instance p0, Landroid/graphics/drawable/ColorDrawable;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/graphics/drawable/ColorDrawable;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, p0}, Landroid/widget/PopupWindow;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 7
    .line 8
    .line 9
    const/4 p0, 0x2

    .line 10
    new-array v0, p0, [I

    .line 11
    .line 12
    invoke-virtual {p2, v0}, Landroid/view/View;->getLocationInWindow([I)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p1}, Landroid/widget/PopupWindow;->getContentView()Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    const/4 v2, 0x0

    .line 20
    invoke-virtual {v1, v2, v2}, Landroid/view/View;->measure(II)V

    .line 21
    .line 22
    .line 23
    aget v2, v0, v2

    .line 24
    .line 25
    invoke-virtual {p2}, Landroid/view/View;->getWidth()I

    .line 26
    .line 27
    .line 28
    move-result v3

    .line 29
    div-int/2addr v3, p0

    .line 30
    add-int/2addr v3, v2

    .line 31
    invoke-virtual {v1}, Landroid/view/View;->getMeasuredWidth()I

    .line 32
    .line 33
    .line 34
    move-result v4

    .line 35
    div-int/2addr v4, p0

    .line 36
    sub-int/2addr v3, v4

    .line 37
    const/4 v4, 0x1

    .line 38
    aget v5, v0, v4

    .line 39
    .line 40
    invoke-virtual {v1}, Landroid/view/View;->getMeasuredHeight()I

    .line 41
    .line 42
    .line 43
    move-result v6

    .line 44
    sub-int/2addr v5, v6

    .line 45
    invoke-virtual {v1}, Landroid/view/View;->getMeasuredWidth()I

    .line 46
    .line 47
    .line 48
    move-result v6

    .line 49
    add-int/2addr v6, v3

    .line 50
    invoke-static {}, Ll/bnl0;->y0()I

    .line 51
    .line 52
    .line 53
    move-result v7

    .line 54
    sget v8, Ll/qa00;->g:I

    .line 55
    .line 56
    sub-int/2addr v7, v8

    .line 57
    if-le v6, v7, :cond_0

    .line 58
    .line 59
    invoke-static {}, Ll/bnl0;->y0()I

    .line 60
    .line 61
    .line 62
    move-result v3

    .line 63
    sub-int/2addr v3, v8

    .line 64
    invoke-virtual {v1}, Landroid/view/View;->getMeasuredWidth()I

    .line 65
    .line 66
    .line 67
    move-result v6

    .line 68
    sub-int/2addr v3, v6

    .line 69
    goto :goto_0

    .line 70
    :cond_0
    if-ge v3, v8, :cond_1

    .line 71
    .line 72
    move v3, v8

    .line 73
    :cond_1
    :goto_0
    invoke-virtual {v1, v0}, Landroid/view/View;->getLocationInWindow([I)V

    .line 74
    .line 75
    .line 76
    sget v0, Ll/edc0;->i:I

    .line 77
    .line 78
    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    check-cast v0, Landroid/widget/FrameLayout;

    .line 83
    .line 84
    invoke-virtual {p2}, Landroid/view/View;->getWidth()I

    .line 85
    .line 86
    .line 87
    move-result v1

    .line 88
    div-int/2addr v1, p0

    .line 89
    add-int/2addr v2, v1

    .line 90
    add-int/2addr v8, v3

    .line 91
    sub-int/2addr v2, v8

    .line 92
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    check-cast p0, Landroid/widget/RelativeLayout$LayoutParams;

    .line 97
    .line 98
    iput v2, p0, Landroid/widget/RelativeLayout$LayoutParams;->leftMargin:I

    .line 99
    .line 100
    invoke-virtual {p3}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    invoke-interface {p0, v4}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 105
    .line 106
    .line 107
    new-instance p0, Ll/n1r;

    .line 108
    .line 109
    invoke-direct {p0, p3}, Ll/n1r;-><init>(Landroid/view/View;)V

    .line 110
    .line 111
    .line 112
    invoke-virtual {p1, p0}, Landroid/widget/PopupWindow;->setOnDismissListener(Landroid/widget/PopupWindow$OnDismissListener;)V

    .line 113
    .line 114
    .line 115
    const/16 p0, 0x33

    .line 116
    .line 117
    invoke-virtual {p1, p2, p0, v3, v5}, Landroid/widget/PopupWindow;->showAtLocation(Landroid/view/View;III)V

    .line 118
    .line 119
    .line 120
    invoke-virtual {p1, v4}, Landroid/widget/PopupWindow;->setOutsideTouchable(Z)V

    .line 121
    .line 122
    .line 123
    invoke-virtual {p1, v4}, Landroid/widget/PopupWindow;->setFocusable(Z)V

    .line 124
    .line 125
    .line 126
    invoke-virtual {p1}, Landroid/widget/PopupWindow;->update()V

    .line 127
    .line 128
    .line 129
    return-void
.end method

.method public static synthetic y(Ll/w0r$l;Lcom/p1/mobile/putong/core/data/Sticker;Landroid/widget/FrameLayout;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/w0r$l;->K(Lcom/p1/mobile/putong/core/data/Sticker;Landroid/widget/FrameLayout;Landroid/view/View;)Z

    move-result p0

    return p0
.end method

.method public static synthetic z(Landroid/view/View;)V
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


# virtual methods
.method public final synthetic G(Lcom/p1/mobile/putong/core/data/Sticker;Landroid/widget/PopupWindow;Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p3, p1, Lcom/p1/mobile/putong/core/data/Sticker;->pictures:Ljava/util/List;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-interface {p3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object p3

    .line 8
    check-cast p3, Lcom/p1/mobile/putong/data/Picture;

    .line 9
    .line 10
    iget-object p3, p3, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 11
    .line 12
    const-string v0, "gift_url"

    .line 13
    .line 14
    invoke-static {v0, p3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 15
    .line 16
    .line 17
    move-result-object p3

    .line 18
    filled-new-array {p3}, [Ll/pf60;

    .line 19
    .line 20
    .line 21
    move-result-object p3

    .line 22
    const-string v0, "e_gif_add"

    .line 23
    .line 24
    const-string v1, "p_chat_view"

    .line 25
    .line 26
    invoke-static {v0, v1, p3}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p2}, Landroid/widget/PopupWindow;->dismiss()V

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Ll/w0r$l;->c:Ll/w0r;

    .line 33
    .line 34
    invoke-virtual {p0, p1}, Ll/w0r;->J(Lcom/p1/mobile/putong/core/data/Sticker;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public final synthetic H(IILandroid/content/Intent;)Z
    .locals 1

    .line 1
    const/16 v0, 0x12

    .line 2
    .line 3
    if-ne p1, v0, :cond_1

    .line 4
    .line 5
    const/4 p1, -0x1

    .line 6
    if-ne p2, p1, :cond_1

    .line 7
    .line 8
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-eqz p1, :cond_1

    .line 13
    .line 14
    sget-object p1, Lcom/p1/mobile/putong/core/ui/messages/meme/CorePopularMemeAct;->o:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {p3, p1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    check-cast p1, Lcom/p1/mobile/putong/core/data/Sticker;

    .line 21
    .line 22
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result p2

    .line 26
    if-eqz p2, :cond_0

    .line 27
    .line 28
    iget-object p0, p0, Ll/w0r$l;->b:Lcom/p1/mobile/android/app/Act;

    .line 29
    .line 30
    check-cast p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 31
    .line 32
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l()Ll/clz;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    iget-object p2, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 37
    .line 38
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 39
    .line 40
    .line 41
    move-result p2

    .line 42
    invoke-virtual {p0, p1, p2}, Ll/clz;->R6(Lcom/p1/mobile/putong/core/data/Sticker;Z)V

    .line 43
    .line 44
    .line 45
    :cond_0
    const/4 p0, 0x1

    .line 46
    return p0

    .line 47
    :cond_1
    const/4 p0, 0x0

    .line 48
    return p0
.end method

.method public final synthetic I(Landroid/widget/FrameLayout;Landroid/view/View;)V
    .locals 2

    .line 1
    const-string p2, "e_chat_hot_gifs_search"

    .line 2
    .line 3
    const-string v0, "p_chat_view"

    .line 4
    .line 5
    invoke-static {p2, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    new-instance p2, Landroid/content/Intent;

    .line 9
    .line 10
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    const-class v0, Lcom/p1/mobile/putong/core/ui/messages/meme/CorePopularMemeAct;

    .line 15
    .line 16
    invoke-direct {p2, p1, v0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 17
    .line 18
    .line 19
    sget-object p1, Lcom/p1/mobile/putong/core/ui/messages/meme/CorePopularMemeAct;->j:Ljava/lang/String;

    .line 20
    .line 21
    const/4 v0, 0x1

    .line 22
    invoke-virtual {p2, p1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 23
    .line 24
    .line 25
    sget-object p1, Lcom/p1/mobile/putong/core/ui/messages/meme/CorePopularMemeAct;->k:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {p2, p1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 28
    .line 29
    .line 30
    iget-object p1, p0, Ll/w0r$l;->b:Lcom/p1/mobile/android/app/Act;

    .line 31
    .line 32
    check-cast p1, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 33
    .line 34
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->B0()Ll/u1z;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-virtual {p1}, Ll/j3z;->g0()Ll/iam;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    check-cast p1, Ll/d3z;

    .line 43
    .line 44
    invoke-virtual {p1}, Ll/d3z;->t0()Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    if-nez v0, :cond_0

    .line 65
    .line 66
    sget-object v0, Lcom/p1/mobile/putong/core/ui/messages/meme/CorePopularMemeAct;->n:Ljava/lang/String;

    .line 67
    .line 68
    invoke-virtual {p2, v0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 69
    .line 70
    .line 71
    :cond_0
    iget-object p1, p0, Ll/w0r$l;->b:Lcom/p1/mobile/android/app/Act;

    .line 72
    .line 73
    new-instance v0, Ll/p1r;

    .line 74
    .line 75
    invoke-direct {v0, p0}, Ll/p1r;-><init>(Ll/w0r$l;)V

    .line 76
    .line 77
    .line 78
    const/16 v1, 0x12

    .line 79
    .line 80
    invoke-virtual {p1, v1, p2, v0}, Lcom/p1/mobile/android/app/Act;->startActivityForResult(ILandroid/content/Intent;Lcom/p1/mobile/android/app/a$a;)V

    .line 81
    .line 82
    .line 83
    iget-object p0, p0, Ll/w0r$l;->b:Lcom/p1/mobile/android/app/Act;

    .line 84
    .line 85
    sget p1, Ll/y7c0;->e:I

    .line 86
    .line 87
    sget p2, Ll/y7c0;->a:I

    .line 88
    .line 89
    invoke-virtual {p0, p1, p2}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 90
    .line 91
    .line 92
    return-void
.end method

.method public final synthetic J(Lcom/p1/mobile/putong/core/data/Sticker;ILandroid/view/View;)V
    .locals 2

    .line 1
    const-string p3, "gif_source"

    .line 2
    .line 3
    const-string v0, "gifs"

    .line 4
    .line 5
    invoke-static {p3, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object p3

    .line 9
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Sticker;->pictures:Ljava/util/List;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Lcom/p1/mobile/putong/data/Picture;

    .line 17
    .line 18
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 19
    .line 20
    const-string v1, "gift_url"

    .line 21
    .line 22
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    new-instance v1, Ljava/lang/StringBuilder;

    .line 27
    .line 28
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 29
    .line 30
    .line 31
    add-int/lit8 p2, p2, 0x1

    .line 32
    .line 33
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    const-string p2, ""

    .line 37
    .line 38
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p2

    .line 45
    const-string v1, "gifs_order"

    .line 46
    .line 47
    invoke-static {v1, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 48
    .line 49
    .line 50
    move-result-object p2

    .line 51
    filled-new-array {p3, v0, p2}, [Ll/pf60;

    .line 52
    .line 53
    .line 54
    move-result-object p2

    .line 55
    const-string p3, "e_chat_gif_click"

    .line 56
    .line 57
    const-string v0, "p_chat_view"

    .line 58
    .line 59
    invoke-static {p3, v0, p2}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 60
    .line 61
    .line 62
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    move-result p2

    .line 66
    if-eqz p2, :cond_0

    .line 67
    .line 68
    iget-object p0, p0, Ll/w0r$l;->b:Lcom/p1/mobile/android/app/Act;

    .line 69
    .line 70
    check-cast p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 71
    .line 72
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l()Ll/clz;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    iget-object p2, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 77
    .line 78
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 79
    .line 80
    .line 81
    move-result p2

    .line 82
    invoke-virtual {p0, p1, p2}, Ll/clz;->R6(Lcom/p1/mobile/putong/core/data/Sticker;Z)V

    .line 83
    .line 84
    .line 85
    :cond_0
    return-void
.end method

.method public final synthetic K(Lcom/p1/mobile/putong/core/data/Sticker;Landroid/widget/FrameLayout;Landroid/view/View;)Z
    .locals 3

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Sticker;->pictures:Ljava/util/List;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, Lcom/p1/mobile/putong/data/Picture;

    .line 9
    .line 10
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 11
    .line 12
    const-string v1, "gift_url"

    .line 13
    .line 14
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    filled-new-array {v0}, [Ll/pf60;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const-string v1, "e_gif_add"

    .line 23
    .line 24
    const-string v2, "p_chat_view"

    .line 25
    .line 26
    invoke-static {v1, v2, v0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-direct {p0, v0, p1}, Ll/w0r$l;->F(Landroid/content/Context;Lcom/p1/mobile/putong/core/data/Sticker;)Landroid/widget/PopupWindow;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-direct {p0, p1, p2, p3}, Ll/w0r$l;->L(Landroid/widget/PopupWindow;Landroid/view/View;Landroid/view/View;)V

    .line 38
    .line 39
    .line 40
    const/4 p0, 0x1

    .line 41
    return p0
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

.method public getItemCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w0r$l;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    add-int/lit8 p0, p0, 0x1

    .line 8
    .line 9
    return p0
.end method

.method public getItemViewType(I)I
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p0, -0x1

    .line 4
    return p0

    .line 5
    :cond_0
    const/4 p0, 0x1

    .line 6
    return p0
.end method

.method public onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$e0;I)V
    .locals 7
    .param p1    # Landroidx/recyclerview/widget/RecyclerView$e0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    check-cast p1, Ll/w0r$l$a;

    .line 2
    .line 3
    iget-object v0, p1, Ll/w0r$l$a;->a:Lv/VDraweeView;

    .line 4
    .line 5
    iget-object p1, p1, Ll/w0r$l$a;->b:Landroid/widget/FrameLayout;

    .line 6
    .line 7
    const-string v1, "p_chat_view"

    .line 8
    .line 9
    if-nez p2, :cond_2

    .line 10
    .line 11
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    invoke-virtual {p2}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    invoke-interface {p2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 20
    .line 21
    .line 22
    move-result p2

    .line 23
    if-eqz p2, :cond_0

    .line 24
    .line 25
    sget p2, Ll/ibc0;->i2:I

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    sget p2, Ll/ibc0;->h2:I

    .line 29
    .line 30
    :goto_0
    invoke-virtual {v0, p2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 31
    .line 32
    .line 33
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 34
    .line 35
    .line 36
    move-result-object p2

    .line 37
    invoke-virtual {p2}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 38
    .line 39
    .line 40
    move-result-object p2

    .line 41
    invoke-interface {p2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 42
    .line 43
    .line 44
    move-result p2

    .line 45
    if-eqz p2, :cond_1

    .line 46
    .line 47
    sget p2, Ll/ibc0;->K3:I

    .line 48
    .line 49
    goto :goto_1

    .line 50
    :cond_1
    sget p2, Ll/ibc0;->J3:I

    .line 51
    .line 52
    :goto_1
    invoke-virtual {v0, p2}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 53
    .line 54
    .line 55
    sget-object p2, Landroid/widget/ImageView$ScaleType;->CENTER:Landroid/widget/ImageView$ScaleType;

    .line 56
    .line 57
    invoke-virtual {v0, p2}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 58
    .line 59
    .line 60
    const-string p2, "e_chat_hot_gifs_search"

    .line 61
    .line 62
    invoke-static {p2, v1}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    new-instance p2, Ll/k1r;

    .line 66
    .line 67
    invoke-direct {p2, p0, p1}, Ll/k1r;-><init>(Ll/w0r$l;Landroid/widget/FrameLayout;)V

    .line 68
    .line 69
    .line 70
    invoke-static {p1, p2}, Ll/bnl0;->L(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 71
    .line 72
    .line 73
    return-void

    .line 74
    :cond_2
    iget-object v2, p0, Ll/w0r$l;->a:Ljava/util/List;

    .line 75
    .line 76
    add-int/lit8 v3, p2, -0x1

    .line 77
    .line 78
    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    check-cast v2, Lcom/p1/mobile/putong/core/data/Sticker;

    .line 83
    .line 84
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 85
    .line 86
    .line 87
    move-result v3

    .line 88
    if-eqz v3, :cond_4

    .line 89
    .line 90
    iget-object v3, v2, Lcom/p1/mobile/putong/core/data/Sticker;->pictures:Ljava/util/List;

    .line 91
    .line 92
    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    .line 93
    .line 94
    .line 95
    move-result v3

    .line 96
    if-nez v3, :cond_4

    .line 97
    .line 98
    invoke-virtual {p1, v2}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 99
    .line 100
    .line 101
    const/4 v3, 0x0

    .line 102
    invoke-virtual {v0, v3}, Landroid/view/View;->setBackgroundResource(I)V

    .line 103
    .line 104
    .line 105
    iget-object v4, v2, Lcom/p1/mobile/putong/core/data/Sticker;->source:Lcom/p1/mobile/putong/core/data/StickerSource;

    .line 106
    .line 107
    const-string v5, "shanmeng"

    .line 108
    .line 109
    invoke-static {v4, v5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 110
    .line 111
    .line 112
    move-result v4

    .line 113
    if-eqz v4, :cond_3

    .line 114
    .line 115
    sget-object v4, Ll/uqb0;->G:Ll/fsb0;

    .line 116
    .line 117
    iget-object v5, v2, Lcom/p1/mobile/putong/core/data/Sticker;->pictures:Ljava/util/List;

    .line 118
    .line 119
    invoke-interface {v5, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 120
    .line 121
    .line 122
    move-result-object v5

    .line 123
    check-cast v5, Lcom/p1/mobile/putong/data/Picture;

    .line 124
    .line 125
    iget-object v5, v5, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 126
    .line 127
    invoke-virtual {v4, v0, v5}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 128
    .line 129
    .line 130
    iget-object v4, v2, Lcom/p1/mobile/putong/core/data/Sticker;->pictures:Ljava/util/List;

    .line 131
    .line 132
    invoke-interface {v4, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 133
    .line 134
    .line 135
    move-result-object v4

    .line 136
    check-cast v4, Lcom/p1/mobile/putong/data/Picture;

    .line 137
    .line 138
    iget-object v4, v4, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 139
    .line 140
    invoke-static {v4}, Ll/niw;->e(Ljava/lang/String;)Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object v4

    .line 144
    iput-object v4, v2, Lcom/p1/mobile/putong/core/data/Sticker;->hash:Ljava/lang/String;

    .line 145
    .line 146
    goto :goto_2

    .line 147
    :cond_3
    sget-object v4, Ll/uqb0;->G:Ll/fsb0;

    .line 148
    .line 149
    iget-object v5, v2, Lcom/p1/mobile/putong/core/data/Sticker;->pictures:Ljava/util/List;

    .line 150
    .line 151
    invoke-interface {v5, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 152
    .line 153
    .line 154
    move-result-object v5

    .line 155
    check-cast v5, Lcom/p1/mobile/putong/data/Picture;

    .line 156
    .line 157
    invoke-virtual {p0, v5}, Ll/w0r$l;->M(Lcom/p1/mobile/putong/data/Picture;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 158
    .line 159
    .line 160
    move-result-object v5

    .line 161
    invoke-virtual {v4, v0, v5}, Ll/fsb0;->B0(Lcom/facebook/drawee/view/DraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 162
    .line 163
    .line 164
    :goto_2
    const-string v4, "gif_source"

    .line 165
    .line 166
    const-string v5, "gifs"

    .line 167
    .line 168
    invoke-static {v4, v5}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 169
    .line 170
    .line 171
    move-result-object v4

    .line 172
    iget-object v5, v2, Lcom/p1/mobile/putong/core/data/Sticker;->pictures:Ljava/util/List;

    .line 173
    .line 174
    invoke-interface {v5, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 175
    .line 176
    .line 177
    move-result-object v3

    .line 178
    check-cast v3, Lcom/p1/mobile/putong/data/Picture;

    .line 179
    .line 180
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 181
    .line 182
    const-string v5, "gift_url"

    .line 183
    .line 184
    invoke-static {v5, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 185
    .line 186
    .line 187
    move-result-object v3

    .line 188
    new-instance v5, Ljava/lang/StringBuilder;

    .line 189
    .line 190
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 191
    .line 192
    .line 193
    add-int/lit8 v6, p2, 0x1

    .line 194
    .line 195
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 196
    .line 197
    .line 198
    const-string v6, ""

    .line 199
    .line 200
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 201
    .line 202
    .line 203
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 204
    .line 205
    .line 206
    move-result-object v5

    .line 207
    const-string v6, "gifs_order"

    .line 208
    .line 209
    invoke-static {v6, v5}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 210
    .line 211
    .line 212
    move-result-object v5

    .line 213
    filled-new-array {v4, v3, v5}, [Ll/pf60;

    .line 214
    .line 215
    .line 216
    move-result-object v3

    .line 217
    const-string v4, "e_chat_gif_click"

    .line 218
    .line 219
    invoke-static {v4, v1, v3}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 220
    .line 221
    .line 222
    new-instance v1, Ll/l1r;

    .line 223
    .line 224
    invoke-direct {v1, p0, v2, p2}, Ll/l1r;-><init>(Ll/w0r$l;Lcom/p1/mobile/putong/core/data/Sticker;I)V

    .line 225
    .line 226
    .line 227
    invoke-static {p1, v1}, Ll/bnl0;->L(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 228
    .line 229
    .line 230
    new-instance p2, Ll/m1r;

    .line 231
    .line 232
    invoke-direct {p2, p0, v2, p1}, Ll/m1r;-><init>(Ll/w0r$l;Lcom/p1/mobile/putong/core/data/Sticker;Landroid/widget/FrameLayout;)V

    .line 233
    .line 234
    .line 235
    invoke-virtual {p1, p2}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 236
    .line 237
    .line 238
    goto :goto_3

    .line 239
    :cond_4
    sget-object p0, Ll/uqb0;->G:Ll/fsb0;

    .line 240
    .line 241
    invoke-virtual {p0, v0}, Ll/am2;->o(Lcom/facebook/drawee/view/DraweeView;)V

    .line 242
    .line 243
    .line 244
    :goto_3
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 245
    .line 246
    .line 247
    move-result-object p0

    .line 248
    const/high16 p1, 0x41200000    # 10.0f

    .line 249
    .line 250
    invoke-interface {p0, v0, p1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->R9(Landroid/view/View;F)V

    .line 251
    .line 252
    .line 253
    return-void
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$e0;
    .locals 2
    .param p1    # Landroid/view/ViewGroup;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object p2, p0, Ll/w0r$l;->b:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    sget v0, Ll/qec0;->t1:I

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-virtual {p2, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 15
    .line 16
    .line 17
    move-result-object p2

    .line 18
    const/4 v0, -0x1

    .line 19
    iput v0, p2, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 20
    .line 21
    invoke-static {}, Ll/bnl0;->y0()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    const/high16 v1, 0x40800000    # 4.0f

    .line 26
    .line 27
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    sub-int/2addr v0, v1

    .line 32
    div-int/lit8 v0, v0, 0x4

    .line 33
    .line 34
    iput v0, p2, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 35
    .line 36
    iput v0, p2, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 37
    .line 38
    invoke-virtual {p1, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 39
    .line 40
    .line 41
    new-instance p2, Ll/w0r$l$a;

    .line 42
    .line 43
    invoke-direct {p2, p0, p1}, Ll/w0r$l$a;-><init>(Ll/w0r$l;Landroid/view/View;)V

    .line 44
    .line 45
    .line 46
    return-object p2
.end method
