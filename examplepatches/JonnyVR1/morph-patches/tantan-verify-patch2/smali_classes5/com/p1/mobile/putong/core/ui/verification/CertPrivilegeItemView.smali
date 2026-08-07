.class public Lcom/p1/mobile/putong/core/ui/verification/CertPrivilegeItemView;
.super Lv/VLinear;
.source "SourceFile"


# instance fields
.field public c:Landroid/widget/FrameLayout;

.field public d:Lv/VText_NoTopPadding;

.field public e:Lv/VText_NoTopPadding;

.field public f:Lcom/p1/mobile/putong/core/ui/verification/CertPrivilege;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VLinear;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method private T(Ljava/lang/String;)V
    .locals 5

    .line 1
    new-instance v0, Lv/VDraweeView;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Lv/VDraweeView;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 11
    .line 12
    const/high16 v2, 0x43660000    # 230.0f

    .line 13
    .line 14
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    const/high16 v3, 0x43340000    # 180.0f

    .line 19
    .line 20
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 21
    .line 22
    .line 23
    move-result v3

    .line 24
    invoke-direct {v1, v2, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 25
    .line 26
    .line 27
    const/high16 v2, 0x42200000    # 40.0f

    .line 28
    .line 29
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    const/high16 v3, 0x41f80000    # 31.0f

    .line 34
    .line 35
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 36
    .line 37
    .line 38
    move-result v3

    .line 39
    const/4 v4, 0x0

    .line 40
    invoke-virtual {v1, v2, v3, v4, v4}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 41
    .line 42
    .line 43
    const v2, 0x800003

    .line 44
    .line 45
    .line 46
    iput v2, v1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 47
    .line 48
    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 49
    .line 50
    .line 51
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/verification/CertPrivilegeItemView;->c:Landroid/widget/FrameLayout;

    .line 52
    .line 53
    invoke-virtual {v1}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 54
    .line 55
    .line 56
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/verification/CertPrivilegeItemView;->c:Landroid/widget/FrameLayout;

    .line 57
    .line 58
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 59
    .line 60
    .line 61
    sget-object p0, Ll/uqb0;->G:Ll/fsb0;

    .line 62
    .line 63
    invoke-virtual {p0, v0, p1}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    return-void
.end method


# virtual methods
.method public final P(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/uq4;->a(Lcom/p1/mobile/putong/core/ui/verification/CertPrivilegeItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public Q(Lcom/p1/mobile/putong/core/ui/verification/CertPrivilege;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/verification/CertPrivilegeItemView;->f:Lcom/p1/mobile/putong/core/ui/verification/CertPrivilege;

    .line 2
    .line 3
    return-void
.end method

.method public R()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/verification/CertPrivilegeItemView$a;->a:[I

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/verification/CertPrivilegeItemView;->f:Lcom/p1/mobile/putong/core/ui/verification/CertPrivilege;

    .line 4
    .line 5
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    aget v0, v0, v1

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    if-eq v0, v1, :cond_5

    .line 13
    .line 14
    const/4 v1, 0x2

    .line 15
    if-eq v0, v1, :cond_4

    .line 16
    .line 17
    const/4 v1, 0x3

    .line 18
    if-eq v0, v1, :cond_4

    .line 19
    .line 20
    const/4 v1, 0x4

    .line 21
    if-eq v0, v1, :cond_4

    .line 22
    .line 23
    const/4 v1, 0x5

    .line 24
    if-eq v0, v1, :cond_0

    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/verification/CertPrivilegeItemView;->d:Lv/VText_NoTopPadding;

    .line 28
    .line 29
    const-string v1, "\u53ea\u770b\u8ba4\u8bc1\u7528\u6237"

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/verification/CertPrivilegeItemView;->e:Lv/VText_NoTopPadding;

    .line 35
    .line 36
    const-string v1, "\u6ed1\u5361\u53ea\u770b\u5df2\u5b8c\u6210\u5934\u50cf\u8ba4\u8bc1\u7684\u7528\u6237"

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 39
    .line 40
    .line 41
    invoke-static {}, Ll/gra;->z()Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-eqz v0, :cond_2

    .line 46
    .line 47
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 48
    .line 49
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 50
    .line 51
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    if-eqz v0, :cond_1

    .line 60
    .line 61
    const-string v0, "https://fe-static.tancdn.com/v1/images/eyJpZCI6IjNPU0tHTkszN0JQTFpaWFozSUdNSVVJRUQ3RFVUWDE0IiwidyI6NjkwLCJoIjo1NDAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo1NDI2MDgyMjEyOTk0NzIyMDU3fQ.webp"

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_1
    const-string v0, "https://fe-static.tancdn.com/v1/images/eyJpZCI6IktWTENVWjZSWFRVUFBUR1hVQ05HVDU3Q01GV1hSQjE0IiwidyI6NjkwLCJoIjo1NDAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoxMTAyOTAwNjIzNDMwOTgxODg5fQ.webp"

    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_2
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 68
    .line 69
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 70
    .line 71
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    if-eqz v0, :cond_3

    .line 80
    .line 81
    const-string v0, "https://fe-static.tancdn.com/v1/images/eyJpZCI6IlJQWDNONFlWNTRHTkNLS0U0NFRDNE9KMkhVNVZFSjE0IiwidyI6NjkwLCJoIjo1NDAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo1NDI2MDgyMjEyOTk0NzIyMDU3fQ.webp"

    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_3
    const-string v0, "https://fe-static.tancdn.com/v1/images/eyJpZCI6IkdHS1lYNzVCV0lZNU5FRlBBRldOUkFIMkJIVU9BSjE0IiwidyI6NjkwLCJoIjo1NDAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo1MTM4MTM0NDc5NDk3OTYzNzgxfQ.webp"

    .line 85
    .line 86
    :goto_0
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/core/ui/verification/CertPrivilegeItemView;->T(Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    return-void

    .line 90
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/verification/CertPrivilegeItemView;->f:Lcom/p1/mobile/putong/core/ui/verification/CertPrivilege;

    .line 91
    .line 92
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/verification/CertPrivilegeItemView;->S(Lcom/p1/mobile/putong/core/ui/verification/CertPrivilege;)V

    .line 93
    .line 94
    .line 95
    return-void

    .line 96
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/verification/CertPrivilegeItemView;->d:Lv/VText_NoTopPadding;

    .line 97
    .line 98
    const-string v1, "\u66f4\u591a\u53f3\u6ed1"

    .line 99
    .line 100
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 101
    .line 102
    .line 103
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/verification/CertPrivilegeItemView;->e:Lv/VText_NoTopPadding;

    .line 104
    .line 105
    const-string v1, "\u6bcf\u5929\u53ef\u989d\u5916\u53d1\u51fa10\u6b21\u559c\u6b22"

    .line 106
    .line 107
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 108
    .line 109
    .line 110
    invoke-static {}, Ll/gra;->z()Z

    .line 111
    .line 112
    .line 113
    move-result v0

    .line 114
    if-eqz v0, :cond_7

    .line 115
    .line 116
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 117
    .line 118
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 119
    .line 120
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 125
    .line 126
    .line 127
    move-result v0

    .line 128
    if-eqz v0, :cond_6

    .line 129
    .line 130
    const-string v0, "https://fe-static.tancdn.com/v1/images/eyJpZCI6Ik1PM1k2RTYzVVVIV1BQTzI3WjJVRjNUWjdPTlpWVTE0IiwidyI6NjkwLCJoIjo1NDAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo2NjQ5NjQ0MDIzNTc2NTMyMjQ0fQ.webp"

    .line 131
    .line 132
    goto :goto_1

    .line 133
    :cond_6
    const-string v0, "https://fe-static.tancdn.com/v1/images/eyJpZCI6Ilg2Q09QQjZTQVJVV1o0MlBTUlJaRDNKN09ZVENSWDE0IiwidyI6NjkwLCJoIjo1NDAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo4ODk0ODg3NzUxOTE5OTA1NDh9.webp"

    .line 134
    .line 135
    goto :goto_1

    .line 136
    :cond_7
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 137
    .line 138
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 139
    .line 140
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 141
    .line 142
    .line 143
    move-result-object v0

    .line 144
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 145
    .line 146
    .line 147
    move-result v0

    .line 148
    if-eqz v0, :cond_8

    .line 149
    .line 150
    const-string v0, "https://fe-static.tancdn.com/v1/images/eyJpZCI6IjVDS1NSUEVUUkRPQldBQkhTSlNSQU1CMkNLTUhTWDE0IiwidyI6NjkwLCJoIjo1NDAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo2NjQ5OTI1NDk4NTUzMjM4Nzg4fQ.webp"

    .line 151
    .line 152
    goto :goto_1

    .line 153
    :cond_8
    const-string v0, "https://fe-static.tancdn.com/v1/images/eyJpZCI6IklVUTdIUUpPMktENUJONVRJUktTWkQ1RUxaTUFMSTE0IiwidyI6NjkwLCJoIjo1NDAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo4OTAzMzUzOTkxNDY0MjI1MzJ9.webp"

    .line 154
    .line 155
    :goto_1
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/core/ui/verification/CertPrivilegeItemView;->T(Ljava/lang/String;)V

    .line 156
    .line 157
    .line 158
    return-void
.end method

.method public final S(Lcom/p1/mobile/putong/core/ui/verification/CertPrivilege;)V
    .locals 8

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget v1, Ll/kec0;->e1:I

    .line 10
    .line 11
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/verification/CertPrivilegeItemView;->c:Landroid/widget/FrameLayout;

    .line 12
    .line 13
    const/4 v3, 0x1

    .line 14
    invoke-virtual {v0, v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    sget v1, Ll/adc0;->O:I

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    check-cast v1, Lv/AutoVDraweeView;

    .line 25
    .line 26
    sget v2, Ll/adc0;->J5:I

    .line 27
    .line 28
    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    check-cast v2, Lv/VImage;

    .line 33
    .line 34
    sget v4, Ll/adc0;->H5:I

    .line 35
    .line 36
    invoke-virtual {v0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object v4

    .line 40
    check-cast v4, Lv/VImage;

    .line 41
    .line 42
    sget v5, Ll/adc0;->G5:I

    .line 43
    .line 44
    invoke-virtual {v0, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    check-cast v0, Lv/VImage;

    .line 49
    .line 50
    invoke-static {}, Ll/gra;->z()Z

    .line 51
    .line 52
    .line 53
    move-result v5

    .line 54
    if-eqz v5, :cond_0

    .line 55
    .line 56
    sget v5, Ll/dbc0;->e5:I

    .line 57
    .line 58
    invoke-virtual {v2, v5}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 59
    .line 60
    .line 61
    sget v5, Ll/dbc0;->d5:I

    .line 62
    .line 63
    invoke-virtual {v4, v5}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 64
    .line 65
    .line 66
    sget v5, Ll/dbc0;->c5:I

    .line 67
    .line 68
    invoke-virtual {v0, v5}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 69
    .line 70
    .line 71
    const/high16 v5, -0x3df40000    # -35.0f

    .line 72
    .line 73
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 74
    .line 75
    .line 76
    move-result v5

    .line 77
    invoke-static {v2, v5}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 78
    .line 79
    .line 80
    const/high16 v5, -0x3e580000    # -21.0f

    .line 81
    .line 82
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 83
    .line 84
    .line 85
    move-result v5

    .line 86
    invoke-static {v2, v5}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 87
    .line 88
    .line 89
    const/high16 v5, -0x3e500000    # -22.0f

    .line 90
    .line 91
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 92
    .line 93
    .line 94
    move-result v5

    .line 95
    invoke-static {v4, v5}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 96
    .line 97
    .line 98
    const/high16 v5, -0x3e900000    # -15.0f

    .line 99
    .line 100
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 101
    .line 102
    .line 103
    move-result v5

    .line 104
    invoke-static {v4, v5}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 105
    .line 106
    .line 107
    const/high16 v5, 0x42920000    # 73.0f

    .line 108
    .line 109
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 110
    .line 111
    .line 112
    move-result v5

    .line 113
    new-array v6, v3, [Landroid/view/View;

    .line 114
    .line 115
    const/4 v7, 0x0

    .line 116
    aput-object v0, v6, v7

    .line 117
    .line 118
    invoke-static {v5, v6}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 119
    .line 120
    .line 121
    const/high16 v5, 0x41f00000    # 30.0f

    .line 122
    .line 123
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 124
    .line 125
    .line 126
    move-result v5

    .line 127
    invoke-static {v0, v5}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 128
    .line 129
    .line 130
    :cond_0
    sget-object v5, Lcom/p1/mobile/putong/core/ui/verification/CertPrivilegeItemView$a;->a:[I

    .line 131
    .line 132
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 133
    .line 134
    .line 135
    move-result p1

    .line 136
    aget p1, v5, p1

    .line 137
    .line 138
    const/4 v5, 0x2

    .line 139
    if-eq p1, v5, :cond_3

    .line 140
    .line 141
    const/4 v2, 0x3

    .line 142
    if-eq p1, v2, :cond_2

    .line 143
    .line 144
    const/4 v0, 0x4

    .line 145
    if-eq p1, v0, :cond_1

    .line 146
    .line 147
    return-void

    .line 148
    :cond_1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 149
    .line 150
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 151
    .line 152
    invoke-virtual {p1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 153
    .line 154
    .line 155
    move-result-object p1

    .line 156
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 157
    .line 158
    .line 159
    move-result-object p1

    .line 160
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 161
    .line 162
    new-instance v2, Ll/bkq;

    .line 163
    .line 164
    const/16 v5, 0xf

    .line 165
    .line 166
    invoke-direct {v2, v0, v5}, Ll/bkq;-><init>(II)V

    .line 167
    .line 168
    .line 169
    invoke-virtual {v1, p1, v2}, Lv/AutoVDraweeView;->y(Ljava/lang/String;Ll/fm80;)V

    .line 170
    .line 171
    .line 172
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/verification/CertPrivilegeItemView;->d:Lv/VText_NoTopPadding;

    .line 173
    .line 174
    const-string v0, "\u9ad8\u9636\u9690\u79c1\u8bbe\u7f6e"

    .line 175
    .line 176
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 177
    .line 178
    .line 179
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/verification/CertPrivilegeItemView;->e:Lv/VText_NoTopPadding;

    .line 180
    .line 181
    const-string p1, "\u4f60\u51b3\u5b9a\u8c01\u80fd\u770b\u5230\u4f60\uff0c\u4fdd\u62a4\u4f60\u7684\u9690\u79c1"

    .line 182
    .line 183
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 184
    .line 185
    .line 186
    invoke-static {v4, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 187
    .line 188
    .line 189
    return-void

    .line 190
    :cond_2
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 191
    .line 192
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 193
    .line 194
    invoke-virtual {p1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 195
    .line 196
    .line 197
    move-result-object p1

    .line 198
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 199
    .line 200
    .line 201
    move-result-object p1

    .line 202
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 203
    .line 204
    invoke-virtual {v1, p1}, Lv/AutoVDraweeView;->setImageUrl(Ljava/lang/String;)V

    .line 205
    .line 206
    .line 207
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/verification/CertPrivilegeItemView;->d:Lv/VText_NoTopPadding;

    .line 208
    .line 209
    const-string v1, "\u8ba4\u8bc1\u6807\u8bc6"

    .line 210
    .line 211
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 212
    .line 213
    .line 214
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/verification/CertPrivilegeItemView;->e:Lv/VText_NoTopPadding;

    .line 215
    .line 216
    const-string p1, "\u70b9\u4eae\u4e13\u5c5e\u5fbd\u7ae0\uff0c\u5c55\u793a\u8ba4\u8bc1\u8eab\u4efd"

    .line 217
    .line 218
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 219
    .line 220
    .line 221
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 222
    .line 223
    .line 224
    return-void

    .line 225
    :cond_3
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 226
    .line 227
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 228
    .line 229
    invoke-virtual {p1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 230
    .line 231
    .line 232
    move-result-object p1

    .line 233
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 234
    .line 235
    .line 236
    move-result-object p1

    .line 237
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 238
    .line 239
    invoke-virtual {v1, p1}, Lv/AutoVDraweeView;->setImageUrl(Ljava/lang/String;)V

    .line 240
    .line 241
    .line 242
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/verification/CertPrivilegeItemView;->d:Lv/VText_NoTopPadding;

    .line 243
    .line 244
    const-string v0, "\u4f18\u5148\u63a8\u8350"

    .line 245
    .line 246
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 247
    .line 248
    .line 249
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/verification/CertPrivilegeItemView;->e:Lv/VText_NoTopPadding;

    .line 250
    .line 251
    const-string p1, "\u8ba9\u611f\u5174\u8da3\u7684\u4eba\u4f18\u5148\u770b\u5230\u4f60"

    .line 252
    .line 253
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 254
    .line 255
    .line 256
    invoke-static {v2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 257
    .line 258
    .line 259
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/verification/CertPrivilegeItemView;->P(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
