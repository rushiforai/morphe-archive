.class public Ll/r600;
.super Ll/bdz;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/r600$b;,
        Ll/r600$c;
    }
.end annotation


# static fields
.field public static i:Ljava/lang/String; = ""

.field public static j:Ljava/lang/String; = ""


# instance fields
.field public c:Ljava/lang/String;

.field public d:Lv/VImage;

.field public e:Lv/VPager;

.field public f:Lv/VPagerCircleIndicator;

.field public g:Ll/r600$c;

.field public h:Ljava/lang/Runnable;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/android/app/Act;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Ll/bdz;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 2
    .line 3
    .line 4
    const-string p1, ""

    .line 5
    .line 6
    iput-object p1, p0, Ll/r600;->c:Ljava/lang/String;

    .line 7
    .line 8
    new-instance p1, Ll/r600$a;

    .line 9
    .line 10
    invoke-direct {p1, p0}, Ll/r600$a;-><init>(Ll/r600;)V

    .line 11
    .line 12
    .line 13
    iput-object p1, p0, Ll/r600;->h:Ljava/lang/Runnable;

    .line 14
    .line 15
    iput-object p2, p0, Ll/r600;->c:Ljava/lang/String;

    .line 16
    .line 17
    return-void
.end method

.method public static synthetic j(Ll/r600;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/r600;->q(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic k(Ll/r600;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/r600;->p(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic l(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeEditAct;->a2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const/16 p2, 0x312

    .line 6
    .line 7
    invoke-virtual {p0, p1, p2}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 8
    .line 9
    .line 10
    sget p1, Ll/y7c0;->e:I

    .line 11
    .line 12
    sget p2, Ll/y7c0;->a:I

    .line 13
    .line 14
    invoke-virtual {p0, p1, p2}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public static synthetic m(Ll/r600;Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/r600;->r(Landroid/view/View;Landroid/view/MotionEvent;)Z

    move-result p0

    return p0
.end method

.method public static bridge synthetic n(Ll/r600;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/r600;->s()V

    return-void
.end method

.method public static t(Lcom/p1/mobile/putong/app/PutongAct;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    sput-object p2, Ll/r600;->j:Ljava/lang/String;

    .line 2
    .line 3
    sput-object p3, Ll/r600;->i:Ljava/lang/String;

    .line 4
    .line 5
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 6
    .line 7
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 8
    .line 9
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/core/api/g;->zp(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Conversation;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    if-eqz p2, :cond_2

    .line 14
    .line 15
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 16
    .line 17
    const-string v0, "dismissed"

    .line 18
    .line 19
    invoke-static {p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 20
    .line 21
    .line 22
    move-result p2

    .line 23
    if-eqz p2, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 27
    .line 28
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 29
    .line 30
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/g;->v1:Ll/jxd0;

    .line 31
    .line 32
    invoke-virtual {p2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object p2

    .line 36
    check-cast p2, Ljava/lang/Boolean;

    .line 37
    .line 38
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 39
    .line 40
    .line 41
    move-result p2

    .line 42
    if-nez p2, :cond_1

    .line 43
    .line 44
    new-instance p2, Ll/r600;

    .line 45
    .line 46
    invoke-direct {p2, p0, p1}, Ll/r600;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 50
    .line 51
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 52
    .line 53
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/g;->v1:Ll/jxd0;

    .line 54
    .line 55
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 56
    .line 57
    invoke-virtual {p0, p1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    invoke-virtual {p2}, Ll/r600;->show()V

    .line 61
    .line 62
    .line 63
    return-void

    .line 64
    :cond_1
    invoke-static {p0, p1, p3}, Ll/r600;->u(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    return-void

    .line 68
    :cond_2
    :goto_0
    const-string p0, "\u5df2\u89e3\u9664\u914d\u5bf9\uff0c\u65e0\u6cd5\u67e5\u770b"

    .line 69
    .line 70
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public static u(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    new-instance v0, Ll/n600;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Ll/n600;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p0, v0}, Ll/azy;->V(Lcom/p1/mobile/android/app/Act;Ll/x20;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public c()I
    .locals 0

    .line 1
    const/16 p0, 0x50

    .line 2
    .line 3
    return p0
.end method

.method public f()V
    .locals 5

    .line 1
    sget v0, Ll/edc0;->Y0:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ll/o600;

    .line 8
    .line 9
    invoke-direct {v1, p0}, Ll/o600;-><init>(Ll/r600;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const/4 v1, -0x2

    .line 24
    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->height:I

    .line 25
    .line 26
    const/16 v1, 0x50

    .line 27
    .line 28
    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->gravity:I

    .line 29
    .line 30
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v1, v0}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 35
    .line 36
    .line 37
    const/4 v0, 0x1

    .line 38
    invoke-virtual {p0, v0}, Landroid/app/Dialog;->setCancelable(Z)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0, v0}, Landroid/app/Dialog;->setCanceledOnTouchOutside(Z)V

    .line 42
    .line 43
    .line 44
    sget v0, Ll/edc0;->O:I

    .line 45
    .line 46
    invoke-virtual {p0, v0}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    check-cast v0, Lv/VImage;

    .line 51
    .line 52
    iput-object v0, p0, Ll/r600;->d:Lv/VImage;

    .line 53
    .line 54
    new-instance v1, Ll/p600;

    .line 55
    .line 56
    invoke-direct {v1, p0}, Ll/p600;-><init>(Ll/r600;)V

    .line 57
    .line 58
    .line 59
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 60
    .line 61
    .line 62
    sget v0, Ll/edc0;->q3:I

    .line 63
    .line 64
    invoke-virtual {p0, v0}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    check-cast v0, Lv/VPager;

    .line 69
    .line 70
    iput-object v0, p0, Ll/r600;->e:Lv/VPager;

    .line 71
    .line 72
    sget v0, Ll/edc0;->p3:I

    .line 73
    .line 74
    invoke-virtual {p0, v0}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    check-cast v0, Lv/VPagerCircleIndicator;

    .line 79
    .line 80
    iput-object v0, p0, Ll/r600;->f:Lv/VPagerCircleIndicator;

    .line 81
    .line 82
    new-instance v0, Ljava/util/ArrayList;

    .line 83
    .line 84
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 85
    .line 86
    .line 87
    new-instance v1, Ll/r600$b;

    .line 88
    .line 89
    const-string v2, "\u53d1\u51fa\u6216\u6536\u5230\u8be5\u6a21\u5f0f\u4e0b\u7684\u56fe\u7247,\u53e6\u4e00\u65b9\u5fc5\u987b\u4e5f\u56de\u590d\u4e00\u5f20\u56fe\u7247\u624d\u80fd\u8fdb\u884c\u67e5\u770b"

    .line 90
    .line 91
    sget v3, Ll/ibc0;->t4:I

    .line 92
    .line 93
    const-string v4, "\u4ee5\u56fe\u6362\u56fe"

    .line 94
    .line 95
    invoke-direct {v1, p0, v4, v2, v3}, Ll/r600$b;-><init>(Ll/r600;Ljava/lang/String;Ljava/lang/String;I)V

    .line 96
    .line 97
    .line 98
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 99
    .line 100
    .line 101
    new-instance v1, Ll/r600$b;

    .line 102
    .line 103
    const-string v2, "\u5feb\u62cd\u5fc5\u987b\u5728\u9650\u65f6\u5185\u67e5\u770b,\u8d85\u65f6\u5c06\u65e0\u6cd5\u67e5\u770b\u9ad8\u6e05\u5927\u56fe;\u5df2\u67e5\u770b\u7684\u5feb\u62cd,\u53ef\u968f\u65f6\u56de\u770b"

    .line 104
    .line 105
    sget v3, Ll/ibc0;->i3:I

    .line 106
    .line 107
    const-string v4, "\u9650\u65f6\u5feb\u62cd"

    .line 108
    .line 109
    invoke-direct {v1, p0, v4, v2, v3}, Ll/r600$b;-><init>(Ll/r600;Ljava/lang/String;Ljava/lang/String;I)V

    .line 110
    .line 111
    .line 112
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 113
    .line 114
    .line 115
    new-instance v1, Ll/r600$c;

    .line 116
    .line 117
    invoke-virtual {p0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    .line 118
    .line 119
    .line 120
    move-result-object v2

    .line 121
    invoke-direct {v1, p0, v2, v0}, Ll/r600$c;-><init>(Ll/r600;Landroid/content/Context;Ljava/util/List;)V

    .line 122
    .line 123
    .line 124
    iput-object v1, p0, Ll/r600;->g:Ll/r600$c;

    .line 125
    .line 126
    iget-object v0, p0, Ll/r600;->e:Lv/VPager;

    .line 127
    .line 128
    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Ll/cf60;)V

    .line 129
    .line 130
    .line 131
    iget-object v0, p0, Ll/r600;->f:Lv/VPagerCircleIndicator;

    .line 132
    .line 133
    iget-object v1, p0, Ll/r600;->e:Lv/VPager;

    .line 134
    .line 135
    invoke-virtual {v0, v1}, Lv/VPagerCircleIndicator;->setViewPager(Landroidx/viewpager/widget/ViewPager;)V

    .line 136
    .line 137
    .line 138
    iget-object v0, p0, Ll/r600;->e:Lv/VPager;

    .line 139
    .line 140
    new-instance v1, Ll/q600;

    .line 141
    .line 142
    invoke-direct {v1, p0}, Ll/q600;-><init>(Ll/r600;)V

    .line 143
    .line 144
    .line 145
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 146
    .line 147
    .line 148
    invoke-virtual {p0}, Ll/r600;->s()V

    .line 149
    .line 150
    .line 151
    return-void
.end method

.method public h()I
    .locals 0

    .line 1
    sget p0, Ll/qec0;->t4:I

    .line 2
    .line 3
    return p0
.end method

.method public o()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_newphoto_info"

    .line 2
    .line 3
    return-object p0
.end method

.method public onAttachedToWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/app/Dialog;->onAttachedToWindow()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/r600;->s()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/app/Dialog;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/r600;->v()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic p(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/bdz;->dismiss()V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/r600;->e:Lv/VPager;

    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    invoke-virtual {p1}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    const/4 v0, 0x1

    .line 13
    if-ne p1, v0, :cond_0

    .line 14
    .line 15
    const-string p1, "time"

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const-string p1, "switch"

    .line 19
    .line 20
    :goto_0
    invoke-virtual {p0}, Ll/r600;->o()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    const-string v1, "new_photo_type"

    .line 25
    .line 26
    invoke-static {v1, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    filled-new-array {p1}, [Ll/pf60;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    const-string v1, "e_newphoto_known"

    .line 35
    .line 36
    invoke-static {v1, v0, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 37
    .line 38
    .line 39
    iget-object p1, p0, Ll/bdz;->a:Lcom/p1/mobile/android/app/Act;

    .line 40
    .line 41
    iget-object p0, p0, Ll/r600;->c:Ljava/lang/String;

    .line 42
    .line 43
    sget-object v0, Ll/r600;->i:Ljava/lang/String;

    .line 44
    .line 45
    invoke-static {p1, p0, v0}, Ll/r600;->u(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public final synthetic q(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/bdz;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic r(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/r600;->v()V

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x0

    .line 5
    return p0
.end method

.method public final s()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/r600;->e:Lv/VPager;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/r600;->g:Ll/r600$c;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Ll/r600;->g:Ll/r600$c;

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/r600$c;->getCount()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-lez v0, :cond_0

    .line 24
    .line 25
    iget-object v0, p0, Ll/r600;->h:Ljava/lang/Runnable;

    .line 26
    .line 27
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_0

    .line 32
    .line 33
    iget-object v0, p0, Ll/r600;->h:Ljava/lang/Runnable;

    .line 34
    .line 35
    invoke-static {v0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    iget-object p0, p0, Ll/r600;->h:Ljava/lang/Runnable;

    .line 43
    .line 44
    const-wide/16 v1, 0x1388

    .line 45
    .line 46
    invoke-static {v0, p0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 47
    .line 48
    .line 49
    :cond_0
    return-void
.end method

.method public show()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/r600;->o()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-class v1, Ll/r600;

    .line 6
    .line 7
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-static {v0, v1}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Ll/bdz;->b:Ll/l4g0;

    .line 16
    .line 17
    const-string v1, "receiver_user_id"

    .line 18
    .line 19
    iget-object v2, p0, Ll/r600;->c:Ljava/lang/String;

    .line 20
    .line 21
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    filled-new-array {v1}, [Ll/pf60;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v0, v1}, Ll/l4g0;->p([Ll/pf60;)V

    .line 30
    .line 31
    .line 32
    invoke-super {p0}, Ll/bdz;->show()V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public final v()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/r600;->h:Ljava/lang/Runnable;

    .line 2
    .line 3
    invoke-static {p0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
