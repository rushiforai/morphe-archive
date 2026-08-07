.class public Ll/snc0;
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

.method public static synthetic a(Lcom/p1/mobile/putong/core/data/Message;[Ll/w30;Lv/VListCell;Lv/VListCell$a;I)V
    .locals 0

    .line 1
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    invoke-virtual {p2, p0}, Lcom/p1/mobile/putong/core/api/g;->In(Lcom/p1/mobile/putong/core/data/Message;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    new-instance p3, Ll/qnc0;

    .line 10
    .line 11
    invoke-direct {p3}, Ll/qnc0;-><init>()V

    .line 12
    .line 13
    .line 14
    new-instance p4, Ll/rnc0;

    .line 15
    .line 16
    invoke-direct {p4, p0}, Ll/rnc0;-><init>(Lcom/p1/mobile/putong/core/data/Message;)V

    .line 17
    .line 18
    .line 19
    invoke-static {p3, p4}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p2, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 24
    .line 25
    .line 26
    const/4 p0, 0x0

    .line 27
    aget-object p0, p1, p0

    .line 28
    .line 29
    invoke-virtual {p0}, Ll/w30;->b()V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public static synthetic b([Ll/w30;Landroid/view/View;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    aget-object p0, p0, p1

    .line 3
    .line 4
    invoke-virtual {p0}, Ll/w30;->b()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic c(Ll/uxj0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 5

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    sget v2, Lcom/p1/mobile/putong/core/message/R$string;->K4:I

    .line 11
    .line 12
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    const/4 v1, 0x1

    .line 20
    new-array v1, v1, [Ll/w30;

    .line 21
    .line 22
    new-instance v2, Ll/w30$b;

    .line 23
    .line 24
    invoke-direct {v2, p0}, Ll/w30$b;-><init>(Landroid/content/Context;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    sget v4, Lcom/p1/mobile/putong/core/message/R$string;->t4:I

    .line 32
    .line 33
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    invoke-virtual {v2, v3}, Ll/w30$b;->L(Ljava/lang/CharSequence;)Ll/w30$b;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    sget v3, Lcom/p1/mobile/putong/core/message/R$string;->a:I

    .line 46
    .line 47
    invoke-virtual {p0, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-virtual {v2, p0}, Ll/w30$b;->I(Ljava/lang/CharSequence;)Ll/w30$b;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    new-instance v2, Ll/onc0;

    .line 56
    .line 57
    invoke-direct {v2, v1}, Ll/onc0;-><init>([Ll/w30;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p0, v2}, Ll/w30$b;->U(Landroid/view/View$OnClickListener;)Ll/w30$b;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-virtual {p0, v0}, Ll/w30$b;->Q(Ljava/util/List;)Ll/w30$b;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    new-instance v0, Ll/pnc0;

    .line 69
    .line 70
    invoke-direct {v0, p1, v1}, Ll/pnc0;-><init>(Lcom/p1/mobile/putong/core/data/Message;[Ll/w30;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {p0, v0}, Ll/w30$b;->V(Ll/w30$d;)Ll/w30$b;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    invoke-virtual {p0}, Ll/w30$b;->F()Ll/w30;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    invoke-virtual {p0}, Ll/w30;->f()V

    .line 82
    .line 83
    .line 84
    const/4 p1, 0x0

    .line 85
    aput-object p0, v1, p1

    .line 86
    .line 87
    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/core/data/Message;Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Ll/r97;->E()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Message;->channel:Lcom/p1/mobile/putong/core/data/MessageChannel;

    .line 16
    .line 17
    const-string v0, "group"

    .line 18
    .line 19
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_1

    .line 24
    .line 25
    instance-of p0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 26
    .line 27
    if-eqz p0, :cond_1

    .line 28
    .line 29
    check-cast p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 30
    .line 31
    iget-boolean p0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->hasHandle:Z

    .line 32
    .line 33
    if-eqz p0, :cond_0

    .line 34
    .line 35
    return-void

    .line 36
    :cond_0
    const/4 p0, 0x1

    .line 37
    iput-boolean p0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->hasHandle:Z

    .line 38
    .line 39
    :cond_1
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->u4:I

    .line 40
    .line 41
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public static f(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/android/app/Act;Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/Message;",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/util/List<",
            "Ll/ovb0<",
            "Ljava/lang/String;",
            "Ljava/lang/Runnable;",
            "Ljava/lang/Integer;",
            "Ljava/lang/Void;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/g;->Xe(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Conversation;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Ll/br5;->f(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Message;->isMe()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Message;->status()Lcom/p1/mobile/putong/data/LocalStatus;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    const-string v1, "normal"

    .line 29
    .line 30
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_1

    .line 35
    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->likeOfMoment:Ljava/lang/String;

    .line 37
    .line 38
    if-nez v0, :cond_1

    .line 39
    .line 40
    invoke-virtual {p1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    sget v1, Lcom/p1/mobile/putong/core/message/R$string;->K4:I

    .line 45
    .line 46
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    new-instance v1, Ll/nnc0;

    .line 51
    .line 52
    invoke-direct {v1, p1, p0}, Ll/nnc0;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Message;)V

    .line 53
    .line 54
    .line 55
    sget p0, Ll/ibc0;->u1:I

    .line 56
    .line 57
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    const/4 p1, 0x0

    .line 62
    invoke-static {v0, v1, p0, p1}, Ll/jyb;->Z(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ll/ovb0;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-interface {p2, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    :cond_1
    :goto_0
    return-void
.end method

.method public static g(Landroid/view/View;ILcom/p1/mobile/android/app/Act;)Z
    .locals 5

    .line 1
    instance-of v0, p2, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_2

    .line 5
    .line 6
    check-cast p2, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 7
    .line 8
    iget-object p2, p2, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 9
    .line 10
    invoke-virtual {p2}, Ll/j3z;->e0()Ll/mzl;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    invoke-interface {p2}, Ll/mzl;->B0()Ll/u1z;

    .line 15
    .line 16
    .line 17
    move-result-object p2

    .line 18
    invoke-virtual {p2}, Ll/j3z;->g0()Ll/iam;

    .line 19
    .line 20
    .line 21
    move-result-object p2

    .line 22
    check-cast p2, Ll/d3z;

    .line 23
    .line 24
    invoke-virtual {p2}, Ll/d3z;->t0()Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    const/high16 v0, 0x41f00000    # 30.0f

    .line 29
    .line 30
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    const/high16 v2, 0x42200000    # 40.0f

    .line 35
    .line 36
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 37
    .line 38
    .line 39
    move-result v3

    .line 40
    mul-int/2addr v3, p1

    .line 41
    add-int/2addr v0, v3

    .line 42
    const/4 p1, 0x2

    .line 43
    new-array v3, p1, [I

    .line 44
    .line 45
    invoke-virtual {p2, v3}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 46
    .line 47
    .line 48
    new-array p1, p1, [I

    .line 49
    .line 50
    invoke-virtual {p0, p1}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 51
    .line 52
    .line 53
    const/4 p2, 0x1

    .line 54
    aget v3, v3, p2

    .line 55
    .line 56
    aget v4, p1, p2

    .line 57
    .line 58
    sub-int/2addr v3, v4

    .line 59
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 60
    .line 61
    .line 62
    move-result p0

    .line 63
    sub-int/2addr v3, p0

    .line 64
    aget p0, p1, p2

    .line 65
    .line 66
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 67
    .line 68
    .line 69
    move-result p1

    .line 70
    sub-int/2addr p0, p1

    .line 71
    if-le p0, v3, :cond_0

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_0
    move p2, v1

    .line 75
    :goto_0
    if-eqz p2, :cond_1

    .line 76
    .line 77
    if-ge p0, v0, :cond_1

    .line 78
    .line 79
    return v1

    .line 80
    :cond_1
    return p2

    .line 81
    :cond_2
    return v1
.end method

.method public static h(I)I
    .locals 1

    .line 1
    const/4 v0, -0x2

    .line 2
    if-ne p0, v0, :cond_0

    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const/high16 v0, 0x40000000    # 2.0f

    .line 7
    .line 8
    :goto_0
    invoke-static {p0}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    invoke-static {p0, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    return p0
.end method

.method public static i(Lcom/p1/mobile/putong/core/data/Message;Landroid/view/View;Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p0, p2, v0}, Ll/snc0;->f(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/android/app/Act;Ljava/util/List;)V

    .line 7
    .line 8
    .line 9
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    invoke-static {p1, p0, p2}, Ll/snc0;->g(Landroid/view/View;ILcom/p1/mobile/android/app/Act;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    invoke-static {p1, v0, p0, p2}, Ll/snc0;->j(Landroid/view/View;Ljava/util/List;ZLcom/p1/mobile/android/app/Act;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public static j(Landroid/view/View;Ljava/util/List;ZLcom/p1/mobile/android/app/Act;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Ljava/util/List<",
            "Ll/ovb0<",
            "Ljava/lang/String;",
            "Ljava/lang/Runnable;",
            "Ljava/lang/Integer;",
            "Ljava/lang/Void;",
            ">;>;Z",
            "Lcom/p1/mobile/android/app/Act;",
            ")V"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/ui/messages/view/MenuCustomView;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1, p2}, Lcom/p1/mobile/putong/core/ui/messages/view/MenuCustomView;-><init>(Landroid/content/Context;Z)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/ui/messages/view/MenuCustomView;->setData(Ljava/util/List;)V

    .line 11
    .line 12
    .line 13
    new-instance p1, Landroid/widget/PopupWindow;

    .line 14
    .line 15
    const/4 v1, -0x2

    .line 16
    invoke-direct {p1, v0, v1, v1}, Landroid/widget/PopupWindow;-><init>(Landroid/view/View;II)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/ui/messages/view/MenuCustomView;->setPopupWindow(Landroid/widget/PopupWindow;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p1}, Landroid/widget/PopupWindow;->getWidth()I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    invoke-static {v1}, Ll/snc0;->h(I)I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    invoke-virtual {p1}, Landroid/widget/PopupWindow;->getHeight()I

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    invoke-static {v2}, Ll/snc0;->h(I)I

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    invoke-virtual {v0, v1, v2}, Landroid/view/View;->measure(II)V

    .line 39
    .line 40
    .line 41
    const/4 v1, 0x1

    .line 42
    invoke-virtual {p1, v1}, Landroid/widget/PopupWindow;->setOutsideTouchable(Z)V

    .line 43
    .line 44
    .line 45
    new-instance v1, Landroid/graphics/drawable/BitmapDrawable;

    .line 46
    .line 47
    invoke-direct {v1}, Landroid/graphics/drawable/BitmapDrawable;-><init>()V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p1, v1}, Landroid/widget/PopupWindow;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 51
    .line 52
    .line 53
    const/16 v1, 0xa

    .line 54
    .line 55
    if-eqz p2, :cond_0

    .line 56
    .line 57
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 58
    .line 59
    .line 60
    move-result p2

    .line 61
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    .line 62
    .line 63
    .line 64
    move-result v2

    .line 65
    sub-int/2addr p2, v2

    .line 66
    div-int/lit8 p2, p2, 0x2

    .line 67
    .line 68
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    neg-int v0, v0

    .line 73
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 74
    .line 75
    .line 76
    move-result v2

    .line 77
    sub-int/2addr v0, v2

    .line 78
    add-int/lit8 v1, v0, -0xa

    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 82
    .line 83
    .line 84
    move-result p2

    .line 85
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    sub-int/2addr p2, v0

    .line 90
    div-int/lit8 p2, p2, 0x2

    .line 91
    .line 92
    :goto_0
    const v0, 0x800003

    .line 93
    .line 94
    .line 95
    invoke-virtual {p1, p0, p2, v1, v0}, Landroid/widget/PopupWindow;->showAsDropDown(Landroid/view/View;III)V

    .line 96
    .line 97
    .line 98
    new-instance p0, Ll/snc0$a;

    .line 99
    .line 100
    invoke-direct {p0, p1}, Ll/snc0$a;-><init>(Landroid/widget/PopupWindow;)V

    .line 101
    .line 102
    .line 103
    new-instance p2, Ll/snc0$b;

    .line 104
    .line 105
    invoke-direct {p2, p3, p0}, Ll/snc0$b;-><init>(Lcom/p1/mobile/android/app/Act;Ll/pn50;)V

    .line 106
    .line 107
    .line 108
    invoke-virtual {p1, p2}, Landroid/widget/PopupWindow;->setOnDismissListener(Landroid/widget/PopupWindow$OnDismissListener;)V

    .line 109
    .line 110
    .line 111
    check-cast p3, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 112
    .line 113
    iget-object p1, p3, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 114
    .line 115
    invoke-virtual {p1}, Ll/clz;->t7()Ll/qzz;

    .line 116
    .line 117
    .line 118
    move-result-object p1

    .line 119
    iget-object p1, p1, Ll/qzz;->n1:Ll/iwl;

    .line 120
    .line 121
    invoke-interface {p1, p0}, Ll/iwl;->n(Ll/pn50;)V

    .line 122
    .line 123
    .line 124
    return-void
.end method
