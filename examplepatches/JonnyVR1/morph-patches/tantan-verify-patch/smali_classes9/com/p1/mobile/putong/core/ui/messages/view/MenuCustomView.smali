.class public Lcom/p1/mobile/putong/core/ui/messages/view/MenuCustomView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public a:Landroid/content/Context;

.field public b:Landroid/widget/PopupWindow;


# direct methods
.method public constructor <init>(Landroid/content/Context;Z)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/view/MenuCustomView;->c(Landroid/content/Context;Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/messages/view/MenuCustomView;Ll/ovb0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/view/MenuCustomView;->d(Ll/ovb0;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final b(I)I
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget p0, p0, Landroid/util/DisplayMetrics;->density:F

    .line 10
    .line 11
    int-to-float p1, p1

    .line 12
    mul-float/2addr p0, p1

    .line 13
    float-to-int p0, p0

    .line 14
    return p0
.end method

.method public final c(Landroid/content/Context;Z)V
    .locals 2

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MenuCustomView;->a:Landroid/content/Context;

    .line 2
    .line 3
    const/4 p1, 0x1

    .line 4
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 5
    .line 6
    .line 7
    const/high16 p1, 0x41a00000    # 20.0f

    .line 8
    .line 9
    const/high16 v0, 0x41200000    # 10.0f

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    if-eqz p2, :cond_0

    .line 13
    .line 14
    sget p2, Ll/ibc0;->s1:I

    .line 15
    .line 16
    invoke-virtual {p0, p2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 17
    .line 18
    .line 19
    invoke-static {v0}, Ll/bnl0;->w(F)I

    .line 20
    .line 21
    .line 22
    move-result p2

    .line 23
    invoke-static {p1}, Ll/bnl0;->w(F)I

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    invoke-virtual {p0, v1, p2, v1, p1}, Landroid/view/View;->setPadding(IIII)V

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    sget p2, Ll/ibc0;->r1:I

    .line 32
    .line 33
    invoke-virtual {p0, p2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 34
    .line 35
    .line 36
    invoke-static {p1}, Ll/bnl0;->w(F)I

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    invoke-static {v0}, Ll/bnl0;->w(F)I

    .line 41
    .line 42
    .line 43
    move-result p2

    .line 44
    invoke-virtual {p0, v1, p1, v1, p2}, Landroid/view/View;->setPadding(IIII)V

    .line 45
    .line 46
    .line 47
    :goto_0
    new-instance p1, Landroid/widget/LinearLayout$LayoutParams;

    .line 48
    .line 49
    const/4 p2, -0x2

    .line 50
    invoke-direct {p1, p2, p2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public final synthetic d(Ll/ovb0;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MenuCustomView;->b:Landroid/widget/PopupWindow;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/widget/PopupWindow;->dismiss()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p1, Ll/ovb0;->b:Ljava/lang/Object;

    .line 9
    .line 10
    check-cast p0, Ljava/lang/Runnable;

    .line 11
    .line 12
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public setData(Ljava/util/List;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
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
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Ll/ovb0;

    .line 16
    .line 17
    new-instance v1, Landroid/widget/LinearLayout;

    .line 18
    .line 19
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MenuCustomView;->a:Landroid/content/Context;

    .line 20
    .line 21
    invoke-direct {v1, v2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 22
    .line 23
    .line 24
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    .line 25
    .line 26
    const/16 v3, 0x28

    .line 27
    .line 28
    invoke-virtual {p0, v3}, Lcom/p1/mobile/putong/core/ui/messages/view/MenuCustomView;->b(I)I

    .line 29
    .line 30
    .line 31
    move-result v3

    .line 32
    const/4 v4, -0x2

    .line 33
    invoke-direct {v2, v4, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v1, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 37
    .line 38
    .line 39
    const/16 v2, 0x18

    .line 40
    .line 41
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/core/ui/messages/view/MenuCustomView;->b(I)I

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    const/16 v3, 0x24

    .line 46
    .line 47
    invoke-virtual {p0, v3}, Lcom/p1/mobile/putong/core/ui/messages/view/MenuCustomView;->b(I)I

    .line 48
    .line 49
    .line 50
    move-result v3

    .line 51
    const/4 v5, 0x0

    .line 52
    invoke-virtual {v1, v2, v5, v3, v5}, Landroid/view/View;->setPadding(IIII)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v1, v5}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 56
    .line 57
    .line 58
    new-instance v2, Landroid/widget/ImageView;

    .line 59
    .line 60
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MenuCustomView;->a:Landroid/content/Context;

    .line 61
    .line 62
    invoke-direct {v2, v3}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 63
    .line 64
    .line 65
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    .line 66
    .line 67
    const/16 v5, 0x16

    .line 68
    .line 69
    invoke-virtual {p0, v5}, Lcom/p1/mobile/putong/core/ui/messages/view/MenuCustomView;->b(I)I

    .line 70
    .line 71
    .line 72
    move-result v6

    .line 73
    invoke-virtual {p0, v5}, Lcom/p1/mobile/putong/core/ui/messages/view/MenuCustomView;->b(I)I

    .line 74
    .line 75
    .line 76
    move-result v5

    .line 77
    invoke-direct {v3, v6, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 78
    .line 79
    .line 80
    iget-object v5, v0, Ll/ovb0;->c:Ljava/lang/Object;

    .line 81
    .line 82
    if-eqz v5, :cond_0

    .line 83
    .line 84
    check-cast v5, Ljava/lang/Integer;

    .line 85
    .line 86
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    .line 87
    .line 88
    .line 89
    move-result v5

    .line 90
    invoke-virtual {v2, v5}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 91
    .line 92
    .line 93
    :cond_0
    invoke-virtual {v2, v3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 94
    .line 95
    .line 96
    new-instance v3, Landroid/widget/TextView;

    .line 97
    .line 98
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MenuCustomView;->a:Landroid/content/Context;

    .line 99
    .line 100
    invoke-direct {v3, v5}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 101
    .line 102
    .line 103
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    .line 104
    .line 105
    invoke-direct {v5, v4, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 106
    .line 107
    .line 108
    const/16 v4, 0x8

    .line 109
    .line 110
    invoke-virtual {p0, v4}, Lcom/p1/mobile/putong/core/ui/messages/view/MenuCustomView;->b(I)I

    .line 111
    .line 112
    .line 113
    move-result v4

    .line 114
    iput v4, v5, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 115
    .line 116
    invoke-virtual {v3, v5}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 117
    .line 118
    .line 119
    iget-object v4, v0, Ll/ovb0;->a:Ljava/lang/Object;

    .line 120
    .line 121
    check-cast v4, Ljava/lang/CharSequence;

    .line 122
    .line 123
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 124
    .line 125
    .line 126
    const/4 v4, 0x1

    .line 127
    invoke-static {v4}, Landroid/graphics/Typeface;->defaultFromStyle(I)Landroid/graphics/Typeface;

    .line 128
    .line 129
    .line 130
    move-result-object v4

    .line 131
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 132
    .line 133
    .line 134
    const/high16 v4, 0x41600000    # 14.0f

    .line 135
    .line 136
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextSize(F)V

    .line 137
    .line 138
    .line 139
    const-string v4, "#e6000000"

    .line 140
    .line 141
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 142
    .line 143
    .line 144
    move-result v4

    .line 145
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 146
    .line 147
    .line 148
    new-instance v4, Ll/hqy;

    .line 149
    .line 150
    invoke-direct {v4, p0, v0}, Ll/hqy;-><init>(Lcom/p1/mobile/putong/core/ui/messages/view/MenuCustomView;Ll/ovb0;)V

    .line 151
    .line 152
    .line 153
    invoke-virtual {v1, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 154
    .line 155
    .line 156
    const/16 v0, 0x10

    .line 157
    .line 158
    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 159
    .line 160
    .line 161
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 162
    .line 163
    .line 164
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 165
    .line 166
    .line 167
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 168
    .line 169
    .line 170
    goto/16 :goto_0

    .line 171
    .line 172
    :cond_1
    return-void
.end method

.method public setPopupWindow(Landroid/widget/PopupWindow;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MenuCustomView;->b:Landroid/widget/PopupWindow;

    .line 2
    .line 3
    return-void
.end method
