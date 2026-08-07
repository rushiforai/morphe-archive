.class public Lcom/p1/mobile/putong/feed/newui/status/share/a;
.super Lcom/google/android/material/bottomsheet/BottomSheetDialog;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/feed/newui/status/share/a$c;
    }
.end annotation


# static fields
.field public static w:Ll/uzh;

.field public static x:Z


# instance fields
.field public a:Landroid/view/View;

.field public b:Landroid/view/View;

.field public c:Lcom/p1/mobile/android/app/Act;

.field public d:Landroid/widget/PopupWindow;

.field public e:Z

.field public f:Landroid/view/animation/Interpolator;

.field public g:Landroid/animation/Animator;

.field public h:I

.field public i:I

.field public j:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

.field public k:Ll/uul;

.field public l:Landroid/widget/LinearLayout;

.field public m:Lv/VDraweeView;

.field public n:Lv/VEditText;

.field public o:Lcom/p1/mobile/putong/feed/newui/status/display/view/FeedSmoothSpeedRecycle;

.field public p:Landroid/widget/TextView;

.field public q:Landroid/widget/TextView;

.field public r:Lv/VText;

.field public s:Landroid/widget/FrameLayout;

.field public t:Lv/VLinear;

.field public u:Ljava/lang/String;

.field public v:Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;-><init>(Landroid/content/Context;I)V

    .line 2
    .line 3
    .line 4
    const/4 p2, 0x0

    .line 5
    iput-boolean p2, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->e:Z

    .line 6
    .line 7
    new-instance p2, Ll/xjg;

    .line 8
    .line 9
    invoke-direct {p2}, Ll/xjg;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->f:Landroid/view/animation/Interpolator;

    .line 13
    .line 14
    const/4 p2, 0x0

    .line 15
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->g:Landroid/animation/Animator;

    .line 16
    .line 17
    new-instance p2, Lcom/p1/mobile/putong/feed/newui/status/share/a$b;

    .line 18
    .line 19
    invoke-direct {p2, p0}, Lcom/p1/mobile/putong/feed/newui/status/share/a$b;-><init>(Lcom/p1/mobile/putong/feed/newui/status/share/a;)V

    .line 20
    .line 21
    .line 22
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->v:Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;

    .line 23
    .line 24
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/status/share/a;->L(Landroid/content/Context;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public static synthetic A(Lcom/p1/mobile/putong/feed/newui/status/share/a;Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/status/share/a;->O(Landroid/view/View;Landroid/view/MotionEvent;)Z

    move-result p0

    return p0
.end method

.method public static bridge synthetic C(Lcom/p1/mobile/putong/feed/newui/status/share/a;)Lv/VEditText;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->n:Lv/VEditText;

    return-object p0
.end method

.method public static bridge synthetic D(Lcom/p1/mobile/putong/feed/newui/status/share/a;)Lcom/google/android/material/bottomsheet/BottomSheetBehavior;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->j:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    return-object p0
.end method

.method public static E()Ljava/util/List;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/uzh;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v1, Ll/owi;->g:Ll/wyd0;

    .line 7
    .line 8
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    check-cast v1, Ljava/lang/String;

    .line 13
    .line 14
    const-class v2, Lcom/p1/mobile/putong/feed/data/StateEmotion;

    .line 15
    .line 16
    invoke-static {v1, v2}, Lcom/alibaba/fastjson/JSON;->parseArray(Ljava/lang/String;Ljava/lang/Class;)Ljava/util/List;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    if-eqz v2, :cond_1

    .line 29
    .line 30
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    check-cast v2, Lcom/p1/mobile/putong/feed/data/StateEmotion;

    .line 35
    .line 36
    iget-object v3, v2, Lcom/p1/mobile/putong/feed/data/StateEmotion;->emotions:Ljava/util/List;

    .line 37
    .line 38
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 39
    .line 40
    .line 41
    move-result-object v3

    .line 42
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 43
    .line 44
    .line 45
    move-result v4

    .line 46
    if-eqz v4, :cond_0

    .line 47
    .line 48
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object v4

    .line 52
    check-cast v4, Lcom/p1/mobile/putong/data/Emotion;

    .line 53
    .line 54
    new-instance v5, Ll/uzh;

    .line 55
    .line 56
    const/4 v6, 0x0

    .line 57
    iget-object v7, v2, Lcom/p1/mobile/putong/feed/data/StateEmotion;->categoryName:Ljava/lang/String;

    .line 58
    .line 59
    invoke-direct {v5, v6, v4, v7}, Ll/uzh;-><init>(ZLcom/p1/mobile/putong/data/Emotion;Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_1
    return-object v0
.end method

.method private G()V
    .locals 3

    .line 1
    new-instance v0, Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->a:Landroid/view/View;

    .line 7
    .line 8
    invoke-virtual {v1, v0}, Landroid/view/View;->getWindowVisibleDisplayFrame(Landroid/graphics/Rect;)V

    .line 9
    .line 10
    .line 11
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->h:I

    .line 12
    .line 13
    if-nez v1, :cond_0

    .line 14
    .line 15
    iget v1, v0, Landroid/graphics/Rect;->bottom:I

    .line 16
    .line 17
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->h:I

    .line 18
    .line 19
    :cond_0
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->i:I

    .line 20
    .line 21
    if-nez v1, :cond_1

    .line 22
    .line 23
    iget v1, v0, Landroid/graphics/Rect;->bottom:I

    .line 24
    .line 25
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->i:I

    .line 26
    .line 27
    :cond_1
    iget v1, v0, Landroid/graphics/Rect;->bottom:I

    .line 28
    .line 29
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->i:I

    .line 30
    .line 31
    if-le v1, v2, :cond_2

    .line 32
    .line 33
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->h:I

    .line 34
    .line 35
    if-eq v1, v2, :cond_2

    .line 36
    .line 37
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/status/share/a;->H()V

    .line 38
    .line 39
    .line 40
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->h:I

    .line 41
    .line 42
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->i:I

    .line 43
    .line 44
    :cond_2
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->i:I

    .line 45
    .line 46
    iget v2, v0, Landroid/graphics/Rect;->bottom:I

    .line 47
    .line 48
    sub-int/2addr v1, v2

    .line 49
    if-lez v1, :cond_4

    .line 50
    .line 51
    iget-boolean v2, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->e:Z

    .line 52
    .line 53
    if-eqz v2, :cond_3

    .line 54
    .line 55
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->g:Landroid/animation/Animator;

    .line 56
    .line 57
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result v2

    .line 61
    if-eqz v2, :cond_3

    .line 62
    .line 63
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->g:Landroid/animation/Animator;

    .line 64
    .line 65
    invoke-virtual {v2}, Landroid/animation/Animator;->cancel()V

    .line 66
    .line 67
    .line 68
    :cond_3
    const/4 v2, 0x1

    .line 69
    iput-boolean v2, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->e:Z

    .line 70
    .line 71
    invoke-direct {p0, v1}, Lcom/p1/mobile/putong/feed/newui/status/share/a;->a0(I)V

    .line 72
    .line 73
    .line 74
    iget v0, v0, Landroid/graphics/Rect;->bottom:I

    .line 75
    .line 76
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->i:I

    .line 77
    .line 78
    return-void

    .line 79
    :cond_4
    if-gez v1, :cond_5

    .line 80
    .line 81
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/status/share/a;->H()V

    .line 82
    .line 83
    .line 84
    iget v0, v0, Landroid/graphics/Rect;->bottom:I

    .line 85
    .line 86
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->i:I

    .line 87
    .line 88
    :cond_5
    return-void
.end method

.method private H()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->e:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->g:Landroid/animation/Animator;

    .line 6
    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->g:Landroid/animation/Animator;

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/animation/Animator;->cancel()V

    .line 16
    .line 17
    .line 18
    :cond_0
    const/4 v0, 0x0

    .line 19
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->e:Z

    .line 20
    .line 21
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/feed/newui/status/share/a;->a0(I)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public static I(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 1

    .line 1
    const-string v0, "input_method"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Landroid/view/inputmethod/InputMethodManager;

    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-virtual {p0, p1, v0}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method private L(Landroid/content/Context;)V
    .locals 3

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Lcom/p1/mobile/android/app/Act;

    .line 3
    .line 4
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->c:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    sget v1, Ll/tec0;->l3:I

    .line 11
    .line 12
    const/4 v2, 0x0

    .line 13
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {}, Ll/cmg;->A()Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    sget v0, Ll/tec0;->m3:I

    .line 28
    .line 29
    invoke-virtual {p1, v0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    :cond_0
    invoke-virtual {p0, v0}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setContentView(Landroid/view/View;)V

    .line 34
    .line 35
    .line 36
    sget p1, Ll/hdc0;->x0:I

    .line 37
    .line 38
    invoke-virtual {v0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    check-cast p1, Landroid/widget/LinearLayout;

    .line 43
    .line 44
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->l:Landroid/widget/LinearLayout;

    .line 45
    .line 46
    invoke-static {}, Ll/cmg;->A()Z

    .line 47
    .line 48
    .line 49
    move-result p1

    .line 50
    if-nez p1, :cond_1

    .line 51
    .line 52
    sget p1, Ll/hdc0;->W:I

    .line 53
    .line 54
    invoke-virtual {v0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    check-cast p1, Lv/VDraweeView;

    .line 59
    .line 60
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->m:Lv/VDraweeView;

    .line 61
    .line 62
    :cond_1
    sget p1, Ll/hdc0;->v0:I

    .line 63
    .line 64
    invoke-virtual {v0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    check-cast p1, Lv/VEditText;

    .line 69
    .line 70
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->n:Lv/VEditText;

    .line 71
    .line 72
    sget p1, Ll/hdc0;->C1:I

    .line 73
    .line 74
    invoke-virtual {v0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    check-cast p1, Landroid/widget/FrameLayout;

    .line 79
    .line 80
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->s:Landroid/widget/FrameLayout;

    .line 81
    .line 82
    sget p1, Ll/hdc0;->J1:I

    .line 83
    .line 84
    invoke-virtual {v0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/status/display/view/FeedSmoothSpeedRecycle;

    .line 89
    .line 90
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->o:Lcom/p1/mobile/putong/feed/newui/status/display/view/FeedSmoothSpeedRecycle;

    .line 91
    .line 92
    sget p1, Ll/hdc0;->c1:I

    .line 93
    .line 94
    invoke-virtual {v0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    check-cast p1, Landroid/widget/TextView;

    .line 99
    .line 100
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->p:Landroid/widget/TextView;

    .line 101
    .line 102
    sget p1, Ll/hdc0;->v1:I

    .line 103
    .line 104
    invoke-virtual {v0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 105
    .line 106
    .line 107
    move-result-object p1

    .line 108
    check-cast p1, Landroid/widget/TextView;

    .line 109
    .line 110
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->q:Landroid/widget/TextView;

    .line 111
    .line 112
    sget p1, Ll/hdc0;->U1:I

    .line 113
    .line 114
    invoke-virtual {v0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 115
    .line 116
    .line 117
    move-result-object p1

    .line 118
    check-cast p1, Lv/VText;

    .line 119
    .line 120
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->r:Lv/VText;

    .line 121
    .line 122
    sget p1, Ll/hdc0;->L:I

    .line 123
    .line 124
    invoke-virtual {v0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 125
    .line 126
    .line 127
    move-result-object p1

    .line 128
    check-cast p1, Lv/VLinear;

    .line 129
    .line 130
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->t:Lv/VLinear;

    .line 131
    .line 132
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->l:Landroid/widget/LinearLayout;

    .line 133
    .line 134
    invoke-static {}, Ll/cmg;->E()Z

    .line 135
    .line 136
    .line 137
    move-result v1

    .line 138
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 139
    .line 140
    .line 141
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->r:Lv/VText;

    .line 142
    .line 143
    invoke-virtual {p1}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 144
    .line 145
    .line 146
    move-result-object p1

    .line 147
    if-eqz p1, :cond_2

    .line 148
    .line 149
    const/4 v1, 0x1

    .line 150
    invoke-virtual {p1, v1}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 151
    .line 152
    .line 153
    :cond_2
    sget p1, Ll/hdc0;->H1:I

    .line 154
    .line 155
    invoke-virtual {v0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 156
    .line 157
    .line 158
    move-result-object p1

    .line 159
    new-instance v0, Ll/ewh;

    .line 160
    .line 161
    invoke-direct {v0, p0}, Ll/ewh;-><init>(Lcom/p1/mobile/putong/feed/newui/status/share/a;)V

    .line 162
    .line 163
    .line 164
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 165
    .line 166
    .line 167
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/status/share/a;->M()V

    .line 168
    .line 169
    .line 170
    return-void
.end method

.method private M()V
    .locals 4

    .line 1
    new-instance v0, Landroid/widget/PopupWindow;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->c:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Landroid/widget/PopupWindow;-><init>(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->d:Landroid/widget/PopupWindow;

    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->c:Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    const-string v1, "layout_inflater"

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Landroid/view/LayoutInflater;

    .line 19
    .line 20
    sget v1, Ll/jec0;->u:I

    .line 21
    .line 22
    const/4 v2, 0x0

    .line 23
    const/4 v3, 0x0

    .line 24
    invoke-virtual {v0, v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->a:Landroid/view/View;

    .line 29
    .line 30
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->d:Landroid/widget/PopupWindow;

    .line 31
    .line 32
    invoke-virtual {v1, v0}, Landroid/widget/PopupWindow;->setContentView(Landroid/view/View;)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->d:Landroid/widget/PopupWindow;

    .line 36
    .line 37
    const/16 v1, 0x15

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Landroid/widget/PopupWindow;->setSoftInputMode(I)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->d:Landroid/widget/PopupWindow;

    .line 43
    .line 44
    const/4 v1, 0x1

    .line 45
    invoke-virtual {v0, v1}, Landroid/widget/PopupWindow;->setInputMethodMode(I)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->c:Lcom/p1/mobile/android/app/Act;

    .line 49
    .line 50
    const v1, 0x1020002

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0, v1}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->b:Landroid/view/View;

    .line 58
    .line 59
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->d:Landroid/widget/PopupWindow;

    .line 60
    .line 61
    invoke-virtual {v0, v3}, Landroid/widget/PopupWindow;->setWidth(I)V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->d:Landroid/widget/PopupWindow;

    .line 65
    .line 66
    const/4 v1, -0x1

    .line 67
    invoke-virtual {v0, v1}, Landroid/widget/PopupWindow;->setHeight(I)V

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->a:Landroid/view/View;

    .line 71
    .line 72
    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    new-instance v1, Ll/wvh;

    .line 77
    .line 78
    invoke-direct {v1, p0}, Ll/wvh;-><init>(Lcom/p1/mobile/putong/feed/newui/status/share/a;)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 82
    .line 83
    .line 84
    return-void
.end method

.method private synthetic V(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/status/share/a;->H()V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->c:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->n:Lv/VEditText;

    .line 7
    .line 8
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/feed/newui/status/share/a;->I(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/status/share/a;->dismiss()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method private Y()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->k:Ll/uul;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->k:Ll/uul;

    .line 10
    .line 11
    invoke-interface {p0}, Ll/uul;->b()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public static Z(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Emotion;Ljava/lang/String;)V
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/BubbleInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    iput-object p2, v0, Lcom/p1/mobile/putong/data/BubbleInfo;->value:Ljava/lang/String;

    .line 13
    .line 14
    :cond_0
    iput-object p1, v0, Lcom/p1/mobile/putong/data/BubbleInfo;->emotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 15
    .line 16
    new-instance v1, Lcom/p1/mobile/putong/data/TextTheme;

    .line 17
    .line 18
    invoke-direct {v1}, Lcom/p1/mobile/putong/data/TextTheme;-><init>()V

    .line 19
    .line 20
    .line 21
    iget-object v2, p1, Lcom/p1/mobile/putong/data/Emotion;->backgroundColor:Ljava/util/List;

    .line 22
    .line 23
    iput-object v2, v1, Lcom/p1/mobile/putong/data/TextTheme;->backgroundColor:Ljava/util/List;

    .line 24
    .line 25
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Emotion;->iconColor:Ljava/util/List;

    .line 26
    .line 27
    iput-object p1, v1, Lcom/p1/mobile/putong/data/TextTheme;->iconColor:Ljava/util/List;

    .line 28
    .line 29
    iput-object v1, v0, Lcom/p1/mobile/putong/data/BubbleInfo;->textTheme:Lcom/p1/mobile/putong/data/TextTheme;

    .line 30
    .line 31
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-nez p1, :cond_1

    .line 36
    .line 37
    new-instance p1, Ll/fwh;

    .line 38
    .line 39
    invoke-direct {p1, v0}, Ll/fwh;-><init>(Lcom/p1/mobile/putong/data/BubbleInfo;)V

    .line 40
    .line 41
    .line 42
    invoke-static {p0, p2, p1}, Ll/ksg;->p(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/y20;)V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->e:Ll/ms8;

    .line 47
    .line 48
    const-string p1, ""

    .line 49
    .line 50
    invoke-virtual {p0, v0, p1}, Ll/ms8;->V0(Lcom/p1/mobile/putong/data/BubbleInfo;Ljava/lang/String;)Lrx/c;

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method private a0(I)V
    .locals 12

    .line 1
    invoke-static {}, Ll/cmg;->A()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    const/4 v2, 0x1

    .line 7
    if-nez v0, :cond_4

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->n:Lv/VEditText;

    .line 10
    .line 11
    if-nez p1, :cond_2

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->m:Lv/VDraweeView;

    .line 28
    .line 29
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_0

    .line 34
    .line 35
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->m:Lv/VDraweeView;

    .line 36
    .line 37
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 38
    .line 39
    .line 40
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->n:Lv/VEditText;

    .line 41
    .line 42
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 47
    .line 48
    const/4 v3, -0x2

    .line 49
    iput v3, v0, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 50
    .line 51
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->n:Lv/VEditText;

    .line 52
    .line 53
    invoke-virtual {v3, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 54
    .line 55
    .line 56
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->n:Lv/VEditText;

    .line 57
    .line 58
    const/4 v3, 0x4

    .line 59
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 60
    .line 61
    .line 62
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->l:Landroid/widget/LinearLayout;

    .line 63
    .line 64
    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 65
    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_2
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 73
    .line 74
    const/4 v3, -0x1

    .line 75
    iput v3, v0, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 76
    .line 77
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->n:Lv/VEditText;

    .line 78
    .line 79
    invoke-virtual {v3, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 80
    .line 81
    .line 82
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->m:Lv/VDraweeView;

    .line 83
    .line 84
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    if-eqz v0, :cond_3

    .line 89
    .line 90
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->m:Lv/VDraweeView;

    .line 91
    .line 92
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 93
    .line 94
    .line 95
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->l:Landroid/widget/LinearLayout;

    .line 96
    .line 97
    const/16 v3, 0x33

    .line 98
    .line 99
    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 100
    .line 101
    .line 102
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->n:Lv/VEditText;

    .line 103
    .line 104
    const/4 v3, 0x2

    .line 105
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 106
    .line 107
    .line 108
    :cond_4
    :goto_0
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->s:Landroid/widget/FrameLayout;

    .line 109
    .line 110
    iget-object v10, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->f:Landroid/view/animation/Interpolator;

    .line 111
    .line 112
    neg-int p1, p1

    .line 113
    int-to-float p1, p1

    .line 114
    new-array v11, v2, [F

    .line 115
    .line 116
    aput p1, v11, v1

    .line 117
    .line 118
    const-string v5, "translationY"

    .line 119
    .line 120
    const-wide/16 v6, 0x0

    .line 121
    .line 122
    const-wide/16 v8, 0x96

    .line 123
    .line 124
    invoke-static/range {v4 .. v11}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 125
    .line 126
    .line 127
    move-result-object p1

    .line 128
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->g:Landroid/animation/Animator;

    .line 129
    .line 130
    invoke-virtual {p1}, Landroid/animation/Animator;->start()V

    .line 131
    .line 132
    .line 133
    return-void
.end method

.method public static synthetic q(Lcom/p1/mobile/putong/feed/newui/status/share/a;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/status/share/a;->S(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic r(Lcom/p1/mobile/putong/feed/newui/status/share/a;Ll/y20;Ll/l4g0;Ljava/lang/String;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/feed/newui/status/share/a;->T(Ll/y20;Ll/l4g0;Ljava/lang/String;Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic s(Lcom/p1/mobile/putong/feed/newui/status/share/a;Ll/e1i;Ljava/util/List;Landroidx/recyclerview/widget/RecyclerView;Landroid/view/View;I)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Lcom/p1/mobile/putong/feed/newui/status/share/a;->R(Ll/e1i;Ljava/util/List;Landroidx/recyclerview/widget/RecyclerView;Landroid/view/View;I)V

    return-void
.end method

.method public static synthetic t(Lcom/p1/mobile/putong/feed/newui/status/share/a;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/status/share/a;->N()V

    return-void
.end method

.method public static synthetic u(Lcom/p1/mobile/putong/feed/newui/status/share/a;Ljava/lang/Integer;Ll/uzh;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/status/share/a;->Q(Ljava/lang/Integer;Ll/uzh;)V

    return-void
.end method

.method public static synthetic v(Lcom/p1/mobile/putong/feed/newui/status/share/a;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/status/share/a;->U(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic w(Lcom/p1/mobile/putong/feed/newui/status/share/a;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/status/share/a;->W()V

    return-void
.end method

.method public static synthetic x(Lcom/p1/mobile/putong/feed/newui/status/share/a;Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/status/share/a;->P(Landroid/view/View;Landroid/view/MotionEvent;)Z

    move-result p0

    return p0
.end method

.method public static synthetic y(Lcom/p1/mobile/putong/data/BubbleInfo;Lcom/p1/mobile/putong/data/Detect;)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    sget-object p1, Lcom/p1/mobile/putong/feed/FeedModule;->e:Ll/ms8;

    .line 4
    .line 5
    const-string v0, ""

    .line 6
    .line 7
    invoke-virtual {p1, p0, v0}, Ll/ms8;->V0(Lcom/p1/mobile/putong/data/BubbleInfo;Ljava/lang/String;)Lrx/c;

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    const-string p0, "p_state_post_guide"

    .line 12
    .line 13
    invoke-static {p1, p0}, Ll/ksg;->l(Lcom/p1/mobile/putong/data/Detect;Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_1

    .line 18
    .line 19
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->s:I

    .line 20
    .line 21
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_1
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->W2:I

    .line 26
    .line 27
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public static synthetic z(Lcom/p1/mobile/putong/feed/newui/status/share/a;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/status/share/a;->V(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final F()Ljava/lang/String;
    .locals 2

    .line 1
    const-string v0, "from_nearby_focus"

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->u:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const-string p0, "p_follow"

    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_0
    const-string v0, "from_nearby_falls_feed"

    .line 15
    .line 16
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->u:Ljava/lang/String;

    .line 17
    .line 18
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    const-string p0, "p_nearby"

    .line 25
    .line 26
    return-object p0

    .line 27
    :cond_1
    const-string v0, "from_like"

    .line 28
    .line 29
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->u:Ljava/lang/String;

    .line 30
    .line 31
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_2

    .line 36
    .line 37
    const-string p0, "p_like"

    .line 38
    .line 39
    return-object p0

    .line 40
    :cond_2
    const-string v0, "state_explore"

    .line 41
    .line 42
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->u:Ljava/lang/String;

    .line 43
    .line 44
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-eqz v0, :cond_3

    .line 49
    .line 50
    const-string p0, "p_state_explore"

    .line 51
    .line 52
    return-object p0

    .line 53
    :cond_3
    const-string v0, "from_discover_dating"

    .line 54
    .line 55
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->u:Ljava/lang/String;

    .line 56
    .line 57
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-eqz v0, :cond_4

    .line 62
    .line 63
    const-string p0, "p_discover_dating"

    .line 64
    .line 65
    return-object p0

    .line 66
    :cond_4
    const-string v0, "from_discover_discussion"

    .line 67
    .line 68
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->u:Ljava/lang/String;

    .line 69
    .line 70
    invoke-static {v0, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 71
    .line 72
    .line 73
    move-result p0

    .line 74
    if-eqz p0, :cond_5

    .line 75
    .line 76
    const-string p0, "p_discover_discussion"

    .line 77
    .line 78
    return-object p0

    .line 79
    :cond_5
    const-string p0, ""

    .line 80
    .line 81
    return-object p0
.end method

.method public J(Ljava/lang/String;Ljava/lang/String;ILl/y20;Ll/y20;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "I",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->u:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "from_nearby_focus"

    .line 4
    .line 5
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const-string v1, "state_explore"

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    const-string p2, "follow"

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const-string v0, "from_nearby_falls_feed"

    .line 17
    .line 18
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    const-string p2, "nearby"

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_1
    const-string v0, "from_like"

    .line 28
    .line 29
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_2

    .line 34
    .line 35
    const-string p2, "like"

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_2
    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-eqz v0, :cond_3

    .line 43
    .line 44
    move-object p2, v1

    .line 45
    :cond_3
    :goto_0
    const-class v0, Landroid/app/Dialog;

    .line 46
    .line 47
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    const-string v2, "p_state_post_guide"

    .line 52
    .line 53
    invoke-static {v2, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    const-string v3, "state_post_guide_showfrom"

    .line 58
    .line 59
    invoke-static {v3, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 60
    .line 61
    .line 62
    move-result-object v3

    .line 63
    filled-new-array {v3}, [Ll/pf60;

    .line 64
    .line 65
    .line 66
    move-result-object v3

    .line 67
    invoke-virtual {v0, v3}, Ll/l4g0;->p([Ll/pf60;)V

    .line 68
    .line 69
    .line 70
    invoke-static {v0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 71
    .line 72
    .line 73
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->r:Lv/VText;

    .line 74
    .line 75
    invoke-virtual {v3, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 76
    .line 77
    .line 78
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->r:Lv/VText;

    .line 79
    .line 80
    invoke-virtual {p1}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    const/4 v3, 0x1

    .line 85
    if-eqz p1, :cond_4

    .line 86
    .line 87
    invoke-virtual {p1, v3}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 88
    .line 89
    .line 90
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->t:Lv/VLinear;

    .line 91
    .line 92
    new-instance v4, Ll/vvh;

    .line 93
    .line 94
    invoke-direct {v4, p0}, Ll/vvh;-><init>(Lcom/p1/mobile/putong/feed/newui/status/share/a;)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {p1, v4}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 98
    .line 99
    .line 100
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->n:Lv/VEditText;

    .line 101
    .line 102
    new-instance v4, Ll/xvh;

    .line 103
    .line 104
    invoke-direct {v4, p0}, Ll/xvh;-><init>(Lcom/p1/mobile/putong/feed/newui/status/share/a;)V

    .line 105
    .line 106
    .line 107
    invoke-virtual {p1, v4}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 108
    .line 109
    .line 110
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->n:Lv/VEditText;

    .line 111
    .line 112
    new-instance v4, Ll/b4h;

    .line 113
    .line 114
    const/16 v5, 0x1e

    .line 115
    .line 116
    invoke-direct {v4, v5}, Ll/b4h;-><init>(I)V

    .line 117
    .line 118
    .line 119
    new-array v5, v3, [Landroid/text/InputFilter;

    .line 120
    .line 121
    const/4 v6, 0x0

    .line 122
    aput-object v4, v5, v6

    .line 123
    .line 124
    invoke-virtual {p1, v5}, Landroid/widget/TextView;->setFilters([Landroid/text/InputFilter;)V

    .line 125
    .line 126
    .line 127
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->n:Lv/VEditText;

    .line 128
    .line 129
    new-instance v4, Lcom/p1/mobile/putong/feed/newui/status/share/a$a;

    .line 130
    .line 131
    invoke-direct {v4, p0}, Lcom/p1/mobile/putong/feed/newui/status/share/a$a;-><init>(Lcom/p1/mobile/putong/feed/newui/status/share/a;)V

    .line 132
    .line 133
    .line 134
    invoke-virtual {p1, v4}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 135
    .line 136
    .line 137
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->o:Lcom/p1/mobile/putong/feed/newui/status/display/view/FeedSmoothSpeedRecycle;

    .line 138
    .line 139
    new-instance v4, Lcom/p1/mobile/putong/feed/newui/status/share/a$c;

    .line 140
    .line 141
    const/4 v5, 0x0

    .line 142
    invoke-direct {v4, v5}, Lcom/p1/mobile/putong/feed/newui/status/share/a$c;-><init>(Ll/hwh;)V

    .line 143
    .line 144
    .line 145
    invoke-virtual {p1, v4}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$n;)V

    .line 146
    .line 147
    .line 148
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/status/share/a;->E()Ljava/util/List;

    .line 149
    .line 150
    .line 151
    move-result-object p1

    .line 152
    new-instance v4, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;

    .line 153
    .line 154
    invoke-direct {v4, v6}, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;-><init>(I)V

    .line 155
    .line 156
    .line 157
    new-instance v5, Ljava/util/Random;

    .line 158
    .line 159
    invoke-direct {v5}, Ljava/util/Random;-><init>()V

    .line 160
    .line 161
    .line 162
    const/16 v7, 0x12

    .line 163
    .line 164
    invoke-virtual {v5, v7}, Ljava/util/Random;->nextInt(I)I

    .line 165
    .line 166
    .line 167
    move-result v5

    .line 168
    const v7, 0x9c40

    .line 169
    .line 170
    .line 171
    add-int/2addr v5, v7

    .line 172
    if-eqz p3, :cond_5

    .line 173
    .line 174
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 175
    .line 176
    .line 177
    move-result v7

    .line 178
    if-lez v7, :cond_5

    .line 179
    .line 180
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 181
    .line 182
    .line 183
    move-result v5

    .line 184
    mul-int/lit16 v5, v5, 0xbb8

    .line 185
    .line 186
    add-int/2addr v5, p3

    .line 187
    sub-int/2addr v5, v3

    .line 188
    :cond_5
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->o:Lcom/p1/mobile/putong/feed/newui/status/display/view/FeedSmoothSpeedRecycle;

    .line 189
    .line 190
    invoke-virtual {v4, p3, v5}, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->f(Landroidx/recyclerview/widget/RecyclerView;I)V

    .line 191
    .line 192
    .line 193
    new-instance p3, Lcom/p1/mobile/putong/feed/newui/status/share/b;

    .line 194
    .line 195
    invoke-direct {p3}, Lcom/p1/mobile/putong/feed/newui/status/share/b;-><init>()V

    .line 196
    .line 197
    .line 198
    invoke-virtual {v4, p3}, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->z(Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$c;)V

    .line 199
    .line 200
    .line 201
    new-instance p3, Ll/e1i;

    .line 202
    .line 203
    iget-object v5, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->c:Lcom/p1/mobile/android/app/Act;

    .line 204
    .line 205
    invoke-direct {p3, p1, v5}, Ll/e1i;-><init>(Ljava/util/List;Landroid/content/Context;)V

    .line 206
    .line 207
    .line 208
    iget-object v5, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->o:Lcom/p1/mobile/putong/feed/newui/status/display/view/FeedSmoothSpeedRecycle;

    .line 209
    .line 210
    invoke-virtual {v5, p3}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 211
    .line 212
    .line 213
    new-instance v5, Ll/yvh;

    .line 214
    .line 215
    invoke-direct {v5, p0}, Ll/yvh;-><init>(Lcom/p1/mobile/putong/feed/newui/status/share/a;)V

    .line 216
    .line 217
    .line 218
    invoke-virtual {p3, v5}, Ll/e1i;->G(Ll/z20;)V

    .line 219
    .line 220
    .line 221
    invoke-virtual {v4, v3}, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->y(Z)V

    .line 222
    .line 223
    .line 224
    new-instance v5, Ll/zvh;

    .line 225
    .line 226
    invoke-direct {v5, p0, p3, p1}, Ll/zvh;-><init>(Lcom/p1/mobile/putong/feed/newui/status/share/a;Ll/e1i;Ljava/util/List;)V

    .line 227
    .line 228
    .line 229
    invoke-virtual {v4, v5}, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;->A(Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$e;)V

    .line 230
    .line 231
    .line 232
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->q:Landroid/widget/TextView;

    .line 233
    .line 234
    new-instance p3, Ll/awh;

    .line 235
    .line 236
    invoke-direct {p3, p0}, Ll/awh;-><init>(Lcom/p1/mobile/putong/feed/newui/status/share/a;)V

    .line 237
    .line 238
    .line 239
    invoke-static {p1, p3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 240
    .line 241
    .line 242
    new-instance p1, Ll/bwh;

    .line 243
    .line 244
    invoke-direct {p1, p0, p5, v0, p2}, Ll/bwh;-><init>(Lcom/p1/mobile/putong/feed/newui/status/share/a;Ll/y20;Ll/l4g0;Ljava/lang/String;)V

    .line 245
    .line 246
    .line 247
    invoke-virtual {p0, p1}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 248
    .line 249
    .line 250
    new-instance p1, Ll/cwh;

    .line 251
    .line 252
    invoke-direct {p1, p0}, Ll/cwh;-><init>(Lcom/p1/mobile/putong/feed/newui/status/share/a;)V

    .line 253
    .line 254
    .line 255
    invoke-virtual {p0, p1}, Landroid/app/Dialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    .line 256
    .line 257
    .line 258
    invoke-virtual {p0, v3}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setCanceledOnTouchOutside(Z)V

    .line 259
    .line 260
    .line 261
    sput-boolean v6, Lcom/p1/mobile/putong/feed/newui/status/share/a;->x:Z

    .line 262
    .line 263
    const-string p1, "source_page"

    .line 264
    .line 265
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/status/share/a;->F()Ljava/lang/String;

    .line 266
    .line 267
    .line 268
    move-result-object p0

    .line 269
    invoke-static {p1, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 270
    .line 271
    .line 272
    move-result-object p0

    .line 273
    filled-new-array {p0}, [Ll/pf60;

    .line 274
    .line 275
    .line 276
    move-result-object p0

    .line 277
    const-string p1, "e_set_my_state_post"

    .line 278
    .line 279
    invoke-static {p1, v2, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 280
    .line 281
    .line 282
    invoke-static {p2, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 283
    .line 284
    .line 285
    move-result p0

    .line 286
    if-nez p0, :cond_6

    .line 287
    .line 288
    sget-object p0, Ll/owi;->i:Ll/byd0;

    .line 289
    .line 290
    invoke-static {}, Ll/pzi0;->o()J

    .line 291
    .line 292
    .line 293
    move-result-wide p1

    .line 294
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 295
    .line 296
    .line 297
    move-result-object p1

    .line 298
    invoke-virtual {p0, p1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 299
    .line 300
    .line 301
    :cond_6
    invoke-static {p4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 302
    .line 303
    .line 304
    move-result p0

    .line 305
    if-eqz p0, :cond_7

    .line 306
    .line 307
    const-string p0, ""

    .line 308
    .line 309
    invoke-interface {p4, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 310
    .line 311
    .line 312
    :cond_7
    return-void
.end method

.method public K(Ljava/lang/String;Ljava/lang/String;ILl/y20;Ll/y20;Ll/uul;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "I",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;",
            "Ll/uul;",
            ")V"
        }
    .end annotation

    .line 1
    iput-object p6, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->k:Ll/uul;

    .line 2
    .line 3
    invoke-virtual/range {p0 .. p5}, Lcom/p1/mobile/putong/feed/newui/status/share/a;->J(Ljava/lang/String;Ljava/lang/String;ILl/y20;Ll/y20;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic N()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/app/Dialog;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic O(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/4 p2, 0x1

    .line 6
    if-nez p1, :cond_0

    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->n:Lv/VEditText;

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-interface {p0, p2}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return p2
.end method

.method public final synthetic P(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->n:Lv/VEditText;

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const/4 p1, 0x1

    .line 14
    invoke-interface {p0, p1}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 15
    .line 16
    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public final synthetic Q(Ljava/lang/Integer;Ll/uzh;)V
    .locals 2

    .line 1
    invoke-virtual {p2}, Ll/uzh;->b()Lcom/p1/mobile/putong/data/Emotion;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Emotion;->id:Ljava/lang/String;

    .line 6
    .line 7
    const-string v0, "state_type_id"

    .line 8
    .line 9
    invoke-static {v0, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    filled-new-array {p2}, [Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    const-string v0, "e_set_my_state_type"

    .line 18
    .line 19
    const-string v1, "p_state_post_guide"

    .line 20
    .line 21
    invoke-static {v0, v1, p2}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->o:Lcom/p1/mobile/putong/feed/newui/status/display/view/FeedSmoothSpeedRecycle;

    .line 25
    .line 26
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->smoothScrollToPosition(I)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public final synthetic R(Ll/e1i;Ljava/util/List;Landroidx/recyclerview/widget/RecyclerView;Landroid/view/View;I)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ll/e1i;->z()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    rem-int/2addr p5, p1

    .line 6
    if-ltz p5, :cond_1

    .line 7
    .line 8
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-lt p5, p1, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    invoke-interface {p2, p5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    check-cast p1, Ll/uzh;

    .line 20
    .line 21
    sput-object p1, Lcom/p1/mobile/putong/feed/newui/status/share/a;->w:Ll/uzh;

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->p:Landroid/widget/TextView;

    .line 24
    .line 25
    invoke-virtual {p1}, Ll/uzh;->d()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 30
    .line 31
    .line 32
    :cond_1
    :goto_0
    return-void
.end method

.method public final synthetic S(Landroid/view/View;)V
    .locals 2

    .line 1
    const-string p1, "source_page"

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/status/share/a;->F()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {p1, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    filled-new-array {p1}, [Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    const-string v0, "e_set_my_state_post"

    .line 16
    .line 17
    const-string v1, "p_state_post_guide"

    .line 18
    .line 19
    invoke-static {v0, v1, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 20
    .line 21
    .line 22
    invoke-static {}, Ll/cmg;->E()Z

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    if-eqz p1, :cond_1

    .line 27
    .line 28
    sget-object p1, Lcom/p1/mobile/putong/feed/newui/status/share/a;->w:Ll/uzh;

    .line 29
    .line 30
    if-nez p1, :cond_0

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->c:Lcom/p1/mobile/android/app/Act;

    .line 34
    .line 35
    invoke-virtual {p1}, Ll/uzh;->b()Lcom/p1/mobile/putong/data/Emotion;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->n:Lv/VEditText;

    .line 40
    .line 41
    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-static {v0, p1, v1}, Lcom/p1/mobile/putong/feed/newui/status/share/a;->Z(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Emotion;Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->c:Lcom/p1/mobile/android/app/Act;

    .line 53
    .line 54
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->n:Lv/VEditText;

    .line 55
    .line 56
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/feed/newui/status/share/a;->I(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/status/share/a;->dismiss()V

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :cond_1
    sget-object p1, Lcom/p1/mobile/putong/feed/newui/status/share/a;->w:Ll/uzh;

    .line 64
    .line 65
    if-nez p1, :cond_2

    .line 66
    .line 67
    :goto_0
    return-void

    .line 68
    :cond_2
    const/4 v0, 0x1

    .line 69
    sput-boolean v0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->x:Z

    .line 70
    .line 71
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->c:Lcom/p1/mobile/android/app/Act;

    .line 72
    .line 73
    invoke-virtual {p1}, Ll/uzh;->b()Lcom/p1/mobile/putong/data/Emotion;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    invoke-static {v0, p1}, Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;->s2(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Emotion;)Landroid/content/Intent;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    invoke-virtual {v0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 82
    .line 83
    .line 84
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->c:Lcom/p1/mobile/android/app/Act;

    .line 85
    .line 86
    const/4 v0, 0x0

    .line 87
    invoke-virtual {p1, v0, v0}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 88
    .line 89
    .line 90
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->c:Lcom/p1/mobile/android/app/Act;

    .line 91
    .line 92
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->n:Lv/VEditText;

    .line 93
    .line 94
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/feed/newui/status/share/a;->I(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/status/share/a;->dismiss()V

    .line 98
    .line 99
    .line 100
    return-void
.end method

.method public final synthetic T(Ll/y20;Ll/l4g0;Ljava/lang/String;Landroid/content/DialogInterface;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object p4

    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-interface {p4, v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->as(Z)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/status/share/a;->X()V

    .line 10
    .line 11
    .line 12
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    if-eqz p0, :cond_0

    .line 17
    .line 18
    const-string p0, ""

    .line 19
    .line 20
    invoke-interface {p1, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    invoke-static {p2}, Ll/w1e;->e(Ll/l4g0;)V

    .line 24
    .line 25
    .line 26
    sget-boolean p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->x:Z

    .line 27
    .line 28
    const-string p1, "state_explore"

    .line 29
    .line 30
    if-eqz p0, :cond_1

    .line 31
    .line 32
    invoke-static {p3, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    if-nez p0, :cond_2

    .line 37
    .line 38
    sget-object p0, Ll/owi;->j:Ll/vxd0;

    .line 39
    .line 40
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-virtual {p0, p1}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_1
    invoke-static {p3, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 49
    .line 50
    .line 51
    move-result p0

    .line 52
    if-nez p0, :cond_2

    .line 53
    .line 54
    sget-object p0, Ll/owi;->j:Ll/vxd0;

    .line 55
    .line 56
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    check-cast p1, Ljava/lang/Integer;

    .line 61
    .line 62
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 63
    .line 64
    .line 65
    move-result p1

    .line 66
    add-int/lit8 p1, p1, 0x1

    .line 67
    .line 68
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    invoke-virtual {p0, p1}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    sget-object p0, Ll/owi;->k:Ll/byd0;

    .line 76
    .line 77
    invoke-static {}, Ll/pzi0;->o()J

    .line 78
    .line 79
    .line 80
    move-result-wide p1

    .line 81
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    invoke-virtual {p0, p1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    :cond_2
    return-void
.end method

.method public final synthetic U(Landroid/content/DialogInterface;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-interface {p1, v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->as(Z)V

    .line 7
    .line 8
    .line 9
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/status/share/a;->Y()V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->d:Landroid/widget/PopupWindow;

    .line 13
    .line 14
    invoke-virtual {p1}, Landroid/widget/PopupWindow;->isShowing()Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-nez p1, :cond_0

    .line 19
    .line 20
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->b:Landroid/view/View;

    .line 21
    .line 22
    invoke-virtual {p1}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    if-eqz p1, :cond_0

    .line 27
    .line 28
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->d:Landroid/widget/PopupWindow;

    .line 29
    .line 30
    new-instance v0, Landroid/graphics/drawable/ColorDrawable;

    .line 31
    .line 32
    const/4 v1, 0x0

    .line 33
    invoke-direct {v0, v1}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p1, v0}, Landroid/widget/PopupWindow;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 37
    .line 38
    .line 39
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->d:Landroid/widget/PopupWindow;

    .line 40
    .line 41
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->b:Landroid/view/View;

    .line 42
    .line 43
    invoke-virtual {p1, p0, v1, v1, v1}, Landroid/widget/PopupWindow;->showAtLocation(Landroid/view/View;III)V

    .line 44
    .line 45
    .line 46
    :cond_0
    return-void
.end method

.method public final synthetic W()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->a:Landroid/view/View;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/status/share/a;->G()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final X()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->k:Ll/uul;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->k:Ll/uul;

    .line 10
    .line 11
    invoke-interface {p0}, Ll/uul;->c()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public dismiss()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->c:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    new-instance v1, Ll/dwh;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/dwh;-><init>(Lcom/p1/mobile/putong/feed/newui/status/share/a;)V

    .line 6
    .line 7
    .line 8
    const-wide/16 v2, 0xc8

    .line 9
    .line 10
    invoke-static {v0, v1, v2, v3}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public show()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/app/Dialog;->show()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/vcc0;->E:I

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Landroid/widget/FrameLayout;

    .line 11
    .line 12
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    const/4 v2, -0x1

    .line 17
    iput v2, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 20
    .line 21
    .line 22
    const/4 v1, 0x0

    .line 23
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 24
    .line 25
    .line 26
    invoke-static {v0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->from(Landroid/view/View;)Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->j:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 31
    .line 32
    const/4 v1, 0x3

    .line 33
    invoke-virtual {v0, v1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setState(I)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->j:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 37
    .line 38
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a;->v:Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;

    .line 39
    .line 40
    invoke-virtual {v0, p0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setBottomSheetCallback(Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method
