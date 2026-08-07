.class public Ll/du;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/xt;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Landroid/view/ViewStub;

.field public b:Lcom/google/android/material/tabs/TabLayout;

.field public c:Lcom/flipboard/bottomsheet/BottomSheetLayout;

.field public d:Lv/VPager;

.field public e:Lv/VProgressBar;

.field public f:Landroid/widget/LinearLayout;

.field public g:Landroid/widget/ImageView;

.field public h:Landroid/widget/TextView;

.field public i:Landroid/widget/FrameLayout;

.field public j:Lv/VText;

.field public k:Lv/VText;

.field public l:Ll/xt;

.field public m:Z

.field public n:Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;

.field public o:Ll/uyh0;

.field public p:Ll/uyh0;

.field public q:Ll/uyh0;

.field public r:Lv/VList;

.field public s:Ll/yo;

.field public t:Ll/l4g0;

.field public u:Ll/l4g0;

.field public v:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ll/uyh0;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;)V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/du;->m:Z

    .line 6
    .line 7
    new-instance v0, Ll/l4g0;

    .line 8
    .line 9
    const-class v1, Lcom/flipboard/bottomsheet/BottomSheetLayout;

    .line 10
    .line 11
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    const-string v3, "p_video_albums_view"

    .line 16
    .line 17
    invoke-direct {v0, v3, v2}, Ll/l4g0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Ll/du;->t:Ll/l4g0;

    .line 21
    .line 22
    new-instance v0, Ll/l4g0;

    .line 23
    .line 24
    const-string v2, "p_picture_albums_view"

    .line 25
    .line 26
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-direct {v0, v2, v1}, Ll/l4g0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    iput-object v0, p0, Ll/du;->u:Ll/l4g0;

    .line 34
    .line 35
    iput-object p1, p0, Ll/du;->n:Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;

    .line 36
    .line 37
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/data/Picture;)Lcom/p1/mobile/putong/data/Media;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic b(Ll/du;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/du;->C()V

    return-void
.end method

.method public static synthetic c(Ll/du;ZLcom/flipboard/bottomsheet/BottomSheetLayout;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/du;->E(ZLcom/flipboard/bottomsheet/BottomSheetLayout;)V

    return-void
.end method

.method public static synthetic d(Ll/du;IZLandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/du;->F(IZLandroid/view/View;)V

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/data/Video;)Lcom/p1/mobile/putong/data/Media;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static bridge synthetic f(Ll/du;)Ll/uyh0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/du;->q:Ll/uyh0;

    return-object p0
.end method

.method public static bridge synthetic i(Ll/du;)Ll/y20;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/du;->v:Ll/y20;

    return-object p0
.end method

.method public static bridge synthetic j(Ll/du;)Ll/uyh0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/du;->o:Ll/uyh0;

    return-object p0
.end method

.method public static bridge synthetic k(Ll/du;)Ll/uyh0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/du;->p:Ll/uyh0;

    return-object p0
.end method

.method public static bridge synthetic l(Ll/du;Ll/uyh0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/du;->q:Ll/uyh0;

    return-void
.end method


# virtual methods
.method public A(ILjava/lang/String;Ljava/lang/String;ZIZLcom/p1/mobile/putong/data/Gender;)V
    .locals 1

    .line 1
    iget-object p3, p0, Ll/du;->b:Lcom/google/android/material/tabs/TabLayout;

    .line 2
    .line 3
    sget v0, Ll/bbc0;->h1:I

    .line 4
    .line 5
    invoke-virtual {p3, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, p6, p7}, Ll/du;->p(ZLcom/p1/mobile/putong/data/Gender;)V

    .line 9
    .line 10
    .line 11
    sget p3, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;->B:I

    .line 12
    .line 13
    iget-object p6, p0, Ll/du;->n:Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;

    .line 14
    .line 15
    if-ne p1, p3, :cond_0

    .line 16
    .line 17
    sget p1, Ll/a9c0;->n:I

    .line 18
    .line 19
    invoke-virtual {p6, p1}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    invoke-virtual {p6, p1}, Lcom/p1/mobile/android/app/Act;->setStatusBarColor(I)V

    .line 24
    .line 25
    .line 26
    iget-object p1, p0, Ll/du;->n:Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;

    .line 27
    .line 28
    sget p3, Ll/a9c0;->m:I

    .line 29
    .line 30
    invoke-virtual {p1, p3}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 31
    .line 32
    .line 33
    move-result p3

    .line 34
    invoke-virtual {p1, p3}, Lcom/p1/mobile/android/app/Act;->setActionBarColor(I)V

    .line 35
    .line 36
    .line 37
    iget-object p1, p0, Ll/du;->n:Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;

    .line 38
    .line 39
    sget p3, Lcom/p1/mobile/putong/account/R$string;->r2:I

    .line 40
    .line 41
    invoke-virtual {p1, p3}, Lcom/p1/mobile/android/app/Act;->setTitle(I)V

    .line 42
    .line 43
    .line 44
    iget-object p1, p0, Ll/du;->j:Lv/VText;

    .line 45
    .line 46
    iget-object p3, p0, Ll/du;->n:Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;

    .line 47
    .line 48
    sget p6, Ll/a9c0;->a:I

    .line 49
    .line 50
    invoke-virtual {p3, p6}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 51
    .line 52
    .line 53
    move-result p3

    .line 54
    invoke-virtual {p1, p3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 55
    .line 56
    .line 57
    iget-object p1, p0, Ll/du;->e:Lv/VProgressBar;

    .line 58
    .line 59
    const/4 p3, 0x1

    .line 60
    invoke-static {p1, p3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 61
    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_0
    sget p1, Lcom/p1/mobile/putong/account/R$string;->y2:I

    .line 65
    .line 66
    invoke-virtual {p6, p1}, Lcom/p1/mobile/android/app/Act;->setTitle(I)V

    .line 67
    .line 68
    .line 69
    :goto_0
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    if-nez p1, :cond_1

    .line 74
    .line 75
    iget-object p1, p0, Ll/du;->n:Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;

    .line 76
    .line 77
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/app/Act;->setTitle(Ljava/lang/CharSequence;)V

    .line 78
    .line 79
    .line 80
    :cond_1
    if-eqz p4, :cond_3

    .line 81
    .line 82
    if-lez p5, :cond_3

    .line 83
    .line 84
    iget-object p1, p0, Ll/du;->b:Lcom/google/android/material/tabs/TabLayout;

    .line 85
    .line 86
    iget-object p2, p0, Ll/du;->n:Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;

    .line 87
    .line 88
    invoke-virtual {p2}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 89
    .line 90
    .line 91
    move-result-object p2

    .line 92
    invoke-virtual {p2}, Ll/c30;->j()F

    .line 93
    .line 94
    .line 95
    move-result p2

    .line 96
    invoke-virtual {p1, p2}, Lcom/google/android/material/tabs/TabLayout;->setElevation(F)V

    .line 97
    .line 98
    .line 99
    iget-object p1, p0, Ll/du;->n:Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;

    .line 100
    .line 101
    iget-object p1, p1, Lcom/p1/mobile/putong/app/PutongAct;->statusHeaderView:Landroid/view/View;

    .line 102
    .line 103
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 104
    .line 105
    .line 106
    move-result p1

    .line 107
    const/4 p2, 0x0

    .line 108
    if-eqz p1, :cond_2

    .line 109
    .line 110
    iget-object p1, p0, Ll/du;->n:Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;

    .line 111
    .line 112
    iget-object p1, p1, Lcom/p1/mobile/putong/app/PutongAct;->statusHeaderView:Landroid/view/View;

    .line 113
    .line 114
    invoke-virtual {p1, p2}, Landroid/view/View;->setElevation(F)V

    .line 115
    .line 116
    .line 117
    :cond_2
    iget-object p0, p0, Ll/du;->n:Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;

    .line 118
    .line 119
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 120
    .line 121
    .line 122
    move-result-object p0

    .line 123
    invoke-virtual {p0, p2}, Ll/c30;->A(F)V

    .line 124
    .line 125
    .line 126
    return-void

    .line 127
    :cond_3
    iget-object p0, p0, Ll/du;->b:Lcom/google/android/material/tabs/TabLayout;

    .line 128
    .line 129
    const/16 p1, 0x8

    .line 130
    .line 131
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 132
    .line 133
    .line 134
    return-void
.end method

.method public B(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/du;->e:Lv/VProgressBar;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic C()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/du;->q:Ll/uyh0;

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

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/du;->n:Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic E(ZLcom/flipboard/bottomsheet/BottomSheetLayout;)V
    .locals 1

    .line 1
    iget-object p2, p0, Ll/du;->b:Lcom/google/android/material/tabs/TabLayout;

    .line 2
    .line 3
    invoke-virtual {p2}, Landroid/view/View;->getVisibility()I

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    const/16 v0, 0x8

    .line 8
    .line 9
    if-eq p2, v0, :cond_1

    .line 10
    .line 11
    iget-object p1, p0, Ll/du;->q:Ll/uyh0;

    .line 12
    .line 13
    iget-object p2, p0, Ll/du;->p:Ll/uyh0;

    .line 14
    .line 15
    if-ne p1, p2, :cond_0

    .line 16
    .line 17
    iget-object p1, p0, Ll/du;->t:Ll/l4g0;

    .line 18
    .line 19
    invoke-virtual {p1}, Ll/l4g0;->k()V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Ll/du;->t:Ll/l4g0;

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/l4g0;->j()V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    iget-object p1, p0, Ll/du;->u:Ll/l4g0;

    .line 29
    .line 30
    invoke-virtual {p1}, Ll/l4g0;->k()V

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, Ll/du;->u:Ll/l4g0;

    .line 34
    .line 35
    invoke-virtual {p0}, Ll/l4g0;->j()V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_1
    if-eqz p1, :cond_2

    .line 40
    .line 41
    iget-object p1, p0, Ll/du;->t:Ll/l4g0;

    .line 42
    .line 43
    invoke-virtual {p1}, Ll/l4g0;->k()V

    .line 44
    .line 45
    .line 46
    iget-object p0, p0, Ll/du;->t:Ll/l4g0;

    .line 47
    .line 48
    invoke-virtual {p0}, Ll/l4g0;->j()V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_2
    iget-object p1, p0, Ll/du;->u:Ll/l4g0;

    .line 53
    .line 54
    invoke-virtual {p1}, Ll/l4g0;->k()V

    .line 55
    .line 56
    .line 57
    iget-object p0, p0, Ll/du;->u:Ll/l4g0;

    .line 58
    .line 59
    invoke-virtual {p0}, Ll/l4g0;->j()V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public final synthetic F(IZLandroid/view/View;)V
    .locals 3

    .line 1
    iget-object p3, p0, Ll/du;->e:Lv/VProgressBar;

    .line 2
    .line 3
    invoke-virtual {p3}, Landroid/view/View;->getVisibility()I

    .line 4
    .line 5
    .line 6
    move-result p3

    .line 7
    if-nez p3, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    new-instance p3, Lv/VList;

    .line 11
    .line 12
    iget-object v0, p0, Ll/du;->n:Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;

    .line 13
    .line 14
    invoke-direct {p3, v0}, Lv/VList;-><init>(Landroid/content/Context;)V

    .line 15
    .line 16
    .line 17
    iput-object p3, p0, Ll/du;->r:Lv/VList;

    .line 18
    .line 19
    const/4 v0, -0x1

    .line 20
    invoke-virtual {p3, v0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 21
    .line 22
    .line 23
    iget-object p3, p0, Ll/du;->r:Lv/VList;

    .line 24
    .line 25
    const/4 v1, 0x0

    .line 26
    invoke-virtual {p3, v1}, Landroid/widget/ListView;->setDivider(Landroid/graphics/drawable/Drawable;)V

    .line 27
    .line 28
    .line 29
    new-instance p3, Ll/yo;

    .line 30
    .line 31
    sget v1, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;->B:I

    .line 32
    .line 33
    if-ne p1, v1, :cond_1

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    sget v1, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;->C:I

    .line 37
    .line 38
    :goto_0
    iget-object p1, p0, Ll/du;->q:Ll/uyh0;

    .line 39
    .line 40
    iget-object v2, p0, Ll/du;->n:Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;

    .line 41
    .line 42
    invoke-direct {p3, v1, p1, v2, v2}, Ll/yo;-><init>(ILl/uyh0;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/account/ui/mediapicker/AccountMediaPickerBaseAct$a;)V

    .line 43
    .line 44
    .line 45
    iput-object p3, p0, Ll/du;->s:Ll/yo;

    .line 46
    .line 47
    iget-object p1, p0, Ll/du;->r:Lv/VList;

    .line 48
    .line 49
    invoke-virtual {p1, p3}, Lv/VList;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 50
    .line 51
    .line 52
    iget-object p1, p0, Ll/du;->s:Ll/yo;

    .line 53
    .line 54
    iget-object p3, p0, Ll/du;->q:Ll/uyh0;

    .line 55
    .line 56
    iget-object p3, p3, Ll/uyh0;->b:Ll/vg60;

    .line 57
    .line 58
    invoke-virtual {p1, p3}, Ll/yo;->w(Ll/vg60;)V

    .line 59
    .line 60
    .line 61
    const/high16 p1, 0x42800000    # 64.0f

    .line 62
    .line 63
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 64
    .line 65
    .line 66
    move-result p1

    .line 67
    iget-object p3, p0, Ll/du;->q:Ll/uyh0;

    .line 68
    .line 69
    iget-object p3, p3, Ll/uyh0;->b:Ll/vg60;

    .line 70
    .line 71
    iget-object p3, p3, Ll/vg60;->a:Ljava/util/List;

    .line 72
    .line 73
    invoke-interface {p3}, Ljava/util/List;->size()I

    .line 74
    .line 75
    .line 76
    move-result p3

    .line 77
    mul-int/2addr p3, p1

    .line 78
    iget-object p1, p0, Ll/du;->c:Lcom/flipboard/bottomsheet/BottomSheetLayout;

    .line 79
    .line 80
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 81
    .line 82
    .line 83
    move-result p1

    .line 84
    div-int/lit8 p1, p1, 0x2

    .line 85
    .line 86
    iget-object v1, p0, Ll/du;->r:Lv/VList;

    .line 87
    .line 88
    if-ge p3, p1, :cond_2

    .line 89
    .line 90
    new-instance p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 91
    .line 92
    invoke-direct {p1, v0, p3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 93
    .line 94
    .line 95
    invoke-virtual {v1, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 96
    .line 97
    .line 98
    iget-object p1, p0, Ll/du;->c:Lcom/flipboard/bottomsheet/BottomSheetLayout;

    .line 99
    .line 100
    int-to-float p3, p3

    .line 101
    invoke-virtual {p1, p3}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->setPeekSheetTranslation(F)V

    .line 102
    .line 103
    .line 104
    goto :goto_1

    .line 105
    :cond_2
    new-instance p3, Landroid/widget/FrameLayout$LayoutParams;

    .line 106
    .line 107
    const/4 v2, -0x2

    .line 108
    invoke-direct {p3, v0, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 109
    .line 110
    .line 111
    invoke-virtual {v1, p3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 112
    .line 113
    .line 114
    iget-object p3, p0, Ll/du;->c:Lcom/flipboard/bottomsheet/BottomSheetLayout;

    .line 115
    .line 116
    int-to-float p1, p1

    .line 117
    invoke-virtual {p3, p1}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->setPeekSheetTranslation(F)V

    .line 118
    .line 119
    .line 120
    :goto_1
    iget-object p1, p0, Ll/du;->c:Lcom/flipboard/bottomsheet/BottomSheetLayout;

    .line 121
    .line 122
    new-instance p3, Ll/cu;

    .line 123
    .line 124
    invoke-direct {p3, p0, p2}, Ll/cu;-><init>(Ll/du;Z)V

    .line 125
    .line 126
    .line 127
    invoke-virtual {p1, p3}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->m(Ll/qn50;)V

    .line 128
    .line 129
    .line 130
    iget-object p1, p0, Ll/du;->c:Lcom/flipboard/bottomsheet/BottomSheetLayout;

    .line 131
    .line 132
    iget-object p3, p0, Ll/du;->r:Lv/VList;

    .line 133
    .line 134
    invoke-virtual {p1, p3}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->C(Landroid/view/View;)V

    .line 135
    .line 136
    .line 137
    iget-object p1, p0, Ll/du;->b:Lcom/google/android/material/tabs/TabLayout;

    .line 138
    .line 139
    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    .line 140
    .line 141
    .line 142
    move-result p1

    .line 143
    const/16 p3, 0x8

    .line 144
    .line 145
    if-eq p1, p3, :cond_4

    .line 146
    .line 147
    iget-object p1, p0, Ll/du;->q:Ll/uyh0;

    .line 148
    .line 149
    iget-object p2, p0, Ll/du;->p:Ll/uyh0;

    .line 150
    .line 151
    if-ne p1, p2, :cond_3

    .line 152
    .line 153
    iget-object p1, p0, Ll/du;->t:Ll/l4g0;

    .line 154
    .line 155
    invoke-virtual {p1}, Ll/l4g0;->i()V

    .line 156
    .line 157
    .line 158
    iget-object p0, p0, Ll/du;->t:Ll/l4g0;

    .line 159
    .line 160
    invoke-virtual {p0}, Ll/l4g0;->l()V

    .line 161
    .line 162
    .line 163
    return-void

    .line 164
    :cond_3
    iget-object p1, p0, Ll/du;->u:Ll/l4g0;

    .line 165
    .line 166
    invoke-virtual {p1}, Ll/l4g0;->i()V

    .line 167
    .line 168
    .line 169
    iget-object p0, p0, Ll/du;->u:Ll/l4g0;

    .line 170
    .line 171
    invoke-virtual {p0}, Ll/l4g0;->l()V

    .line 172
    .line 173
    .line 174
    return-void

    .line 175
    :cond_4
    if-eqz p2, :cond_5

    .line 176
    .line 177
    iget-object p1, p0, Ll/du;->t:Ll/l4g0;

    .line 178
    .line 179
    invoke-virtual {p1}, Ll/l4g0;->i()V

    .line 180
    .line 181
    .line 182
    iget-object p0, p0, Ll/du;->t:Ll/l4g0;

    .line 183
    .line 184
    invoke-virtual {p0}, Ll/l4g0;->l()V

    .line 185
    .line 186
    .line 187
    return-void

    .line 188
    :cond_5
    iget-object p1, p0, Ll/du;->u:Ll/l4g0;

    .line 189
    .line 190
    invoke-virtual {p1}, Ll/l4g0;->i()V

    .line 191
    .line 192
    .line 193
    iget-object p0, p0, Ll/du;->u:Ll/l4g0;

    .line 194
    .line 195
    invoke-virtual {p0}, Ll/l4g0;->l()V

    .line 196
    .line 197
    .line 198
    return-void
.end method

.method public final G(Ll/uyh0;Ll/vg60;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/uyh0;",
            "Ll/vg60<",
            "Ll/ewi;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p1, Ll/uyh0;->c:Ll/ewi;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_2

    .line 8
    .line 9
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    iget-object p0, p2, Ll/vg60;->a:Ljava/util/List;

    .line 16
    .line 17
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-nez p0, :cond_1

    .line 22
    .line 23
    iget-object p0, p2, Ll/vg60;->a:Ljava/util/List;

    .line 24
    .line 25
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 30
    .line 31
    .line 32
    move-result p2

    .line 33
    if-eqz p2, :cond_1

    .line 34
    .line 35
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object p2

    .line 39
    check-cast p2, Ll/ewi;

    .line 40
    .line 41
    iget-object v0, p1, Ll/uyh0;->c:Ll/ewi;

    .line 42
    .line 43
    invoke-virtual {p2, v0}, Ll/ewi;->equals(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-eqz v0, :cond_0

    .line 48
    .line 49
    iput-object p2, p1, Ll/uyh0;->c:Ll/ewi;

    .line 50
    .line 51
    iget-object p0, p1, Ll/uyh0;->d:Ll/jic0;

    .line 52
    .line 53
    check-cast p0, Ll/kp;

    .line 54
    .line 55
    iget-object p1, p2, Ll/ewi;->c:Ll/vg60;

    .line 56
    .line 57
    invoke-virtual {p0, p1}, Ll/kp;->L(Ll/vg60;)V

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :cond_1
    const/4 p0, 0x0

    .line 62
    iput-object p0, p1, Ll/uyh0;->c:Ll/ewi;

    .line 63
    .line 64
    :cond_2
    return-void
.end method

.method public H(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Picture;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/du;->o:Ll/uyh0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/uyh0;->a:Ll/vg60;

    .line 4
    .line 5
    iget-object v0, v0, Ll/vg60;->a:Ljava/util/List;

    .line 6
    .line 7
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iget-object v1, p0, Ll/du;->o:Ll/uyh0;

    .line 12
    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    iget-object v0, v1, Ll/uyh0;->a:Ll/vg60;

    .line 16
    .line 17
    iget-object v0, v0, Ll/vg60;->a:Ljava/util/List;

    .line 18
    .line 19
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    iget-object v1, p0, Ll/du;->o:Ll/uyh0;

    .line 24
    .line 25
    iget-object v1, v1, Ll/uyh0;->a:Ll/vg60;

    .line 26
    .line 27
    iget-object v1, v1, Ll/vg60;->a:Ljava/util/List;

    .line 28
    .line 29
    invoke-interface {v1, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Ll/du;->o:Ll/uyh0;

    .line 33
    .line 34
    iget-object p0, p0, Ll/uyh0;->d:Ll/jic0;

    .line 35
    .line 36
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    invoke-virtual {p0, v0, p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemRangeInserted(II)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_0
    new-instance v0, Ll/vg60;

    .line 45
    .line 46
    new-instance v2, Ll/zt;

    .line 47
    .line 48
    invoke-direct {v2}, Ll/zt;-><init>()V

    .line 49
    .line 50
    .line 51
    invoke-static {p1, v2}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    const/4 v2, 0x0

    .line 56
    invoke-direct {v0, p1, v2}, Ll/vg60;-><init>(Ljava/util/List;Lcom/p1/mobile/putong/data/DbLinks;)V

    .line 57
    .line 58
    .line 59
    iput-object v0, v1, Ll/uyh0;->a:Ll/vg60;

    .line 60
    .line 61
    iget-object p0, p0, Ll/du;->o:Ll/uyh0;

    .line 62
    .line 63
    iget-object p1, p0, Ll/uyh0;->d:Ll/jic0;

    .line 64
    .line 65
    check-cast p1, Ll/kp;

    .line 66
    .line 67
    iget-object p0, p0, Ll/uyh0;->a:Ll/vg60;

    .line 68
    .line 69
    invoke-virtual {p1, p0}, Ll/kp;->L(Ll/vg60;)V

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method public I(Ll/vg60;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/vg60<",
            "Ll/ewi;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/du;->o:Ll/uyh0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/uyh0;->b:Ll/vg60;

    .line 4
    .line 5
    iget-object v0, v0, Ll/vg60;->a:Ljava/util/List;

    .line 6
    .line 7
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iget-object v1, p0, Ll/du;->o:Ll/uyh0;

    .line 12
    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    iget-object v0, v1, Ll/uyh0;->b:Ll/vg60;

    .line 16
    .line 17
    iget-object v0, v0, Ll/vg60;->a:Ljava/util/List;

    .line 18
    .line 19
    iget-object p1, p1, Ll/vg60;->a:Ljava/util/List;

    .line 20
    .line 21
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    iput-object p1, v1, Ll/uyh0;->b:Ll/vg60;

    .line 26
    .line 27
    invoke-virtual {p0, v1, p1}, Ll/du;->G(Ll/uyh0;Ll/vg60;)V

    .line 28
    .line 29
    .line 30
    :goto_0
    iget-object p1, p0, Ll/du;->q:Ll/uyh0;

    .line 31
    .line 32
    iget-object v0, p0, Ll/du;->o:Ll/uyh0;

    .line 33
    .line 34
    if-ne p1, v0, :cond_1

    .line 35
    .line 36
    iget-object p1, p0, Ll/du;->s:Ll/yo;

    .line 37
    .line 38
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    if-eqz p1, :cond_1

    .line 43
    .line 44
    iget-object p1, p0, Ll/du;->s:Ll/yo;

    .line 45
    .line 46
    iget-object p0, p0, Ll/du;->o:Ll/uyh0;

    .line 47
    .line 48
    iget-object p0, p0, Ll/uyh0;->b:Ll/vg60;

    .line 49
    .line 50
    invoke-virtual {p1, p0}, Ll/yo;->w(Ll/vg60;)V

    .line 51
    .line 52
    .line 53
    :cond_1
    return-void
.end method

.method public J(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Video;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/du;->p:Ll/uyh0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/uyh0;->a:Ll/vg60;

    .line 4
    .line 5
    iget-object v0, v0, Ll/vg60;->a:Ljava/util/List;

    .line 6
    .line 7
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iget-object v1, p0, Ll/du;->p:Ll/uyh0;

    .line 12
    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    iget-object v0, v1, Ll/uyh0;->a:Ll/vg60;

    .line 16
    .line 17
    iget-object v0, v0, Ll/vg60;->a:Ljava/util/List;

    .line 18
    .line 19
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    iget-object v1, p0, Ll/du;->p:Ll/uyh0;

    .line 24
    .line 25
    iget-object v1, v1, Ll/uyh0;->a:Ll/vg60;

    .line 26
    .line 27
    iget-object v1, v1, Ll/vg60;->a:Ljava/util/List;

    .line 28
    .line 29
    invoke-interface {v1, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Ll/du;->p:Ll/uyh0;

    .line 33
    .line 34
    iget-object p0, p0, Ll/uyh0;->d:Ll/jic0;

    .line 35
    .line 36
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    invoke-virtual {p0, v0, p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemRangeInserted(II)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_0
    new-instance v0, Ll/vg60;

    .line 45
    .line 46
    new-instance v2, Ll/bu;

    .line 47
    .line 48
    invoke-direct {v2}, Ll/bu;-><init>()V

    .line 49
    .line 50
    .line 51
    invoke-static {p1, v2}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    const/4 v2, 0x0

    .line 56
    invoke-direct {v0, p1, v2}, Ll/vg60;-><init>(Ljava/util/List;Lcom/p1/mobile/putong/data/DbLinks;)V

    .line 57
    .line 58
    .line 59
    iput-object v0, v1, Ll/uyh0;->a:Ll/vg60;

    .line 60
    .line 61
    iget-object p0, p0, Ll/du;->p:Ll/uyh0;

    .line 62
    .line 63
    iget-object p1, p0, Ll/uyh0;->d:Ll/jic0;

    .line 64
    .line 65
    check-cast p1, Ll/kp;

    .line 66
    .line 67
    iget-object p0, p0, Ll/uyh0;->a:Ll/vg60;

    .line 68
    .line 69
    invoke-virtual {p1, p0}, Ll/kp;->L(Ll/vg60;)V

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method public K(Ll/vg60;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/vg60<",
            "Ll/ewi;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/du;->p:Ll/uyh0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/uyh0;->b:Ll/vg60;

    .line 4
    .line 5
    iget-object v0, v0, Ll/vg60;->a:Ljava/util/List;

    .line 6
    .line 7
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iget-object v1, p0, Ll/du;->p:Ll/uyh0;

    .line 12
    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    iget-object v0, v1, Ll/uyh0;->b:Ll/vg60;

    .line 16
    .line 17
    iget-object v0, v0, Ll/vg60;->a:Ljava/util/List;

    .line 18
    .line 19
    iget-object p1, p1, Ll/vg60;->a:Ljava/util/List;

    .line 20
    .line 21
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    iput-object p1, v1, Ll/uyh0;->b:Ll/vg60;

    .line 26
    .line 27
    invoke-virtual {p0, v1, p1}, Ll/du;->G(Ll/uyh0;Ll/vg60;)V

    .line 28
    .line 29
    .line 30
    :goto_0
    iget-object p1, p0, Ll/du;->q:Ll/uyh0;

    .line 31
    .line 32
    iget-object v0, p0, Ll/du;->p:Ll/uyh0;

    .line 33
    .line 34
    if-ne p1, v0, :cond_1

    .line 35
    .line 36
    iget-object p1, p0, Ll/du;->s:Ll/yo;

    .line 37
    .line 38
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    if-eqz p1, :cond_1

    .line 43
    .line 44
    iget-object p1, p0, Ll/du;->s:Ll/yo;

    .line 45
    .line 46
    iget-object p0, p0, Ll/du;->p:Ll/uyh0;

    .line 47
    .line 48
    iget-object p0, p0, Ll/uyh0;->b:Ll/vg60;

    .line 49
    .line 50
    invoke-virtual {p1, p0}, Ll/yo;->w(Ll/vg60;)V

    .line 51
    .line 52
    .line 53
    :cond_1
    return-void
.end method

.method public L(Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ll/uyh0;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/du;->v:Ll/y20;

    .line 2
    .line 3
    return-void
.end method

.method public M(Ll/ewi;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/du;->q:Ll/uyh0;

    .line 2
    .line 3
    iput-object p1, p0, Ll/uyh0;->c:Ll/ewi;

    .line 4
    .line 5
    return-void
.end method

.method public N(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/du;->b:Lcom/google/android/material/tabs/TabLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/android/material/tabs/TabLayout;->getTabCount()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x2

    .line 8
    if-ne v0, v1, :cond_0

    .line 9
    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Ll/du;->b:Lcom/google/android/material/tabs/TabLayout;

    .line 13
    .line 14
    const/4 p1, 0x1

    .line 15
    invoke-virtual {p0, p1}, Lcom/google/android/material/tabs/TabLayout;->getTabAt(I)Lcom/google/android/material/tabs/TabLayout$Tab;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Lcom/google/android/material/tabs/TabLayout$Tab;->select()V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public O(Ll/uyh0;Ll/uyh0;Ll/uyh0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/du;->o:Ll/uyh0;

    .line 2
    .line 3
    iput-object p2, p0, Ll/du;->p:Ll/uyh0;

    .line 4
    .line 5
    iput-object p3, p0, Ll/du;->q:Ll/uyh0;

    .line 6
    .line 7
    return-void
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/du;->n:Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/xt;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/du;->n(Ll/xt;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/du;->m(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public m(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/eu;->b(Ll/du;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public n(Ll/xt;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/du;->l:Ll/xt;

    .line 2
    .line 3
    return-void
.end method

.method public p(ZLcom/p1/mobile/putong/data/Gender;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/du;->f:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    const/16 p1, 0x8

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public q()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/du;->o:Ll/uyh0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/uyh0;->a:Ll/vg60;

    .line 4
    .line 5
    iget-object v0, v0, Ll/vg60;->a:Ljava/util/List;

    .line 6
    .line 7
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Ll/du;->o:Ll/uyh0;

    .line 11
    .line 12
    iget-object p0, p0, Ll/uyh0;->b:Ll/vg60;

    .line 13
    .line 14
    iget-object p0, p0, Ll/vg60;->a:Ljava/util/List;

    .line 15
    .line 16
    invoke-interface {p0}, Ljava/util/List;->clear()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public s(Ll/ewi;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/du;->q:Ll/uyh0;

    .line 2
    .line 3
    iget-object v0, p0, Ll/uyh0;->d:Ll/jic0;

    .line 4
    .line 5
    check-cast v0, Ll/kp;

    .line 6
    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/uyh0;->a:Ll/vg60;

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object p0, p1, Ll/ewi;->c:Ll/vg60;

    .line 13
    .line 14
    :goto_0
    invoke-virtual {v0, p0}, Ll/kp;->L(Ll/vg60;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public u()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/du;->q:Ll/uyh0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/uyh0;->e:Landroidx/recyclerview/widget/RecyclerView;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->scrollToPosition(I)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Ll/du;->n:Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;

    .line 10
    .line 11
    new-instance v1, Ll/yt;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Ll/yt;-><init>(Ll/du;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->post(Ljava/lang/Runnable;)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Ll/du;->c:Lcom/flipboard/bottomsheet/BottomSheetLayout;

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->q()V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public v(Ll/vg60;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/vg60<",
            "Ll/ewi;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p1, Ll/vg60;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-lez v0, :cond_1

    .line 9
    .line 10
    iget-object p0, p0, Ll/du;->o:Ll/uyh0;

    .line 11
    .line 12
    iput-object p1, p0, Ll/uyh0;->b:Ll/vg60;

    .line 13
    .line 14
    iget-object v0, p0, Ll/uyh0;->c:Ll/ewi;

    .line 15
    .line 16
    if-nez v0, :cond_0

    .line 17
    .line 18
    iget-object p1, p1, Ll/vg60;->a:Ljava/util/List;

    .line 19
    .line 20
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    check-cast p1, Ll/ewi;

    .line 25
    .line 26
    iput-object p1, p0, Ll/uyh0;->c:Ll/ewi;

    .line 27
    .line 28
    :cond_0
    return-void

    .line 29
    :cond_1
    iget-object p0, p0, Ll/du;->e:Lv/VProgressBar;

    .line 30
    .line 31
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public w()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/du;->e:Lv/VProgressBar;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public x(Ll/vg60;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/vg60<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/du;->o:Ll/uyh0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/uyh0;->d:Ll/jic0;

    .line 4
    .line 5
    check-cast v0, Ll/kp;

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Ll/kp;->L(Ll/vg60;)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Ll/du;->e:Lv/VProgressBar;

    .line 11
    .line 12
    const/4 p1, 0x0

    .line 13
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public y(IZ)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/du;->j:Lv/VText;

    .line 2
    .line 3
    sget v1, Lcom/p1/mobile/putong/account/R$string;->p0:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/du;->j:Lv/VText;

    .line 9
    .line 10
    new-instance v1, Ll/au;

    .line 11
    .line 12
    invoke-direct {v1, p0, p1, p2}, Ll/au;-><init>(Ll/du;IZ)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public z(IIZIZLcom/p1/mobile/putong/data/Gender;ZZ)V
    .locals 14

    .line 1
    move/from16 v9, p4

    .line 2
    .line 3
    const/high16 v10, 0x40800000    # 4.0f

    .line 4
    .line 5
    const/4 v11, 0x1

    .line 6
    const/4 v12, 0x0

    .line 7
    if-lez p1, :cond_1

    .line 8
    .line 9
    iget-object v6, p0, Ll/du;->o:Ll/uyh0;

    .line 10
    .line 11
    new-instance v0, Ll/kp;

    .line 12
    .line 13
    sget v1, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;->C:I

    .line 14
    .line 15
    move/from16 v2, p2

    .line 16
    .line 17
    if-ne v2, v1, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    sget v1, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;->B:I

    .line 21
    .line 22
    :goto_0
    iget-object v3, p0, Ll/du;->n:Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;

    .line 23
    .line 24
    const-string v8, ""

    .line 25
    .line 26
    const/4 v2, 0x0

    .line 27
    move v4, p1

    .line 28
    move/from16 v5, p7

    .line 29
    .line 30
    move/from16 v7, p8

    .line 31
    .line 32
    invoke-direct/range {v0 .. v8}, Ll/kp;-><init>(IZLcom/p1/mobile/putong/app/PutongAct;IZLl/uyh0;ZLjava/lang/String;)V

    .line 33
    .line 34
    .line 35
    iput-object v0, v6, Ll/uyh0;->d:Ll/jic0;

    .line 36
    .line 37
    iget-object v0, p0, Ll/du;->o:Ll/uyh0;

    .line 38
    .line 39
    iget-object v1, p0, Ll/du;->n:Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;

    .line 40
    .line 41
    invoke-virtual {v1}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    sget v2, Ll/hec0;->H:I

    .line 46
    .line 47
    iget-object v3, p0, Ll/du;->d:Lv/VPager;

    .line 48
    .line 49
    invoke-virtual {v1, v2, v3, v12}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    check-cast v1, Landroidx/recyclerview/widget/RecyclerView;

    .line 54
    .line 55
    iput-object v1, v0, Ll/uyh0;->e:Landroidx/recyclerview/widget/RecyclerView;

    .line 56
    .line 57
    new-instance v0, Landroidx/recyclerview/widget/GridLayoutManager;

    .line 58
    .line 59
    invoke-virtual {p0}, Ll/du;->C0()Landroid/content/Context;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-direct {v0, v1, v9}, Landroidx/recyclerview/widget/GridLayoutManager;-><init>(Landroid/content/Context;I)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {v0, v11}, Landroidx/recyclerview/widget/LinearLayoutManager;->setSmoothScrollbarEnabled(Z)V

    .line 67
    .line 68
    .line 69
    iget-object v1, p0, Ll/du;->o:Ll/uyh0;

    .line 70
    .line 71
    iget-object v1, v1, Ll/uyh0;->e:Landroidx/recyclerview/widget/RecyclerView;

    .line 72
    .line 73
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 74
    .line 75
    .line 76
    iget-object v0, p0, Ll/du;->o:Ll/uyh0;

    .line 77
    .line 78
    iget-object v0, v0, Ll/uyh0;->e:Landroidx/recyclerview/widget/RecyclerView;

    .line 79
    .line 80
    new-instance v1, Ll/puf0;

    .line 81
    .line 82
    invoke-static {v10}, Ll/qa00;->d(F)I

    .line 83
    .line 84
    .line 85
    move-result v2

    .line 86
    invoke-direct {v1, v2, v9}, Ll/puf0;-><init>(II)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$n;)V

    .line 90
    .line 91
    .line 92
    iget-object v0, p0, Ll/du;->o:Ll/uyh0;

    .line 93
    .line 94
    iget-object v1, v0, Ll/uyh0;->e:Landroidx/recyclerview/widget/RecyclerView;

    .line 95
    .line 96
    iget-object v0, v0, Ll/uyh0;->d:Ll/jic0;

    .line 97
    .line 98
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 99
    .line 100
    .line 101
    :cond_1
    if-eqz p3, :cond_2

    .line 102
    .line 103
    iget-object v13, p0, Ll/du;->p:Ll/uyh0;

    .line 104
    .line 105
    new-instance v0, Ll/kp;

    .line 106
    .line 107
    sget v1, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;->C:I

    .line 108
    .line 109
    iget-object v3, p0, Ll/du;->n:Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;

    .line 110
    .line 111
    iget-object v6, p0, Ll/du;->o:Ll/uyh0;

    .line 112
    .line 113
    const-string v8, ""

    .line 114
    .line 115
    const/4 v2, 0x1

    .line 116
    move v4, p1

    .line 117
    move/from16 v5, p7

    .line 118
    .line 119
    move/from16 v7, p8

    .line 120
    .line 121
    invoke-direct/range {v0 .. v8}, Ll/kp;-><init>(IZLcom/p1/mobile/putong/app/PutongAct;IZLl/uyh0;ZLjava/lang/String;)V

    .line 122
    .line 123
    .line 124
    iput-object v0, v13, Ll/uyh0;->d:Ll/jic0;

    .line 125
    .line 126
    iget-object v0, p0, Ll/du;->p:Ll/uyh0;

    .line 127
    .line 128
    iget-object v1, p0, Ll/du;->n:Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;

    .line 129
    .line 130
    invoke-virtual {v1}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 131
    .line 132
    .line 133
    move-result-object v1

    .line 134
    sget v2, Ll/hec0;->H:I

    .line 135
    .line 136
    iget-object v3, p0, Ll/du;->d:Lv/VPager;

    .line 137
    .line 138
    invoke-virtual {v1, v2, v3, v12}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 139
    .line 140
    .line 141
    move-result-object v1

    .line 142
    check-cast v1, Landroidx/recyclerview/widget/RecyclerView;

    .line 143
    .line 144
    iput-object v1, v0, Ll/uyh0;->e:Landroidx/recyclerview/widget/RecyclerView;

    .line 145
    .line 146
    new-instance v0, Landroidx/recyclerview/widget/GridLayoutManager;

    .line 147
    .line 148
    invoke-virtual {p0}, Ll/du;->C0()Landroid/content/Context;

    .line 149
    .line 150
    .line 151
    move-result-object v1

    .line 152
    invoke-direct {v0, v1, v9}, Landroidx/recyclerview/widget/GridLayoutManager;-><init>(Landroid/content/Context;I)V

    .line 153
    .line 154
    .line 155
    invoke-virtual {v0, v11}, Landroidx/recyclerview/widget/LinearLayoutManager;->setSmoothScrollbarEnabled(Z)V

    .line 156
    .line 157
    .line 158
    iget-object v1, p0, Ll/du;->p:Ll/uyh0;

    .line 159
    .line 160
    iget-object v1, v1, Ll/uyh0;->e:Landroidx/recyclerview/widget/RecyclerView;

    .line 161
    .line 162
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 163
    .line 164
    .line 165
    iget-object v0, p0, Ll/du;->p:Ll/uyh0;

    .line 166
    .line 167
    iget-object v0, v0, Ll/uyh0;->e:Landroidx/recyclerview/widget/RecyclerView;

    .line 168
    .line 169
    new-instance v1, Ll/puf0;

    .line 170
    .line 171
    invoke-static {v10}, Ll/qa00;->d(F)I

    .line 172
    .line 173
    .line 174
    move-result v2

    .line 175
    invoke-direct {v1, v2, v9}, Ll/puf0;-><init>(II)V

    .line 176
    .line 177
    .line 178
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$n;)V

    .line 179
    .line 180
    .line 181
    iget-object v0, p0, Ll/du;->p:Ll/uyh0;

    .line 182
    .line 183
    iget-object v1, v0, Ll/uyh0;->e:Landroidx/recyclerview/widget/RecyclerView;

    .line 184
    .line 185
    iget-object v0, v0, Ll/uyh0;->d:Ll/jic0;

    .line 186
    .line 187
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 188
    .line 189
    .line 190
    :cond_2
    new-instance v0, Ll/mu;

    .line 191
    .line 192
    iget-object v3, p0, Ll/du;->o:Ll/uyh0;

    .line 193
    .line 194
    iget-object v4, p0, Ll/du;->p:Ll/uyh0;

    .line 195
    .line 196
    iget-object v5, p0, Ll/du;->n:Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;

    .line 197
    .line 198
    move v2, p1

    .line 199
    move/from16 v1, p3

    .line 200
    .line 201
    invoke-direct/range {v0 .. v5}, Ll/mu;-><init>(ZILl/uyh0;Ll/uyh0;Lcom/p1/mobile/android/app/Act;)V

    .line 202
    .line 203
    .line 204
    move v4, v2

    .line 205
    iget-object v1, p0, Ll/du;->d:Lv/VPager;

    .line 206
    .line 207
    invoke-virtual {v1, v0}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Ll/cf60;)V

    .line 208
    .line 209
    .line 210
    iget-object v0, p0, Ll/du;->b:Lcom/google/android/material/tabs/TabLayout;

    .line 211
    .line 212
    iget-object v1, p0, Ll/du;->d:Lv/VPager;

    .line 213
    .line 214
    invoke-virtual {v0, v1}, Lcom/google/android/material/tabs/TabLayout;->setupWithViewPager(Landroidx/viewpager/widget/ViewPager;)V

    .line 215
    .line 216
    .line 217
    iget-object v0, p0, Ll/du;->d:Lv/VPager;

    .line 218
    .line 219
    new-instance v1, Ll/du$a;

    .line 220
    .line 221
    move/from16 v2, p5

    .line 222
    .line 223
    move-object/from16 v3, p6

    .line 224
    .line 225
    invoke-direct {v1, p0, p1, v2, v3}, Ll/du$a;-><init>(Ll/du;IZLcom/p1/mobile/putong/data/Gender;)V

    .line 226
    .line 227
    .line 228
    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->d(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 229
    .line 230
    .line 231
    return-void
.end method
