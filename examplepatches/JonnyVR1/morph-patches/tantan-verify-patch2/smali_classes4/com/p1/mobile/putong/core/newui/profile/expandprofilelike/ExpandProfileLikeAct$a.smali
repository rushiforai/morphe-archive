.class public Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnLayoutChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct;->setUpKeyboardDetectorLayout(Landroid/view/View;Landroid/view/View;Ll/b30;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public a:I

.field public b:Z

.field public c:I

.field public d:Z

.field public e:I

.field public f:I

.field public final synthetic g:Z

.field public final synthetic h:Landroid/view/ViewGroup;

.field public final synthetic i:Landroid/view/View;

.field public final synthetic j:Ll/b30;

.field public final synthetic k:Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct;ZLandroid/view/ViewGroup;Landroid/view/View;Ll/b30;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct$a;->k:Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct;

    .line 2
    .line 3
    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct$a;->g:Z

    .line 4
    .line 5
    iput-object p3, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct$a;->h:Landroid/view/ViewGroup;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct$a;->i:Landroid/view/View;

    .line 8
    .line 9
    iput-object p5, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct$a;->j:Ll/b30;

    .line 10
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    const/4 p3, 0x0

    .line 15
    iput-boolean p3, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct$a;->d:Z

    .line 16
    .line 17
    iput p3, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct$a;->e:I

    .line 18
    .line 19
    invoke-virtual {p1}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    if-eqz p1, :cond_1

    .line 24
    .line 25
    if-eqz p2, :cond_0

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    const/high16 p1, 0x42600000    # 56.0f

    .line 29
    .line 30
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 31
    .line 32
    .line 33
    move-result p3

    .line 34
    :cond_1
    :goto_0
    iput p3, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct$a;->f:I

    .line 35
    .line 36
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct$a;Landroid/view/View;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct$a;->b(Landroid/view/View;I)V

    return-void
.end method


# virtual methods
.method public final synthetic b(Landroid/view/View;I)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct$a;->a:I

    .line 8
    .line 9
    add-int/2addr p0, p2

    .line 10
    iput p0, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 11
    .line 12
    const/4 p0, 0x0

    .line 13
    invoke-virtual {p1, p0, p2, p0, p0}, Landroid/view/View;->setPadding(IIII)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1}, Landroid/view/View;->requestLayout()V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public onLayoutChange(Landroid/view/View;IIIIIIII)V
    .locals 0

    .line 1
    iget p2, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct$a;->a:I

    .line 2
    .line 3
    iget-object p4, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct$a;->k:Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct;

    .line 4
    .line 5
    iget p4, p4, Lcom/p1/mobile/android/app/Act;->screenHeight:I

    .line 6
    .line 7
    invoke-static {p2, p4}, Ljava/lang/Math;->min(II)I

    .line 8
    .line 9
    .line 10
    move-result p2

    .line 11
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct$a;->a:I

    .line 12
    .line 13
    sub-int/2addr p5, p3

    .line 14
    iget p3, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct$a;->f:I

    .line 15
    .line 16
    sub-int p3, p5, p3

    .line 17
    .line 18
    sub-int/2addr p2, p3

    .line 19
    sget-boolean p3, Lcom/p1/mobile/android/app/swipback/SwipeBackLayout;->D:Z

    .line 20
    .line 21
    const/4 p4, 0x1

    .line 22
    const/4 p6, 0x0

    .line 23
    if-eqz p3, :cond_0

    .line 24
    .line 25
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct$a;->h:Landroid/view/ViewGroup;

    .line 26
    .line 27
    invoke-virtual {p3, p6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object p3

    .line 31
    invoke-virtual {p3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 32
    .line 33
    .line 34
    move-result-object p7

    .line 35
    instance-of p7, p7, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 36
    .line 37
    if-eqz p7, :cond_0

    .line 38
    .line 39
    invoke-virtual {p3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 40
    .line 41
    .line 42
    move-result-object p3

    .line 43
    check-cast p3, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 44
    .line 45
    iget p3, p3, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 46
    .line 47
    iget p7, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct$a;->e:I

    .line 48
    .line 49
    if-eq p3, p7, :cond_0

    .line 50
    .line 51
    sub-int p8, p3, p7

    .line 52
    .line 53
    sub-int p7, p3, p7

    .line 54
    .line 55
    sub-int/2addr p2, p7

    .line 56
    iput p3, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct$a;->e:I

    .line 57
    .line 58
    iget p3, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct$a;->f:I

    .line 59
    .line 60
    sub-int p3, p5, p3

    .line 61
    .line 62
    add-int/2addr p3, p2

    .line 63
    iput p3, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct$a;->a:I

    .line 64
    .line 65
    move p3, p4

    .line 66
    goto :goto_0

    .line 67
    :cond_0
    move p3, p6

    .line 68
    move p8, p3

    .line 69
    :goto_0
    const/high16 p7, 0x42c80000    # 100.0f

    .line 70
    .line 71
    invoke-static {p7}, Ll/qa00;->d(F)I

    .line 72
    .line 73
    .line 74
    move-result p7

    .line 75
    if-le p2, p7, :cond_1

    .line 76
    .line 77
    move p7, p4

    .line 78
    goto :goto_1

    .line 79
    :cond_1
    move p7, p6

    .line 80
    :goto_1
    if-nez p7, :cond_5

    .line 81
    .line 82
    iget p9, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct$a;->f:I

    .line 83
    .line 84
    sub-int/2addr p5, p9

    .line 85
    iput p5, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct$a;->a:I

    .line 86
    .line 87
    move p5, p6

    .line 88
    :goto_2
    instance-of p9, p1, Landroid/view/View;

    .line 89
    .line 90
    if-eqz p9, :cond_2

    .line 91
    .line 92
    iget-object p9, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct$a;->k:Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct;

    .line 93
    .line 94
    invoke-virtual {p9}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 95
    .line 96
    .line 97
    move-result-object p9

    .line 98
    invoke-virtual {p9}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 99
    .line 100
    .line 101
    move-result-object p9

    .line 102
    if-eq p1, p9, :cond_2

    .line 103
    .line 104
    check-cast p1, Landroid/view/View;

    .line 105
    .line 106
    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    .line 107
    .line 108
    .line 109
    move-result p9

    .line 110
    add-int/2addr p5, p9

    .line 111
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    goto :goto_2

    .line 116
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct$a;->i:Landroid/view/View;

    .line 117
    .line 118
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    .line 119
    .line 120
    .line 121
    move-result p1

    .line 122
    sub-int/2addr p1, p5

    .line 123
    iget p9, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct$a;->a:I

    .line 124
    .line 125
    if-ne p1, p9, :cond_3

    .line 126
    .line 127
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct$a;->i:Landroid/view/View;

    .line 128
    .line 129
    invoke-virtual {p1}, Landroid/view/View;->getPaddingTop()I

    .line 130
    .line 131
    .line 132
    move-result p1

    .line 133
    if-eq p5, p1, :cond_5

    .line 134
    .line 135
    :cond_3
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct$a;->d:Z

    .line 136
    .line 137
    if-nez p1, :cond_4

    .line 138
    .line 139
    iput-boolean p4, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct$a;->d:Z

    .line 140
    .line 141
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct$a;->i:Landroid/view/View;

    .line 142
    .line 143
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 144
    .line 145
    .line 146
    move-result-object p1

    .line 147
    iget p9, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct$a;->a:I

    .line 148
    .line 149
    add-int/2addr p9, p5

    .line 150
    iput p9, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 151
    .line 152
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct$a;->i:Landroid/view/View;

    .line 153
    .line 154
    invoke-virtual {p1, p6, p5, p6, p6}, Landroid/view/View;->setPadding(IIII)V

    .line 155
    .line 156
    .line 157
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct$a;->i:Landroid/view/View;

    .line 158
    .line 159
    invoke-virtual {p1}, Landroid/view/View;->requestLayout()V

    .line 160
    .line 161
    .line 162
    goto :goto_3

    .line 163
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct$a;->i:Landroid/view/View;

    .line 164
    .line 165
    new-instance p9, Ll/ukf;

    .line 166
    .line 167
    invoke-direct {p9, p0, p1, p5}, Ll/ukf;-><init>(Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct$a;Landroid/view/View;I)V

    .line 168
    .line 169
    .line 170
    invoke-static {p9}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 171
    .line 172
    .line 173
    :cond_5
    :goto_3
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct$a;->b:Z

    .line 174
    .line 175
    if-ne p7, p1, :cond_6

    .line 176
    .line 177
    iget p1, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct$a;->c:I

    .line 178
    .line 179
    if-ne p2, p1, :cond_6

    .line 180
    .line 181
    if-eqz p3, :cond_9

    .line 182
    .line 183
    :cond_6
    iput-boolean p7, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct$a;->b:Z

    .line 184
    .line 185
    if-eqz p7, :cond_7

    .line 186
    .line 187
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct$a;->c:I

    .line 188
    .line 189
    sget-object p1, Lcom/p1/mobile/android/app/Act;->savedKeyboardHeight:Ll/vxd0;

    .line 190
    .line 191
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 192
    .line 193
    .line 194
    move-result-object p2

    .line 195
    invoke-virtual {p1, p2}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 196
    .line 197
    .line 198
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct$a;->j:Ll/b30;

    .line 199
    .line 200
    if-eqz p1, :cond_9

    .line 201
    .line 202
    iget-boolean p2, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct$a;->b:Z

    .line 203
    .line 204
    if-eqz p2, :cond_8

    .line 205
    .line 206
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct$a;->k:Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct;

    .line 207
    .line 208
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->lifecycle_()Lcom/p1/mobile/android/app/c;

    .line 209
    .line 210
    .line 211
    move-result-object p2

    .line 212
    sget-object p5, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 213
    .line 214
    if-ne p2, p5, :cond_8

    .line 215
    .line 216
    goto :goto_4

    .line 217
    :cond_8
    move p4, p6

    .line 218
    :goto_4
    invoke-static {p4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 219
    .line 220
    .line 221
    move-result-object p2

    .line 222
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct$a;->c:I

    .line 223
    .line 224
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 225
    .line 226
    .line 227
    move-result-object p0

    .line 228
    invoke-static {p3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 229
    .line 230
    .line 231
    move-result-object p3

    .line 232
    invoke-static {p8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 233
    .line 234
    .line 235
    move-result-object p4

    .line 236
    invoke-interface {p1, p2, p0, p3, p4}, Ll/b30;->b(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 237
    .line 238
    .line 239
    :cond_9
    return-void
.end method
