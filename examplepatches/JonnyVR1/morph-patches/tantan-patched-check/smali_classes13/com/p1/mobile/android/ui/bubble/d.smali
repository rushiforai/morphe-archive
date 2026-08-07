.class public Lcom/p1/mobile/android/ui/bubble/d;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/android/ui/bubble/d$c;
    }
.end annotation


# static fields
.field public static d:Lcom/p1/mobile/android/ui/bubble/d;


# instance fields
.field public a:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/android/ui/bubble/d$c;",
            ">;"
        }
    .end annotation
.end field

.field public b:I

.field public c:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/android/ui/bubble/d;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/android/ui/bubble/d;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/android/ui/bubble/d;->d:Lcom/p1/mobile/android/ui/bubble/d;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/p1/mobile/android/ui/bubble/d;->b:I

    .line 6
    .line 7
    const-string v0, "fail_tips"

    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/android/ui/bubble/d;->c:Ljava/lang/String;

    .line 10
    .line 11
    new-instance v0, Ljava/util/HashMap;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/android/ui/bubble/d;->a:Ljava/util/HashMap;

    .line 17
    .line 18
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/android/ui/bubble/d;Ljava/lang/String;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/android/ui/bubble/d;->n(Ljava/lang/String;Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/android/ui/bubble/BubbleView;Lcom/p1/mobile/android/ui/bubble/d$c;Ll/bge;FF)V
    .locals 0

    .line 1
    const/high16 p2, 0x435c0000    # 220.0f

    .line 2
    .line 3
    div-float/2addr p3, p2

    .line 4
    invoke-virtual {p0, p3}, Landroid/view/View;->setScaleX(F)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, p3}, Landroid/view/View;->setScaleY(F)V

    .line 8
    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    cmpg-float p0, p3, p0

    .line 12
    .line 13
    if-gtz p0, :cond_1

    .line 14
    .line 15
    iget-object p0, p1, Lcom/p1/mobile/android/ui/bubble/d$c;->b:Ljava/lang/ref/WeakReference;

    .line 16
    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    check-cast p0, Landroid/view/View;

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const/4 p0, 0x0

    .line 27
    :goto_0
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    if-eqz p1, :cond_1

    .line 32
    .line 33
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    instance-of p1, p1, Landroid/view/ViewGroup;

    .line 38
    .line 39
    if-eqz p1, :cond_1

    .line 40
    .line 41
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    check-cast p1, Landroid/view/ViewGroup;

    .line 46
    .line 47
    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    instance-of p2, p0, Landroid/view/View;

    .line 55
    .line 56
    if-eqz p2, :cond_1

    .line 57
    .line 58
    check-cast p0, Landroid/view/View;

    .line 59
    .line 60
    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 61
    .line 62
    .line 63
    :cond_1
    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/android/ui/bubble/d;Ljava/lang/String;Landroid/view/View;Lcom/p1/mobile/android/ui/bubble/a;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/android/ui/bubble/d;->o(Ljava/lang/String;Landroid/view/View;Lcom/p1/mobile/android/ui/bubble/a;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic d(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->m:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic f(Lcom/p1/mobile/android/ui/bubble/d;Landroid/view/View;Ljava/lang/String;Lcom/p1/mobile/android/ui/bubble/a;[I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/android/ui/bubble/d;->p(Landroid/view/View;Ljava/lang/String;Lcom/p1/mobile/android/ui/bubble/a;[I)V

    return-void
.end method

.method public static synthetic g(Lcom/p1/mobile/android/ui/bubble/d;Ljava/lang/String;Landroid/widget/FrameLayout;Landroid/graphics/Rect;Lcom/p1/mobile/android/ui/bubble/a;Landroid/graphics/Rect;Lcom/p1/mobile/android/ui/bubble/BubbleView;Landroid/view/View;Landroid/view/View;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p8}, Lcom/p1/mobile/android/ui/bubble/d;->q(Ljava/lang/String;Landroid/widget/FrameLayout;Landroid/graphics/Rect;Lcom/p1/mobile/android/ui/bubble/a;Landroid/graphics/Rect;Lcom/p1/mobile/android/ui/bubble/BubbleView;Landroid/view/View;Landroid/view/View;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static l()Lcom/p1/mobile/android/ui/bubble/d;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/ui/bubble/d;->d:Lcom/p1/mobile/android/ui/bubble/d;

    .line 2
    .line 3
    return-object v0
.end method


# virtual methods
.method public final h(Lcom/p1/mobile/android/ui/bubble/a;Landroid/view/View;)V
    .locals 5

    .line 1
    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    sget p2, Ll/gec0;->i:I

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-virtual {p0, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    sget p2, Ll/vcc0;->l:I

    .line 17
    .line 18
    invoke-virtual {p0, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object p2

    .line 22
    check-cast p2, Landroid/widget/ImageView;

    .line 23
    .line 24
    sget v0, Ll/vcc0;->k:I

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Landroid/widget/TextView;

    .line 31
    .line 32
    iget-object v1, p1, Lcom/p1/mobile/android/ui/bubble/a;->F:Ljava/lang/Integer;

    .line 33
    .line 34
    if-eqz v1, :cond_0

    .line 35
    .line 36
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setBreakStrategy(I)V

    .line 41
    .line 42
    .line 43
    :cond_0
    iget-object v1, p1, Lcom/p1/mobile/android/ui/bubble/a;->u:Ljava/lang/Integer;

    .line 44
    .line 45
    if-eqz v1, :cond_1

    .line 46
    .line 47
    const/4 v1, 0x0

    .line 48
    invoke-virtual {p2, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 49
    .line 50
    .line 51
    iget-object v2, p1, Lcom/p1/mobile/android/ui/bubble/a;->u:Ljava/lang/Integer;

    .line 52
    .line 53
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 54
    .line 55
    .line 56
    move-result v2

    .line 57
    invoke-virtual {p2, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 61
    .line 62
    .line 63
    move-result-object p2

    .line 64
    check-cast p2, Landroid/widget/LinearLayout$LayoutParams;

    .line 65
    .line 66
    invoke-virtual {p2, v1}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginStart(I)V

    .line 67
    .line 68
    .line 69
    sget v1, Ll/qa00;->m:I

    .line 70
    .line 71
    invoke-virtual {p2, v1}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginEnd(I)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {v0, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 75
    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_1
    iget-object p2, p1, Lcom/p1/mobile/android/ui/bubble/a;->G:Lcom/p1/mobile/android/ui/bubble/a$a;

    .line 79
    .line 80
    if-eqz p2, :cond_2

    .line 81
    .line 82
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 83
    .line 84
    .line 85
    move-result-object p2

    .line 86
    check-cast p2, Landroid/widget/LinearLayout$LayoutParams;

    .line 87
    .line 88
    iget-object v1, p1, Lcom/p1/mobile/android/ui/bubble/a;->G:Lcom/p1/mobile/android/ui/bubble/a$a;

    .line 89
    .line 90
    iget v2, v1, Lcom/p1/mobile/android/ui/bubble/a$a;->a:I

    .line 91
    .line 92
    iget v3, v1, Lcom/p1/mobile/android/ui/bubble/a$a;->b:I

    .line 93
    .line 94
    iget v4, v1, Lcom/p1/mobile/android/ui/bubble/a$a;->c:I

    .line 95
    .line 96
    iget v1, v1, Lcom/p1/mobile/android/ui/bubble/a$a;->d:I

    .line 97
    .line 98
    invoke-virtual {p2, v2, v3, v4, v1}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 99
    .line 100
    .line 101
    :cond_2
    :goto_0
    iget-boolean p2, p1, Lcom/p1/mobile/android/ui/bubble/a;->J:Z

    .line 102
    .line 103
    const/4 v1, 0x1

    .line 104
    if-eqz p2, :cond_3

    .line 105
    .line 106
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setGravity(I)V

    .line 107
    .line 108
    .line 109
    :cond_3
    iget-boolean p2, p1, Lcom/p1/mobile/android/ui/bubble/a;->o:Z

    .line 110
    .line 111
    if-eqz p2, :cond_4

    .line 112
    .line 113
    invoke-static {v1}, Landroid/graphics/Typeface;->defaultFromStyle(I)Landroid/graphics/Typeface;

    .line 114
    .line 115
    .line 116
    move-result-object p2

    .line 117
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 118
    .line 119
    .line 120
    :cond_4
    iget p2, p1, Lcom/p1/mobile/android/ui/bubble/a;->p:I

    .line 121
    .line 122
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 123
    .line 124
    .line 125
    iget p2, p1, Lcom/p1/mobile/android/ui/bubble/a;->s:F

    .line 126
    .line 127
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 128
    .line 129
    .line 130
    iget-object p2, p1, Lcom/p1/mobile/android/ui/bubble/a;->q:Ljava/lang/String;

    .line 131
    .line 132
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 133
    .line 134
    .line 135
    move-result p2

    .line 136
    if-nez p2, :cond_5

    .line 137
    .line 138
    iget-object p2, p1, Lcom/p1/mobile/android/ui/bubble/a;->q:Ljava/lang/String;

    .line 139
    .line 140
    invoke-static {p2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 141
    .line 142
    .line 143
    move-result p2

    .line 144
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 145
    .line 146
    .line 147
    :cond_5
    iget p2, p1, Lcom/p1/mobile/android/ui/bubble/a;->t:I

    .line 148
    .line 149
    if-lez p2, :cond_6

    .line 150
    .line 151
    int-to-float p2, p2

    .line 152
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 153
    .line 154
    .line 155
    move-result p2

    .line 156
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setMaxWidth(I)V

    .line 157
    .line 158
    .line 159
    :cond_6
    iget-object p2, p1, Lcom/p1/mobile/android/ui/bubble/a;->r:Ljava/lang/CharSequence;

    .line 160
    .line 161
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 162
    .line 163
    .line 164
    invoke-virtual {p1, p0}, Lcom/p1/mobile/android/ui/bubble/a;->s(Landroid/view/View;)Lcom/p1/mobile/android/ui/bubble/a;

    .line 165
    .line 166
    .line 167
    return-void
.end method

.method public i(Ljava/lang/String;Z)V
    .locals 2

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/android/ui/bubble/d;->a:Ljava/util/HashMap;

    .line 9
    .line 10
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    check-cast v0, Lcom/p1/mobile/android/ui/bubble/d$c;

    .line 15
    .line 16
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-eqz v1, :cond_2

    .line 21
    .line 22
    iget-object v0, v0, Lcom/p1/mobile/android/ui/bubble/d$c;->d:Lcom/p1/mobile/android/ui/bubble/a;

    .line 23
    .line 24
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-eqz v1, :cond_1

    .line 29
    .line 30
    iget-object v1, v0, Lcom/p1/mobile/android/ui/bubble/a;->k:Lcom/p1/mobile/android/ui/bubble/a$b;

    .line 31
    .line 32
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    if-eqz v1, :cond_1

    .line 37
    .line 38
    iget-object v0, v0, Lcom/p1/mobile/android/ui/bubble/a;->k:Lcom/p1/mobile/android/ui/bubble/a$b;

    .line 39
    .line 40
    invoke-interface {v0, p1}, Lcom/p1/mobile/android/ui/bubble/a$b;->a(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    :cond_1
    if-eqz p2, :cond_2

    .line 44
    .line 45
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/ui/bubble/d;->k(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    :cond_2
    :goto_0
    return-void
.end method

.method public j()V
    .locals 3

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/android/ui/bubble/d;->a:Ljava/util/HashMap;

    .line 7
    .line 8
    invoke-virtual {v1}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    if-eqz v2, :cond_0

    .line 21
    .line 22
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    check-cast v2, Ljava/lang/String;

    .line 27
    .line 28
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    if-nez v1, :cond_1

    .line 37
    .line 38
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    if-eqz v1, :cond_1

    .line 47
    .line 48
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    check-cast v1, Ljava/lang/String;

    .line 53
    .line 54
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/ui/bubble/d;->k(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    goto :goto_1

    .line 58
    :cond_1
    return-void
.end method

.method public k(Ljava/lang/String;)V
    .locals 5

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto/16 :goto_0

    .line 8
    .line 9
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/android/ui/bubble/d;->a:Ljava/util/HashMap;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Lcom/p1/mobile/android/ui/bubble/d$c;

    .line 16
    .line 17
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_3

    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/android/ui/bubble/d$c;->c:Lcom/p1/mobile/android/ui/bubble/BubbleView;

    .line 24
    .line 25
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-eqz v1, :cond_1

    .line 30
    .line 31
    invoke-virtual {v0}, Lcom/p1/mobile/android/ui/bubble/BubbleView;->i()V

    .line 32
    .line 33
    .line 34
    new-instance v1, Ll/zsi;

    .line 35
    .line 36
    const/4 v2, 0x0

    .line 37
    invoke-direct {v1, v2}, Ll/zsi;-><init>(F)V

    .line 38
    .line 39
    .line 40
    new-instance v3, Ll/ezf0;

    .line 41
    .line 42
    invoke-direct {v3}, Ll/ezf0;-><init>()V

    .line 43
    .line 44
    .line 45
    const v4, 0x3f1c28f6    # 0.61f

    .line 46
    .line 47
    .line 48
    invoke-virtual {v3, v4}, Ll/ezf0;->d(F)Ll/ezf0;

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    const/high16 v4, 0x44160000    # 600.0f

    .line 53
    .line 54
    invoke-virtual {v3, v4}, Ll/ezf0;->f(F)Ll/ezf0;

    .line 55
    .line 56
    .line 57
    move-result-object v3

    .line 58
    new-instance v4, Ll/tyf0;

    .line 59
    .line 60
    invoke-direct {v4, v1}, Ll/tyf0;-><init>(Ll/zsi;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {v4, v3}, Ll/tyf0;->r(Ll/ezf0;)Ll/tyf0;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    invoke-virtual {v1, v2}, Ll/bge;->j(F)Ll/bge;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    check-cast v1, Ll/tyf0;

    .line 72
    .line 73
    invoke-virtual {v0}, Lcom/p1/mobile/android/ui/bubble/BubbleView;->k()[F

    .line 74
    .line 75
    .line 76
    move-result-object v3

    .line 77
    const/4 v4, 0x0

    .line 78
    aget v4, v3, v4

    .line 79
    .line 80
    invoke-virtual {v0, v4}, Landroid/view/View;->setPivotX(F)V

    .line 81
    .line 82
    .line 83
    const/4 v4, 0x1

    .line 84
    aget v3, v3, v4

    .line 85
    .line 86
    invoke-virtual {v0, v3}, Landroid/view/View;->setPivotY(F)V

    .line 87
    .line 88
    .line 89
    new-instance v3, Lcom/p1/mobile/android/ui/bubble/b;

    .line 90
    .line 91
    invoke-direct {v3, v0, p0}, Lcom/p1/mobile/android/ui/bubble/b;-><init>(Lcom/p1/mobile/android/ui/bubble/BubbleView;Lcom/p1/mobile/android/ui/bubble/d$c;)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {v1, v3}, Ll/bge;->b(Ll/bge$r;)Ll/bge;

    .line 95
    .line 96
    .line 97
    const/high16 v0, 0x435c0000    # 220.0f

    .line 98
    .line 99
    invoke-virtual {v1, v0}, Ll/bge;->j(F)Ll/bge;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    check-cast v0, Ll/tyf0;

    .line 104
    .line 105
    invoke-virtual {v0, v2}, Ll/tyf0;->o(F)V

    .line 106
    .line 107
    .line 108
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/android/ui/bubble/d$c;->d:Lcom/p1/mobile/android/ui/bubble/a;

    .line 109
    .line 110
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 111
    .line 112
    .line 113
    move-result v0

    .line 114
    if-eqz v0, :cond_2

    .line 115
    .line 116
    iget-object v0, p0, Lcom/p1/mobile/android/ui/bubble/a;->l:Lcom/p1/mobile/android/ui/bubble/a$c;

    .line 117
    .line 118
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 119
    .line 120
    .line 121
    move-result v0

    .line 122
    if-eqz v0, :cond_2

    .line 123
    .line 124
    iget-object v0, p0, Lcom/p1/mobile/android/ui/bubble/a;->l:Lcom/p1/mobile/android/ui/bubble/a$c;

    .line 125
    .line 126
    invoke-interface {v0, p1}, Lcom/p1/mobile/android/ui/bubble/a$c;->a(Ljava/lang/String;)V

    .line 127
    .line 128
    .line 129
    :cond_2
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 130
    .line 131
    .line 132
    move-result p1

    .line 133
    if-eqz p1, :cond_3

    .line 134
    .line 135
    iget-object p1, p0, Lcom/p1/mobile/android/ui/bubble/a;->K:Ll/z2m;

    .line 136
    .line 137
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 138
    .line 139
    .line 140
    move-result p1

    .line 141
    if-eqz p1, :cond_3

    .line 142
    .line 143
    iget-object p1, p0, Lcom/p1/mobile/android/ui/bubble/a;->K:Ll/z2m;

    .line 144
    .line 145
    invoke-interface {p1, p0}, Ll/z2m;->a(Ll/d3m;)V

    .line 146
    .line 147
    .line 148
    :cond_3
    :goto_0
    return-void
.end method

.method public final m()Ljava/lang/String;
    .locals 2

    .line 1
    iget v0, p0, Lcom/p1/mobile/android/ui/bubble/d;->b:I

    .line 2
    .line 3
    add-int/lit8 v1, v0, 0x1

    .line 4
    .line 5
    iput v1, p0, Lcom/p1/mobile/android/ui/bubble/d;->b:I

    .line 6
    .line 7
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public final synthetic n(Ljava/lang/String;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/ui/bubble/d;->a:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic o(Ljava/lang/String;Landroid/view/View;Lcom/p1/mobile/android/ui/bubble/a;)Ljava/lang/Boolean;
    .locals 7

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/ui/bubble/d;->x(Ljava/lang/String;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance v4, Landroid/graphics/Rect;

    .line 8
    .line 9
    invoke-direct {v4}, Landroid/graphics/Rect;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p2, v4}, Landroid/view/View;->getWindowVisibleDisplayFrame(Landroid/graphics/Rect;)V

    .line 13
    .line 14
    .line 15
    new-instance v0, Landroid/graphics/Rect;

    .line 16
    .line 17
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p2, v0}, Landroid/view/View;->getLocalVisibleRect(Landroid/graphics/Rect;)Z

    .line 21
    .line 22
    .line 23
    new-instance v3, Landroid/graphics/Rect;

    .line 24
    .line 25
    invoke-direct {v3}, Landroid/graphics/Rect;-><init>()V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p2, v3}, Landroid/view/View;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    .line 29
    .line 30
    .line 31
    move-object v1, p0

    .line 32
    move-object v6, p1

    .line 33
    move-object v5, p2

    .line 34
    move-object v2, p3

    .line 35
    invoke-virtual/range {v1 .. v6}, Lcom/p1/mobile/android/ui/bubble/d;->w(Lcom/p1/mobile/android/ui/bubble/a;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/view/View;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    :cond_0
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 39
    .line 40
    return-object p0
.end method

.method public final synthetic p(Landroid/view/View;Ljava/lang/String;Lcom/p1/mobile/android/ui/bubble/a;[I)V
    .locals 0

    .line 1
    new-instance p4, Ll/eg3;

    .line 2
    .line 3
    invoke-direct {p4, p0, p2, p1, p3}, Ll/eg3;-><init>(Lcom/p1/mobile/android/ui/bubble/d;Ljava/lang/String;Landroid/view/View;Lcom/p1/mobile/android/ui/bubble/a;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p1, p4}, Ll/bnl0;->b0(Landroid/view/View;Ll/pcj;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, p2}, Lcom/p1/mobile/android/ui/bubble/d;->x(Ljava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p1}, Landroid/view/View;->invalidate()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public final synthetic q(Ljava/lang/String;Landroid/widget/FrameLayout;Landroid/graphics/Rect;Lcom/p1/mobile/android/ui/bubble/a;Landroid/graphics/Rect;Lcom/p1/mobile/android/ui/bubble/BubbleView;Landroid/view/View;Landroid/view/View;)Ljava/lang/Boolean;
    .locals 7

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/ui/bubble/d;->x(Ljava/lang/String;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_2

    .line 6
    .line 7
    new-instance p0, Landroid/graphics/Rect;

    .line 8
    .line 9
    invoke-direct {p0}, Landroid/graphics/Rect;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p2, p0}, Landroid/view/View;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    .line 13
    .line 14
    .line 15
    new-instance v2, Landroid/graphics/Rect;

    .line 16
    .line 17
    iget v0, p3, Landroid/graphics/Rect;->left:I

    .line 18
    .line 19
    iget-boolean v1, p4, Lcom/p1/mobile/android/ui/bubble/a;->D:Z

    .line 20
    .line 21
    const/4 v6, 0x0

    .line 22
    if-eqz v1, :cond_0

    .line 23
    .line 24
    iget v3, p0, Landroid/graphics/Rect;->left:I

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    move v3, v6

    .line 28
    :goto_0
    sub-int/2addr v0, v3

    .line 29
    iget v3, p3, Landroid/graphics/Rect;->top:I

    .line 30
    .line 31
    iget v4, p5, Landroid/graphics/Rect;->top:I

    .line 32
    .line 33
    sub-int/2addr v3, v4

    .line 34
    iget v5, p3, Landroid/graphics/Rect;->right:I

    .line 35
    .line 36
    if-eqz v1, :cond_1

    .line 37
    .line 38
    iget v1, p0, Landroid/graphics/Rect;->left:I

    .line 39
    .line 40
    goto :goto_1

    .line 41
    :cond_1
    move v1, v6

    .line 42
    :goto_1
    add-int/2addr v5, v1

    .line 43
    iget v1, p3, Landroid/graphics/Rect;->bottom:I

    .line 44
    .line 45
    sub-int/2addr v1, v4

    .line 46
    invoke-direct {v2, v0, v3, v5, v1}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p7}, Landroid/view/View;->getWidth()I

    .line 50
    .line 51
    .line 52
    move-result v3

    .line 53
    invoke-virtual {p7}, Landroid/view/View;->getHeight()I

    .line 54
    .line 55
    .line 56
    move-result v4

    .line 57
    move-object v5, p1

    .line 58
    move-object v1, p4

    .line 59
    move-object v0, p6

    .line 60
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/android/ui/bubble/BubbleView;->s(Lcom/p1/mobile/android/ui/bubble/a;Landroid/graphics/Rect;IILjava/lang/String;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {v0}, Lcom/p1/mobile/android/ui/bubble/BubbleView;->l()[I

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    new-instance p4, Landroid/widget/FrameLayout$LayoutParams;

    .line 68
    .line 69
    const/4 p6, -0x2

    .line 70
    invoke-direct {p4, p6, p6}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 71
    .line 72
    .line 73
    iget p5, p5, Landroid/graphics/Rect;->top:I

    .line 74
    .line 75
    iget p0, p0, Landroid/graphics/Rect;->top:I

    .line 76
    .line 77
    sub-int/2addr p5, p0

    .line 78
    new-instance p0, Landroid/graphics/Rect;

    .line 79
    .line 80
    invoke-direct {p0}, Landroid/graphics/Rect;-><init>()V

    .line 81
    .line 82
    .line 83
    invoke-virtual {p8, p0}, Landroid/view/View;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    .line 84
    .line 85
    .line 86
    iget p0, p0, Landroid/graphics/Rect;->top:I

    .line 87
    .line 88
    iget p3, p3, Landroid/graphics/Rect;->top:I

    .line 89
    .line 90
    sub-int/2addr p0, p3

    .line 91
    add-int/2addr p5, p0

    .line 92
    aget p0, p1, v6

    .line 93
    .line 94
    iget p3, v1, Lcom/p1/mobile/android/ui/bubble/a;->c:I

    .line 95
    .line 96
    add-int/2addr p0, p3

    .line 97
    iput p0, p4, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 98
    .line 99
    const/4 p0, 0x1

    .line 100
    aget p0, p1, p0

    .line 101
    .line 102
    iget p1, v1, Lcom/p1/mobile/android/ui/bubble/a;->d:I

    .line 103
    .line 104
    add-int/2addr p0, p1

    .line 105
    add-int/2addr p0, p5

    .line 106
    iput p0, p4, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 107
    .line 108
    invoke-virtual {p2, v0, p4}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 109
    .line 110
    .line 111
    invoke-virtual {v0, v5}, Lcom/p1/mobile/android/ui/bubble/BubbleView;->t(Ljava/lang/String;)V

    .line 112
    .line 113
    .line 114
    iget-object p0, v1, Lcom/p1/mobile/android/ui/bubble/a;->m:Lcom/p1/mobile/android/ui/bubble/a$d;

    .line 115
    .line 116
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 117
    .line 118
    .line 119
    move-result p0

    .line 120
    if-eqz p0, :cond_3

    .line 121
    .line 122
    iget-object p0, v1, Lcom/p1/mobile/android/ui/bubble/a;->m:Lcom/p1/mobile/android/ui/bubble/a$d;

    .line 123
    .line 124
    invoke-interface {p0, v0}, Lcom/p1/mobile/android/ui/bubble/a$d;->a(Landroid/view/View;)V

    .line 125
    .line 126
    .line 127
    goto :goto_2

    .line 128
    :cond_2
    invoke-virtual {p2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 129
    .line 130
    .line 131
    move-result-object p0

    .line 132
    check-cast p0, Landroid/view/ViewGroup;

    .line 133
    .line 134
    if-eqz p0, :cond_3

    .line 135
    .line 136
    invoke-virtual {p0, p2}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 137
    .line 138
    .line 139
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 140
    .line 141
    .line 142
    move-result-object p1

    .line 143
    instance-of p2, p1, Landroid/view/View;

    .line 144
    .line 145
    if-eqz p2, :cond_3

    .line 146
    .line 147
    check-cast p1, Landroid/view/View;

    .line 148
    .line 149
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 150
    .line 151
    .line 152
    :cond_3
    :goto_2
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 153
    .line 154
    return-object p0
.end method

.method public final r(Ljava/lang/String;Lcom/p1/mobile/android/ui/bubble/BubbleView;Landroid/view/View;Lcom/p1/mobile/android/ui/bubble/a;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/ui/bubble/d;->a:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/android/ui/bubble/d$c;

    .line 8
    .line 9
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    iput-object p2, p0, Lcom/p1/mobile/android/ui/bubble/d$c;->c:Lcom/p1/mobile/android/ui/bubble/BubbleView;

    .line 16
    .line 17
    new-instance p1, Ljava/lang/ref/WeakReference;

    .line 18
    .line 19
    invoke-direct {p1, p3}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    iput-object p1, p0, Lcom/p1/mobile/android/ui/bubble/d$c;->b:Ljava/lang/ref/WeakReference;

    .line 23
    .line 24
    iput-object p4, p0, Lcom/p1/mobile/android/ui/bubble/d$c;->d:Lcom/p1/mobile/android/ui/bubble/a;

    .line 25
    .line 26
    const/4 p0, 0x1

    .line 27
    return p0

    .line 28
    :cond_0
    const/4 p0, 0x0

    .line 29
    return p0
.end method

.method public s(Lcom/p1/mobile/android/ui/bubble/a;Landroid/view/View;Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/android/ui/bubble/a;->w:Landroid/view/View;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/android/ui/bubble/d;->h(Lcom/p1/mobile/android/ui/bubble/a;Landroid/view/View;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    new-instance v0, Lcom/p1/mobile/android/ui/bubble/d$c;

    .line 9
    .line 10
    invoke-direct {v0, p0, p3, p1}, Lcom/p1/mobile/android/ui/bubble/d$c;-><init>(Lcom/p1/mobile/android/ui/bubble/d;Ljava/lang/String;Lcom/p1/mobile/android/ui/bubble/a;)V

    .line 11
    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/android/ui/bubble/d;->a:Ljava/util/HashMap;

    .line 14
    .line 15
    invoke-virtual {v1, p3, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    instance-of v1, v0, Lcom/p1/mobile/android/app/Act;

    .line 23
    .line 24
    if-eqz v1, :cond_1

    .line 25
    .line 26
    check-cast v0, Lcom/p1/mobile/android/app/Act;

    .line 27
    .line 28
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->lifecycle()Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    new-instance v1, Ll/bg3;

    .line 33
    .line 34
    invoke-direct {v1}, Ll/bg3;-><init>()V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    new-instance v1, Ll/cg3;

    .line 42
    .line 43
    invoke-direct {v1, p0, p3}, Ll/cg3;-><init>(Lcom/p1/mobile/android/ui/bubble/d;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 51
    .line 52
    .line 53
    :cond_1
    new-instance v0, Ll/dg3;

    .line 54
    .line 55
    invoke-direct {v0, p0, p2, p3, p1}, Ll/dg3;-><init>(Lcom/p1/mobile/android/ui/bubble/d;Landroid/view/View;Ljava/lang/String;Lcom/p1/mobile/android/ui/bubble/a;)V

    .line 56
    .line 57
    .line 58
    invoke-static {p2, v0}, Ll/bnl0;->Q0(Landroid/view/View;Ll/y20;)V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public t(Lcom/p1/mobile/android/ui/bubble/a;Landroid/view/View;)Ljava/lang/String;
    .locals 1

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/android/ui/bubble/d;->c:Ljava/lang/String;

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/bubble/d;->m()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {p0, p1, p2, v0}, Lcom/p1/mobile/android/ui/bubble/d;->u(Lcom/p1/mobile/android/ui/bubble/a;Landroid/view/View;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-object v0
.end method

.method public u(Lcom/p1/mobile/android/ui/bubble/a;Landroid/view/View;Ljava/lang/String;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/p1/mobile/android/ui/bubble/d;->v(Lcom/p1/mobile/android/ui/bubble/a;Landroid/view/View;Ljava/lang/String;I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public v(Lcom/p1/mobile/android/ui/bubble/a;Landroid/view/View;Ljava/lang/String;I)V
    .locals 1

    .line 1
    if-eqz p2, :cond_2

    .line 2
    .line 3
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_2

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/android/ui/bubble/d;->a:Ljava/util/HashMap;

    .line 10
    .line 11
    invoke-virtual {p0, p3}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-nez p0, :cond_2

    .line 16
    .line 17
    invoke-static {}, Ll/cl80;->e()Ll/cl80;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0}, Ll/cl80;->k()Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-eqz p0, :cond_0

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    invoke-static {}, Ll/l51;->D()Z

    .line 29
    .line 30
    .line 31
    invoke-static {}, Lcom/p1/mobile/android/ui/poplevel/a;->p()Lcom/p1/mobile/android/ui/poplevel/a;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/poplevel/a;->I()Z

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    if-eqz p0, :cond_1

    .line 40
    .line 41
    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    instance-of p0, p0, Lcom/p1/mobile/android/app/Act;

    .line 46
    .line 47
    if-eqz p0, :cond_1

    .line 48
    .line 49
    invoke-virtual {p1, p3, p2}, Lcom/p1/mobile/android/ui/bubble/a;->c(Ljava/lang/String;Landroid/view/View;)V

    .line 50
    .line 51
    .line 52
    invoke-static {}, Lcom/p1/mobile/android/ui/poplevel/a;->p()Lcom/p1/mobile/android/ui/poplevel/a;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    new-instance v0, Ll/b3m;

    .line 57
    .line 58
    invoke-direct {v0, p3}, Ll/b3m;-><init>(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 62
    .line 63
    .line 64
    move-result-object p2

    .line 65
    check-cast p2, Lcom/p1/mobile/android/app/Act;

    .line 66
    .line 67
    invoke-static {p4}, Lcom/p1/mobile/android/ui/poplevel/a;->F(I)I

    .line 68
    .line 69
    .line 70
    move-result p3

    .line 71
    invoke-virtual {p0, v0, p2, p1, p3}, Lcom/p1/mobile/android/ui/poplevel/a;->C(Ll/c3m;Ll/e3m;Ll/d3m;I)V

    .line 72
    .line 73
    .line 74
    return-void

    .line 75
    :cond_1
    invoke-static {}, Ll/cl80;->e()Ll/cl80;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    invoke-static {p1}, Ll/al80;->a(Ll/f3m;)Ll/al80;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    new-instance v0, Ljava/lang/ref/WeakReference;

    .line 84
    .line 85
    invoke-direct {v0, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {p1, v0}, Ll/al80;->r(Ljava/lang/ref/WeakReference;)Ll/al80;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    invoke-virtual {p1, p3}, Ll/al80;->n(Ljava/lang/String;)Ll/al80;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    invoke-virtual {p1, p4}, Ll/al80;->p(I)Ll/al80;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    invoke-virtual {p0, p1}, Ll/cl80;->q(Ll/al80;)V

    .line 101
    .line 102
    .line 103
    :cond_2
    :goto_0
    return-void
.end method

.method public final w(Lcom/p1/mobile/android/ui/bubble/a;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/view/View;Ljava/lang/String;)V
    .locals 10

    .line 1
    invoke-virtual {p4}, Landroid/view/View;->getRootView()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v3

    .line 9
    if-eqz v3, :cond_5

    .line 10
    .line 11
    iget-object v3, p1, Lcom/p1/mobile/android/ui/bubble/a;->y:Landroid/view/View;

    .line 12
    .line 13
    if-nez v3, :cond_0

    .line 14
    .line 15
    const v3, 0x1020002

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v3

    .line 22
    :cond_0
    move-object v8, v3

    .line 23
    instance-of v0, v8, Landroid/view/ViewGroup;

    .line 24
    .line 25
    if-eqz v0, :cond_5

    .line 26
    .line 27
    iget v0, p1, Lcom/p1/mobile/android/ui/bubble/a;->B:I

    .line 28
    .line 29
    const/4 v3, -0x1

    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    new-instance v0, Landroid/widget/FrameLayout;

    .line 33
    .line 34
    invoke-virtual {p4}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 35
    .line 36
    .line 37
    move-result-object v4

    .line 38
    invoke-direct {v0, v4}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 39
    .line 40
    .line 41
    new-instance v4, Lcom/p1/mobile/android/ui/bubble/BubbleBackgroundView;

    .line 42
    .line 43
    invoke-virtual {p4}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 44
    .line 45
    .line 46
    move-result-object v6

    .line 47
    invoke-direct {v4, v6}, Lcom/p1/mobile/android/ui/bubble/BubbleBackgroundView;-><init>(Landroid/content/Context;)V

    .line 48
    .line 49
    .line 50
    iget v6, p1, Lcom/p1/mobile/android/ui/bubble/a;->B:I

    .line 51
    .line 52
    invoke-virtual {v4, v6}, Lcom/p1/mobile/android/ui/bubble/BubbleBackgroundView;->setBackgroundPaintColor(I)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v4, p2}, Lcom/p1/mobile/android/ui/bubble/BubbleBackgroundView;->setTargetViewRect(Landroid/graphics/Rect;)V

    .line 56
    .line 57
    .line 58
    iget v7, p1, Lcom/p1/mobile/android/ui/bubble/a;->C:I

    .line 59
    .line 60
    invoke-virtual {v4, v7}, Lcom/p1/mobile/android/ui/bubble/BubbleBackgroundView;->setTargetViewRadius(I)V

    .line 61
    .line 62
    .line 63
    new-instance v7, Ll/fg3;

    .line 64
    .line 65
    invoke-direct {v7}, Ll/fg3;-><init>()V

    .line 66
    .line 67
    .line 68
    invoke-static {v4, v7}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 69
    .line 70
    .line 71
    move-object v7, v8

    .line 72
    check-cast v7, Landroid/view/ViewGroup;

    .line 73
    .line 74
    invoke-virtual {v7, v4, v3, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;II)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {v0, v4}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {v7, v0, v3, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;II)V

    .line 81
    .line 82
    .line 83
    :goto_0
    move-object v3, v0

    .line 84
    goto :goto_1

    .line 85
    :cond_1
    new-instance v0, Landroid/widget/FrameLayout;

    .line 86
    .line 87
    invoke-virtual {p4}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 88
    .line 89
    .line 90
    move-result-object v4

    .line 91
    invoke-direct {v0, v4}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 92
    .line 93
    .line 94
    move-object v4, v8

    .line 95
    check-cast v4, Landroid/view/ViewGroup;

    .line 96
    .line 97
    invoke-virtual {v4, v0, v3, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;II)V

    .line 98
    .line 99
    .line 100
    goto :goto_0

    .line 101
    :goto_1
    new-instance v7, Lcom/p1/mobile/android/ui/bubble/BubbleView;

    .line 102
    .line 103
    invoke-virtual {p4}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    invoke-direct {v7, v0}, Lcom/p1/mobile/android/ui/bubble/BubbleView;-><init>(Landroid/content/Context;)V

    .line 108
    .line 109
    .line 110
    invoke-virtual {p0, p5, v7, v3, p1}, Lcom/p1/mobile/android/ui/bubble/d;->r(Ljava/lang/String;Lcom/p1/mobile/android/ui/bubble/BubbleView;Landroid/view/View;Lcom/p1/mobile/android/ui/bubble/a;)Z

    .line 111
    .line 112
    .line 113
    move-result v0

    .line 114
    if-nez v0, :cond_2

    .line 115
    .line 116
    goto :goto_2

    .line 117
    :cond_2
    iget-boolean v0, p1, Lcom/p1/mobile/android/ui/bubble/a;->z:Z

    .line 118
    .line 119
    if-eqz v0, :cond_3

    .line 120
    .line 121
    new-instance v0, Lcom/p1/mobile/android/ui/bubble/d$a;

    .line 122
    .line 123
    invoke-direct {v0, p0, p5}, Lcom/p1/mobile/android/ui/bubble/d$a;-><init>(Lcom/p1/mobile/android/ui/bubble/d;Ljava/lang/String;)V

    .line 124
    .line 125
    .line 126
    invoke-virtual {v3, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 127
    .line 128
    .line 129
    :cond_3
    iget-boolean v0, p1, Lcom/p1/mobile/android/ui/bubble/a;->A:Z

    .line 130
    .line 131
    if-eqz v0, :cond_4

    .line 132
    .line 133
    new-instance v0, Lcom/p1/mobile/android/ui/bubble/d$b;

    .line 134
    .line 135
    invoke-direct {v0, p0, p5}, Lcom/p1/mobile/android/ui/bubble/d$b;-><init>(Lcom/p1/mobile/android/ui/bubble/d;Ljava/lang/String;)V

    .line 136
    .line 137
    .line 138
    invoke-virtual {v3, v0}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 139
    .line 140
    .line 141
    :cond_4
    new-instance v0, Lcom/p1/mobile/android/ui/bubble/c;

    .line 142
    .line 143
    move-object v1, p0

    .line 144
    move-object v5, p1

    .line 145
    move-object v4, p2

    .line 146
    move-object v6, p3

    .line 147
    move-object v9, p4

    .line 148
    move-object v2, p5

    .line 149
    invoke-direct/range {v0 .. v9}, Lcom/p1/mobile/android/ui/bubble/c;-><init>(Lcom/p1/mobile/android/ui/bubble/d;Ljava/lang/String;Landroid/widget/FrameLayout;Landroid/graphics/Rect;Lcom/p1/mobile/android/ui/bubble/a;Landroid/graphics/Rect;Lcom/p1/mobile/android/ui/bubble/BubbleView;Landroid/view/View;Landroid/view/View;)V

    .line 150
    .line 151
    .line 152
    invoke-static {v3, v0}, Ll/bnl0;->b0(Landroid/view/View;Ll/pcj;)V

    .line 153
    .line 154
    .line 155
    :cond_5
    :goto_2
    return-void
.end method

.method public x(Ljava/lang/String;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/ui/bubble/d;->a:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
