.class public Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateFourView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public A:Ljava/lang/String;

.field public B:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public a:Lv/VLinear;

.field public b:Lv/VText;

.field public c:Landroid/view/View;

.field public d:Lv/VText;

.field public e:Landroid/view/View;

.field public f:Lv/VText;

.field public g:Landroid/view/View;

.field public h:Lv/VText;

.field public i:Lv/VLinear;

.field public j:Lcom/p1/mobile/putong/core/ui/view/ImFlowView;

.field public k:Lv/VLinear;

.field public l:Lv/VFrame;

.field public m:Lv/VDraweeView;

.field public n:Lv/VImage;

.field public o:Lv/VFrame;

.field public p:Lv/VDraweeView;

.field public q:Lv/VImage;

.field public r:Lv/VFrame;

.field public s:Lv/VDraweeView;

.field public t:Lv/VImage;

.field public u:Lv/VText;

.field public v:Lv/VLinear;

.field public w:Lv/VDraweeView;

.field public x:Lv/VText;

.field public y:Lcom/p1/mobile/android/app/Act;

.field public z:Lcom/p1/mobile/putong/core/ui/greet/a;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateFourView;->B:Ljava/util/List;

    .line 10
    .line 11
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 12
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 13
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateFourView;->B:Ljava/util/List;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 14
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 15
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateFourView;->B:Ljava/util/List;

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/greet/a;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 2

    .line 1
    const/4 p2, 0x0

    .line 2
    new-array p2, p2, [Ll/sfj0$a;

    .line 3
    .line 4
    const-string v0, "e_user_photo"

    .line 5
    .line 6
    const-string v1, "p_kankan_chat_popup"

    .line 7
    .line 8
    invoke-static {v0, v1, p2}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 9
    .line 10
    .line 11
    const-string p2, "from_greet_act"

    .line 12
    .line 13
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {p0, p2, p1}, Lcom/p1/mobile/putong/core/ui/greet/a;->B1(Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public b(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/kck;->b(Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateFourView;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final c(I)Ljava/lang/String;
    .locals 1

    .line 1
    const/16 p0, 0x3e8

    .line 2
    .line 3
    if-ge p1, p0, :cond_0

    .line 4
    .line 5
    new-instance p0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string p1, "m"

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0

    .line 23
    :cond_0
    const/16 v0, 0x2710

    .line 24
    .line 25
    if-gt p1, v0, :cond_1

    .line 26
    .line 27
    new-instance v0, Ljava/lang/StringBuilder;

    .line 28
    .line 29
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 30
    .line 31
    .line 32
    div-int/2addr p1, p0

    .line 33
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    const-string p0, "km"

    .line 37
    .line 38
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    return-object p0

    .line 46
    :cond_1
    const-string p0, ""

    .line 47
    .line 48
    return-object p0
.end method

.method public d(Ljava/lang/String;)Landroid/view/View;
    .locals 6

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateFourView;->y:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    sget v0, Ll/qec0;->L0:I

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-virtual {p0, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    sget v0, Ll/edc0;->Q4:I

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lv/VText;

    .line 21
    .line 22
    sget v1, Ll/ibc0;->S0:I

    .line 23
    .line 24
    invoke-virtual {p0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 25
    .line 26
    .line 27
    const/high16 v1, 0x40800000    # 4.0f

    .line 28
    .line 29
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setCompoundDrawablePadding(I)V

    .line 34
    .line 35
    .line 36
    sget-object v1, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 39
    .line 40
    .line 41
    sget-object v1, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 44
    .line 45
    .line 46
    const/16 v1, 0x11

    .line 47
    .line 48
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setGravity(I)V

    .line 49
    .line 50
    .line 51
    const/4 v1, 0x1

    .line 52
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setSingleLine(Z)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 56
    .line 57
    .line 58
    const/high16 v1, 0x41400000    # 12.0f

    .line 59
    .line 60
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 61
    .line 62
    .line 63
    move-result v2

    .line 64
    const/high16 v3, 0x40e00000    # 7.0f

    .line 65
    .line 66
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 67
    .line 68
    .line 69
    move-result v4

    .line 70
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 71
    .line 72
    .line 73
    move-result v5

    .line 74
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 75
    .line 76
    .line 77
    move-result v3

    .line 78
    invoke-virtual {v0, v2, v4, v5, v3}, Landroid/view/View;->setPadding(IIII)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 82
    .line 83
    .line 84
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 85
    .line 86
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    sget v2, Ll/g9c0;->d:I

    .line 91
    .line 92
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 93
    .line 94
    .line 95
    move-result v1

    .line 96
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 100
    .line 101
    .line 102
    return-object p0
.end method

.method public final e(Ljava/util/List;Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateFourView;->d(Ljava/lang/String;)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-interface {p1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final f(Lcom/p1/mobile/putong/data/User;)V
    .locals 3

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateFourView;->b:Lv/VText;

    .line 8
    .line 9
    new-instance v1, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 12
    .line 13
    .line 14
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 15
    .line 16
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string v2, "\u5c81"

    .line 20
    .line 21
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateFourView;->c:Landroid/view/View;

    .line 32
    .line 33
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 34
    .line 35
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->zodiac:Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 36
    .line 37
    invoke-static {v1}, Ll/q8g0;->j0(Lcom/p1/mobile/putong/data/ProfileZodiac;)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    xor-int/lit8 v1, v1, 0x1

    .line 46
    .line 47
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateFourView;->d:Lv/VText;

    .line 51
    .line 52
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 53
    .line 54
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->zodiac:Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 55
    .line 56
    invoke-static {v1}, Ll/q8g0;->j0(Lcom/p1/mobile/putong/data/ProfileZodiac;)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 61
    .line 62
    .line 63
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateFourView;->e:Landroid/view/View;

    .line 64
    .line 65
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 66
    .line 67
    iget v1, v1, Lcom/p1/mobile/putong/data/Location;->distance:I

    .line 68
    .line 69
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateFourView;->c(I)Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 74
    .line 75
    .line 76
    move-result v1

    .line 77
    xor-int/lit8 v1, v1, 0x1

    .line 78
    .line 79
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 80
    .line 81
    .line 82
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateFourView;->f:Lv/VText;

    .line 83
    .line 84
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 85
    .line 86
    iget v1, v1, Lcom/p1/mobile/putong/data/Location;->distance:I

    .line 87
    .line 88
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateFourView;->c(I)Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 93
    .line 94
    .line 95
    move-result v1

    .line 96
    xor-int/lit8 v1, v1, 0x1

    .line 97
    .line 98
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 99
    .line 100
    .line 101
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateFourView;->f:Lv/VText;

    .line 102
    .line 103
    new-instance v1, Ljava/lang/StringBuilder;

    .line 104
    .line 105
    const-string v2, "\u8ddd\u4f60"

    .line 106
    .line 107
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 108
    .line 109
    .line 110
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 111
    .line 112
    iget p1, p1, Lcom/p1/mobile/putong/data/Location;->distance:I

    .line 113
    .line 114
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateFourView;->c(I)Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object p1

    .line 118
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 119
    .line 120
    .line 121
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object p1

    .line 125
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 126
    .line 127
    .line 128
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateFourView;->g:Landroid/view/View;

    .line 129
    .line 130
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateFourView;->A:Ljava/lang/String;

    .line 131
    .line 132
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 133
    .line 134
    .line 135
    move-result v0

    .line 136
    xor-int/lit8 v0, v0, 0x1

    .line 137
    .line 138
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 139
    .line 140
    .line 141
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateFourView;->h:Lv/VText;

    .line 142
    .line 143
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateFourView;->A:Ljava/lang/String;

    .line 144
    .line 145
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 146
    .line 147
    .line 148
    :cond_0
    return-void
.end method

.method public final g(Lcom/p1/mobile/putong/data/User;)Z
    .locals 8

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 2
    .line 3
    iget-object v1, v0, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 4
    .line 5
    iget-object v2, v1, Lcom/p1/mobile/putong/data/Work;->industry:Ljava/lang/String;

    .line 6
    .line 7
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Work;->company:Ljava/lang/String;

    .line 8
    .line 9
    iget-object v3, v0, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 10
    .line 11
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Studies;->school:Ljava/lang/String;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 14
    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->friendPurpose:Ljava/util/List;

    .line 18
    .line 19
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 20
    .line 21
    .line 22
    move-result v4

    .line 23
    const/4 v5, 0x0

    .line 24
    const-string v6, ""

    .line 25
    .line 26
    if-nez v4, :cond_0

    .line 27
    .line 28
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 29
    .line 30
    .line 31
    move-result-object v4

    .line 32
    invoke-virtual {v4}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 33
    .line 34
    .line 35
    move-result-object v4

    .line 36
    invoke-interface {v0, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Lcom/p1/mobile/putong/data/Purpose;

    .line 41
    .line 42
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-interface {v4, v0}, Ll/r97;->E2(Ljava/lang/String;)Ll/bkj0;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    iget-object v4, v0, Ll/bkj0;->a:Ljava/lang/Object;

    .line 51
    .line 52
    check-cast v4, Ljava/lang/CharSequence;

    .line 53
    .line 54
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 55
    .line 56
    .line 57
    move-result v4

    .line 58
    if-nez v4, :cond_0

    .line 59
    .line 60
    iget-object v0, v0, Ll/bkj0;->a:Ljava/lang/Object;

    .line 61
    .line 62
    check-cast v0, Ljava/lang/String;

    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_0
    move-object v0, v6

    .line 66
    :goto_0
    iget-object v4, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 67
    .line 68
    iget-object v4, v4, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 69
    .line 70
    iget-object v4, v4, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 71
    .line 72
    iget-object v4, v4, Lcom/p1/mobile/putong/data/Physical;->height:Ljava/util/List;

    .line 73
    .line 74
    invoke-static {v4}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 75
    .line 76
    .line 77
    move-result v7

    .line 78
    if-nez v7, :cond_1

    .line 79
    .line 80
    invoke-interface {v4, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    move-result-object v4

    .line 84
    check-cast v4, Ljava/lang/String;

    .line 85
    .line 86
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 87
    .line 88
    .line 89
    move-result v5

    .line 90
    if-nez v5, :cond_1

    .line 91
    .line 92
    sget-object v5, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 93
    .line 94
    sget v7, Lcom/p1/mobile/putong/core/message/R$string;->q5:I

    .line 95
    .line 96
    invoke-virtual {v5, v7}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v5

    .line 100
    invoke-static {v4, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 101
    .line 102
    .line 103
    move-result v5

    .line 104
    if-nez v5, :cond_1

    .line 105
    .line 106
    new-instance v5, Ljava/lang/StringBuilder;

    .line 107
    .line 108
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 109
    .line 110
    .line 111
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 115
    .line 116
    .line 117
    move-result-object v4

    .line 118
    invoke-virtual {v4}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 119
    .line 120
    .line 121
    move-result-object v4

    .line 122
    invoke-interface {v4}, Ll/r97;->m1()Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object v4

    .line 126
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 127
    .line 128
    .line 129
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object v4

    .line 133
    goto :goto_1

    .line 134
    :cond_1
    move-object v4, v6

    .line 135
    :goto_1
    iget-object v5, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 136
    .line 137
    iget-object v5, v5, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 138
    .line 139
    iget-object v5, v5, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 140
    .line 141
    invoke-static {v5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 142
    .line 143
    .line 144
    move-result v5

    .line 145
    if-eqz v5, :cond_2

    .line 146
    .line 147
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 148
    .line 149
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 150
    .line 151
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 152
    .line 153
    iget-object v5, p1, Lcom/p1/mobile/putong/data/UserWealth;->upperIncome:Ljava/util/List;

    .line 154
    .line 155
    iget-object p1, p1, Lcom/p1/mobile/putong/data/UserWealth;->lowIncome:Ljava/util/List;

    .line 156
    .line 157
    goto :goto_2

    .line 158
    :cond_2
    const/4 v5, 0x0

    .line 159
    move-object p1, v5

    .line 160
    :goto_2
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 161
    .line 162
    .line 163
    move-result v7

    .line 164
    if-eqz v7, :cond_3

    .line 165
    .line 166
    invoke-static {v5}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 167
    .line 168
    .line 169
    move-result v7

    .line 170
    if-nez v7, :cond_4

    .line 171
    .line 172
    :cond_3
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 173
    .line 174
    .line 175
    move-result-object v7

    .line 176
    invoke-virtual {v7}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 177
    .line 178
    .line 179
    move-result-object v7

    .line 180
    invoke-interface {v7, v5, p1}, Ll/r97;->m(Ljava/util/List;Ljava/util/List;)Ljava/lang/String;

    .line 181
    .line 182
    .line 183
    move-result-object p1

    .line 184
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 185
    .line 186
    .line 187
    move-result v5

    .line 188
    if-nez v5, :cond_4

    .line 189
    .line 190
    sget-object v5, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 191
    .line 192
    sget v7, Lcom/p1/mobile/putong/core/message/R$string;->q5:I

    .line 193
    .line 194
    invoke-virtual {v5, v7}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 195
    .line 196
    .line 197
    move-result-object v5

    .line 198
    invoke-static {p1, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 199
    .line 200
    .line 201
    move-result v5

    .line 202
    if-nez v5, :cond_4

    .line 203
    .line 204
    move-object v6, p1

    .line 205
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateFourView;->B:Ljava/util/List;

    .line 206
    .line 207
    invoke-interface {p1}, Ljava/util/List;->clear()V

    .line 208
    .line 209
    .line 210
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 211
    .line 212
    .line 213
    move-result p1

    .line 214
    if-nez p1, :cond_5

    .line 215
    .line 216
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateFourView;->B:Ljava/util/List;

    .line 217
    .line 218
    invoke-interface {p1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 219
    .line 220
    .line 221
    :cond_5
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 222
    .line 223
    .line 224
    move-result p1

    .line 225
    if-nez p1, :cond_6

    .line 226
    .line 227
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateFourView;->B:Ljava/util/List;

    .line 228
    .line 229
    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 230
    .line 231
    .line 232
    :cond_6
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 233
    .line 234
    .line 235
    move-result p1

    .line 236
    if-nez p1, :cond_7

    .line 237
    .line 238
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateFourView;->B:Ljava/util/List;

    .line 239
    .line 240
    invoke-interface {p1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 241
    .line 242
    .line 243
    :cond_7
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 244
    .line 245
    .line 246
    move-result p1

    .line 247
    if-nez p1, :cond_8

    .line 248
    .line 249
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateFourView;->B:Ljava/util/List;

    .line 250
    .line 251
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 252
    .line 253
    .line 254
    :cond_8
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 255
    .line 256
    .line 257
    move-result p1

    .line 258
    if-nez p1, :cond_9

    .line 259
    .line 260
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateFourView;->B:Ljava/util/List;

    .line 261
    .line 262
    invoke-interface {p1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 263
    .line 264
    .line 265
    :cond_9
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 266
    .line 267
    .line 268
    move-result p1

    .line 269
    if-nez p1, :cond_a

    .line 270
    .line 271
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateFourView;->B:Ljava/util/List;

    .line 272
    .line 273
    invoke-interface {p1, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 274
    .line 275
    .line 276
    :cond_a
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateFourView;->B:Ljava/util/List;

    .line 277
    .line 278
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 279
    .line 280
    .line 281
    move-result p0

    .line 282
    xor-int/lit8 p0, p0, 0x1

    .line 283
    .line 284
    return p0
.end method

.method public h(Lcom/p1/mobile/putong/core/ui/greet/a;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)V
    .locals 8

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateFourView;->z:Lcom/p1/mobile/putong/core/ui/greet/a;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateFourView;->y:Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    iput-object p3, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateFourView;->A:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateFourView;->f(Lcom/p1/mobile/putong/data/User;)V

    .line 12
    .line 13
    .line 14
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateFourView;->i:Lv/VLinear;

    .line 15
    .line 16
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateFourView;->g(Lcom/p1/mobile/putong/data/User;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    invoke-static {p3, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateFourView;->j:Lcom/p1/mobile/putong/core/ui/view/ImFlowView;

    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateFourView;->j()Ljava/util/List;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {p3, v0}, Lcom/p1/mobile/putong/core/ui/view/ImFlowView;->setTags(Ljava/util/List;)V

    .line 30
    .line 31
    .line 32
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateFourView;->j:Lcom/p1/mobile/putong/core/ui/view/ImFlowView;

    .line 33
    .line 34
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/ui/view/ImFlowView;->c()V

    .line 35
    .line 36
    .line 37
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateFourView;->j:Lcom/p1/mobile/putong/core/ui/view/ImFlowView;

    .line 38
    .line 39
    const/4 v0, 0x0

    .line 40
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    invoke-virtual {p3, v0}, Lcom/p1/mobile/putong/core/ui/view/ImFlowView;->setHeightLineSpace(I)V

    .line 45
    .line 46
    .line 47
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateFourView;->j:Lcom/p1/mobile/putong/core/ui/view/ImFlowView;

    .line 48
    .line 49
    const/high16 v0, 0x40c00000    # 6.0f

    .line 50
    .line 51
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    invoke-virtual {p3, v0}, Lcom/p1/mobile/putong/core/ui/view/ImFlowView;->setWidthSpace(I)V

    .line 56
    .line 57
    .line 58
    iget-object v5, p2, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 59
    .line 60
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 61
    .line 62
    .line 63
    move-result p3

    .line 64
    const/4 v0, 0x0

    .line 65
    const/4 v7, 0x2

    .line 66
    if-le p3, v7, :cond_0

    .line 67
    .line 68
    const-string v1, "p_kankan_chat_popup"

    .line 69
    .line 70
    new-array v2, v0, [Ll/sfj0$a;

    .line 71
    .line 72
    const-string v3, "e_user_photo"

    .line 73
    .line 74
    invoke-static {v3, v1, v2}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 75
    .line 76
    .line 77
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateFourView;->l:Lv/VFrame;

    .line 78
    .line 79
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateFourView;->m:Lv/VDraweeView;

    .line 80
    .line 81
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateFourView;->n:Lv/VImage;

    .line 82
    .line 83
    const/4 v6, 0x1

    .line 84
    move-object v1, p0

    .line 85
    invoke-virtual/range {v1 .. v6}, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateFourView;->i(Lv/VFrame;Lv/VDraweeView;Lv/VImage;Ljava/util/List;I)V

    .line 86
    .line 87
    .line 88
    iget-object v2, v1, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateFourView;->o:Lv/VFrame;

    .line 89
    .line 90
    iget-object v3, v1, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateFourView;->p:Lv/VDraweeView;

    .line 91
    .line 92
    iget-object v4, v1, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateFourView;->q:Lv/VImage;

    .line 93
    .line 94
    const/4 v6, 0x2

    .line 95
    invoke-virtual/range {v1 .. v6}, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateFourView;->i(Lv/VFrame;Lv/VDraweeView;Lv/VImage;Ljava/util/List;I)V

    .line 96
    .line 97
    .line 98
    goto :goto_0

    .line 99
    :cond_0
    move-object v1, p0

    .line 100
    :goto_0
    const/4 p0, 0x3

    .line 101
    if-le p3, p0, :cond_1

    .line 102
    .line 103
    iget-object v2, v1, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateFourView;->r:Lv/VFrame;

    .line 104
    .line 105
    iget-object v3, v1, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateFourView;->s:Lv/VDraweeView;

    .line 106
    .line 107
    iget-object v4, v1, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateFourView;->t:Lv/VImage;

    .line 108
    .line 109
    const/4 v6, 0x3

    .line 110
    invoke-virtual/range {v1 .. v6}, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateFourView;->i(Lv/VFrame;Lv/VDraweeView;Lv/VImage;Ljava/util/List;I)V

    .line 111
    .line 112
    .line 113
    :cond_1
    iget-object p0, v1, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateFourView;->k:Lv/VLinear;

    .line 114
    .line 115
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 116
    .line 117
    .line 118
    move-result p3

    .line 119
    if-le p3, v7, :cond_2

    .line 120
    .line 121
    const/4 v0, 0x1

    .line 122
    :cond_2
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 123
    .line 124
    .line 125
    iget-object p0, v1, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateFourView;->k:Lv/VLinear;

    .line 126
    .line 127
    new-instance p3, Ll/jck;

    .line 128
    .line 129
    invoke-direct {p3, p1, p2}, Ll/jck;-><init>(Lcom/p1/mobile/putong/core/ui/greet/a;Lcom/p1/mobile/putong/data/User;)V

    .line 130
    .line 131
    .line 132
    invoke-virtual {p0, p3}, Lv/VLinear;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 133
    .line 134
    .line 135
    return-void
.end method

.method public final i(Lv/VFrame;Lv/VDraweeView;Lv/VImage;Ljava/util/List;I)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lv/VFrame;",
            "Lv/VDraweeView;",
            "Lv/VImage;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;I)V"
        }
    .end annotation

    .line 1
    invoke-interface {p4}, Ljava/util/List;->size()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-le v0, p5, :cond_1

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    invoke-interface {p4, p5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    check-cast p1, Lcom/p1/mobile/putong/data/Media;

    .line 17
    .line 18
    sget-object v2, Ll/uqb0;->G:Ll/fsb0;

    .line 19
    .line 20
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    const/16 v4, 0x50

    .line 25
    .line 26
    invoke-virtual {v3, v4}, Lcom/p1/mobile/putong/data/Picture;->profileSize(I)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    invoke-virtual {v2, p2, v3, v1}, Ll/fsb0;->J0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;Z)V

    .line 31
    .line 32
    .line 33
    const/4 p2, 0x3

    .line 34
    if-ne p5, p2, :cond_0

    .line 35
    .line 36
    invoke-interface {p4}, Ljava/util/List;->size()I

    .line 37
    .line 38
    .line 39
    move-result p2

    .line 40
    const/4 p5, 0x4

    .line 41
    if-le p2, p5, :cond_0

    .line 42
    .line 43
    invoke-static {p3, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 44
    .line 45
    .line 46
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateFourView;->u:Lv/VText;

    .line 47
    .line 48
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 49
    .line 50
    .line 51
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateFourView;->u:Lv/VText;

    .line 52
    .line 53
    invoke-interface {p4}, Ljava/util/List;->size()I

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    sub-int/2addr p1, p5

    .line 58
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    const-string p2, "+%s"

    .line 67
    .line 68
    invoke-static {p2, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 73
    .line 74
    .line 75
    return-void

    .line 76
    :cond_0
    instance-of p1, p1, Lcom/p1/mobile/putong/data/Video;

    .line 77
    .line 78
    invoke-static {p3, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 79
    .line 80
    .line 81
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateFourView;->u:Lv/VText;

    .line 82
    .line 83
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 84
    .line 85
    .line 86
    return-void

    .line 87
    :cond_1
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 88
    .line 89
    .line 90
    return-void
.end method

.method public final j()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroid/view/View;",
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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateFourView;->B:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    if-eqz v2, :cond_0

    .line 17
    .line 18
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    check-cast v2, Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {p0, v0, v2}, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateFourView;->e(Ljava/util/List;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    return-object v0
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
    invoke-virtual {p0, v0, p0}, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateFourView;->b(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

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
