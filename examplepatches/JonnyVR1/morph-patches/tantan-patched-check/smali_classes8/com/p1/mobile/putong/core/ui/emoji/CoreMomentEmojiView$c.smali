.class public Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView$c;
.super Ll/dq1;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "c"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/dq1<",
        "Ll/oze$a;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ll/oze$a;",
            ">;"
        }
    .end annotation
.end field

.field public final d:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public e:Landroid/widget/PopupWindow;

.field public final synthetic f:Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView;Ll/y20;Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/ArrayList<",
            "Ll/oze$a;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView$c;->f:Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/dq1;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p3, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView$c;->c:Ljava/util/ArrayList;

    .line 7
    .line 8
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView$c;->d:Ll/y20;

    .line 9
    .line 10
    return-void
.end method

.method private synthetic A(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView$c;->d:Ll/y20;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Ljava/lang/String;

    .line 8
    .line 9
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method private C(Landroid/widget/PopupWindow;Landroid/view/View;Landroid/view/View;)V
    .locals 7

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
    add-int/2addr v3, v4

    .line 31
    invoke-virtual {v2}, Landroid/view/View;->getMeasuredWidth()I

    .line 32
    .line 33
    .line 34
    move-result v4

    .line 35
    div-int/2addr v4, v0

    .line 36
    sub-int/2addr v3, v4

    .line 37
    const/4 v0, 0x1

    .line 38
    aget v1, v1, v0

    .line 39
    .line 40
    invoke-virtual {v2}, Landroid/view/View;->getMeasuredHeight()I

    .line 41
    .line 42
    .line 43
    move-result v4

    .line 44
    sub-int/2addr v1, v4

    .line 45
    invoke-virtual {v2}, Landroid/view/View;->getMeasuredWidth()I

    .line 46
    .line 47
    .line 48
    move-result v4

    .line 49
    add-int/2addr v4, v3

    .line 50
    invoke-static {}, Ll/bnl0;->y0()I

    .line 51
    .line 52
    .line 53
    move-result v5

    .line 54
    sget v6, Ll/qa00;->a:I

    .line 55
    .line 56
    sub-int/2addr v5, v6

    .line 57
    if-le v4, v5, :cond_0

    .line 58
    .line 59
    invoke-static {}, Ll/bnl0;->y0()I

    .line 60
    .line 61
    .line 62
    move-result v3

    .line 63
    sub-int/2addr v3, v6

    .line 64
    invoke-virtual {v2}, Landroid/view/View;->getMeasuredWidth()I

    .line 65
    .line 66
    .line 67
    move-result v2

    .line 68
    sub-int/2addr v3, v2

    .line 69
    goto :goto_0

    .line 70
    :cond_0
    if-ge v3, v6, :cond_1

    .line 71
    .line 72
    move v3, v6

    .line 73
    :cond_1
    :goto_0
    const/16 v2, 0x33

    .line 74
    .line 75
    invoke-virtual {p1, p2, v2, v3, v1}, Landroid/widget/PopupWindow;->showAtLocation(Landroid/view/View;III)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {p1, v0}, Landroid/widget/PopupWindow;->setOutsideTouchable(Z)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {p1, v0}, Landroid/widget/PopupWindow;->setFocusable(Z)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {p1}, Landroid/widget/PopupWindow;->update()V

    .line 85
    .line 86
    .line 87
    invoke-virtual {p3}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 88
    .line 89
    .line 90
    move-result-object p2

    .line 91
    invoke-interface {p2, v0}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 92
    .line 93
    .line 94
    new-instance p2, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView$c$b;

    .line 95
    .line 96
    invoke-direct {p2, p0, p3}, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView$c$b;-><init>(Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView$c;Landroid/view/View;)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {p1, p2}, Landroid/widget/PopupWindow;->setOnDismissListener(Landroid/widget/PopupWindow$OnDismissListener;)V

    .line 100
    .line 101
    .line 102
    return-void
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView$c;Landroid/view/View;Ll/oze$a;Ljava/lang/String;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView$c;->B(Landroid/view/View;Ll/oze$a;Ljava/lang/String;Landroid/view/View;)Z

    move-result p0

    return p0
.end method

.method public static synthetic s(Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView$c;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView$c;->A(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic t(Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView$c;Ll/oze$a;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView$c;->z(Ll/oze$a;Landroid/view/View;)V

    return-void
.end method

.method private y(Landroid/content/Context;ILjava/lang/String;)Landroid/widget/PopupWindow;
    .locals 4

    .line 1
    invoke-static {p1}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    sget v0, Ll/kec0;->C7:I

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
    sget v0, Ll/adc0;->i6:I

    .line 13
    .line 14
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Lv/VImage;

    .line 19
    .line 20
    sget v2, Ll/adc0;->Sd:I

    .line 21
    .line 22
    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    check-cast v2, Lv/VText;

    .line 27
    .line 28
    sget v3, Ll/adc0;->v3:I

    .line 29
    .line 30
    invoke-virtual {p1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    check-cast v3, Lv/VText;

    .line 35
    .line 36
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView$c;->f:Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView;

    .line 37
    .line 38
    invoke-static {p0, p1, v1, v2}, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView;->k(Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView;Landroid/view/View;Landroid/widget/TextView;Landroid/widget/TextView;)V

    .line 39
    .line 40
    .line 41
    new-instance p0, Landroid/widget/PopupWindow;

    .line 42
    .line 43
    const/4 v1, -0x2

    .line 44
    invoke-direct {p0, p1, v1, v1}, Landroid/widget/PopupWindow;-><init>(Landroid/view/View;II)V

    .line 45
    .line 46
    .line 47
    invoke-static {p3}, Ll/eu0;->b(Ljava/lang/String;)Z

    .line 48
    .line 49
    .line 50
    invoke-static {p3}, Ll/eu0;->b(Ljava/lang/String;)Z

    .line 51
    .line 52
    .line 53
    move-result p1

    .line 54
    if-eqz p1, :cond_0

    .line 55
    .line 56
    const/4 p1, 0x1

    .line 57
    invoke-static {v3, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 58
    .line 59
    .line 60
    const/4 p1, 0x0

    .line 61
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 62
    .line 63
    .line 64
    new-instance p1, Ljava/lang/StringBuilder;

    .line 65
    .line 66
    const-string p2, "["

    .line 67
    .line 68
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    const-string p2, "]"

    .line 75
    .line 76
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    invoke-virtual {v3, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 84
    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_0
    invoke-virtual {v0, p2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 88
    .line 89
    .line 90
    :goto_0
    invoke-virtual {v2, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 91
    .line 92
    .line 93
    return-object p0
.end method


# virtual methods
.method public final synthetic B(Landroid/view/View;Ll/oze$a;Ljava/lang/String;Landroid/view/View;)Z
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget p2, p2, Ll/oze$a;->d:I

    .line 6
    .line 7
    invoke-direct {p0, v0, p2, p3}, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView$c;->y(Landroid/content/Context;ILjava/lang/String;)Landroid/widget/PopupWindow;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView$c;->e:Landroid/widget/PopupWindow;

    .line 12
    .line 13
    invoke-direct {p0, p2, p1, p4}, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView$c;->C(Landroid/widget/PopupWindow;Landroid/view/View;Landroid/view/View;)V

    .line 14
    .line 15
    .line 16
    const/4 p0, 0x1

    .line 17
    return p0
.end method

.method public getCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView$c;->c:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView$c;->c:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getItemId(I)J
    .locals 0

    int-to-long p0, p1

    return-wide p0
.end method

.method public bridge synthetic j(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Ll/oze$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView$c;->w(Landroid/view/View;Ll/oze$a;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public m(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    sget p1, Ll/kec0;->B7:I

    .line 10
    .line 11
    const/4 p2, 0x0

    .line 12
    invoke-virtual {p0, p1, p2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public w(Landroid/view/View;Ll/oze$a;II)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    check-cast p3, Landroid/widget/AbsListView$LayoutParams;

    .line 6
    .line 7
    if-nez p3, :cond_0

    .line 8
    .line 9
    new-instance p3, Landroid/widget/AbsListView$LayoutParams;

    .line 10
    .line 11
    const/4 p4, -0x2

    .line 12
    invoke-direct {p3, p4, p4}, Landroid/widget/AbsListView$LayoutParams;-><init>(II)V

    .line 13
    .line 14
    .line 15
    iget-object p4, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView$c;->f:Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView;

    .line 16
    .line 17
    invoke-static {p4}, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView;->f(Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView;)I

    .line 18
    .line 19
    .line 20
    move-result p4

    .line 21
    iput p4, p3, Landroid/widget/AbsListView$LayoutParams;->width:I

    .line 22
    .line 23
    iget-object p4, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView$c;->f:Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView;

    .line 24
    .line 25
    invoke-static {p4}, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView;->f(Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView;)I

    .line 26
    .line 27
    .line 28
    move-result p4

    .line 29
    iput p4, p3, Landroid/widget/AbsListView$LayoutParams;->height:I

    .line 30
    .line 31
    :cond_0
    invoke-virtual {p1, p3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 32
    .line 33
    .line 34
    sget p3, Ll/adc0;->w6:I

    .line 35
    .line 36
    invoke-virtual {p1, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object p3

    .line 40
    check-cast p3, Landroid/widget/ImageView;

    .line 41
    .line 42
    iget p4, p2, Ll/oze$a;->d:I

    .line 43
    .line 44
    if-gtz p4, :cond_1

    .line 45
    .line 46
    new-instance p4, Ll/jye;

    .line 47
    .line 48
    invoke-virtual {p3}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    iget-object v1, p2, Ll/oze$a;->a:Ljava/lang/String;

    .line 53
    .line 54
    const/high16 v2, 0x41c00000    # 24.0f

    .line 55
    .line 56
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 57
    .line 58
    .line 59
    move-result v3

    .line 60
    invoke-direct {p4, v0, v1, v2, v3}, Ll/jye;-><init>(Landroid/content/Context;Ljava/lang/CharSequence;FI)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p3, p4}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 64
    .line 65
    .line 66
    new-instance p3, Ll/l0a;

    .line 67
    .line 68
    invoke-direct {p3, p0, p2}, Ll/l0a;-><init>(Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView$c;Ll/oze$a;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p1, p3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 72
    .line 73
    .line 74
    return-void

    .line 75
    :cond_1
    invoke-virtual {p3, p4}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 76
    .line 77
    .line 78
    iget-object p3, p2, Ll/oze$a;->a:Ljava/lang/String;

    .line 79
    .line 80
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 81
    .line 82
    .line 83
    move-result p3

    .line 84
    const-string p4, "]"

    .line 85
    .line 86
    const-string v0, "["

    .line 87
    .line 88
    if-eqz p3, :cond_2

    .line 89
    .line 90
    new-instance p3, Ljava/lang/StringBuilder;

    .line 91
    .line 92
    invoke-direct {p3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 96
    .line 97
    iget v1, p2, Ll/oze$a;->b:I

    .line 98
    .line 99
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object p3

    .line 113
    sget-object p4, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 114
    .line 115
    iget v0, p2, Ll/oze$a;->b:I

    .line 116
    .line 117
    invoke-virtual {p4, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object p4

    .line 121
    goto :goto_0

    .line 122
    :cond_2
    new-instance p3, Ljava/lang/StringBuilder;

    .line 123
    .line 124
    invoke-direct {p3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 125
    .line 126
    .line 127
    iget-object v0, p2, Ll/oze$a;->a:Ljava/lang/String;

    .line 128
    .line 129
    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 130
    .line 131
    .line 132
    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 133
    .line 134
    .line 135
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object p3

    .line 139
    iget-object p4, p2, Ll/oze$a;->a:Ljava/lang/String;

    .line 140
    .line 141
    :goto_0
    invoke-virtual {p1, p3}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 142
    .line 143
    .line 144
    new-instance p3, Ll/m0a;

    .line 145
    .line 146
    invoke-direct {p3, p0}, Ll/m0a;-><init>(Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView$c;)V

    .line 147
    .line 148
    .line 149
    invoke-virtual {p1, p3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 150
    .line 151
    .line 152
    new-instance p3, Ll/n0a;

    .line 153
    .line 154
    invoke-direct {p3, p0, p1, p2, p4}, Ll/n0a;-><init>(Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView$c;Landroid/view/View;Ll/oze$a;Ljava/lang/String;)V

    .line 155
    .line 156
    .line 157
    invoke-virtual {p1, p3}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 158
    .line 159
    .line 160
    new-instance p2, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView$c$a;

    .line 161
    .line 162
    invoke-direct {p2, p0}, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView$c$a;-><init>(Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView$c;)V

    .line 163
    .line 164
    .line 165
    invoke-virtual {p1, p2}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 166
    .line 167
    .line 168
    return-void
.end method

.method public final synthetic z(Ll/oze$a;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView$c;->d:Ll/y20;

    .line 2
    .line 3
    iget-object p1, p1, Ll/oze$a;->a:Ljava/lang/String;

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
