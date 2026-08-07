.class public Ltech/sud/runtime/component/e/a;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ltech/sud/runtime/component/e/a$a;
    }
.end annotation


# instance fields
.field private a:Landroid/widget/LinearLayout;

.field private b:Landroid/widget/EditText;

.field private c:Landroid/widget/Button;

.field private d:Landroid/view/View;

.field private final e:Landroid/view/Window;

.field private final f:Landroid/view/View;

.field private g:Z

.field private final h:Ltech/sud/runtime/component/e/a$a;

.field private i:Z

.field private j:Ljava/lang/String;

.field private k:Ljava/lang/Integer;

.field private l:Landroid/text/TextWatcher;

.field private m:Landroid/view/View$OnClickListener;

.field private n:Landroid/widget/TextView$OnEditorActionListener;

.field private o:Landroid/view/View$OnFocusChangeListener;

.field private p:Ltech/sud/runtime/component/h/e$a;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ltech/sud/runtime/component/e/a$a;Ljava/lang/Integer;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ltech/sud/runtime/component/e/a;->i:Z

    .line 6
    .line 7
    const-string v0, ""

    .line 8
    .line 9
    iput-object v0, p0, Ltech/sud/runtime/component/e/a;->j:Ljava/lang/String;

    .line 10
    .line 11
    new-instance v0, Ltech/sud/runtime/component/e/a$3;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Ltech/sud/runtime/component/e/a$3;-><init>(Ltech/sud/runtime/component/e/a;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ltech/sud/runtime/component/e/a;->l:Landroid/text/TextWatcher;

    .line 17
    .line 18
    new-instance v0, Ltech/sud/runtime/component/e/a$4;

    .line 19
    .line 20
    invoke-direct {v0, p0}, Ltech/sud/runtime/component/e/a$4;-><init>(Ltech/sud/runtime/component/e/a;)V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Ltech/sud/runtime/component/e/a;->m:Landroid/view/View$OnClickListener;

    .line 24
    .line 25
    new-instance v0, Ltech/sud/runtime/component/e/a$5;

    .line 26
    .line 27
    invoke-direct {v0, p0}, Ltech/sud/runtime/component/e/a$5;-><init>(Ltech/sud/runtime/component/e/a;)V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Ltech/sud/runtime/component/e/a;->n:Landroid/widget/TextView$OnEditorActionListener;

    .line 31
    .line 32
    new-instance v0, Ltech/sud/runtime/component/e/a$6;

    .line 33
    .line 34
    invoke-direct {v0, p0}, Ltech/sud/runtime/component/e/a$6;-><init>(Ltech/sud/runtime/component/e/a;)V

    .line 35
    .line 36
    .line 37
    iput-object v0, p0, Ltech/sud/runtime/component/e/a;->o:Landroid/view/View$OnFocusChangeListener;

    .line 38
    .line 39
    new-instance v0, Ltech/sud/runtime/component/e/a$7;

    .line 40
    .line 41
    invoke-direct {v0, p0}, Ltech/sud/runtime/component/e/a$7;-><init>(Ltech/sud/runtime/component/e/a;)V

    .line 42
    .line 43
    .line 44
    iput-object v0, p0, Ltech/sud/runtime/component/e/a;->p:Ltech/sud/runtime/component/h/e$a;

    .line 45
    .line 46
    const/4 v0, 0x1

    .line 47
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 48
    .line 49
    .line 50
    iput-object p3, p0, Ltech/sud/runtime/component/e/a;->k:Ljava/lang/Integer;

    .line 51
    .line 52
    iput-object p2, p0, Ltech/sud/runtime/component/e/a;->h:Ltech/sud/runtime/component/e/a$a;

    .line 53
    .line 54
    invoke-static {p1}, Ltech/sud/runtime/component/h/c;->a(Landroid/content/Context;)Landroid/app/Activity;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    iput-object p1, p0, Ltech/sud/runtime/component/e/a;->e:Landroid/view/Window;

    .line 63
    .line 64
    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 65
    .line 66
    .line 67
    move-result-object p2

    .line 68
    iput-object p2, p0, Ltech/sud/runtime/component/e/a;->f:Landroid/view/View;

    .line 69
    .line 70
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 71
    .line 72
    .line 73
    move-result-object p2

    .line 74
    iget-object p3, p0, Ltech/sud/runtime/component/e/a;->p:Ltech/sud/runtime/component/h/e$a;

    .line 75
    .line 76
    invoke-static {p2, p1, p3}, Ltech/sud/runtime/component/h/e;->a(Landroid/content/Context;Landroid/view/Window;Ltech/sud/runtime/component/h/e$a;)V

    .line 77
    .line 78
    .line 79
    invoke-direct {p0}, Ltech/sud/runtime/component/e/a;->d()V

    .line 80
    .line 81
    .line 82
    return-void
.end method

.method public static synthetic a(Ltech/sud/runtime/component/e/a;)Landroid/widget/EditText;
    .locals 0

    .line 153
    iget-object p0, p0, Ltech/sud/runtime/component/e/a;->b:Landroid/widget/EditText;

    return-object p0
.end method

.method public static synthetic a(Ltech/sud/runtime/component/e/a;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 150
    iput-object p1, p0, Ltech/sud/runtime/component/e/a;->j:Ljava/lang/String;

    return-object p1
.end method

.method private a(I)V
    .locals 1

    .line 156
    iget-boolean v0, p0, Ltech/sud/runtime/component/e/a;->i:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Ltech/sud/runtime/component/e/a;->b:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    .line 157
    iput-boolean v0, p0, Ltech/sud/runtime/component/e/a;->i:Z

    .line 158
    iget-object p0, p0, Ltech/sud/runtime/component/e/a;->h:Ltech/sud/runtime/component/e/a$a;

    invoke-interface {p0, p1}, Ltech/sud/runtime/component/e/a$a;->a(I)V

    :cond_0
    return-void
.end method

.method public static synthetic a(Ltech/sud/runtime/component/e/a;I)V
    .locals 0

    .line 151
    invoke-direct {p0, p1}, Ltech/sud/runtime/component/e/a;->a(I)V

    return-void
.end method

.method public static synthetic b(Ltech/sud/runtime/component/e/a;)Ljava/lang/String;
    .locals 0

    .line 30
    iget-object p0, p0, Ltech/sud/runtime/component/e/a;->j:Ljava/lang/String;

    return-object p0
.end method

.method public static synthetic c(Ltech/sud/runtime/component/e/a;)Ltech/sud/runtime/component/e/a$a;
    .locals 0

    .line 21
    iget-object p0, p0, Ltech/sud/runtime/component/e/a;->h:Ltech/sud/runtime/component/e/a$a;

    return-object p0
.end method

.method public static synthetic d(Ltech/sud/runtime/component/e/a;)Ljava/lang/String;
    .locals 0

    .line 224
    invoke-direct {p0}, Ltech/sud/runtime/component/e/a;->getInputString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private d()V
    .locals 6

    .line 1
    new-instance v0, Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ltech/sud/runtime/component/e/a;->d:Landroid/view/View;

    .line 11
    .line 12
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 13
    .line 14
    const/4 v1, -0x1

    .line 15
    const/4 v2, 0x0

    .line 16
    invoke-direct {v0, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 17
    .line 18
    .line 19
    const/high16 v3, 0x3f800000    # 1.0f

    .line 20
    .line 21
    iput v3, v0, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    .line 22
    .line 23
    iget-object v4, p0, Ltech/sud/runtime/component/e/a;->d:Landroid/view/View;

    .line 24
    .line 25
    invoke-virtual {v4, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ltech/sud/runtime/component/e/a;->d:Landroid/view/View;

    .line 29
    .line 30
    new-instance v4, Ltech/sud/runtime/component/e/a$2;

    .line 31
    .line 32
    invoke-direct {v4, p0}, Ltech/sud/runtime/component/e/a$2;-><init>(Ltech/sud/runtime/component/e/a;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 36
    .line 37
    .line 38
    new-instance v0, Landroid/widget/LinearLayout;

    .line 39
    .line 40
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 41
    .line 42
    .line 43
    move-result-object v4

    .line 44
    invoke-direct {v0, v4}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 45
    .line 46
    .line 47
    iput-object v0, p0, Ltech/sud/runtime/component/e/a;->a:Landroid/widget/LinearLayout;

    .line 48
    .line 49
    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Ltech/sud/runtime/component/e/a;->a:Landroid/widget/LinearLayout;

    .line 53
    .line 54
    const/16 v2, 0x11

    .line 55
    .line 56
    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 57
    .line 58
    .line 59
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 60
    .line 61
    const/4 v2, -0x2

    .line 62
    invoke-direct {v0, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 63
    .line 64
    .line 65
    iget-object v4, p0, Ltech/sud/runtime/component/e/a;->a:Landroid/widget/LinearLayout;

    .line 66
    .line 67
    invoke-virtual {v4, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 68
    .line 69
    .line 70
    new-instance v0, Landroid/widget/EditText;

    .line 71
    .line 72
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 73
    .line 74
    .line 75
    move-result-object v4

    .line 76
    invoke-direct {v0, v4}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    .line 77
    .line 78
    .line 79
    iput-object v0, p0, Ltech/sud/runtime/component/e/a;->b:Landroid/widget/EditText;

    .line 80
    .line 81
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 82
    .line 83
    invoke-direct {v0, v2, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 84
    .line 85
    .line 86
    iput v3, v0, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    .line 87
    .line 88
    iget-object v3, p0, Ltech/sud/runtime/component/e/a;->b:Landroid/widget/EditText;

    .line 89
    .line 90
    invoke-virtual {v3, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 91
    .line 92
    .line 93
    iget-object v0, p0, Ltech/sud/runtime/component/e/a;->b:Landroid/widget/EditText;

    .line 94
    .line 95
    const-string v3, "\u5b8c\u6210"

    .line 96
    .line 97
    const/4 v4, 0x6

    .line 98
    invoke-virtual {v0, v3, v4}, Landroid/widget/TextView;->setImeActionLabel(Ljava/lang/CharSequence;I)V

    .line 99
    .line 100
    .line 101
    iget-object v0, p0, Ltech/sud/runtime/component/e/a;->b:Landroid/widget/EditText;

    .line 102
    .line 103
    const-string v3, "\u4e0b\u4e00\u4e2a"

    .line 104
    .line 105
    const/4 v4, 0x5

    .line 106
    invoke-virtual {v0, v3, v4}, Landroid/widget/TextView;->setImeActionLabel(Ljava/lang/CharSequence;I)V

    .line 107
    .line 108
    .line 109
    iget-object v0, p0, Ltech/sud/runtime/component/e/a;->b:Landroid/widget/EditText;

    .line 110
    .line 111
    const-string v3, "\u641c\u7d22"

    .line 112
    .line 113
    const/4 v4, 0x3

    .line 114
    invoke-virtual {v0, v3, v4}, Landroid/widget/TextView;->setImeActionLabel(Ljava/lang/CharSequence;I)V

    .line 115
    .line 116
    .line 117
    iget-object v0, p0, Ltech/sud/runtime/component/e/a;->b:Landroid/widget/EditText;

    .line 118
    .line 119
    const-string v3, "\u524d\u5f80"

    .line 120
    .line 121
    const/4 v4, 0x2

    .line 122
    invoke-virtual {v0, v3, v4}, Landroid/widget/TextView;->setImeActionLabel(Ljava/lang/CharSequence;I)V

    .line 123
    .line 124
    .line 125
    iget-object v0, p0, Ltech/sud/runtime/component/e/a;->b:Landroid/widget/EditText;

    .line 126
    .line 127
    const-string v3, "\u53d1\u9001"

    .line 128
    .line 129
    const/4 v4, 0x4

    .line 130
    invoke-virtual {v0, v3, v4}, Landroid/widget/TextView;->setImeActionLabel(Ljava/lang/CharSequence;I)V

    .line 131
    .line 132
    .line 133
    iget-object v0, p0, Ltech/sud/runtime/component/e/a;->b:Landroid/widget/EditText;

    .line 134
    .line 135
    iget-object v3, p0, Ltech/sud/runtime/component/e/a;->l:Landroid/text/TextWatcher;

    .line 136
    .line 137
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 138
    .line 139
    .line 140
    iget-object v0, p0, Ltech/sud/runtime/component/e/a;->b:Landroid/widget/EditText;

    .line 141
    .line 142
    iget-object v3, p0, Ltech/sud/runtime/component/e/a;->o:Landroid/view/View$OnFocusChangeListener;

    .line 143
    .line 144
    invoke-virtual {v0, v3}, Landroid/view/View;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 145
    .line 146
    .line 147
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 148
    .line 149
    .line 150
    move-result-object v0

    .line 151
    const/high16 v3, 0x41800000    # 16.0f

    .line 152
    .line 153
    invoke-static {v0, v3}, Ltech/sud/runtime/component/h/d;->a(Landroid/content/Context;F)I

    .line 154
    .line 155
    .line 156
    move-result v0

    .line 157
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 158
    .line 159
    .line 160
    move-result-object v4

    .line 161
    const/high16 v5, 0x41500000    # 13.0f

    .line 162
    .line 163
    invoke-static {v4, v5}, Ltech/sud/runtime/component/h/d;->a(Landroid/content/Context;F)I

    .line 164
    .line 165
    .line 166
    move-result v4

    .line 167
    iget-object v5, p0, Ltech/sud/runtime/component/e/a;->b:Landroid/widget/EditText;

    .line 168
    .line 169
    invoke-virtual {v5, v0, v4, v0, v4}, Landroid/view/View;->setPadding(IIII)V

    .line 170
    .line 171
    .line 172
    iget-object v0, p0, Ltech/sud/runtime/component/e/a;->b:Landroid/widget/EditText;

    .line 173
    .line 174
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 175
    .line 176
    .line 177
    iget-object v0, p0, Ltech/sud/runtime/component/e/a;->b:Landroid/widget/EditText;

    .line 178
    .line 179
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTextSize(F)V

    .line 180
    .line 181
    .line 182
    iget-object v0, p0, Ltech/sud/runtime/component/e/a;->b:Landroid/widget/EditText;

    .line 183
    .line 184
    const/high16 v1, -0x1000000

    .line 185
    .line 186
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 187
    .line 188
    .line 189
    new-instance v0, Landroid/widget/Button;

    .line 190
    .line 191
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 192
    .line 193
    .line 194
    move-result-object v1

    .line 195
    invoke-direct {v0, v1}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 196
    .line 197
    .line 198
    iput-object v0, p0, Ltech/sud/runtime/component/e/a;->c:Landroid/widget/Button;

    .line 199
    .line 200
    const v1, 0x104000a

    .line 201
    .line 202
    .line 203
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 204
    .line 205
    .line 206
    iget-object v0, p0, Ltech/sud/runtime/component/e/a;->c:Landroid/widget/Button;

    .line 207
    .line 208
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    .line 209
    .line 210
    invoke-direct {v1, v2, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 211
    .line 212
    .line 213
    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 214
    .line 215
    .line 216
    iget-object v0, p0, Ltech/sud/runtime/component/e/a;->c:Landroid/widget/Button;

    .line 217
    .line 218
    iget-object p0, p0, Ltech/sud/runtime/component/e/a;->m:Landroid/view/View$OnClickListener;

    .line 219
    .line 220
    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 221
    .line 222
    .line 223
    return-void
.end method

.method public static synthetic e(Ltech/sud/runtime/component/e/a;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ltech/sud/runtime/component/e/a;->g:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic f(Ltech/sud/runtime/component/e/a;)Ljava/lang/Integer;
    .locals 0

    .line 1
    iget-object p0, p0, Ltech/sud/runtime/component/e/a;->k:Ljava/lang/Integer;

    .line 2
    .line 3
    return-object p0
.end method

.method private getInputString()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ltech/sud/runtime/component/e/a;->b:Landroid/widget/EditText;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    const-string p0, ""

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method


# virtual methods
.method public a()V
    .locals 0

    .line 152
    iget-object p0, p0, Ltech/sud/runtime/component/e/a;->e:Landroid/view/Window;

    invoke-static {p0}, Ltech/sud/runtime/component/h/e;->a(Landroid/view/Window;)V

    return-void
.end method

.method public a(Ljava/lang/String;)V
    .locals 1

    .line 154
    iget-object v0, p0, Ltech/sud/runtime/component/e/a;->b:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 155
    iget-object p0, p0, Ltech/sud/runtime/component/e/a;->b:Landroid/widget/EditText;

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p1

    invoke-virtual {p0, p1}, Landroid/widget/EditText;->setSelection(I)V

    return-void
.end method

.method public a(Ljava/lang/String;IZZI)V
    .locals 3

    .line 1
    iget-object v0, p0, Ltech/sud/runtime/component/e/a;->b:Landroid/widget/EditText;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Ltech/sud/runtime/component/e/a;->b:Landroid/widget/EditText;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    const/4 v1, 0x1

    .line 10
    if-lez p2, :cond_0

    .line 11
    .line 12
    new-instance v2, Landroid/text/InputFilter$LengthFilter;

    .line 13
    .line 14
    invoke-direct {v2, p2}, Landroid/text/InputFilter$LengthFilter;-><init>(I)V

    .line 15
    .line 16
    .line 17
    new-array p2, v1, [Landroid/text/InputFilter;

    .line 18
    .line 19
    aput-object v2, p2, v0

    .line 20
    .line 21
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setFilters([Landroid/text/InputFilter;)V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    new-array p2, v0, [Landroid/text/InputFilter;

    .line 26
    .line 27
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setFilters([Landroid/text/InputFilter;)V

    .line 28
    .line 29
    .line 30
    :goto_0
    if-eqz p3, :cond_1

    .line 31
    .line 32
    iget-object p1, p0, Ltech/sud/runtime/component/e/a;->b:Landroid/widget/EditText;

    .line 33
    .line 34
    const/16 p2, 0x8

    .line 35
    .line 36
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 37
    .line 38
    .line 39
    iget-object p1, p0, Ltech/sud/runtime/component/e/a;->b:Landroid/widget/EditText;

    .line 40
    .line 41
    const p2, 0x20001

    .line 42
    .line 43
    .line 44
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setInputType(I)V

    .line 45
    .line 46
    .line 47
    iget-object p1, p0, Ltech/sud/runtime/component/e/a;->b:Landroid/widget/EditText;

    .line 48
    .line 49
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setImeOptions(I)V

    .line 50
    .line 51
    .line 52
    goto :goto_2

    .line 53
    :cond_1
    const/4 p1, 0x6

    .line 54
    if-eqz p5, :cond_5

    .line 55
    .line 56
    if-eq p5, v1, :cond_4

    .line 57
    .line 58
    const/4 p2, 0x3

    .line 59
    const/4 v0, 0x2

    .line 60
    if-eq p5, v0, :cond_2

    .line 61
    .line 62
    if-eq p5, p2, :cond_3

    .line 63
    .line 64
    const/4 p2, 0x4

    .line 65
    if-eq p5, p2, :cond_2

    .line 66
    .line 67
    goto :goto_1

    .line 68
    :cond_2
    move p1, p2

    .line 69
    goto :goto_1

    .line 70
    :cond_3
    move p1, v0

    .line 71
    goto :goto_1

    .line 72
    :cond_4
    const/4 p1, 0x5

    .line 73
    :cond_5
    :goto_1
    const/high16 p2, 0x2000000

    .line 74
    .line 75
    or-int/2addr p1, p2

    .line 76
    iget-object p2, p0, Ltech/sud/runtime/component/e/a;->b:Landroid/widget/EditText;

    .line 77
    .line 78
    invoke-virtual {p2, v1}, Landroid/widget/TextView;->setSingleLine(Z)V

    .line 79
    .line 80
    .line 81
    iget-object p2, p0, Ltech/sud/runtime/component/e/a;->b:Landroid/widget/EditText;

    .line 82
    .line 83
    invoke-virtual {p2, v1}, Landroid/widget/TextView;->setInputType(I)V

    .line 84
    .line 85
    .line 86
    iget-object p2, p0, Ltech/sud/runtime/component/e/a;->b:Landroid/widget/EditText;

    .line 87
    .line 88
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setImeOptions(I)V

    .line 89
    .line 90
    .line 91
    :goto_2
    iget-object p1, p0, Ltech/sud/runtime/component/e/a;->b:Landroid/widget/EditText;

    .line 92
    .line 93
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    if-nez p1, :cond_7

    .line 98
    .line 99
    iget-object p1, p0, Ltech/sud/runtime/component/e/a;->d:Landroid/view/View;

    .line 100
    .line 101
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 102
    .line 103
    .line 104
    iget-object p1, p0, Ltech/sud/runtime/component/e/a;->a:Landroid/widget/LinearLayout;

    .line 105
    .line 106
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 107
    .line 108
    .line 109
    iget-object p1, p0, Ltech/sud/runtime/component/e/a;->a:Landroid/widget/LinearLayout;

    .line 110
    .line 111
    iget-object p2, p0, Ltech/sud/runtime/component/e/a;->b:Landroid/widget/EditText;

    .line 112
    .line 113
    invoke-virtual {p1, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 114
    .line 115
    .line 116
    if-eqz p3, :cond_6

    .line 117
    .line 118
    iget-object p1, p0, Ltech/sud/runtime/component/e/a;->a:Landroid/widget/LinearLayout;

    .line 119
    .line 120
    iget-object p2, p0, Ltech/sud/runtime/component/e/a;->c:Landroid/widget/Button;

    .line 121
    .line 122
    invoke-virtual {p1, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 123
    .line 124
    .line 125
    iget-object p1, p0, Ltech/sud/runtime/component/e/a;->b:Landroid/widget/EditText;

    .line 126
    .line 127
    const/4 p2, 0x0

    .line 128
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    .line 129
    .line 130
    .line 131
    goto :goto_3

    .line 132
    :cond_6
    iget-object p1, p0, Ltech/sud/runtime/component/e/a;->b:Landroid/widget/EditText;

    .line 133
    .line 134
    iget-object p2, p0, Ltech/sud/runtime/component/e/a;->n:Landroid/widget/TextView$OnEditorActionListener;

    .line 135
    .line 136
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    .line 137
    .line 138
    .line 139
    :cond_7
    :goto_3
    iput-boolean p4, p0, Ltech/sud/runtime/component/e/a;->g:Z

    .line 140
    .line 141
    new-instance p1, Ltech/sud/runtime/component/e/a$1;

    .line 142
    .line 143
    invoke-direct {p1, p0}, Ltech/sud/runtime/component/e/a$1;-><init>(Ltech/sud/runtime/component/e/a;)V

    .line 144
    .line 145
    .line 146
    invoke-virtual {p0, p1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 147
    .line 148
    .line 149
    return-void
.end method

.method public b()V
    .locals 1

    .line 1
    iget-object v0, p0, Ltech/sud/runtime/component/e/a;->b:Landroid/widget/EditText;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object v0, p0, Ltech/sud/runtime/component/e/a;->a:Landroid/widget/LinearLayout;

    .line 13
    .line 14
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Ltech/sud/runtime/component/e/a;->h:Ltech/sud/runtime/component/e/a$a;

    .line 21
    .line 22
    invoke-direct {p0}, Ltech/sud/runtime/component/e/a;->getInputString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-interface {v0, p0}, Ltech/sud/runtime/component/e/a$a;->c(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    :cond_1
    :goto_0
    return-void
.end method

.method public c()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Ltech/sud/runtime/component/e/a;->i:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput-boolean v0, p0, Ltech/sud/runtime/component/e/a;->i:Z

    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget-object v1, p0, Ltech/sud/runtime/component/e/a;->b:Landroid/widget/EditText;

    .line 13
    .line 14
    invoke-static {v0, v1}, Ltech/sud/runtime/component/h/e;->b(Landroid/content/Context;Landroid/view/View;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Ltech/sud/runtime/component/e/a;->b()V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method
