.class public Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;
.super Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct$a;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct$TYPE;,
        Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct$d;,
        Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct$c;
    }
.end annotation


# instance fields
.field public A:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct$c;

.field public B:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$f;",
            ">;"
        }
    .end annotation
.end field

.field public C:Ljava/lang/String;

.field public D:Lcom/p1/mobile/putong/data/Media;

.field public E:Z

.field public F:Z

.field public G:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct$d;

.field public H:Lcom/p1/mobile/putong/feed/newui/mediapicker/a;

.field public I:Lcom/p1/mobile/putong/feed/ui/PictureView;

.field public J:Ljava/lang/Runnable;

.field public l:Lcom/p1/mobile/putong/feed/newui/mediapicker/CoordinatorLinearLayout;

.field public m:Landroidx/appcompat/widget/Toolbar;

.field public n:Landroid/widget/TextView;

.field public o:Landroid/widget/FrameLayout;

.field public p:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;

.field public q:Lv/VText;

.field public r:Lcom/p1/mobile/putong/feed/newui/mediapicker/CoordinatorRecyclerView;

.field public s:Landroid/widget/LinearLayout;

.field public t:Lcom/p1/mobile/putong/feed/newui/mediapicker/BottomLineTextView;

.field public u:Lcom/p1/mobile/putong/feed/newui/mediapicker/BottomLineTextView;

.field public v:I

.field public w:Z

.field public x:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct$TYPE;

.field public y:Landroidx/recyclerview/widget/GridLayoutManager;

.field public z:Landroidx/recyclerview/widget/RecyclerView;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x9

    .line 5
    .line 6
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->v:I

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->w:Z

    .line 10
    .line 11
    sget-object v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct$TYPE;->IMAGES:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct$TYPE;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->x:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct$TYPE;

    .line 14
    .line 15
    new-instance v0, Ll/l01;

    .line 16
    .line 17
    invoke-direct {v0}, Ll/l01;-><init>()V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->B:Ljava/util/Map;

    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->E:Z

    .line 24
    .line 25
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->F:Z

    .line 26
    .line 27
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct$b;

    .line 28
    .line 29
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct$b;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;)V

    .line 30
    .line 31
    .line 32
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->J:Ljava/lang/Runnable;

    .line 33
    .line 34
    return-void
.end method

.method public static synthetic A2(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;Ll/vg60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->c3(Ll/vg60;)V

    return-void
.end method

.method public static synthetic B2(Landroid/view/View;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    instance-of p0, p0, Landroidx/appcompat/view/menu/ActionMenuItemView;

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static synthetic C2(Ljava/util/List;)Ll/vg60;
    .locals 2

    .line 1
    new-instance v0, Ll/vg60;

    .line 2
    .line 3
    new-instance v1, Ll/kwm;

    .line 4
    .line 5
    invoke-direct {v1}, Ll/kwm;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-static {p0, v1}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-direct {v0, p0, v1}, Ll/vg60;-><init>(Ljava/util/List;Lcom/p1/mobile/putong/data/DbLinks;)V

    .line 14
    .line 15
    .line 16
    return-object v0
.end method

.method public static synthetic D2(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->T2()V

    return-void
.end method

.method public static F2(Landroid/content/Context;IZZ)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "imageCount"

    .line 9
    .line 10
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    const-string p0, "hasVideo"

    .line 14
    .line 15
    invoke-virtual {v0, p0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 16
    .line 17
    .line 18
    const-string p0, "isInCameraGroup"

    .line 19
    .line 20
    invoke-virtual {v0, p0, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 21
    .line 22
    .line 23
    return-object v0
.end method

.method public static K2(Landroid/content/Context;Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$f;Landroid/net/Uri;)Landroid/graphics/Bitmap;
    .locals 7

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    .line 9
    .line 10
    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 11
    .line 12
    .line 13
    iput v1, v0, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 14
    .line 15
    iget v2, p1, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$f;->g:I

    .line 16
    .line 17
    iget v3, p1, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$f;->e:I

    .line 18
    .line 19
    sub-int/2addr v2, v3

    .line 20
    iget v3, p1, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$f;->h:I

    .line 21
    .line 22
    iget v4, p1, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$f;->f:I

    .line 23
    .line 24
    sub-int/2addr v3, v4

    .line 25
    mul-int/2addr v2, v3

    .line 26
    iget v3, p1, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$f;->i:I

    .line 27
    .line 28
    iget v4, p1, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$f;->j:I

    .line 29
    .line 30
    mul-int/2addr v3, v4

    .line 31
    mul-int/lit8 v3, v3, 0x4

    .line 32
    .line 33
    move v4, v2

    .line 34
    :goto_0
    iget v5, v0, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 35
    .line 36
    if-le v4, v3, :cond_0

    .line 37
    .line 38
    mul-int/lit8 v5, v5, 0x2

    .line 39
    .line 40
    iput v5, v0, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 41
    .line 42
    mul-int/2addr v5, v5

    .line 43
    div-int v4, v2, v5

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_0
    if-le v5, v1, :cond_2

    .line 47
    .line 48
    div-int/lit8 v5, v5, 0x2

    .line 49
    .line 50
    iput v5, v0, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 51
    .line 52
    goto :goto_1

    .line 53
    :cond_1
    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    .line 54
    .line 55
    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 56
    .line 57
    .line 58
    iput v1, v0, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 59
    .line 60
    :cond_2
    :goto_1
    const/4 v1, 0x0

    .line 61
    :try_start_0
    invoke-static {p0, p2, v0}, Ll/yb5;->H(Landroid/content/Context;Landroid/net/Uri;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    if-nez v2, :cond_3

    .line 66
    .line 67
    return-object v1

    .line 68
    :cond_3
    invoke-static {p0, p2, v2}, Ll/tvb;->c(Landroid/content/Context;Landroid/net/Uri;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    move-result p2

    .line 76
    if-eqz p2, :cond_6

    .line 77
    .line 78
    iget p2, p1, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$f;->e:I

    .line 79
    .line 80
    iget v0, v0, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 81
    .line 82
    div-int/2addr p2, v0

    .line 83
    iput p2, p1, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$f;->e:I

    .line 84
    .line 85
    iget v2, p1, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$f;->f:I

    .line 86
    .line 87
    div-int/2addr v2, v0

    .line 88
    iput v2, p1, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$f;->f:I

    .line 89
    .line 90
    iget v3, p1, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$f;->g:I

    .line 91
    .line 92
    div-int/2addr v3, v0

    .line 93
    iput v3, p1, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$f;->g:I

    .line 94
    .line 95
    iget v4, p1, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$f;->h:I

    .line 96
    .line 97
    div-int/2addr v4, v0

    .line 98
    iput v4, p1, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$f;->h:I

    .line 99
    .line 100
    sub-int/2addr v3, p2

    .line 101
    sub-int/2addr v4, v2

    .line 102
    invoke-static {p0, p2, v2, v3, v4}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIII)Landroid/graphics/Bitmap;

    .line 103
    .line 104
    .line 105
    move-result-object p2

    .line 106
    if-eq p0, p2, :cond_4

    .line 107
    .line 108
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->recycle()V

    .line 109
    .line 110
    .line 111
    goto :goto_2

    .line 112
    :catchall_0
    move-exception p0

    .line 113
    goto :goto_4

    .line 114
    :cond_4
    :goto_2
    iget p0, p1, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$f;->i:I

    .line 115
    .line 116
    if-gt v3, p0, :cond_5

    .line 117
    .line 118
    iget v0, p1, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$f;->j:I

    .line 119
    .line 120
    if-gt v4, v0, :cond_5

    .line 121
    .line 122
    return-object p2

    .line 123
    :cond_5
    iget p1, p1, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$f;->j:I

    .line 124
    .line 125
    invoke-static {p2, p0, p1}, Ll/yb5;->P(Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    invoke-virtual {p2}, Landroid/graphics/Bitmap;->recycle()V

    .line 130
    .line 131
    .line 132
    return-object p0

    .line 133
    :cond_6
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    .line 134
    .line 135
    .line 136
    move-result p1

    .line 137
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    .line 138
    .line 139
    .line 140
    move-result p2

    .line 141
    const/4 v0, 0x0

    .line 142
    if-lt p1, p2, :cond_7

    .line 143
    .line 144
    sub-int/2addr p1, p2

    .line 145
    div-int/lit8 p1, p1, 0x2

    .line 146
    .line 147
    move v6, v0

    .line 148
    move v0, p1

    .line 149
    move p1, p2

    .line 150
    move p2, v6

    .line 151
    goto :goto_3

    .line 152
    :cond_7
    sub-int/2addr p2, p1

    .line 153
    div-int/lit8 p2, p2, 0x2

    .line 154
    .line 155
    :goto_3
    invoke-static {p0, v0, p2, p1, p1}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIII)Landroid/graphics/Bitmap;

    .line 156
    .line 157
    .line 158
    move-result-object p1

    .line 159
    if-eq p0, p1, :cond_8

    .line 160
    .line 161
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->recycle()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 162
    .line 163
    .line 164
    :cond_8
    return-object p1

    .line 165
    :goto_4
    new-instance p1, Ljava/lang/Throwable;

    .line 166
    .line 167
    new-instance p2, Ljava/lang/StringBuilder;

    .line 168
    .line 169
    const-string v0, "MakeDrawableTask cropImageAndResize: "

    .line 170
    .line 171
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 172
    .line 173
    .line 174
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 175
    .line 176
    .line 177
    move-result-object v0

    .line 178
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 179
    .line 180
    .line 181
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 182
    .line 183
    .line 184
    move-result-object p2

    .line 185
    invoke-direct {p1, p2, p0}, Ljava/lang/Throwable;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 186
    .line 187
    .line 188
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 189
    .line 190
    .line 191
    return-object v1
.end method

.method private M2()V
    .locals 3

    .line 1
    new-instance v0, Landroidx/recyclerview/widget/GridLayoutManager;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const/4 v2, 0x4

    .line 8
    invoke-direct {v0, v1, v2}, Landroidx/recyclerview/widget/GridLayoutManager;-><init>(Landroid/content/Context;I)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->y:Landroidx/recyclerview/widget/GridLayoutManager;

    .line 12
    .line 13
    const/4 v1, 0x1

    .line 14
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;->setSmoothScrollbarEnabled(Z)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->r:Lcom/p1/mobile/putong/feed/newui/mediapicker/CoordinatorRecyclerView;

    .line 18
    .line 19
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->y:Landroidx/recyclerview/widget/GridLayoutManager;

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->r:Lcom/p1/mobile/putong/feed/newui/mediapicker/CoordinatorRecyclerView;

    .line 25
    .line 26
    new-instance v0, Ll/nuf0;

    .line 27
    .line 28
    const/high16 v1, 0x40000000    # 2.0f

    .line 29
    .line 30
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    invoke-direct {v0, v1, v2}, Ll/nuf0;-><init>(II)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$n;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public static synthetic a2(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->Z2(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic b2(Lcom/p1/mobile/putong/data/Picture;)Lcom/p1/mobile/putong/data/Media;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic c2(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;Landroid/view/MenuItem;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->g3(Landroid/view/MenuItem;)Z

    move-result p0

    return p0
.end method

.method public static synthetic d2(Ll/v2i0;)Ll/ewi;
    .locals 0

    .line 1
    invoke-static {p0}, Ll/ewi;->b(Ll/v2i0;)Ll/ewi;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic e2(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->X2(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic g2(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->j3()V

    return-void
.end method

.method private synthetic g3(Landroid/view/MenuItem;)Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->L2()V

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x1

    .line 5
    return p0
.end method

.method public static synthetic h2(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;Ll/vg60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->e3(Ll/vg60;)V

    return-void
.end method

.method public static synthetic i2(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->V2(Landroid/view/View;)V

    return-void
.end method

.method private j3()V
    .locals 3

    .line 1
    new-instance v0, Ll/avx;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const/4 v2, 0x1

    .line 8
    invoke-direct {v0, v1, v2, v2}, Ll/avx;-><init>(Landroid/content/Context;ZZ)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ll/avx;->v()Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v1}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    new-instance v2, Ll/bwm;

    .line 20
    .line 21
    invoke-direct {v2, p0}, Ll/bwm;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;)V

    .line 22
    .line 23
    .line 24
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-virtual {v1, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0}, Ll/avx;->v()Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v1}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-static {}, Lrx/schedulers/Schedulers;->io()Ll/f2e0;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    invoke-virtual {v1, v2}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    sget-object v2, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->i:Ll/qcj;

    .line 48
    .line 49
    invoke-static {v2}, Ll/avx;->p(Ll/qcj;)Lrx/c$d;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    invoke-virtual {v1, v2}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    new-instance v2, Ll/cwm;

    .line 58
    .line 59
    invoke-direct {v2}, Ll/cwm;-><init>()V

    .line 60
    .line 61
    .line 62
    invoke-virtual {v1, v2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 67
    .line 68
    .line 69
    move-result-object v2

    .line 70
    invoke-virtual {v1, v2}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    new-instance v2, Ll/dwm;

    .line 75
    .line 76
    invoke-direct {v2, p0}, Ll/dwm;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;)V

    .line 77
    .line 78
    .line 79
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 80
    .line 81
    .line 82
    move-result-object v2

    .line 83
    invoke-virtual {v1, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 84
    .line 85
    .line 86
    invoke-virtual {v0}, Ll/avx;->w()Lrx/c;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    new-instance v2, Ll/ewm;

    .line 91
    .line 92
    invoke-direct {v2, p0}, Ll/ewm;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;)V

    .line 93
    .line 94
    .line 95
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 96
    .line 97
    .line 98
    move-result-object v2

    .line 99
    invoke-virtual {v1, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 100
    .line 101
    .line 102
    invoke-virtual {v0}, Ll/avx;->w()Lrx/c;

    .line 103
    .line 104
    .line 105
    move-result-object v1

    .line 106
    invoke-static {}, Lrx/schedulers/Schedulers;->io()Ll/f2e0;

    .line 107
    .line 108
    .line 109
    move-result-object v2

    .line 110
    invoke-virtual {v1, v2}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 111
    .line 112
    .line 113
    move-result-object v1

    .line 114
    sget-object v2, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->j:Ll/qcj;

    .line 115
    .line 116
    invoke-static {v2}, Ll/avx;->p(Ll/qcj;)Lrx/c$d;

    .line 117
    .line 118
    .line 119
    move-result-object v2

    .line 120
    invoke-virtual {v1, v2}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 121
    .line 122
    .line 123
    move-result-object v1

    .line 124
    new-instance v2, Ll/gwm;

    .line 125
    .line 126
    invoke-direct {v2}, Ll/gwm;-><init>()V

    .line 127
    .line 128
    .line 129
    invoke-virtual {v1, v2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 130
    .line 131
    .line 132
    move-result-object v1

    .line 133
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 134
    .line 135
    .line 136
    move-result-object v2

    .line 137
    invoke-virtual {v1, v2}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 138
    .line 139
    .line 140
    move-result-object v1

    .line 141
    new-instance v2, Ll/hwm;

    .line 142
    .line 143
    invoke-direct {v2, p0}, Ll/hwm;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;)V

    .line 144
    .line 145
    .line 146
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 147
    .line 148
    .line 149
    move-result-object v2

    .line 150
    invoke-virtual {v1, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 151
    .line 152
    .line 153
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 154
    .line 155
    .line 156
    move-result-object p0

    .line 157
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentActivity;->getSupportLoaderManager()Landroidx/loader/app/a;

    .line 158
    .line 159
    .line 160
    move-result-object p0

    .line 161
    const/4 v1, 0x0

    .line 162
    const/4 v2, 0x0

    .line 163
    invoke-virtual {p0, v1, v2, v0}, Landroidx/loader/app/a;->e(ILandroid/os/Bundle;Landroidx/loader/app/a$a;)Ll/utv;

    .line 164
    .line 165
    .line 166
    return-void
.end method

.method public static synthetic k2(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->h3()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic l2(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;Ljava/util/Map;Ljava/util/Map;Ljava/util/ArrayList;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->S2(Ljava/util/Map;Ljava/util/Map;Ljava/util/ArrayList;)V

    return-void
.end method

.method public static synthetic m2(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->U2(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic n2(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;Ljava/util/ArrayList;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->R2(Ljava/util/ArrayList;)V

    return-void
.end method

.method public static synthetic o2(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->b3(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic p2(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->W2(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic q2(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->i3()V

    return-void
.end method

.method private r()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->w:Z

    .line 2
    .line 3
    const/16 v1, 0x8

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->s:Landroid/widget/LinearLayout;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 10
    .line 11
    .line 12
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->m3()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->N2()V

    .line 16
    .line 17
    .line 18
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->M2()V

    .line 19
    .line 20
    .line 21
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->v:I

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->q:Lv/VText;

    .line 24
    .line 25
    const/4 v2, 0x1

    .line 26
    if-ne v0, v2, :cond_1

    .line 27
    .line 28
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_1
    const/4 v0, 0x0

    .line 33
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public static synthetic r2(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->f3(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic s2(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->a3()V

    return-void
.end method

.method public static synthetic u2(Ll/v2i0;)Ll/ewi;
    .locals 0

    .line 1
    invoke-static {p0}, Ll/ewi;->b(Ll/v2i0;)Ll/ewi;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic v2(Ljava/util/List;)Ll/vg60;
    .locals 2

    .line 1
    new-instance v0, Ll/vg60;

    .line 2
    .line 3
    new-instance v1, Ll/iwm;

    .line 4
    .line 5
    invoke-direct {v1}, Ll/iwm;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-static {p0, v1}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-direct {v0, p0, v1}, Ll/vg60;-><init>(Ljava/util/List;Lcom/p1/mobile/putong/data/DbLinks;)V

    .line 14
    .line 15
    .line 16
    return-object v0
.end method

.method public static synthetic w2(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->d3(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic y2(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->Q2()V

    return-void
.end method

.method public static synthetic z2(Lcom/p1/mobile/putong/data/Video;)Lcom/p1/mobile/putong/data/Media;
    .locals 0

    .line 1
    return-object p0
.end method


# virtual methods
.method public E2(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/vwm;->b(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public H()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->f:I

    .line 2
    .line 3
    return p0
.end method

.method public H2(Lcom/p1/mobile/putong/data/Media;I)V
    .locals 5

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->E:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget v0, p0, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->f:I

    .line 6
    .line 7
    if-ne v0, p2, :cond_0

    .line 8
    .line 9
    goto/16 :goto_0

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->p:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;

    .line 12
    .line 13
    new-instance v1, Ljava/io/File;

    .line 14
    .line 15
    iget-object v2, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {v2}, Ll/oki;->z(Ljava/lang/String;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    invoke-static {v1}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->setImageUri(Landroid/net/Uri;)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->G:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct$d;

    .line 32
    .line 33
    invoke-virtual {v0, p2}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(I)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->G:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct$d;

    .line 37
    .line 38
    iget v1, p0, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->f:I

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(I)V

    .line 41
    .line 42
    .line 43
    iput p2, p0, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->f:I

    .line 44
    .line 45
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 46
    .line 47
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->C:Ljava/lang/String;

    .line 48
    .line 49
    goto/16 :goto_3

    .line 50
    .line 51
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->g:Ljava/util/Map;

    .line 52
    .line 53
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 54
    .line 55
    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    if-eqz v0, :cond_2

    .line 60
    .line 61
    iget v0, p0, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->f:I

    .line 62
    .line 63
    iget-object v1, p0, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->g:Ljava/util/Map;

    .line 64
    .line 65
    iget-object v2, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 66
    .line 67
    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    check-cast v1, Ljava/lang/Integer;

    .line 72
    .line 73
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 74
    .line 75
    .line 76
    move-result v1

    .line 77
    if-eq v0, v1, :cond_2

    .line 78
    .line 79
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->B:Ljava/util/Map;

    .line 80
    .line 81
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->C:Ljava/lang/String;

    .line 82
    .line 83
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->p:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;

    .line 84
    .line 85
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->w:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$f;

    .line 86
    .line 87
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 88
    .line 89
    .line 90
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->p:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;

    .line 91
    .line 92
    new-instance v1, Ljava/io/File;

    .line 93
    .line 94
    iget-object v2, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 95
    .line 96
    invoke-static {v2}, Ll/oki;->z(Ljava/lang/String;)Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v2

    .line 100
    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    invoke-static {v1}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    .line 104
    .line 105
    .line 106
    move-result-object v1

    .line 107
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->B:Ljava/util/Map;

    .line 108
    .line 109
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 110
    .line 111
    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 112
    .line 113
    .line 114
    move-result-object v2

    .line 115
    check-cast v2, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$f;

    .line 116
    .line 117
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->S(Landroid/net/Uri;Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$f;)V

    .line 118
    .line 119
    .line 120
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->G:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct$d;

    .line 121
    .line 122
    iget v1, p0, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->f:I

    .line 123
    .line 124
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(I)V

    .line 125
    .line 126
    .line 127
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->G:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct$d;

    .line 128
    .line 129
    invoke-virtual {v0, p2}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(I)V

    .line 130
    .line 131
    .line 132
    iput p2, p0, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->f:I

    .line 133
    .line 134
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 135
    .line 136
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->C:Ljava/lang/String;

    .line 137
    .line 138
    goto/16 :goto_3

    .line 139
    .line 140
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->g:Ljava/util/Map;

    .line 141
    .line 142
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 143
    .line 144
    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 145
    .line 146
    .line 147
    move-result v0

    .line 148
    iget-object v1, p0, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->g:Ljava/util/Map;

    .line 149
    .line 150
    if-eqz v0, :cond_7

    .line 151
    .line 152
    invoke-interface {v1}, Ljava/util/Map;->size()I

    .line 153
    .line 154
    .line 155
    move-result v0

    .line 156
    const/4 v1, 0x1

    .line 157
    if-ne v0, v1, :cond_3

    .line 158
    .line 159
    :goto_0
    return-void

    .line 160
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->B:Ljava/util/Map;

    .line 161
    .line 162
    iget-object v2, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 163
    .line 164
    invoke-interface {v0, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 165
    .line 166
    .line 167
    new-instance v0, Ljava/util/ArrayList;

    .line 168
    .line 169
    iget-object v2, p0, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->g:Ljava/util/Map;

    .line 170
    .line 171
    invoke-interface {v2}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 172
    .line 173
    .line 174
    move-result-object v2

    .line 175
    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 176
    .line 177
    .line 178
    iget-object v2, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 179
    .line 180
    invoke-interface {v0, v2}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    .line 181
    .line 182
    .line 183
    move-result v2

    .line 184
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 185
    .line 186
    .line 187
    move-result v3

    .line 188
    if-ne v3, v1, :cond_4

    .line 189
    .line 190
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 191
    .line 192
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->C:Ljava/lang/String;

    .line 193
    .line 194
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->G:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct$d;

    .line 195
    .line 196
    invoke-virtual {v0, p2}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(I)V

    .line 197
    .line 198
    .line 199
    goto :goto_2

    .line 200
    :cond_4
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 201
    .line 202
    .line 203
    move-result v3

    .line 204
    add-int/lit8 v4, v2, 0x1

    .line 205
    .line 206
    if-ne v3, v4, :cond_5

    .line 207
    .line 208
    sub-int/2addr v2, v1

    .line 209
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 210
    .line 211
    .line 212
    move-result-object v0

    .line 213
    check-cast v0, Ljava/lang/String;

    .line 214
    .line 215
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->C:Ljava/lang/String;

    .line 216
    .line 217
    iget-object v1, p0, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->g:Ljava/util/Map;

    .line 218
    .line 219
    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 220
    .line 221
    .line 222
    move-result-object v0

    .line 223
    check-cast v0, Ljava/lang/Integer;

    .line 224
    .line 225
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 226
    .line 227
    .line 228
    move-result v0

    .line 229
    iput v0, p0, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->f:I

    .line 230
    .line 231
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->G:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct$d;

    .line 232
    .line 233
    invoke-virtual {v0, p2}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(I)V

    .line 234
    .line 235
    .line 236
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->G:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct$d;

    .line 237
    .line 238
    iget v0, p0, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->f:I

    .line 239
    .line 240
    invoke-virtual {p2, v0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(I)V

    .line 241
    .line 242
    .line 243
    goto :goto_2

    .line 244
    :cond_5
    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 245
    .line 246
    .line 247
    move-result-object v1

    .line 248
    check-cast v1, Ljava/lang/String;

    .line 249
    .line 250
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->C:Ljava/lang/String;

    .line 251
    .line 252
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->G:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct$d;

    .line 253
    .line 254
    invoke-virtual {v1, p2}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(I)V

    .line 255
    .line 256
    .line 257
    :goto_1
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 258
    .line 259
    .line 260
    move-result p2

    .line 261
    if-ge v2, p2, :cond_6

    .line 262
    .line 263
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->G:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct$d;

    .line 264
    .line 265
    iget-object v1, p0, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->g:Ljava/util/Map;

    .line 266
    .line 267
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 268
    .line 269
    .line 270
    move-result-object v3

    .line 271
    invoke-interface {v1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 272
    .line 273
    .line 274
    move-result-object v1

    .line 275
    check-cast v1, Ljava/lang/Integer;

    .line 276
    .line 277
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 278
    .line 279
    .line 280
    move-result v1

    .line 281
    invoke-virtual {p2, v1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(I)V

    .line 282
    .line 283
    .line 284
    add-int/lit8 v2, v2, 0x1

    .line 285
    .line 286
    goto :goto_1

    .line 287
    :cond_6
    :goto_2
    iget-object p2, p0, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->g:Ljava/util/Map;

    .line 288
    .line 289
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->C:Ljava/lang/String;

    .line 290
    .line 291
    invoke-interface {p2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 292
    .line 293
    .line 294
    move-result-object p2

    .line 295
    check-cast p2, Ljava/lang/Integer;

    .line 296
    .line 297
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 298
    .line 299
    .line 300
    move-result p2

    .line 301
    iput p2, p0, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->f:I

    .line 302
    .line 303
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->p:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;

    .line 304
    .line 305
    new-instance v0, Ljava/io/File;

    .line 306
    .line 307
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->C:Ljava/lang/String;

    .line 308
    .line 309
    invoke-static {v1}, Ll/oki;->z(Ljava/lang/String;)Ljava/lang/String;

    .line 310
    .line 311
    .line 312
    move-result-object v1

    .line 313
    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 314
    .line 315
    .line 316
    invoke-static {v0}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    .line 317
    .line 318
    .line 319
    move-result-object v0

    .line 320
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->B:Ljava/util/Map;

    .line 321
    .line 322
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->C:Ljava/lang/String;

    .line 323
    .line 324
    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 325
    .line 326
    .line 327
    move-result-object v1

    .line 328
    check-cast v1, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$f;

    .line 329
    .line 330
    invoke-virtual {p2, v0, v1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->S(Landroid/net/Uri;Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$f;)V

    .line 331
    .line 332
    .line 333
    iget-object p2, p0, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->g:Ljava/util/Map;

    .line 334
    .line 335
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 336
    .line 337
    invoke-interface {p2, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 338
    .line 339
    .line 340
    goto :goto_3

    .line 341
    :cond_7
    invoke-interface {v1}, Ljava/util/Map;->size()I

    .line 342
    .line 343
    .line 344
    move-result v0

    .line 345
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->v:I

    .line 346
    .line 347
    if-ne v0, v1, :cond_8

    .line 348
    .line 349
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->l3:I

    .line 350
    .line 351
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 352
    .line 353
    .line 354
    return-void

    .line 355
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->B:Ljava/util/Map;

    .line 356
    .line 357
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->C:Ljava/lang/String;

    .line 358
    .line 359
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->p:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;

    .line 360
    .line 361
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->w:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$f;

    .line 362
    .line 363
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 364
    .line 365
    .line 366
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->G:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct$d;

    .line 367
    .line 368
    iget v1, p0, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->f:I

    .line 369
    .line 370
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(I)V

    .line 371
    .line 372
    .line 373
    iput p2, p0, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->f:I

    .line 374
    .line 375
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 376
    .line 377
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->C:Ljava/lang/String;

    .line 378
    .line 379
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->p:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;

    .line 380
    .line 381
    new-instance v1, Ljava/io/File;

    .line 382
    .line 383
    iget-object v2, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 384
    .line 385
    invoke-static {v2}, Ll/oki;->z(Ljava/lang/String;)Ljava/lang/String;

    .line 386
    .line 387
    .line 388
    move-result-object v2

    .line 389
    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 390
    .line 391
    .line 392
    invoke-static {v1}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    .line 393
    .line 394
    .line 395
    move-result-object v1

    .line 396
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->setImageUri(Landroid/net/Uri;)V

    .line 397
    .line 398
    .line 399
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->g:Ljava/util/Map;

    .line 400
    .line 401
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 402
    .line 403
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 404
    .line 405
    .line 406
    move-result-object p2

    .line 407
    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 408
    .line 409
    .line 410
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->G:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct$d;

    .line 411
    .line 412
    iget p2, p0, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->f:I

    .line 413
    .line 414
    invoke-virtual {p1, p2}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(I)V

    .line 415
    .line 416
    .line 417
    :goto_3
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->l:Lcom/p1/mobile/putong/feed/newui/mediapicker/CoordinatorLinearLayout;

    .line 418
    .line 419
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/CoordinatorLinearLayout;->g()V

    .line 420
    .line 421
    .line 422
    new-instance p1, Ll/pwm;

    .line 423
    .line 424
    invoke-direct {p1, p0}, Ll/pwm;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;)V

    .line 425
    .line 426
    .line 427
    const-wide/16 v0, 0x12c

    .line 428
    .line 429
    invoke-static {p0, p1, v0, v1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 430
    .line 431
    .line 432
    return-void
.end method

.method public I2(Lcom/p1/mobile/putong/data/Media;I)V
    .locals 2

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->f:I

    .line 2
    .line 3
    if-ne v0, p2, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    instance-of v0, p1, Lcom/p1/mobile/putong/data/Video;

    .line 7
    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    move-object v0, p1

    .line 11
    check-cast v0, Lcom/p1/mobile/putong/data/Video;

    .line 12
    .line 13
    iget v0, v0, Lcom/p1/mobile/putong/data/Video;->duration:F

    .line 14
    .line 15
    const/high16 v1, 0x467a0000    # 16000.0f

    .line 16
    .line 17
    cmpl-float v0, v0, v1

    .line 18
    .line 19
    if-lez v0, :cond_1

    .line 20
    .line 21
    sget p1, Lcom/p1/mobile/putong/feed/R$string;->Y2:I

    .line 22
    .line 23
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    const/16 p1, 0xf

    .line 28
    .line 29
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-static {p0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-static {p0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->I:Lcom/p1/mobile/putong/feed/ui/PictureView;

    .line 46
    .line 47
    const/4 v1, 0x1

    .line 48
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/ui/PictureView;->r(Z)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->I:Lcom/p1/mobile/putong/feed/ui/PictureView;

    .line 52
    .line 53
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/feed/ui/PictureView;->F(Lcom/p1/mobile/putong/data/Media;)V

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->I:Lcom/p1/mobile/putong/feed/ui/PictureView;

    .line 57
    .line 58
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/ui/PictureView;->E()V

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->G:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct$d;

    .line 62
    .line 63
    invoke-virtual {v0, p2}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(I)V

    .line 64
    .line 65
    .line 66
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->G:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct$d;

    .line 67
    .line 68
    iget v1, p0, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->f:I

    .line 69
    .line 70
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(I)V

    .line 71
    .line 72
    .line 73
    iput p2, p0, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->f:I

    .line 74
    .line 75
    iget-object p2, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 76
    .line 77
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->C:Ljava/lang/String;

    .line 78
    .line 79
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->D:Lcom/p1/mobile/putong/data/Media;

    .line 80
    .line 81
    return-void
.end method

.method public final L2()V
    .locals 5

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->e:Ll/uyh0;

    .line 7
    .line 8
    iget-object v2, p0, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->c:Ll/uyh0;

    .line 9
    .line 10
    if-ne v1, v2, :cond_1

    .line 11
    .line 12
    iget-object v1, v2, Ll/uyh0;->a:Ll/vg60;

    .line 13
    .line 14
    iget-object v1, v1, Ll/vg60;->a:Ljava/util/List;

    .line 15
    .line 16
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-gtz v1, :cond_0

    .line 21
    .line 22
    const-string p0, "\u76ee\u524d\u6ca1\u6709\u56fe\u7247\uff0c\u53ef\u4ee5\u5148\u53bb\u62cd\u7167"

    .line 23
    .line 24
    invoke-static {p0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    new-instance v1, Ll/l01;

    .line 29
    .line 30
    invoke-direct {v1}, Ll/l01;-><init>()V

    .line 31
    .line 32
    .line 33
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->B:Ljava/util/Map;

    .line 34
    .line 35
    invoke-interface {v1, v2}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 36
    .line 37
    .line 38
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->C:Ljava/lang/String;

    .line 39
    .line 40
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->p:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;

    .line 41
    .line 42
    iget-object v3, v3, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->w:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$f;

    .line 43
    .line 44
    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    sget v2, Lcom/p1/mobile/putong/feed/R$string;->U2:I

    .line 48
    .line 49
    invoke-virtual {p0, v2}, Lcom/p1/mobile/android/app/Act;->progress(I)Landroid/app/Dialog;

    .line 50
    .line 51
    .line 52
    new-instance v2, Ljava/util/LinkedHashMap;

    .line 53
    .line 54
    invoke-direct {v2}, Ljava/util/LinkedHashMap;-><init>()V

    .line 55
    .line 56
    .line 57
    iget-object v3, p0, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->g:Ljava/util/Map;

    .line 58
    .line 59
    invoke-interface {v2, v3}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 60
    .line 61
    .line 62
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->C:Ljava/lang/String;

    .line 63
    .line 64
    iget v4, p0, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->f:I

    .line 65
    .line 66
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 67
    .line 68
    .line 69
    move-result-object v4

    .line 70
    invoke-interface {v2, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    new-instance v3, Ll/qwm;

    .line 74
    .line 75
    invoke-direct {v3, p0, v2, v1, v0}, Ll/qwm;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;Ljava/util/Map;Ljava/util/Map;Ljava/util/ArrayList;)V

    .line 76
    .line 77
    .line 78
    invoke-static {v3}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 79
    .line 80
    .line 81
    return-void

    .line 82
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->D:Lcom/p1/mobile/putong/data/Media;

    .line 83
    .line 84
    instance-of v2, v1, Lcom/p1/mobile/putong/data/Video;

    .line 85
    .line 86
    if-eqz v2, :cond_3

    .line 87
    .line 88
    move-object v2, v1

    .line 89
    check-cast v2, Lcom/p1/mobile/putong/data/Video;

    .line 90
    .line 91
    iget v2, v2, Lcom/p1/mobile/putong/data/Video;->duration:F

    .line 92
    .line 93
    const/high16 v3, 0x467a0000    # 16000.0f

    .line 94
    .line 95
    cmpl-float v2, v2, v3

    .line 96
    .line 97
    if-lez v2, :cond_2

    .line 98
    .line 99
    sget v0, Lcom/p1/mobile/putong/feed/R$string;->Y2:I

    .line 100
    .line 101
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    const/16 v0, 0xf

    .line 106
    .line 107
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    invoke-static {p0, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    invoke-static {p0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    return-void

    .line 123
    :cond_2
    move-object v2, v1

    .line 124
    check-cast v2, Lcom/p1/mobile/putong/data/Video;

    .line 125
    .line 126
    iget-boolean v3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->F:Z

    .line 127
    .line 128
    iput-boolean v3, v2, Lcom/p1/mobile/putong/data/Video;->isFromNewCamera:Z

    .line 129
    .line 130
    iput-boolean v3, v2, Lcom/p1/mobile/putong/data/Video;->hasOriginalSound:Z

    .line 131
    .line 132
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 133
    .line 134
    .line 135
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 136
    .line 137
    .line 138
    move-result v1

    .line 139
    if-lez v1, :cond_3

    .line 140
    .line 141
    new-instance v1, Landroid/content/Intent;

    .line 142
    .line 143
    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 144
    .line 145
    .line 146
    sget-object v2, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->h:Ljava/lang/String;

    .line 147
    .line 148
    invoke-virtual {v1, v2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 149
    .line 150
    .line 151
    const/4 v0, -0x1

    .line 152
    invoke-virtual {p0, v0, v1}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 153
    .line 154
    .line 155
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 156
    .line 157
    .line 158
    :cond_3
    return-void
.end method

.method public final N2()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->m:Landroidx/appcompat/widget/Toolbar;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroidx/appcompat/app/AppCompatActivity;->setSupportActionBar(Landroidx/appcompat/widget/Toolbar;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const/4 v1, 0x1

    .line 19
    invoke-virtual {v0, v1}, Ll/c30;->w(Z)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    const/4 v1, 0x0

    .line 31
    invoke-virtual {v0, v1}, Ll/c30;->z(Z)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->m:Landroidx/appcompat/widget/Toolbar;

    .line 35
    .line 36
    new-instance v1, Ll/zvm;

    .line 37
    .line 38
    invoke-direct {v1, p0}, Ll/zvm;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/Toolbar;->setNavigationOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    sget v1, Ll/lbc0;->a:I

    .line 53
    .line 54
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    const/high16 v1, -0x1000000

    .line 59
    .line 60
    sget-object v2, Landroid/graphics/PorterDuff$Mode;->SRC_ATOP:Landroid/graphics/PorterDuff$Mode;

    .line 61
    .line 62
    invoke-virtual {v0, v1, v2}, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    .line 63
    .line 64
    .line 65
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->n:Landroid/widget/TextView;

    .line 66
    .line 67
    const/4 v2, 0x0

    .line 68
    invoke-virtual {v1, v2, v2, v0, v2}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    sget v0, Ll/lbc0;->J6:I

    .line 76
    .line 77
    invoke-virtual {p0, v0}, Ll/c30;->B(I)V

    .line 78
    .line 79
    .line 80
    return-void
.end method

.method public final synthetic Q2()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->y:Landroidx/recyclerview/widget/GridLayoutManager;

    .line 2
    .line 3
    iget p0, p0, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->f:I

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {v0, p0, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;->scrollToPositionWithOffset(II)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic R2(Ljava/util/ArrayList;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-lez v0, :cond_1

    .line 20
    .line 21
    new-instance v0, Landroid/content/Intent;

    .line 22
    .line 23
    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 24
    .line 25
    .line 26
    sget-object v1, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->h:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 29
    .line 30
    .line 31
    const/4 p1, -0x1

    .line 32
    invoke-virtual {p0, p1, v0}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_1
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->d0:I

    .line 40
    .line 41
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public final synthetic S2(Ljava/util/Map;Ljava/util/Map;Ljava/util/ArrayList;)V
    .locals 6

    .line 1
    invoke-interface {p1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Ljava/lang/String;

    .line 20
    .line 21
    const/4 v1, 0x0

    .line 22
    :try_start_0
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    invoke-interface {p2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    check-cast v3, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$f;

    .line 31
    .line 32
    new-instance v4, Ljava/io/File;

    .line 33
    .line 34
    invoke-static {v0}, Ll/oki;->z(Ljava/lang/String;)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v5

    .line 38
    invoke-direct {v4, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    invoke-static {v4}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    .line 42
    .line 43
    .line 44
    move-result-object v4

    .line 45
    invoke-static {v2, v3, v4}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->K2(Landroid/content/Context;Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$f;Landroid/net/Uri;)Landroid/graphics/Bitmap;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    const-string v3, "jpg"

    .line 50
    .line 51
    invoke-static {v3}, Ll/ecj;->O(Ljava/lang/String;)Ljava/io/File;

    .line 52
    .line 53
    .line 54
    move-result-object v3

    .line 55
    new-instance v4, Ljava/io/FileOutputStream;

    .line 56
    .line 57
    invoke-direct {v4, v3}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 58
    .line 59
    .line 60
    :try_start_1
    sget-object v1, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    .line 61
    .line 62
    const/16 v5, 0x5f

    .line 63
    .line 64
    invoke-virtual {v2, v1, v5, v4}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 65
    .line 66
    .line 67
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-virtual {v0}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    const/4 v2, 0x0

    .line 80
    invoke-static {v0, v1, v2}, Ll/t7f;->b(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {v4}, Ljava/io/OutputStream;->flush()V

    .line 84
    .line 85
    .line 86
    new-instance v0, Lcom/p1/mobile/putong/data/Picture;

    .line 87
    .line 88
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/Picture;-><init>()V

    .line 89
    .line 90
    .line 91
    const-string v1, "image/*"

    .line 92
    .line 93
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 94
    .line 95
    invoke-virtual {v3}, Ljava/io/File;->getPath()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    invoke-static {v1}, Ll/oki;->B(Ljava/lang/String;)Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object v1

    .line 103
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 104
    .line 105
    const-string v1, "raw"

    .line 106
    .line 107
    invoke-static {v1}, Lcom/p1/mobile/putong/data/MediaLocalStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 108
    .line 109
    .line 110
    move-result-object v1

    .line 111
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 112
    .line 113
    invoke-virtual {p3, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 114
    .line 115
    .line 116
    invoke-static {v4}, Ll/ua5;->b(Ljava/io/Closeable;)V

    .line 117
    .line 118
    .line 119
    goto :goto_0

    .line 120
    :catchall_0
    move-exception p0

    .line 121
    move-object v1, v4

    .line 122
    goto :goto_4

    .line 123
    :catch_0
    move-exception v0

    .line 124
    move-object v1, v4

    .line 125
    goto :goto_1

    .line 126
    :catch_1
    move-exception v0

    .line 127
    move-object v1, v4

    .line 128
    goto :goto_3

    .line 129
    :catchall_1
    move-exception p0

    .line 130
    goto :goto_4

    .line 131
    :catch_2
    move-exception v0

    .line 132
    goto :goto_1

    .line 133
    :catch_3
    move-exception v0

    .line 134
    goto :goto_3

    .line 135
    :goto_1
    :try_start_2
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 136
    .line 137
    .line 138
    sget v0, Lcom/p1/mobile/putong/feed/R$string;->N:I

    .line 139
    .line 140
    invoke-static {v0}, Ll/o1j0;->h(I)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 141
    .line 142
    .line 143
    :goto_2
    invoke-static {v1}, Ll/ua5;->b(Ljava/io/Closeable;)V

    .line 144
    .line 145
    .line 146
    goto/16 :goto_0

    .line 147
    .line 148
    :goto_3
    :try_start_3
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 149
    .line 150
    .line 151
    sget v0, Lcom/p1/mobile/putong/feed/R$string;->N:I

    .line 152
    .line 153
    invoke-static {v0}, Ll/o1j0;->h(I)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 154
    .line 155
    .line 156
    goto :goto_2

    .line 157
    :goto_4
    invoke-static {v1}, Ll/ua5;->b(Ljava/io/Closeable;)V

    .line 158
    .line 159
    .line 160
    throw p0

    .line 161
    :cond_0
    new-instance p1, Ll/awm;

    .line 162
    .line 163
    invoke-direct {p1, p0, p3}, Ll/awm;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;Ljava/util/ArrayList;)V

    .line 164
    .line 165
    .line 166
    invoke-static {p1}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 167
    .line 168
    .line 169
    return-void
.end method

.method public final synthetic T2()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->j3()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic U2(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->e:Ll/uyh0;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->c:Ll/uyh0;

    .line 4
    .line 5
    if-ne p1, v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->n3()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic V2(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->e:Ll/uyh0;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->d:Ll/uyh0;

    .line 4
    .line 5
    if-ne p1, v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->o3()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic W2(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->z:Landroidx/recyclerview/widget/RecyclerView;

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    new-instance p1, Landroidx/recyclerview/widget/RecyclerView;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-direct {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;-><init>(Landroid/content/Context;)V

    .line 12
    .line 13
    .line 14
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->z:Landroidx/recyclerview/widget/RecyclerView;

    .line 15
    .line 16
    const/high16 v0, 0x43960000    # 300.0f

    .line 17
    .line 18
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    invoke-virtual {p1, v0}, Landroid/view/View;->setMinimumHeight(I)V

    .line 23
    .line 24
    .line 25
    new-instance p1, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-direct {p1, v0}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 32
    .line 33
    .line 34
    const/4 v0, 0x1

    .line 35
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/LinearLayoutManager;->setReverseLayout(Z)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->z:Landroidx/recyclerview/widget/RecyclerView;

    .line 39
    .line 40
    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 41
    .line 42
    .line 43
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->z:Landroidx/recyclerview/widget/RecyclerView;

    .line 44
    .line 45
    const/4 v0, -0x1

    .line 46
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 47
    .line 48
    .line 49
    :cond_0
    new-instance p1, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct$c;

    .line 50
    .line 51
    const/4 v0, 0x0

    .line 52
    invoke-direct {p1, p0, v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct$c;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;Ll/uwm;)V

    .line 53
    .line 54
    .line 55
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->A:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct$c;

    .line 56
    .line 57
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->z:Landroidx/recyclerview/widget/RecyclerView;

    .line 58
    .line 59
    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 60
    .line 61
    .line 62
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->A:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct$c;

    .line 63
    .line 64
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->e:Ll/uyh0;

    .line 65
    .line 66
    iget-object v0, v0, Ll/uyh0;->b:Ll/vg60;

    .line 67
    .line 68
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct$c;->G(Ll/vg60;)V

    .line 69
    .line 70
    .line 71
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->H:Lcom/p1/mobile/putong/feed/newui/mediapicker/a;

    .line 72
    .line 73
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    move-result p1

    .line 77
    if-eqz p1, :cond_1

    .line 78
    .line 79
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->H:Lcom/p1/mobile/putong/feed/newui/mediapicker/a;

    .line 80
    .line 81
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/a;->dismiss()V

    .line 82
    .line 83
    .line 84
    :cond_1
    new-instance p1, Lcom/p1/mobile/putong/feed/newui/mediapicker/a;

    .line 85
    .line 86
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/a;-><init>(Landroid/content/Context;)V

    .line 87
    .line 88
    .line 89
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->H:Lcom/p1/mobile/putong/feed/newui/mediapicker/a;

    .line 90
    .line 91
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->z:Landroidx/recyclerview/widget/RecyclerView;

    .line 92
    .line 93
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/a;->setContentView(Landroid/view/View;)V

    .line 94
    .line 95
    .line 96
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->H:Lcom/p1/mobile/putong/feed/newui/mediapicker/a;

    .line 97
    .line 98
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/a;->show()V

    .line 99
    .line 100
    .line 101
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->z:Landroidx/recyclerview/widget/RecyclerView;

    .line 102
    .line 103
    const/4 p1, 0x0

    .line 104
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->scrollToPosition(I)V

    .line 105
    .line 106
    .line 107
    return-void
.end method

.method public final synthetic X2(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->E:Z

    .line 2
    .line 3
    xor-int/lit8 p1, p1, 0x1

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->k3(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic Z2(Landroid/os/Bundle;)V
    .locals 8

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->r()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/wzx;->k()Z

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    new-instance v0, Ll/wzx;

    .line 11
    .line 12
    invoke-direct {v0}, Ll/wzx;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    sget v2, Ll/hdc0;->j1:I

    .line 24
    .line 25
    invoke-virtual {p1, v2}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    new-instance v3, Ll/swm;

    .line 30
    .line 31
    invoke-direct {v3, p0}, Ll/swm;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;)V

    .line 32
    .line 33
    .line 34
    const/4 v6, 0x0

    .line 35
    const/4 v7, 0x0

    .line 36
    const/4 v4, 0x0

    .line 37
    const/4 v5, 0x0

    .line 38
    invoke-virtual/range {v0 .. v7}, Ll/wzx;->d(Landroid/app/Activity;Landroid/view/View;Ll/x20;Ll/y20;Ll/l6e;Ll/k6e;Ll/j6e;)V

    .line 39
    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper;->c()Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    const-string v0, "android.permission.READ_EXTERNAL_STORAGE"

    .line 47
    .line 48
    filled-new-array {v0}, [Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->r([Ljava/lang/String;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    const/4 v0, 0x0

    .line 57
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->w(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    const/4 v0, 0x1

    .line 62
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->u(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    new-instance v0, Ll/twm;

    .line 67
    .line 68
    invoke-direct {v0, p0}, Ll/twm;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->o(Ll/x20;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->i(Landroid/app/Activity;)V

    .line 76
    .line 77
    .line 78
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->t:Lcom/p1/mobile/putong/feed/newui/mediapicker/BottomLineTextView;

    .line 79
    .line 80
    new-instance v0, Ll/vvm;

    .line 81
    .line 82
    invoke-direct {v0, p0}, Ll/vvm;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 86
    .line 87
    .line 88
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->u:Lcom/p1/mobile/putong/feed/newui/mediapicker/BottomLineTextView;

    .line 89
    .line 90
    new-instance v0, Ll/wvm;

    .line 91
    .line 92
    invoke-direct {v0, p0}, Ll/wvm;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;)V

    .line 93
    .line 94
    .line 95
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 96
    .line 97
    .line 98
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->n:Landroid/widget/TextView;

    .line 99
    .line 100
    new-instance v0, Ll/xvm;

    .line 101
    .line 102
    invoke-direct {v0, p0}, Ll/xvm;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 106
    .line 107
    .line 108
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->q:Lv/VText;

    .line 109
    .line 110
    new-instance v0, Ll/yvm;

    .line 111
    .line 112
    invoke-direct {v0, p0}, Ll/yvm;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;)V

    .line 113
    .line 114
    .line 115
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 116
    .line 117
    .line 118
    return-void
.end method

.method public final synthetic a3()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->J:Ljava/lang/Runnable;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public b(Ll/ewi;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->e:Ll/uyh0;

    .line 2
    .line 3
    iput-object p1, v0, Ll/uyh0;->c:Ll/ewi;

    .line 4
    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    iget-object p1, v0, Ll/uyh0;->a:Ll/vg60;

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object p1, p1, Ll/ewi;->c:Ll/vg60;

    .line 11
    .line 12
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->G:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct$d;

    .line 13
    .line 14
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct$d;->G(Ll/vg60;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->e:Ll/uyh0;

    .line 18
    .line 19
    iget-object v0, v0, Ll/uyh0;->e:Landroidx/recyclerview/widget/RecyclerView;

    .line 20
    .line 21
    const/4 v1, 0x0

    .line 22
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->scrollToPosition(I)V

    .line 23
    .line 24
    .line 25
    new-instance v0, Ll/uvm;

    .line 26
    .line 27
    invoke-direct {v0, p0}, Ll/uvm;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->post(Ljava/lang/Runnable;)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->H:Lcom/p1/mobile/putong/feed/newui/mediapicker/a;

    .line 34
    .line 35
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-eqz v0, :cond_1

    .line 40
    .line 41
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->H:Lcom/p1/mobile/putong/feed/newui/mediapicker/a;

    .line 42
    .line 43
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/a;->dismiss()V

    .line 44
    .line 45
    .line 46
    const/4 v0, 0x0

    .line 47
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->H:Lcom/p1/mobile/putong/feed/newui/mediapicker/a;

    .line 48
    .line 49
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->x:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct$TYPE;

    .line 50
    .line 51
    sget-object v2, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct$TYPE;->IMAGES:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct$TYPE;

    .line 52
    .line 53
    invoke-virtual {v0, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-eqz v0, :cond_3

    .line 58
    .line 59
    iget-object v0, p1, Ll/vg60;->a:Ljava/util/List;

    .line 60
    .line 61
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    if-lez v0, :cond_4

    .line 66
    .line 67
    iput v1, p0, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->f:I

    .line 68
    .line 69
    iget-object v0, p1, Ll/vg60;->a:Ljava/util/List;

    .line 70
    .line 71
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    check-cast v0, Lcom/p1/mobile/putong/data/Media;

    .line 76
    .line 77
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 78
    .line 79
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->C:Ljava/lang/String;

    .line 80
    .line 81
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->p:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;

    .line 82
    .line 83
    new-instance v2, Ljava/io/File;

    .line 84
    .line 85
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->C:Ljava/lang/String;

    .line 86
    .line 87
    invoke-static {v3}, Ll/oki;->z(Ljava/lang/String;)Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v3

    .line 91
    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    invoke-static {v2}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    .line 95
    .line 96
    .line 97
    move-result-object v2

    .line 98
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->setImageUri(Landroid/net/Uri;)V

    .line 99
    .line 100
    .line 101
    :goto_1
    iget-object v0, p1, Ll/vg60;->a:Ljava/util/List;

    .line 102
    .line 103
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 104
    .line 105
    .line 106
    move-result v0

    .line 107
    if-ge v1, v0, :cond_4

    .line 108
    .line 109
    iget-object v0, p1, Ll/vg60;->a:Ljava/util/List;

    .line 110
    .line 111
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    check-cast v0, Lcom/p1/mobile/putong/data/Media;

    .line 116
    .line 117
    iget-object v2, p0, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->g:Ljava/util/Map;

    .line 118
    .line 119
    iget-object v3, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 120
    .line 121
    invoke-interface {v2, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 122
    .line 123
    .line 124
    move-result v2

    .line 125
    if-eqz v2, :cond_2

    .line 126
    .line 127
    iget-object v2, p0, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->g:Ljava/util/Map;

    .line 128
    .line 129
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 130
    .line 131
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 132
    .line 133
    .line 134
    move-result-object v3

    .line 135
    invoke-interface {v2, v0, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 136
    .line 137
    .line 138
    :cond_2
    add-int/lit8 v1, v1, 0x1

    .line 139
    .line 140
    goto :goto_1

    .line 141
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->x:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct$TYPE;

    .line 142
    .line 143
    sget-object v2, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct$TYPE;->VIDEOS:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct$TYPE;

    .line 144
    .line 145
    invoke-virtual {v0, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 146
    .line 147
    .line 148
    move-result v0

    .line 149
    if-eqz v0, :cond_4

    .line 150
    .line 151
    iget-object v0, p1, Ll/vg60;->a:Ljava/util/List;

    .line 152
    .line 153
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 154
    .line 155
    .line 156
    move-result v0

    .line 157
    if-lez v0, :cond_4

    .line 158
    .line 159
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->I:Lcom/p1/mobile/putong/feed/ui/PictureView;

    .line 160
    .line 161
    const/4 v2, 0x1

    .line 162
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/feed/ui/PictureView;->r(Z)V

    .line 163
    .line 164
    .line 165
    iput v1, p0, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->f:I

    .line 166
    .line 167
    iget-object v0, p1, Ll/vg60;->a:Ljava/util/List;

    .line 168
    .line 169
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 170
    .line 171
    .line 172
    move-result-object v0

    .line 173
    check-cast v0, Lcom/p1/mobile/putong/data/Media;

    .line 174
    .line 175
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 176
    .line 177
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->C:Ljava/lang/String;

    .line 178
    .line 179
    iget-object v0, p1, Ll/vg60;->a:Ljava/util/List;

    .line 180
    .line 181
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 182
    .line 183
    .line 184
    move-result-object v0

    .line 185
    check-cast v0, Lcom/p1/mobile/putong/data/Media;

    .line 186
    .line 187
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->D:Lcom/p1/mobile/putong/data/Media;

    .line 188
    .line 189
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->I:Lcom/p1/mobile/putong/feed/ui/PictureView;

    .line 190
    .line 191
    iget-object p1, p1, Ll/vg60;->a:Ljava/util/List;

    .line 192
    .line 193
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 194
    .line 195
    .line 196
    move-result-object p1

    .line 197
    check-cast p1, Lcom/p1/mobile/putong/data/Media;

    .line 198
    .line 199
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/feed/ui/PictureView;->F(Lcom/p1/mobile/putong/data/Media;)V

    .line 200
    .line 201
    .line 202
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->I:Lcom/p1/mobile/putong/feed/ui/PictureView;

    .line 203
    .line 204
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/PictureView;->E()V

    .line 205
    .line 206
    .line 207
    :cond_4
    return-void
.end method

.method public final synthetic b3(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroidx/activity/ComponentActivity;->onBackPressed()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic c3(Ll/vg60;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->c:Ll/uyh0;

    .line 2
    .line 3
    iput-object p1, p0, Ll/uyh0;->b:Ll/vg60;

    .line 4
    .line 5
    return-void
.end method

.method public final synthetic d3(Ljava/util/List;)V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->d:Ll/uyh0;

    .line 2
    .line 3
    new-instance v0, Ll/vg60;

    .line 4
    .line 5
    new-instance v1, Ll/jwm;

    .line 6
    .line 7
    invoke-direct {v1}, Ll/jwm;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-static {p1, v1}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    const/4 v1, 0x0

    .line 15
    invoke-direct {v0, p1, v1}, Ll/vg60;-><init>(Ljava/util/List;Lcom/p1/mobile/putong/data/DbLinks;)V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Ll/uyh0;->a:Ll/vg60;

    .line 19
    .line 20
    return-void
.end method

.method public final synthetic e3(Ll/vg60;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->d:Ll/uyh0;

    .line 2
    .line 3
    iput-object p1, p0, Ll/uyh0;->b:Ll/vg60;

    .line 4
    .line 5
    return-void
.end method

.method public final synthetic f3(Ljava/util/List;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->c:Ll/uyh0;

    .line 2
    .line 3
    new-instance v1, Ll/vg60;

    .line 4
    .line 5
    new-instance v2, Ll/lwm;

    .line 6
    .line 7
    invoke-direct {v2}, Ll/lwm;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-static {p1, v2}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    const/4 v2, 0x0

    .line 15
    invoke-direct {v1, p1, v2}, Ll/vg60;-><init>(Ljava/util/List;Lcom/p1/mobile/putong/data/DbLinks;)V

    .line 16
    .line 17
    .line 18
    iput-object v1, v0, Ll/uyh0;->a:Ll/vg60;

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->n3()V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final synthetic h3()Ljava/lang/Boolean;
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->m:Landroidx/appcompat/widget/Toolbar;

    .line 2
    .line 3
    invoke-static {p0}, Ll/bnl0;->s(Landroid/view/ViewGroup;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    new-instance v0, Ll/rwm;

    .line 8
    .line 9
    invoke-direct {v0}, Ll/rwm;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-static {p0, v0}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Landroid/view/View;

    .line 31
    .line 32
    check-cast v0, Landroid/widget/TextView;

    .line 33
    .line 34
    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    if-nez v1, :cond_0

    .line 43
    .line 44
    const/4 v1, 0x3

    .line 45
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 50
    .line 51
    .line 52
    const-string v1, "#f55a43"

    .line 53
    .line 54
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 59
    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_1
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 63
    .line 64
    return-object p0
.end method

.method public final synthetic i3()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->e:Ll/uyh0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/uyh0;->e:Landroidx/recyclerview/widget/RecyclerView;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->scrollToPosition(I)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->E2(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public initDataOnCreate()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initDataOnCreate()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/fwm;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/fwm;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;)V

    .line 7
    .line 8
    .line 9
    new-instance v1, Ll/mwm;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Ll/mwm;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/android/app/Act;->creates(Ll/y20;Ll/x20;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final k3(Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->c:Ll/uyh0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/uyh0;->a:Ll/vg60;

    .line 4
    .line 5
    iget-object v0, v0, Ll/vg60;->a:Ljava/util/List;

    .line 6
    .line 7
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x2

    .line 12
    if-ge v0, v1, :cond_0

    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    if-eqz p1, :cond_2

    .line 16
    .line 17
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->q:Lv/VText;

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    sget v1, Ll/lbc0;->s6:I

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 30
    .line 31
    .line 32
    const/4 p1, 0x1

    .line 33
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->E:Z

    .line 34
    .line 35
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->C:Ljava/lang/String;

    .line 36
    .line 37
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_1

    .line 42
    .line 43
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->g:Ljava/util/Map;

    .line 44
    .line 45
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->C:Ljava/lang/String;

    .line 46
    .line 47
    iget v2, p0, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->f:I

    .line 48
    .line 49
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->c:Ll/uyh0;

    .line 57
    .line 58
    iget-object v0, v0, Ll/uyh0;->d:Ll/jic0;

    .line 59
    .line 60
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 61
    .line 62
    .line 63
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->p:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;

    .line 64
    .line 65
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->setFitView(Z)V

    .line 66
    .line 67
    .line 68
    return-void

    .line 69
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->g:Ljava/util/Map;

    .line 70
    .line 71
    invoke-interface {p1}, Ljava/util/Map;->clear()V

    .line 72
    .line 73
    .line 74
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->B:Ljava/util/Map;

    .line 75
    .line 76
    invoke-interface {p1}, Ljava/util/Map;->clear()V

    .line 77
    .line 78
    .line 79
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->q:Lv/VText;

    .line 80
    .line 81
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    sget v1, Ll/lbc0;->r6:I

    .line 86
    .line 87
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 92
    .line 93
    .line 94
    const/4 p1, 0x0

    .line 95
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->E:Z

    .line 96
    .line 97
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->c:Ll/uyh0;

    .line 98
    .line 99
    iget-object v0, v0, Ll/uyh0;->d:Ll/jic0;

    .line 100
    .line 101
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 102
    .line 103
    .line 104
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->p:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;

    .line 105
    .line 106
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->setFitView(Z)V

    .line 107
    .line 108
    .line 109
    return-void
.end method

.method public final m3()V
    .locals 6

    .line 1
    const/high16 v0, 0x42400000    # 48.0f

    .line 2
    .line 3
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    invoke-static {}, Ll/bnl0;->y0()I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    add-int/2addr v1, v2

    .line 12
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->l:Lcom/p1/mobile/putong/feed/newui/mediapicker/CoordinatorLinearLayout;

    .line 17
    .line 18
    invoke-virtual {v2, v1, v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/CoordinatorLinearLayout;->e(II)V

    .line 19
    .line 20
    .line 21
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->o:Landroid/widget/FrameLayout;

    .line 22
    .line 23
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-static {}, Ll/bnl0;->y0()I

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    iput v3, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 32
    .line 33
    iget-object v2, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 34
    .line 35
    invoke-static {v2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    sget v3, Ll/tec0;->k1:I

    .line 40
    .line 41
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->o:Landroid/widget/FrameLayout;

    .line 42
    .line 43
    const/4 v5, 0x0

    .line 44
    invoke-virtual {v2, v3, v4, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    check-cast v2, Lcom/p1/mobile/putong/feed/ui/PictureView;

    .line 49
    .line 50
    iput-object v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->I:Lcom/p1/mobile/putong/feed/ui/PictureView;

    .line 51
    .line 52
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/ui/PictureView;->e:Landroid/widget/ImageView;

    .line 53
    .line 54
    const/4 v3, 0x0

    .line 55
    invoke-virtual {v2, v3}, Landroid/view/View;->setAlpha(F)V

    .line 56
    .line 57
    .line 58
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->I:Lcom/p1/mobile/putong/feed/ui/PictureView;

    .line 59
    .line 60
    const/16 v4, 0xc8

    .line 61
    .line 62
    iput v4, v2, Lcom/p1/mobile/putong/feed/ui/PictureView;->A:I

    .line 63
    .line 64
    iput v3, v2, Lcom/p1/mobile/putong/feed/ui/PictureView;->z:F

    .line 65
    .line 66
    invoke-virtual {v2, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 67
    .line 68
    .line 69
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->I:Lcom/p1/mobile/putong/feed/ui/PictureView;

    .line 70
    .line 71
    invoke-virtual {v2, v5}, Lcom/p1/mobile/putong/feed/ui/PictureView;->u(Z)V

    .line 72
    .line 73
    .line 74
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->o:Landroid/widget/FrameLayout;

    .line 75
    .line 76
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->I:Lcom/p1/mobile/putong/feed/ui/PictureView;

    .line 77
    .line 78
    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 79
    .line 80
    .line 81
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->I:Lcom/p1/mobile/putong/feed/ui/PictureView;

    .line 82
    .line 83
    const/16 v3, 0x8

    .line 84
    .line 85
    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    .line 86
    .line 87
    .line 88
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->r:Lcom/p1/mobile/putong/feed/newui/mediapicker/CoordinatorRecyclerView;

    .line 89
    .line 90
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 91
    .line 92
    .line 93
    move-result-object v2

    .line 94
    invoke-static {}, Ll/bnl0;->w0()I

    .line 95
    .line 96
    .line 97
    move-result v3

    .line 98
    sub-int/2addr v3, v0

    .line 99
    iput v3, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 100
    .line 101
    new-instance v2, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct$d;

    .line 102
    .line 103
    const/4 v3, 0x0

    .line 104
    invoke-direct {v2, p0, v3}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct$d;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;Ll/uwm;)V

    .line 105
    .line 106
    .line 107
    iput-object v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->G:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct$d;

    .line 108
    .line 109
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->r:Lcom/p1/mobile/putong/feed/newui/mediapicker/CoordinatorRecyclerView;

    .line 110
    .line 111
    invoke-virtual {v3, v2}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 112
    .line 113
    .line 114
    iget-object v2, p0, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->c:Ll/uyh0;

    .line 115
    .line 116
    iget-object v3, p0, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->d:Ll/uyh0;

    .line 117
    .line 118
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->G:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct$d;

    .line 119
    .line 120
    iput-object v4, v3, Ll/uyh0;->d:Ll/jic0;

    .line 121
    .line 122
    iput-object v4, v2, Ll/uyh0;->d:Ll/jic0;

    .line 123
    .line 124
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->r:Lcom/p1/mobile/putong/feed/newui/mediapicker/CoordinatorRecyclerView;

    .line 125
    .line 126
    iput-object v4, v3, Ll/uyh0;->e:Landroidx/recyclerview/widget/RecyclerView;

    .line 127
    .line 128
    iput-object v4, v2, Ll/uyh0;->e:Landroidx/recyclerview/widget/RecyclerView;

    .line 129
    .line 130
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->l:Lcom/p1/mobile/putong/feed/newui/mediapicker/CoordinatorLinearLayout;

    .line 131
    .line 132
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 133
    .line 134
    .line 135
    move-result-object v2

    .line 136
    invoke-static {}, Ll/bnl0;->w0()I

    .line 137
    .line 138
    .line 139
    move-result v3

    .line 140
    add-int/2addr v1, v3

    .line 141
    sub-int/2addr v1, v0

    .line 142
    iput v1, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 143
    .line 144
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->r:Lcom/p1/mobile/putong/feed/newui/mediapicker/CoordinatorRecyclerView;

    .line 145
    .line 146
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->l:Lcom/p1/mobile/putong/feed/newui/mediapicker/CoordinatorLinearLayout;

    .line 147
    .line 148
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/CoordinatorRecyclerView;->setCoordinatorListener(Ll/ju6;)V

    .line 149
    .line 150
    .line 151
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->r:Lcom/p1/mobile/putong/feed/newui/mediapicker/CoordinatorRecyclerView;

    .line 152
    .line 153
    new-instance v1, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct$a;

    .line 154
    .line 155
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct$a;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;)V

    .line 156
    .line 157
    .line 158
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->addOnScrollListener(Landroidx/recyclerview/widget/RecyclerView$t;)V

    .line 159
    .line 160
    .line 161
    return-void
.end method

.method public final n3()V
    .locals 5

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct$TYPE;->IMAGES:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct$TYPE;

    .line 2
    .line 3
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->x:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct$TYPE;

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->n:Landroid/widget/TextView;

    .line 6
    .line 7
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->j3:I

    .line 8
    .line 9
    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->t:Lcom/p1/mobile/putong/feed/newui/mediapicker/BottomLineTextView;

    .line 17
    .line 18
    const/4 v1, 0x1

    .line 19
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/BottomLineTextView;->l(Z)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->u:Lcom/p1/mobile/putong/feed/newui/mediapicker/BottomLineTextView;

    .line 23
    .line 24
    const/4 v2, 0x0

    .line 25
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/BottomLineTextView;->l(Z)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->p:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;

    .line 29
    .line 30
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 31
    .line 32
    .line 33
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->v:I

    .line 34
    .line 35
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->q:Lv/VText;

    .line 36
    .line 37
    const/16 v4, 0x8

    .line 38
    .line 39
    if-ne v0, v1, :cond_0

    .line 40
    .line 41
    invoke-virtual {v3, v4}, Landroid/view/View;->setVisibility(I)V

    .line 42
    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_0
    invoke-virtual {v3, v2}, Landroid/view/View;->setVisibility(I)V

    .line 46
    .line 47
    .line 48
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->I:Lcom/p1/mobile/putong/feed/ui/PictureView;

    .line 49
    .line 50
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/ui/PictureView;->D()V

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->I:Lcom/p1/mobile/putong/feed/ui/PictureView;

    .line 54
    .line 55
    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    .line 56
    .line 57
    .line 58
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->c:Ll/uyh0;

    .line 59
    .line 60
    iput-object v0, p0, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->e:Ll/uyh0;

    .line 61
    .line 62
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->G:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct$d;

    .line 63
    .line 64
    iget-object v0, v0, Ll/uyh0;->a:Ll/vg60;

    .line 65
    .line 66
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct$d;->G(Ll/vg60;)V

    .line 67
    .line 68
    .line 69
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->c:Ll/uyh0;

    .line 70
    .line 71
    iget-object v0, v0, Ll/uyh0;->a:Ll/vg60;

    .line 72
    .line 73
    iget-object v0, v0, Ll/vg60;->a:Ljava/util/List;

    .line 74
    .line 75
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    if-lez v0, :cond_1

    .line 80
    .line 81
    iput v2, p0, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->f:I

    .line 82
    .line 83
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->c:Ll/uyh0;

    .line 84
    .line 85
    iget-object v0, v0, Ll/uyh0;->a:Ll/vg60;

    .line 86
    .line 87
    iget-object v0, v0, Ll/vg60;->a:Ljava/util/List;

    .line 88
    .line 89
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    check-cast v0, Lcom/p1/mobile/putong/data/Media;

    .line 94
    .line 95
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 96
    .line 97
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->C:Ljava/lang/String;

    .line 98
    .line 99
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->p:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;

    .line 100
    .line 101
    new-instance v1, Ljava/io/File;

    .line 102
    .line 103
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->C:Ljava/lang/String;

    .line 104
    .line 105
    invoke-static {v2}, Ll/oki;->z(Ljava/lang/String;)Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v2

    .line 109
    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 110
    .line 111
    .line 112
    invoke-static {v1}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    .line 113
    .line 114
    .line 115
    move-result-object v1

    .line 116
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->setImageUri(Landroid/net/Uri;)V

    .line 117
    .line 118
    .line 119
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->J:Ljava/lang/Runnable;

    .line 120
    .line 121
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 122
    .line 123
    .line 124
    return-void
.end method

.method public final o3()V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct$TYPE;->VIDEOS:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct$TYPE;

    .line 2
    .line 3
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->x:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct$TYPE;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->k3(Z)V

    .line 7
    .line 8
    .line 9
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->n:Landroid/widget/TextView;

    .line 10
    .line 11
    sget v2, Lcom/p1/mobile/putong/feed/R$string;->k3:I

    .line 12
    .line 13
    invoke-virtual {p0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 18
    .line 19
    .line 20
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->t:Lcom/p1/mobile/putong/feed/newui/mediapicker/BottomLineTextView;

    .line 21
    .line 22
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/BottomLineTextView;->l(Z)V

    .line 23
    .line 24
    .line 25
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->u:Lcom/p1/mobile/putong/feed/newui/mediapicker/BottomLineTextView;

    .line 26
    .line 27
    const/4 v2, 0x1

    .line 28
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/BottomLineTextView;->l(Z)V

    .line 29
    .line 30
    .line 31
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->I:Lcom/p1/mobile/putong/feed/ui/PictureView;

    .line 32
    .line 33
    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 34
    .line 35
    .line 36
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->q:Lv/VText;

    .line 37
    .line 38
    const/16 v2, 0x8

    .line 39
    .line 40
    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 41
    .line 42
    .line 43
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->p:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;

    .line 44
    .line 45
    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 46
    .line 47
    .line 48
    iget-object v1, p0, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->d:Ll/uyh0;

    .line 49
    .line 50
    iput-object v1, p0, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->e:Ll/uyh0;

    .line 51
    .line 52
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->G:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct$d;

    .line 53
    .line 54
    iget-object v1, v1, Ll/uyh0;->a:Ll/vg60;

    .line 55
    .line 56
    invoke-virtual {v2, v1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct$d;->G(Ll/vg60;)V

    .line 57
    .line 58
    .line 59
    iget-object v1, p0, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->d:Ll/uyh0;

    .line 60
    .line 61
    iget-object v1, v1, Ll/uyh0;->a:Ll/vg60;

    .line 62
    .line 63
    iget-object v1, v1, Ll/vg60;->a:Ljava/util/List;

    .line 64
    .line 65
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    if-lez v1, :cond_0

    .line 70
    .line 71
    iput v0, p0, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->f:I

    .line 72
    .line 73
    iget-object v1, p0, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->d:Ll/uyh0;

    .line 74
    .line 75
    iget-object v1, v1, Ll/uyh0;->a:Ll/vg60;

    .line 76
    .line 77
    iget-object v1, v1, Ll/vg60;->a:Ljava/util/List;

    .line 78
    .line 79
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    check-cast v1, Lcom/p1/mobile/putong/data/Media;

    .line 84
    .line 85
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 86
    .line 87
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->C:Ljava/lang/String;

    .line 88
    .line 89
    iget-object v1, p0, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->d:Ll/uyh0;

    .line 90
    .line 91
    iget-object v1, v1, Ll/uyh0;->a:Ll/vg60;

    .line 92
    .line 93
    iget-object v1, v1, Ll/vg60;->a:Ljava/util/List;

    .line 94
    .line 95
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    check-cast v1, Lcom/p1/mobile/putong/data/Media;

    .line 100
    .line 101
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->D:Lcom/p1/mobile/putong/data/Media;

    .line 102
    .line 103
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->I:Lcom/p1/mobile/putong/feed/ui/PictureView;

    .line 104
    .line 105
    iget-object v2, p0, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->d:Ll/uyh0;

    .line 106
    .line 107
    iget-object v2, v2, Ll/uyh0;->a:Ll/vg60;

    .line 108
    .line 109
    iget-object v2, v2, Ll/vg60;->a:Ljava/util/List;

    .line 110
    .line 111
    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    check-cast v0, Lcom/p1/mobile/putong/data/Media;

    .line 116
    .line 117
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/feed/ui/PictureView;->F(Lcom/p1/mobile/putong/data/Media;)V

    .line 118
    .line 119
    .line 120
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->J:Ljava/lang/Runnable;

    .line 121
    .line 122
    const-wide/16 v1, 0xc8

    .line 123
    .line 124
    invoke-virtual {p0, v0, v1, v2}, Lcom/p1/mobile/android/app/Act;->postDelayed(Ljava/lang/Runnable;J)V

    .line 125
    .line 126
    .line 127
    :cond_0
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 4

    .line 1
    sget v0, Ll/hdc0;->O0:I

    .line 2
    .line 3
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->m:I

    .line 4
    .line 5
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/app/PutongAct;->actionItemPadding(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    const/4 v2, 0x0

    .line 14
    const/4 v3, 0x1

    .line 15
    invoke-interface {p1, v2, v0, v3, v1}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    new-instance v0, Ll/nwm;

    .line 20
    .line 21
    invoke-direct {v0, p0}, Ll/nwm;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;)V

    .line 22
    .line 23
    .line 24
    invoke-interface {p1, v0}, Landroid/view/MenuItem;->setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    const/4 v0, 0x2

    .line 29
    invoke-interface {p1, v0}, Landroid/view/MenuItem;->setShowAsAction(I)V

    .line 30
    .line 31
    .line 32
    const p1, 0x1020002

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    new-instance v0, Ll/owm;

    .line 40
    .line 41
    invoke-direct {v0, p0}, Ll/owm;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;)V

    .line 42
    .line 43
    .line 44
    invoke-static {p1, v0}, Ll/bnl0;->b0(Landroid/view/View;Ll/pcj;)V

    .line 45
    .line 46
    .line 47
    return v3
.end method

.method public onDestroyLifecycle()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->I:Lcom/p1/mobile/putong/feed/ui/PictureView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->I:Lcom/p1/mobile/putong/feed/ui/PictureView;

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/ui/PictureView;->r(Z)V

    .line 13
    .line 14
    .line 15
    :cond_0
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->onDestroyLifecycle()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public onPauseLifecycle()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->I:Lcom/p1/mobile/putong/feed/ui/PictureView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->I:Lcom/p1/mobile/putong/feed/ui/PictureView;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/ui/PictureView;->D()V

    .line 12
    .line 13
    .line 14
    :cond_0
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->onPauseLifecycle()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public preCreateView(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/app/PutongAct;->preCreateView(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    const-string v0, "imageCount"

    .line 9
    .line 10
    const/16 v1, 0x9

    .line 11
    .line 12
    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->v:I

    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    const-string v0, "hasVideo"

    .line 23
    .line 24
    const/4 v1, 0x1

    .line 25
    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->w:Z

    .line 30
    .line 31
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    const-string v0, "isInCameraGroup"

    .line 36
    .line 37
    const/4 v1, 0x0

    .line 38
    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->F:Z

    .line 43
    .line 44
    return-void
.end method

.method public x()Ljava/util/Map;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->g:Ljava/util/Map;

    .line 2
    .line 3
    return-object p0
.end method

.method public y(Lcom/p1/mobile/putong/data/Media;I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->e:Ll/uyh0;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->c:Ll/uyh0;

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->H2(Lcom/p1/mobile/putong/data/Media;I)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->I2(Lcom/p1/mobile/putong/data/Media;I)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
