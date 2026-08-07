.class public Ll/pek;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/pek$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/mek;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/VText;

.field public b:Lv/VLinear;

.field public c:Lv/VImage;

.field public final d:Lcom/p1/mobile/putong/core/newui/group/GroupCreateCategoryAct;

.field public e:Ll/mek;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/group/GroupCreateCategoryAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/pek;->d:Lcom/p1/mobile/putong/core/newui/group/GroupCreateCategoryAct;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/pek;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/pek;->j(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic b(Ll/pek;Lv/VImage;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/pek;->c:Lv/VImage;

    return-void
.end method

.method public static bridge synthetic c(Ll/pek;Lv/VLinear;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/pek;->b:Lv/VLinear;

    return-void
.end method

.method public static bridge synthetic d(Ll/pek;Lv/VText;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/pek;->a:Lv/VText;

    return-void
.end method

.method private synthetic j(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pek;->d:Lcom/p1/mobile/putong/core/newui/group/GroupCreateCategoryAct;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private k(Ljava/util/List;)V
    .locals 2
    .param p1    # Ljava/util/List;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/GroupAttribute;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 3
    .line 4
    .line 5
    move-result-object p1

    .line 6
    check-cast p1, Lcom/p1/mobile/putong/core/data/GroupAttribute;

    .line 7
    .line 8
    iget-object v0, p0, Ll/pek;->a:Lv/VText;

    .line 9
    .line 10
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/GroupAttribute;->creationLimit:Lcom/p1/mobile/putong/core/data/GroupCreationLimit;

    .line 11
    .line 12
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/GroupCreationLimit;->value:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/pek;->b:Lv/VLinear;

    .line 18
    .line 19
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 20
    .line 21
    .line 22
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/GroupAttribute;->categories:Ljava/util/List;

    .line 23
    .line 24
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_0

    .line 33
    .line 34
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    check-cast v0, Lcom/p1/mobile/putong/core/data/GroupCategory;

    .line 39
    .line 40
    invoke-virtual {p0, v0}, Ll/pek;->f(Lcom/p1/mobile/putong/core/data/GroupCategory;)V

    .line 41
    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/pek;->d:Lcom/p1/mobile/putong/core/newui/group/GroupCreateCategoryAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/pek$a;->a(Ll/pek;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final f(Lcom/p1/mobile/putong/core/data/GroupCategory;)V
    .locals 7

    .line 1
    new-instance v0, Landroid/widget/LinearLayout;

    .line 2
    .line 3
    iget-object v1, p0, Ll/pek;->d:Lcom/p1/mobile/putong/core/newui/group/GroupCreateCategoryAct;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 10
    .line 11
    .line 12
    new-instance v2, Landroid/graphics/drawable/GradientDrawable;

    .line 13
    .line 14
    invoke-direct {v2}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 15
    .line 16
    .line 17
    :try_start_0
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/GroupCategory;->backgroundColor:Ljava/lang/String;

    .line 18
    .line 19
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    invoke-virtual {v2, v3}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :catch_0
    const v3, -0x80809

    .line 28
    .line 29
    .line 30
    invoke-virtual {v2, v3}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 31
    .line 32
    .line 33
    :goto_0
    const/high16 v3, 0x41200000    # 10.0f

    .line 34
    .line 35
    invoke-static {v3}, Ll/bnl0;->w(F)I

    .line 36
    .line 37
    .line 38
    move-result v4

    .line 39
    int-to-float v4, v4

    .line 40
    invoke-virtual {v2, v4}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0, v2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 44
    .line 45
    .line 46
    new-instance v2, Landroid/widget/TextView;

    .line 47
    .line 48
    iget-object v4, p0, Ll/pek;->d:Lcom/p1/mobile/putong/core/newui/group/GroupCreateCategoryAct;

    .line 49
    .line 50
    invoke-direct {v2, v4}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 51
    .line 52
    .line 53
    iget-object v4, p1, Lcom/p1/mobile/putong/core/data/GroupCategory;->name:Ljava/lang/String;

    .line 54
    .line 55
    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 56
    .line 57
    .line 58
    const/high16 v4, 0x41800000    # 16.0f

    .line 59
    .line 60
    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setTextSize(F)V

    .line 61
    .line 62
    .line 63
    :try_start_1
    iget-object v5, p1, Lcom/p1/mobile/putong/core/data/GroupCategory;->textColor:Ljava/lang/String;

    .line 64
    .line 65
    invoke-static {v5}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 66
    .line 67
    .line 68
    move-result v5

    .line 69
    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setTextColor(I)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 70
    .line 71
    .line 72
    goto :goto_1

    .line 73
    :catch_1
    const v5, -0xddddde

    .line 74
    .line 75
    .line 76
    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setTextColor(I)V

    .line 77
    .line 78
    .line 79
    :goto_1
    const/16 v5, 0x10

    .line 80
    .line 81
    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setGravity(I)V

    .line 82
    .line 83
    .line 84
    invoke-static {v4}, Ll/bnl0;->w(F)I

    .line 85
    .line 86
    .line 87
    move-result v4

    .line 88
    invoke-virtual {v2, v4, v1, v1, v1}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {v0, p1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 92
    .line 93
    .line 94
    new-instance p1, Landroid/widget/LinearLayout$LayoutParams;

    .line 95
    .line 96
    const/high16 v4, 0x3f800000    # 1.0f

    .line 97
    .line 98
    const/4 v6, -0x1

    .line 99
    invoke-direct {p1, v1, v6, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 100
    .line 101
    .line 102
    invoke-virtual {v0, v2, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 103
    .line 104
    .line 105
    new-instance p1, Landroid/widget/ImageView;

    .line 106
    .line 107
    iget-object v2, p0, Ll/pek;->d:Lcom/p1/mobile/putong/core/newui/group/GroupCreateCategoryAct;

    .line 108
    .line 109
    invoke-direct {p1, v2}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 110
    .line 111
    .line 112
    invoke-static {v3}, Ll/bnl0;->w(F)I

    .line 113
    .line 114
    .line 115
    move-result v2

    .line 116
    invoke-static {v3}, Ll/bnl0;->w(F)I

    .line 117
    .line 118
    .line 119
    move-result v3

    .line 120
    invoke-virtual {p1, v2, v1, v3, v1}, Landroid/view/View;->setPadding(IIII)V

    .line 121
    .line 122
    .line 123
    sget v1, Ll/ibc0;->s0:I

    .line 124
    .line 125
    invoke-virtual {p1, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 126
    .line 127
    .line 128
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    .line 129
    .line 130
    const/high16 v2, 0x42000000    # 32.0f

    .line 131
    .line 132
    invoke-static {v2}, Ll/bnl0;->w(F)I

    .line 133
    .line 134
    .line 135
    move-result v2

    .line 136
    const/high16 v3, 0x41400000    # 12.0f

    .line 137
    .line 138
    invoke-static {v3}, Ll/bnl0;->w(F)I

    .line 139
    .line 140
    .line 141
    move-result v4

    .line 142
    invoke-direct {v1, v2, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 143
    .line 144
    .line 145
    invoke-virtual {v0, p1, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 146
    .line 147
    .line 148
    invoke-virtual {v0, v5}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 149
    .line 150
    .line 151
    iget-object p1, p0, Ll/pek;->e:Ll/mek;

    .line 152
    .line 153
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 154
    .line 155
    .line 156
    new-instance v1, Ll/oek;

    .line 157
    .line 158
    invoke-direct {v1, p1}, Ll/oek;-><init>(Ll/mek;)V

    .line 159
    .line 160
    .line 161
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 162
    .line 163
    .line 164
    new-instance p1, Landroid/widget/LinearLayout$LayoutParams;

    .line 165
    .line 166
    const/high16 v1, 0x42400000    # 48.0f

    .line 167
    .line 168
    invoke-static {v1}, Ll/bnl0;->w(F)I

    .line 169
    .line 170
    .line 171
    move-result v1

    .line 172
    invoke-direct {p1, v6, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 173
    .line 174
    .line 175
    invoke-static {v3}, Ll/bnl0;->w(F)I

    .line 176
    .line 177
    .line 178
    move-result v1

    .line 179
    iput v1, p1, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    .line 180
    .line 181
    iget-object p0, p0, Ll/pek;->b:Lv/VLinear;

    .line 182
    .line 183
    invoke-virtual {p0, v0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 184
    .line 185
    .line 186
    return-void
.end method

.method public i(Ll/mek;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/pek;->e:Ll/mek;

    .line 2
    .line 3
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/mek;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/pek;->i(Ll/mek;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/pek;->e(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public r()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/pek;->d:Lcom/p1/mobile/putong/core/newui/group/GroupCreateCategoryAct;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 4
    .line 5
    .line 6
    move-result-object v0

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
    iget-object v0, p0, Ll/pek;->d:Lcom/p1/mobile/putong/core/newui/group/GroupCreateCategoryAct;

    .line 14
    .line 15
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Ll/c30;->m()V

    .line 20
    .line 21
    .line 22
    :cond_0
    iget-object v0, p0, Ll/pek;->c:Lv/VImage;

    .line 23
    .line 24
    new-instance v1, Ll/nek;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/nek;-><init>(Ll/pek;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Ll/pek;->e:Ll/mek;

    .line 33
    .line 34
    invoke-virtual {v0}, Ll/mek;->g0()Ljava/util/List;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-direct {p0, v0}, Ll/pek;->k(Ljava/util/List;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method
