.class public Lcom/p1/mobile/putong/core/ui/greet/GreetMessageMomentNewView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public b:Lv/VImage;

.field public c:Lv/VText;

.field public d:Lv/VText;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/greet/GreetMessageMomentNewView;Lcom/p1/mobile/putong/core/data/CoreMomentInfo;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageMomentNewView;->e(Lcom/p1/mobile/putong/core/data/CoreMomentInfo;Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/ui/greet/GreetMessageMomentNewView;Lcom/p1/mobile/putong/core/data/CoreMomentInfo;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageMomentNewView;->f(Lcom/p1/mobile/putong/core/data/CoreMomentInfo;Ljava/lang/Throwable;)V

    return-void
.end method


# virtual methods
.method public c(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/ick;->b(Lcom/p1/mobile/putong/core/ui/greet/GreetMessageMomentNewView;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final d(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 8
    .line 9
    const-string p1, "female"

    .line 10
    .line 11
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    const-string p0, "\u5979"

    .line 18
    .line 19
    return-object p0

    .line 20
    :cond_0
    const-string p0, "\u4ed6"

    .line 21
    .line 22
    return-object p0
.end method

.method public final synthetic e(Lcom/p1/mobile/putong/core/data/CoreMomentInfo;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p2, p1}, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageMomentNewView;->h(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/CoreMomentInfo;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic f(Lcom/p1/mobile/putong/core/data/CoreMomentInfo;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    const/4 p2, 0x0

    .line 2
    invoke-virtual {p0, p2, p1}, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageMomentNewView;->h(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/CoreMomentInfo;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public g(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/CoreMomentInfo;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0, p2}, Ll/dkb;->Ka(Ljava/lang/String;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    new-instance p2, Ll/td;

    .line 14
    .line 15
    invoke-direct {p2}, Ll/td;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1, p2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    const/4 p2, 0x1

    .line 23
    invoke-virtual {p1, p2}, Lrx/c;->take(I)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    new-instance p2, Ll/gck;

    .line 28
    .line 29
    invoke-direct {p2, p0, p3}, Ll/gck;-><init>(Lcom/p1/mobile/putong/core/ui/greet/GreetMessageMomentNewView;Lcom/p1/mobile/putong/core/data/CoreMomentInfo;)V

    .line 30
    .line 31
    .line 32
    new-instance v0, Ll/hck;

    .line 33
    .line 34
    invoke-direct {v0, p0, p3}, Ll/hck;-><init>(Lcom/p1/mobile/putong/core/ui/greet/GreetMessageMomentNewView;Lcom/p1/mobile/putong/core/data/CoreMomentInfo;)V

    .line 35
    .line 36
    .line 37
    invoke-static {p2, v0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public h(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/CoreMomentInfo;)V
    .locals 4
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SetTextI18n"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageMomentNewView;->c:Lv/VText;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageMomentNewView;->d(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string p1, "\u53d1\u5e03\u4e86\u52a8\u6001"

    .line 16
    .line 17
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 25
    .line 26
    .line 27
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    if-eqz p1, :cond_0

    .line 32
    .line 33
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->value:Ljava/lang/String;

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    const-string p1, "\u5185\u5bb9\u5df2\u5220\u9664"

    .line 37
    .line 38
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageMomentNewView;->d:Lv/VText;

    .line 39
    .line 40
    invoke-virtual {v0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    const/4 v1, 0x0

    .line 49
    cmpl-float v1, v0, v1

    .line 50
    .line 51
    if-lez v1, :cond_3

    .line 52
    .line 53
    const/high16 v1, 0x42c80000    # 100.0f

    .line 54
    .line 55
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    int-to-float v1, v1

    .line 60
    cmpg-float v1, v0, v1

    .line 61
    .line 62
    const/high16 v2, 0x41100000    # 9.0f

    .line 63
    .line 64
    if-gtz v1, :cond_1

    .line 65
    .line 66
    const/high16 v0, 0x429c0000    # 78.0f

    .line 67
    .line 68
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageMomentNewView;->d:Lv/VText;

    .line 73
    .line 74
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 75
    .line 76
    .line 77
    move-result v2

    .line 78
    invoke-static {v1, v2}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 79
    .line 80
    .line 81
    goto :goto_1

    .line 82
    :cond_1
    const/high16 v1, 0x43430000    # 195.0f

    .line 83
    .line 84
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 85
    .line 86
    .line 87
    move-result v1

    .line 88
    int-to-float v1, v1

    .line 89
    cmpg-float v0, v0, v1

    .line 90
    .line 91
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageMomentNewView;->d:Lv/VText;

    .line 92
    .line 93
    const/high16 v3, 0x41800000    # 16.0f

    .line 94
    .line 95
    if-gtz v0, :cond_2

    .line 96
    .line 97
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 98
    .line 99
    .line 100
    move-result v0

    .line 101
    invoke-static {v1, v0}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 102
    .line 103
    .line 104
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 105
    .line 106
    .line 107
    move-result v0

    .line 108
    goto :goto_1

    .line 109
    :cond_2
    const/high16 v0, 0x40c00000    # 6.0f

    .line 110
    .line 111
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 112
    .line 113
    .line 114
    move-result v0

    .line 115
    invoke-static {v1, v0}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 116
    .line 117
    .line 118
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 119
    .line 120
    .line 121
    move-result v0

    .line 122
    :goto_1
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageMomentNewView;->d:Lv/VText;

    .line 123
    .line 124
    invoke-static {v1, v0}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 125
    .line 126
    .line 127
    :cond_3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageMomentNewView;->d:Lv/VText;

    .line 128
    .line 129
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 130
    .line 131
    .line 132
    const-string p0, "moment_id"

    .line 133
    .line 134
    iget-object p1, p2, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 135
    .line 136
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 137
    .line 138
    .line 139
    move-result-object p0

    .line 140
    filled-new-array {p0}, [Ll/pf60;

    .line 141
    .line 142
    .line 143
    move-result-object p0

    .line 144
    const-string p1, "e_moment"

    .line 145
    .line 146
    const-string p2, "p_kankan_chat_popup"

    .line 147
    .line 148
    invoke-static {p1, p2, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 149
    .line 150
    .line 151
    return-void
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-static {v0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {p0, v0, p0}, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageMomentNewView;->c(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method
