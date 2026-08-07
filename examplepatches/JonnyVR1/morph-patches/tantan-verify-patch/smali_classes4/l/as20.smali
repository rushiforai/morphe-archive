.class public Ll/as20;
.super Lcom/p1/mobile/android/app/Act$w;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/android/app/Act$w<",
        "Lcom/p1/mobile/android/app/Act;",
        "Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;",
        ">;"
    }
.end annotation


# static fields
.field public static i:Ll/vxd0;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SV_USE_DUP_ID"
        }
    .end annotation
.end field

.field public static j:Ll/byd0;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SV_USE_DUP_ID"
        }
    .end annotation
.end field

.field public static final k:I

.field public static final l:I

.field public static final m:I

.field public static final n:I

.field public static final o:I

.field public static final p:I

.field public static final q:I

.field public static final r:I


# instance fields
.field public final a:Z

.field public b:Ll/zm4;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/zm4<",
            "Ll/kql;",
            ">;"
        }
    .end annotation
.end field

.field public c:Z

.field public d:Z

.field public e:Z

.field public f:Z

.field public g:F

.field public h:F


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Ll/vxd0;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "super_like_bubble_show_count_"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    const/4 v2, 0x0

    .line 26
    invoke-direct {v0, v1, v2}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 27
    .line 28
    .line 29
    sput-object v0, Ll/as20;->i:Ll/vxd0;

    .line 30
    .line 31
    new-instance v0, Ll/byd0;

    .line 32
    .line 33
    new-instance v1, Ljava/lang/StringBuilder;

    .line 34
    .line 35
    const-string v2, "super_like_bubble_show_date_"

    .line 36
    .line 37
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    const-wide/16 v2, 0x0

    .line 56
    .line 57
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    invoke-direct {v0, v1, v2}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 62
    .line 63
    .line 64
    sput-object v0, Ll/as20;->j:Ll/byd0;

    .line 65
    .line 66
    const/4 v0, 0x1

    .line 67
    sput v0, Ll/as20;->k:I

    .line 68
    .line 69
    const/16 v0, 0x168

    .line 70
    .line 71
    sput v0, Ll/as20;->l:I

    .line 72
    .line 73
    const/16 v0, 0x113

    .line 74
    .line 75
    sput v0, Ll/as20;->m:I

    .line 76
    .line 77
    const/16 v0, 0xdc

    .line 78
    .line 79
    sput v0, Ll/as20;->n:I

    .line 80
    .line 81
    const/16 v0, 0x96

    .line 82
    .line 83
    sput v0, Ll/as20;->o:I

    .line 84
    .line 85
    const/16 v0, 0x190

    .line 86
    .line 87
    sput v0, Ll/as20;->p:I

    .line 88
    .line 89
    const/16 v0, 0xeb

    .line 90
    .line 91
    sput v0, Ll/as20;->q:I

    .line 92
    .line 93
    const/16 v0, 0xf

    .line 94
    .line 95
    sput v0, Ll/as20;->r:I

    .line 96
    .line 97
    return-void
.end method

.method public constructor <init>(Ll/zm4;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/zm4<",
            "Ll/kql;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/android/app/Act$w;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/gra;->h3()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    iput-boolean v0, p0, Ll/as20;->a:Z

    .line 9
    .line 10
    const/4 v0, 0x1

    .line 11
    iput-boolean v0, p0, Ll/as20;->c:Z

    .line 12
    .line 13
    iput-boolean v0, p0, Ll/as20;->d:Z

    .line 14
    .line 15
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 18
    .line 19
    iget-object v0, v0, Ll/dkb;->W0:Ll/jxd0;

    .line 20
    .line 21
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Ljava/lang/Boolean;

    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    iput-boolean v0, p0, Ll/as20;->e:Z

    .line 32
    .line 33
    const/4 v0, 0x0

    .line 34
    iput-boolean v0, p0, Ll/as20;->f:Z

    .line 35
    .line 36
    const/high16 v0, -0x40800000    # -1.0f

    .line 37
    .line 38
    iput v0, p0, Ll/as20;->h:F

    .line 39
    .line 40
    iput-object p1, p0, Ll/as20;->b:Ll/zm4;

    .line 41
    .line 42
    return-void
.end method

.method private A()I
    .locals 2

    .line 1
    sget v0, Ll/as20;->m:I

    .line 2
    .line 3
    iget-boolean v1, p0, Ll/as20;->c:Z

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    sget v0, Ll/as20;->n:I

    .line 8
    .line 9
    :cond_0
    iget p0, p0, Ll/as20;->h:F

    .line 10
    .line 11
    const/high16 v1, -0x40800000    # -1.0f

    .line 12
    .line 13
    cmpl-float v1, p0, v1

    .line 14
    .line 15
    if-eqz v1, :cond_1

    .line 16
    .line 17
    int-to-float v0, v0

    .line 18
    mul-float/2addr p0, v0

    .line 19
    float-to-int p0, p0

    .line 20
    return p0

    .line 21
    :cond_1
    return v0
.end method

.method private C()I
    .locals 1

    .line 1
    iget p0, p0, Ll/as20;->h:F

    .line 2
    .line 3
    const/high16 v0, -0x40800000    # -1.0f

    .line 4
    .line 5
    cmpl-float v0, p0, v0

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    sget v0, Ll/as20;->r:I

    .line 10
    .line 11
    int-to-float v0, v0

    .line 12
    mul-float/2addr p0, v0

    .line 13
    float-to-int p0, p0

    .line 14
    return p0

    .line 15
    :cond_0
    sget p0, Ll/as20;->r:I

    .line 16
    .line 17
    return p0
.end method

.method private D()I
    .locals 1

    .line 1
    iget p0, p0, Ll/as20;->h:F

    .line 2
    .line 3
    const/high16 v0, -0x40800000    # -1.0f

    .line 4
    .line 5
    cmpl-float v0, p0, v0

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    sget v0, Ll/as20;->q:I

    .line 10
    .line 11
    int-to-float v0, v0

    .line 12
    mul-float/2addr p0, v0

    .line 13
    float-to-int p0, p0

    .line 14
    return p0

    .line 15
    :cond_0
    sget p0, Ll/as20;->q:I

    .line 16
    .line 17
    return p0
.end method

.method private E()I
    .locals 1

    .line 1
    iget p0, p0, Ll/as20;->h:F

    .line 2
    .line 3
    const/high16 v0, -0x40800000    # -1.0f

    .line 4
    .line 5
    cmpl-float v0, p0, v0

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    sget v0, Ll/as20;->p:I

    .line 10
    .line 11
    int-to-float v0, v0

    .line 12
    mul-float/2addr p0, v0

    .line 13
    float-to-int p0, p0

    .line 14
    return p0

    .line 15
    :cond_0
    sget p0, Ll/as20;->p:I

    .line 16
    .line 17
    return p0
.end method

.method public static I(Lcom/p1/mobile/putong/core/ui/PictureView;Lcom/p1/mobile/putong/core/ui/PictureView;)Lcom/p1/mobile/putong/core/ui/PictureView;
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/ui/PictureView;->m:Lv/VText;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->m:Lv/VText;

    .line 4
    .line 5
    invoke-virtual {v1}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p1, Lcom/p1/mobile/putong/core/ui/PictureView;->m:Lv/VText;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->m:Lv/VText;

    .line 15
    .line 16
    invoke-virtual {v1}, Landroid/view/View;->getVisibility()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p1, Lcom/p1/mobile/putong/core/ui/PictureView;->n:Lv/VImage;

    .line 24
    .line 25
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->n:Lv/VImage;

    .line 26
    .line 27
    invoke-virtual {v1}, Landroid/view/View;->getVisibility()I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p1, Lcom/p1/mobile/putong/core/ui/PictureView;->o:Lv/VText;

    .line 35
    .line 36
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->o:Lv/VText;

    .line 37
    .line 38
    invoke-virtual {v1}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p1, Lcom/p1/mobile/putong/core/ui/PictureView;->o:Lv/VText;

    .line 46
    .line 47
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->o:Lv/VText;

    .line 48
    .line 49
    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    invoke-virtual {v0, p0}, Landroid/view/View;->setVisibility(I)V

    .line 54
    .line 55
    .line 56
    return-object p1
.end method

.method private W(Ll/pf60;)Landroid/animation/Animator;
    .locals 53
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;",
            "Ll/q3m;",
            ">;)",
            "Landroid/animation/Animator;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v10, p1

    .line 4
    .line 5
    iget-object v1, v10, Ll/pf60;->b:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v1, Ll/q3m;

    .line 8
    .line 9
    invoke-interface {v1}, Ll/q3m;->c0()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    iget-object v2, v10, Ll/pf60;->b:Ljava/lang/Object;

    .line 14
    .line 15
    check-cast v2, Ll/q3m;

    .line 16
    .line 17
    invoke-interface {v2}, Ll/q3m;->e2()V

    .line 18
    .line 19
    .line 20
    iget-object v2, v10, Ll/pf60;->b:Ljava/lang/Object;

    .line 21
    .line 22
    check-cast v2, Ll/q3m;

    .line 23
    .line 24
    invoke-interface {v2}, Ll/t3m;->W()Landroidx/recyclerview/widget/RecyclerView;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-static {v2}, Ll/bnl0;->u(Landroid/view/View;)V

    .line 29
    .line 30
    .line 31
    iget-object v2, v10, Ll/pf60;->b:Ljava/lang/Object;

    .line 32
    .line 33
    check-cast v2, Ll/q3m;

    .line 34
    .line 35
    invoke-interface {v2}, Ll/q3m;->u2()Lcom/p1/mobile/putong/core/ui/profile/views/VPager_SquaredRefactor;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    const/4 v3, 0x0

    .line 40
    if-nez v2, :cond_0

    .line 41
    .line 42
    return-object v3

    .line 43
    :cond_0
    iget-object v2, v10, Ll/pf60;->b:Ljava/lang/Object;

    .line 44
    .line 45
    check-cast v2, Ll/q3m;

    .line 46
    .line 47
    invoke-interface {v2}, Ll/q3m;->u2()Lcom/p1/mobile/putong/core/ui/profile/views/VPager_SquaredRefactor;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    invoke-static {v2}, Ll/bnl0;->v(Landroid/view/View;)V

    .line 52
    .line 53
    .line 54
    iget-object v2, v10, Ll/pf60;->b:Ljava/lang/Object;

    .line 55
    .line 56
    check-cast v2, Ll/q3m;

    .line 57
    .line 58
    invoke-interface {v2}, Ll/q3m;->U0()Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    invoke-direct {v0}, Ll/as20;->A()I

    .line 63
    .line 64
    .line 65
    move-result v4

    .line 66
    const/16 v19, 0x0

    .line 67
    .line 68
    if-nez v2, :cond_3

    .line 69
    .line 70
    new-instance v0, Ljava/lang/RuntimeException;

    .line 71
    .line 72
    sget-object v2, Ljava/util/Locale;->CHINA:Ljava/util/Locale;

    .line 73
    .line 74
    iget-object v3, v10, Ll/pf60;->a:Ljava/lang/Object;

    .line 75
    .line 76
    check-cast v3, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;

    .line 77
    .line 78
    iget-object v3, v3, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->v2:Lcom/p1/mobile/putong/data/User;

    .line 79
    .line 80
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 81
    .line 82
    .line 83
    move-result v3

    .line 84
    if-eqz v3, :cond_1

    .line 85
    .line 86
    iget-object v3, v10, Ll/pf60;->a:Ljava/lang/Object;

    .line 87
    .line 88
    check-cast v3, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;

    .line 89
    .line 90
    iget-object v3, v3, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->v2:Lcom/p1/mobile/putong/data/User;

    .line 91
    .line 92
    iget-object v3, v3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 93
    .line 94
    goto :goto_0

    .line 95
    :cond_1
    const-string v3, "null"

    .line 96
    .line 97
    :goto_0
    iget-object v5, v10, Ll/pf60;->a:Ljava/lang/Object;

    .line 98
    .line 99
    check-cast v5, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;

    .line 100
    .line 101
    iget-object v5, v5, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->v2:Lcom/p1/mobile/putong/data/User;

    .line 102
    .line 103
    invoke-static {v5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 104
    .line 105
    .line 106
    move-result v5

    .line 107
    if-eqz v5, :cond_2

    .line 108
    .line 109
    iget-object v5, v10, Ll/pf60;->a:Ljava/lang/Object;

    .line 110
    .line 111
    check-cast v5, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;

    .line 112
    .line 113
    iget-object v5, v5, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->v2:Lcom/p1/mobile/putong/data/User;

    .line 114
    .line 115
    iget-object v5, v5, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 116
    .line 117
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 118
    .line 119
    .line 120
    move-result v19

    .line 121
    :cond_2
    invoke-static/range {v19 .. v19}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 122
    .line 123
    .line 124
    move-result-object v5

    .line 125
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 126
    .line 127
    .line 128
    move-result-object v1

    .line 129
    filled-new-array {v3, v5, v1}, [Ljava/lang/Object;

    .line 130
    .line 131
    .line 132
    move-result-object v1

    .line 133
    const-string v3, "\u5361\u7247\u5207\u6362\u52a8\u753b\u5f02\u5e38\uff1a\u7528\u6237ID\uff1a%s, \u56fe\u7247\u6570\u91cf\uff1a%d, \u5f53\u524d\u7d22\u5f15\uff1a%d"

    .line 134
    .line 135
    invoke-static {v2, v3, v1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object v1

    .line 139
    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 140
    .line 141
    .line 142
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 143
    .line 144
    .line 145
    invoke-static {v4}, Ll/gt0;->j(I)Landroid/animation/Animator;

    .line 146
    .line 147
    .line 148
    move-result-object v0

    .line 149
    return-object v0

    .line 150
    :cond_3
    iget-object v5, v10, Ll/pf60;->a:Ljava/lang/Object;

    .line 151
    .line 152
    check-cast v5, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;

    .line 153
    .line 154
    iget-object v5, v5, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->v2:Lcom/p1/mobile/putong/data/User;

    .line 155
    .line 156
    iget-object v5, v5, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 157
    .line 158
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 159
    .line 160
    .line 161
    move-result v5

    .line 162
    const/4 v6, 0x1

    .line 163
    if-gt v5, v1, :cond_4

    .line 164
    .line 165
    iget-object v1, v10, Ll/pf60;->a:Ljava/lang/Object;

    .line 166
    .line 167
    check-cast v1, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;

    .line 168
    .line 169
    iget-object v1, v1, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->v2:Lcom/p1/mobile/putong/data/User;

    .line 170
    .line 171
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 172
    .line 173
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 174
    .line 175
    .line 176
    move-result v1

    .line 177
    sub-int/2addr v1, v6

    .line 178
    :cond_4
    iget-object v5, v10, Ll/pf60;->a:Ljava/lang/Object;

    .line 179
    .line 180
    check-cast v5, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;

    .line 181
    .line 182
    iget-object v5, v5, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->v2:Lcom/p1/mobile/putong/data/User;

    .line 183
    .line 184
    invoke-virtual {v5, v1}, Lcom/p1/mobile/putong/data/User;->media(I)Lcom/p1/mobile/putong/data/Media;

    .line 185
    .line 186
    .line 187
    move-result-object v5

    .line 188
    iget-object v1, v10, Ll/pf60;->a:Ljava/lang/Object;

    .line 189
    .line 190
    check-cast v1, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;

    .line 191
    .line 192
    invoke-virtual {v1, v5}, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->v3(Lcom/p1/mobile/putong/data/Media;)V

    .line 193
    .line 194
    .line 195
    iget-object v1, v10, Ll/pf60;->a:Ljava/lang/Object;

    .line 196
    .line 197
    check-cast v1, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;

    .line 198
    .line 199
    new-instance v7, Ll/tr20;

    .line 200
    .line 201
    invoke-direct {v7, v0, v10, v5}, Ll/tr20;-><init>(Ll/as20;Ll/pf60;Lcom/p1/mobile/putong/data/Media;)V

    .line 202
    .line 203
    .line 204
    invoke-virtual {v1, v7}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 205
    .line 206
    .line 207
    iget-object v1, v10, Ll/pf60;->a:Ljava/lang/Object;

    .line 208
    .line 209
    check-cast v1, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;

    .line 210
    .line 211
    iget-object v1, v1, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->T:Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 212
    .line 213
    invoke-static {v1}, Ll/bnl0;->i0(Landroid/view/View;)Ll/bnl0$g;

    .line 214
    .line 215
    .line 216
    move-result-object v1

    .line 217
    move-object v7, v3

    .line 218
    move-object v3, v5

    .line 219
    invoke-static {v2}, Ll/bnl0;->i0(Landroid/view/View;)Ll/bnl0$g;

    .line 220
    .line 221
    .line 222
    move-result-object v5

    .line 223
    iget-object v8, v10, Ll/pf60;->a:Ljava/lang/Object;

    .line 224
    .line 225
    check-cast v8, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;

    .line 226
    .line 227
    iget-object v8, v8, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->T:Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 228
    .line 229
    iget-object v8, v8, Lcom/p1/mobile/putong/core/ui/PictureView;->b:Lv/VDraweeView;

    .line 230
    .line 231
    invoke-static {v8}, Ll/bnl0;->i0(Landroid/view/View;)Ll/bnl0$g;

    .line 232
    .line 233
    .line 234
    move-result-object v8

    .line 235
    iget v9, v1, Ll/bnl0$g;->b:I

    .line 236
    .line 237
    iget v11, v5, Ll/bnl0$g;->b:I

    .line 238
    .line 239
    move-object v12, v7

    .line 240
    sub-int v7, v9, v11

    .line 241
    .line 242
    iget-boolean v13, v0, Ll/as20;->c:Z

    .line 243
    .line 244
    if-eqz v13, :cond_5

    .line 245
    .line 246
    int-to-long v12, v4

    .line 247
    sub-int/2addr v9, v11

    .line 248
    int-to-float v9, v9

    .line 249
    new-array v11, v6, [F

    .line 250
    .line 251
    aput v9, v11, v19

    .line 252
    .line 253
    move-wide v15, v12

    .line 254
    const-string v12, "translationY"

    .line 255
    .line 256
    const-wide/16 v13, 0x0

    .line 257
    .line 258
    const/16 v17, 0x0

    .line 259
    .line 260
    move-object/from16 v18, v11

    .line 261
    .line 262
    move-object v11, v2

    .line 263
    invoke-static/range {v11 .. v18}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 264
    .line 265
    .line 266
    move-result-object v2

    .line 267
    move-object v12, v2

    .line 268
    check-cast v12, Landroid/animation/ObjectAnimator;

    .line 269
    .line 270
    iget-object v2, v10, Ll/pf60;->a:Ljava/lang/Object;

    .line 271
    .line 272
    move-object v9, v2

    .line 273
    check-cast v9, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;

    .line 274
    .line 275
    iget-object v9, v9, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->v2:Lcom/p1/mobile/putong/data/User;

    .line 276
    .line 277
    move-object v13, v2

    .line 278
    check-cast v13, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;

    .line 279
    .line 280
    iget-object v13, v13, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->T:Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 281
    .line 282
    check-cast v2, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;

    .line 283
    .line 284
    move/from16 v52, v4

    .line 285
    .line 286
    move-object v4, v1

    .line 287
    move-object v1, v9

    .line 288
    move-object v9, v2

    .line 289
    move-object v2, v11

    .line 290
    move/from16 v11, v52

    .line 291
    .line 292
    move-object/from16 v52, v13

    .line 293
    .line 294
    move v13, v6

    .line 295
    move-object v6, v8

    .line 296
    move-object/from16 v8, v52

    .line 297
    .line 298
    invoke-virtual/range {v0 .. v9}, Ll/as20;->x(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/ui/PictureView;Lcom/p1/mobile/putong/data/Media;Ll/bnl0$g;Ll/bnl0$g;Ll/bnl0$g;ILcom/p1/mobile/putong/core/ui/PictureView;Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;)Landroid/animation/ObjectAnimator;

    .line 299
    .line 300
    .line 301
    move-result-object v1

    .line 302
    goto :goto_1

    .line 303
    :cond_5
    move v11, v4

    .line 304
    move v13, v6

    .line 305
    move-object v4, v1

    .line 306
    move-object v1, v12

    .line 307
    :goto_1
    iget-object v6, v10, Ll/pf60;->b:Ljava/lang/Object;

    .line 308
    .line 309
    check-cast v6, Ll/q3m;

    .line 310
    .line 311
    invoke-interface {v6}, Ll/t3m;->q()Landroid/view/ViewGroup;

    .line 312
    .line 313
    .line 314
    move-result-object v6

    .line 315
    invoke-static {v6}, Ll/bnl0;->i0(Landroid/view/View;)Ll/bnl0$g;

    .line 316
    .line 317
    .line 318
    move-result-object v6

    .line 319
    iget-object v7, v10, Ll/pf60;->b:Ljava/lang/Object;

    .line 320
    .line 321
    check-cast v7, Ll/q3m;

    .line 322
    .line 323
    invoke-interface {v7}, Ll/q3m;->U()Ll/bnl0$g;

    .line 324
    .line 325
    .line 326
    move-result-object v7

    .line 327
    iget-object v8, v10, Ll/pf60;->a:Ljava/lang/Object;

    .line 328
    .line 329
    check-cast v8, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;

    .line 330
    .line 331
    iget-object v8, v8, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->F0:Lv/VFrame;

    .line 332
    .line 333
    invoke-static {v8}, Ll/bnl0;->i0(Landroid/view/View;)Ll/bnl0$g;

    .line 334
    .line 335
    .line 336
    move-result-object v8

    .line 337
    iget-object v9, v10, Ll/pf60;->b:Ljava/lang/Object;

    .line 338
    .line 339
    check-cast v9, Ll/q3m;

    .line 340
    .line 341
    invoke-interface {v9}, Ll/q3m;->R2()Landroid/view/View;

    .line 342
    .line 343
    .line 344
    move-result-object v9

    .line 345
    invoke-static {v9}, Ll/bnl0;->i0(Landroid/view/View;)Ll/bnl0$g;

    .line 346
    .line 347
    .line 348
    move-result-object v9

    .line 349
    iget v14, v6, Ll/bnl0$g;->d:I

    .line 350
    .line 351
    iget v7, v7, Ll/bnl0$g;->b:I

    .line 352
    .line 353
    iget v6, v6, Ll/bnl0$g;->b:I

    .line 354
    .line 355
    sub-int/2addr v7, v6

    .line 356
    sub-int/2addr v14, v7

    .line 357
    const/high16 v6, 0x41f00000    # 30.0f

    .line 358
    .line 359
    invoke-static {v6}, Ll/qa00;->d(F)I

    .line 360
    .line 361
    .line 362
    move-result v6

    .line 363
    add-int/2addr v14, v6

    .line 364
    iget-object v6, v10, Ll/pf60;->b:Ljava/lang/Object;

    .line 365
    .line 366
    check-cast v6, Ll/q3m;

    .line 367
    .line 368
    invoke-interface {v6}, Ll/q3m;->o0()Landroid/view/View;

    .line 369
    .line 370
    .line 371
    move-result-object v6

    .line 372
    invoke-static {v6}, Ll/bnl0;->i0(Landroid/view/View;)Ll/bnl0$g;

    .line 373
    .line 374
    .line 375
    move-result-object v6

    .line 376
    iget v6, v6, Ll/bnl0$g;->a:I

    .line 377
    .line 378
    iget-object v6, v10, Ll/pf60;->a:Ljava/lang/Object;

    .line 379
    .line 380
    check-cast v6, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;

    .line 381
    .line 382
    iget-object v6, v6, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->T:Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 383
    .line 384
    invoke-static {v6, v2}, Ll/as20;->I(Lcom/p1/mobile/putong/core/ui/PictureView;Lcom/p1/mobile/putong/core/ui/PictureView;)Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 385
    .line 386
    .line 387
    move-result-object v6

    .line 388
    move v15, v14

    .line 389
    int-to-long v13, v11

    .line 390
    invoke-virtual {v0, v2, v6}, Ll/as20;->H(Lcom/p1/mobile/putong/core/ui/PictureView;Lcom/p1/mobile/putong/core/ui/PictureView;)Landroid/animation/Animator;

    .line 391
    .line 392
    .line 393
    move-result-object v16

    .line 394
    iget-object v7, v10, Ll/pf60;->b:Ljava/lang/Object;

    .line 395
    .line 396
    check-cast v7, Ll/q3m;

    .line 397
    .line 398
    invoke-virtual {v0, v7, v11, v15}, Ll/as20;->G(Ll/q3m;II)Landroid/animation/Animator;

    .line 399
    .line 400
    .line 401
    move-result-object v18

    .line 402
    iget-object v7, v10, Ll/pf60;->b:Ljava/lang/Object;

    .line 403
    .line 404
    check-cast v7, Ll/q3m;

    .line 405
    .line 406
    invoke-virtual {v0, v7, v11, v15}, Ll/as20;->F(Ll/q3m;II)Landroid/animation/Animator;

    .line 407
    .line 408
    .line 409
    move-result-object v11

    .line 410
    iget-object v7, v10, Ll/pf60;->b:Ljava/lang/Object;

    .line 411
    .line 412
    check-cast v7, Ll/q3m;

    .line 413
    .line 414
    invoke-interface {v7}, Ll/q3m;->B2()Landroid/view/View;

    .line 415
    .line 416
    .line 417
    move-result-object v20

    .line 418
    move-object/from16 v17, v1

    .line 419
    .line 420
    const/4 v7, 0x1

    .line 421
    new-array v1, v7, [F

    .line 422
    .line 423
    const/16 v43, 0x0

    .line 424
    .line 425
    aput v43, v1, v19

    .line 426
    .line 427
    const-string v21, "alpha"

    .line 428
    .line 429
    const-wide/16 v22, 0x0

    .line 430
    .line 431
    const/16 v26, 0x0

    .line 432
    .line 433
    move-object/from16 v27, v1

    .line 434
    .line 435
    move-wide/from16 v24, v13

    .line 436
    .line 437
    invoke-static/range {v20 .. v27}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 438
    .line 439
    .line 440
    move-result-object v1

    .line 441
    iget-object v13, v10, Ll/pf60;->b:Ljava/lang/Object;

    .line 442
    .line 443
    check-cast v13, Ll/q3m;

    .line 444
    .line 445
    invoke-interface {v13}, Ll/q3m;->S1()Landroid/view/View;

    .line 446
    .line 447
    .line 448
    move-result-object v20

    .line 449
    new-array v13, v7, [F

    .line 450
    .line 451
    aput v43, v13, v19

    .line 452
    .line 453
    const-string v21, "alpha"

    .line 454
    .line 455
    move-object/from16 v27, v13

    .line 456
    .line 457
    invoke-static/range {v20 .. v27}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 458
    .line 459
    .line 460
    move-result-object v13

    .line 461
    iget-object v14, v10, Ll/pf60;->b:Ljava/lang/Object;

    .line 462
    .line 463
    check-cast v14, Ll/q3m;

    .line 464
    .line 465
    invoke-interface {v14}, Ll/q3m;->h2()Landroid/view/View;

    .line 466
    .line 467
    .line 468
    move-result-object v20

    .line 469
    new-array v14, v7, [F

    .line 470
    .line 471
    aput v43, v14, v19

    .line 472
    .line 473
    const-string v21, "alpha"

    .line 474
    .line 475
    move-object/from16 v27, v14

    .line 476
    .line 477
    invoke-static/range {v20 .. v27}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 478
    .line 479
    .line 480
    move-result-object v14

    .line 481
    iget-object v7, v10, Ll/pf60;->b:Ljava/lang/Object;

    .line 482
    .line 483
    check-cast v7, Ll/q3m;

    .line 484
    .line 485
    invoke-interface {v7}, Ll/q3m;->o0()Landroid/view/View;

    .line 486
    .line 487
    .line 488
    move-result-object v20

    .line 489
    sget-object v26, Ll/gt0;->f:Landroid/view/animation/Interpolator;

    .line 490
    .line 491
    move-object/from16 v28, v1

    .line 492
    .line 493
    const/4 v7, 0x1

    .line 494
    new-array v1, v7, [F

    .line 495
    .line 496
    aput v43, v1, v19

    .line 497
    .line 498
    const-string v21, "alpha"

    .line 499
    .line 500
    move-object/from16 v27, v1

    .line 501
    .line 502
    invoke-static/range {v20 .. v27}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 503
    .line 504
    .line 505
    move-result-object v1

    .line 506
    iget-object v7, v10, Ll/pf60;->b:Ljava/lang/Object;

    .line 507
    .line 508
    check-cast v7, Ll/q3m;

    .line 509
    .line 510
    invoke-interface {v7}, Ll/q3m;->J()Landroid/view/View;

    .line 511
    .line 512
    .line 513
    move-result-object v21

    .line 514
    move-object/from16 v29, v1

    .line 515
    .line 516
    const/4 v7, 0x1

    .line 517
    new-array v1, v7, [F

    .line 518
    .line 519
    aput v43, v1, v19

    .line 520
    .line 521
    move-object/from16 v20, v21

    .line 522
    .line 523
    const-string v21, "alpha"

    .line 524
    .line 525
    const/16 v26, 0x0

    .line 526
    .line 527
    move-object/from16 v27, v1

    .line 528
    .line 529
    invoke-static/range {v20 .. v27}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 530
    .line 531
    .line 532
    move-result-object v1

    .line 533
    move-wide/from16 v26, v24

    .line 534
    .line 535
    iget-boolean v7, v0, Ll/as20;->d:Z

    .line 536
    .line 537
    if-nez v7, :cond_6

    .line 538
    .line 539
    invoke-static {}, Ll/wkh0;->f()Z

    .line 540
    .line 541
    .line 542
    move-result v7

    .line 543
    if-eqz v7, :cond_7

    .line 544
    .line 545
    :cond_6
    move-object/from16 v40, v1

    .line 546
    .line 547
    move-object/from16 v39, v11

    .line 548
    .line 549
    move-object/from16 v38, v12

    .line 550
    .line 551
    goto :goto_2

    .line 552
    :cond_7
    iget-object v7, v10, Ll/pf60;->b:Ljava/lang/Object;

    .line 553
    .line 554
    check-cast v7, Ll/q3m;

    .line 555
    .line 556
    invoke-interface {v7}, Ll/q3m;->Q2()Landroid/view/View;

    .line 557
    .line 558
    .line 559
    move-result-object v30

    .line 560
    invoke-direct {v0}, Ll/as20;->D()I

    .line 561
    .line 562
    .line 563
    move-result v7

    .line 564
    move-object/from16 v39, v11

    .line 565
    .line 566
    move-object/from16 v38, v12

    .line 567
    .line 568
    int-to-long v11, v7

    .line 569
    move-object/from16 v40, v1

    .line 570
    .line 571
    const/4 v7, 0x1

    .line 572
    new-array v1, v7, [F

    .line 573
    .line 574
    aput v43, v1, v19

    .line 575
    .line 576
    const-string v31, "alpha"

    .line 577
    .line 578
    const-wide/16 v32, 0x0

    .line 579
    .line 580
    const/16 v36, 0x0

    .line 581
    .line 582
    move-object/from16 v37, v1

    .line 583
    .line 584
    move-wide/from16 v34, v11

    .line 585
    .line 586
    invoke-static/range {v30 .. v37}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 587
    .line 588
    .line 589
    move-result-object v1

    .line 590
    goto :goto_3

    .line 591
    :goto_2
    invoke-static/range {v19 .. v19}, Ll/gt0;->j(I)Landroid/animation/Animator;

    .line 592
    .line 593
    .line 594
    move-result-object v1

    .line 595
    :goto_3
    iget-object v11, v10, Ll/pf60;->b:Ljava/lang/Object;

    .line 596
    .line 597
    move-object/from16 v20, v11

    .line 598
    .line 599
    check-cast v20, Ll/q3m;

    .line 600
    .line 601
    invoke-direct {v0}, Ll/as20;->D()I

    .line 602
    .line 603
    .line 604
    move-result v22

    .line 605
    const/16 v23, 0x0

    .line 606
    .line 607
    const/16 v24, 0x0

    .line 608
    .line 609
    const/16 v21, 0x0

    .line 610
    .line 611
    move/from16 v25, v15

    .line 612
    .line 613
    invoke-static/range {v20 .. v25}, Ll/pza0;->e(Ll/q3m;IILandroid/view/animation/Interpolator;II)Landroid/animation/Animator;

    .line 614
    .line 615
    .line 616
    move-result-object v11

    .line 617
    iget-object v12, v10, Ll/pf60;->b:Ljava/lang/Object;

    .line 618
    .line 619
    check-cast v12, Ll/q3m;

    .line 620
    .line 621
    invoke-interface {v12}, Ll/q3m;->y1()Landroid/view/View;

    .line 622
    .line 623
    .line 624
    move-result-object v30

    .line 625
    invoke-direct {v0}, Ll/as20;->D()I

    .line 626
    .line 627
    .line 628
    move-result v12

    .line 629
    move-object v15, v8

    .line 630
    int-to-long v7, v12

    .line 631
    move-object/from16 v41, v1

    .line 632
    .line 633
    const/4 v12, 0x1

    .line 634
    new-array v1, v12, [F

    .line 635
    .line 636
    aput v43, v1, v19

    .line 637
    .line 638
    const-string v31, "alpha"

    .line 639
    .line 640
    const-wide/16 v32, 0x0

    .line 641
    .line 642
    const/16 v36, 0x0

    .line 643
    .line 644
    move-object/from16 v37, v1

    .line 645
    .line 646
    move-wide/from16 v34, v7

    .line 647
    .line 648
    invoke-static/range {v30 .. v37}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 649
    .line 650
    .line 651
    move-result-object v30

    .line 652
    iget-object v1, v10, Ll/pf60;->b:Ljava/lang/Object;

    .line 653
    .line 654
    check-cast v1, Ll/q3m;

    .line 655
    .line 656
    invoke-interface {v1}, Ll/q3m;->q2()Landroid/view/View;

    .line 657
    .line 658
    .line 659
    move-result-object v44

    .line 660
    invoke-direct {v0}, Ll/as20;->D()I

    .line 661
    .line 662
    .line 663
    move-result v1

    .line 664
    int-to-long v7, v1

    .line 665
    new-array v1, v12, [F

    .line 666
    .line 667
    aput v43, v1, v19

    .line 668
    .line 669
    const-string v45, "alpha"

    .line 670
    .line 671
    const-wide/16 v46, 0x0

    .line 672
    .line 673
    const/16 v50, 0x0

    .line 674
    .line 675
    move-object/from16 v51, v1

    .line 676
    .line 677
    move-wide/from16 v48, v7

    .line 678
    .line 679
    invoke-static/range {v44 .. v51}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 680
    .line 681
    .line 682
    move-result-object v31

    .line 683
    iget-object v1, v6, Lcom/p1/mobile/putong/core/ui/PictureView;->k:Landroid/widget/LinearLayout;

    .line 684
    .line 685
    new-array v8, v12, [F

    .line 686
    .line 687
    const/high16 v12, 0x3f800000    # 1.0f

    .line 688
    .line 689
    aput v12, v8, v19

    .line 690
    .line 691
    const-string v21, "alpha"

    .line 692
    .line 693
    const-wide/16 v22, 0x0

    .line 694
    .line 695
    move-wide/from16 v24, v26

    .line 696
    .line 697
    const/16 v26, 0x0

    .line 698
    .line 699
    move-object/from16 v20, v1

    .line 700
    .line 701
    move-object/from16 v27, v8

    .line 702
    .line 703
    invoke-static/range {v20 .. v27}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 704
    .line 705
    .line 706
    move-result-object v32

    .line 707
    iget-boolean v1, v0, Ll/as20;->c:Z

    .line 708
    .line 709
    if-eqz v1, :cond_8

    .line 710
    .line 711
    invoke-static/range {v19 .. v19}, Ll/gt0;->j(I)Landroid/animation/Animator;

    .line 712
    .line 713
    .line 714
    move-result-object v1

    .line 715
    move/from16 v20, v12

    .line 716
    .line 717
    const/4 v7, 0x1

    .line 718
    :goto_4
    move-object/from16 v33, v1

    .line 719
    .line 720
    goto :goto_5

    .line 721
    :cond_8
    sget-object v1, Ll/gt0;->i:Landroid/util/Property;

    .line 722
    .line 723
    iget v8, v4, Ll/bnl0$g;->c:I

    .line 724
    .line 725
    int-to-float v8, v8

    .line 726
    mul-float/2addr v8, v12

    .line 727
    iget v7, v5, Ll/bnl0$g;->c:I

    .line 728
    .line 729
    int-to-float v7, v7

    .line 730
    div-float/2addr v8, v7

    .line 731
    move/from16 v20, v12

    .line 732
    .line 733
    const/4 v7, 0x1

    .line 734
    new-array v12, v7, [F

    .line 735
    .line 736
    aput v8, v12, v19

    .line 737
    .line 738
    invoke-static {v2, v1, v12}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 739
    .line 740
    .line 741
    move-result-object v1

    .line 742
    goto :goto_4

    .line 743
    :goto_5
    iget-object v1, v6, Lcom/p1/mobile/putong/core/ui/PictureView;->o:Lv/VText;

    .line 744
    .line 745
    new-array v6, v7, [F

    .line 746
    .line 747
    aput v20, v6, v19

    .line 748
    .line 749
    const-string v21, "alpha"

    .line 750
    .line 751
    const-wide/16 v22, 0x0

    .line 752
    .line 753
    const/16 v26, 0x0

    .line 754
    .line 755
    move-object/from16 v20, v1

    .line 756
    .line 757
    move-object/from16 v27, v6

    .line 758
    .line 759
    invoke-static/range {v20 .. v27}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 760
    .line 761
    .line 762
    move-result-object v34

    .line 763
    move-wide/from16 v7, v24

    .line 764
    .line 765
    iget-boolean v1, v0, Ll/as20;->c:Z

    .line 766
    .line 767
    const-string v6, "translationX"

    .line 768
    .line 769
    if-eqz v1, :cond_9

    .line 770
    .line 771
    invoke-static/range {v19 .. v19}, Ll/gt0;->j(I)Landroid/animation/Animator;

    .line 772
    .line 773
    .line 774
    move-result-object v1

    .line 775
    :goto_6
    move-object/from16 v35, v1

    .line 776
    .line 777
    goto :goto_7

    .line 778
    :cond_9
    iget v1, v4, Ll/bnl0$g;->a:I

    .line 779
    .line 780
    iget v12, v5, Ll/bnl0$g;->a:I

    .line 781
    .line 782
    sub-int/2addr v1, v12

    .line 783
    int-to-float v1, v1

    .line 784
    move/from16 v20, v1

    .line 785
    .line 786
    const/4 v12, 0x1

    .line 787
    new-array v1, v12, [F

    .line 788
    .line 789
    aput v20, v1, v19

    .line 790
    .line 791
    invoke-static {v2, v6, v1}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    .line 792
    .line 793
    .line 794
    move-result-object v1

    .line 795
    goto :goto_6

    .line 796
    :goto_7
    iget-boolean v1, v0, Ll/as20;->c:Z

    .line 797
    .line 798
    const-string v12, "translationY"

    .line 799
    .line 800
    if-eqz v1, :cond_a

    .line 801
    .line 802
    invoke-static/range {v19 .. v19}, Ll/gt0;->j(I)Landroid/animation/Animator;

    .line 803
    .line 804
    .line 805
    move-result-object v1

    .line 806
    :goto_8
    move-object/from16 v36, v1

    .line 807
    .line 808
    goto :goto_9

    .line 809
    :cond_a
    iget v1, v4, Ll/bnl0$g;->b:I

    .line 810
    .line 811
    iget v4, v5, Ll/bnl0$g;->b:I

    .line 812
    .line 813
    sub-int/2addr v1, v4

    .line 814
    int-to-float v1, v1

    .line 815
    const/4 v4, 0x1

    .line 816
    new-array v5, v4, [F

    .line 817
    .line 818
    aput v1, v5, v19

    .line 819
    .line 820
    invoke-static {v2, v12, v5}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    .line 821
    .line 822
    .line 823
    move-result-object v1

    .line 824
    goto :goto_8

    .line 825
    :goto_9
    iget-boolean v1, v0, Ll/as20;->c:Z

    .line 826
    .line 827
    if-eqz v1, :cond_b

    .line 828
    .line 829
    move-object/from16 v37, v17

    .line 830
    .line 831
    goto :goto_a

    .line 832
    :cond_b
    invoke-static/range {v19 .. v19}, Ll/gt0;->j(I)Landroid/animation/Animator;

    .line 833
    .line 834
    .line 835
    move-result-object v1

    .line 836
    move-object/from16 v37, v1

    .line 837
    .line 838
    :goto_a
    iget-boolean v1, v0, Ll/as20;->c:Z

    .line 839
    .line 840
    if-eqz v1, :cond_c

    .line 841
    .line 842
    goto :goto_b

    .line 843
    :cond_c
    invoke-static/range {v19 .. v19}, Ll/gt0;->j(I)Landroid/animation/Animator;

    .line 844
    .line 845
    .line 846
    move-result-object v1

    .line 847
    move-object/from16 v38, v1

    .line 848
    .line 849
    :goto_b
    iget-object v1, v10, Ll/pf60;->b:Ljava/lang/Object;

    .line 850
    .line 851
    check-cast v1, Ll/q3m;

    .line 852
    .line 853
    invoke-interface {v1}, Ll/q3m;->o3()Landroid/view/View;

    .line 854
    .line 855
    .line 856
    move-result-object v1

    .line 857
    const/4 v4, 0x1

    .line 858
    new-array v5, v4, [F

    .line 859
    .line 860
    aput v43, v5, v19

    .line 861
    .line 862
    const-string v4, "alpha"

    .line 863
    .line 864
    invoke-static {v1, v4, v5}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    .line 865
    .line 866
    .line 867
    move-result-object v1

    .line 868
    iget-object v5, v10, Ll/pf60;->b:Ljava/lang/Object;

    .line 869
    .line 870
    check-cast v5, Ll/q3m;

    .line 871
    .line 872
    invoke-interface {v5}, Ll/q3m;->N3()Landroid/view/View;

    .line 873
    .line 874
    .line 875
    move-result-object v5

    .line 876
    move-object/from16 v20, v1

    .line 877
    .line 878
    move-object/from16 v17, v3

    .line 879
    .line 880
    const/4 v1, 0x1

    .line 881
    new-array v3, v1, [F

    .line 882
    .line 883
    aput v43, v3, v19

    .line 884
    .line 885
    invoke-static {v5, v4, v3}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    .line 886
    .line 887
    .line 888
    move-result-object v3

    .line 889
    iget-object v4, v10, Ll/pf60;->b:Ljava/lang/Object;

    .line 890
    .line 891
    check-cast v4, Ll/q3m;

    .line 892
    .line 893
    invoke-interface {v4}, Ll/q3m;->R2()Landroid/view/View;

    .line 894
    .line 895
    .line 896
    move-result-object v4

    .line 897
    iget v5, v15, Ll/bnl0$g;->a:I

    .line 898
    .line 899
    iget v1, v9, Ll/bnl0$g;->a:I

    .line 900
    .line 901
    sub-int/2addr v5, v1

    .line 902
    int-to-float v1, v5

    .line 903
    move/from16 v21, v1

    .line 904
    .line 905
    const/4 v5, 0x1

    .line 906
    new-array v1, v5, [F

    .line 907
    .line 908
    aput v21, v1, v19

    .line 909
    .line 910
    invoke-static {v4, v6, v1}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    .line 911
    .line 912
    .line 913
    move-result-object v1

    .line 914
    iget-object v4, v10, Ll/pf60;->b:Ljava/lang/Object;

    .line 915
    .line 916
    check-cast v4, Ll/q3m;

    .line 917
    .line 918
    invoke-interface {v4}, Ll/q3m;->R2()Landroid/view/View;

    .line 919
    .line 920
    .line 921
    move-result-object v4

    .line 922
    iget v6, v15, Ll/bnl0$g;->b:I

    .line 923
    .line 924
    iget v9, v9, Ll/bnl0$g;->b:I

    .line 925
    .line 926
    sub-int/2addr v6, v9

    .line 927
    int-to-float v6, v6

    .line 928
    new-array v9, v5, [F

    .line 929
    .line 930
    aput v6, v9, v19

    .line 931
    .line 932
    invoke-static {v4, v12, v9}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    .line 933
    .line 934
    .line 935
    move-result-object v42

    .line 936
    move-object/from16 v24, v13

    .line 937
    .line 938
    move-object/from16 v25, v14

    .line 939
    .line 940
    move-object/from16 v21, v18

    .line 941
    .line 942
    move-object/from16 v23, v28

    .line 943
    .line 944
    move-object/from16 v26, v29

    .line 945
    .line 946
    move-object/from16 v22, v39

    .line 947
    .line 948
    move-object/from16 v27, v40

    .line 949
    .line 950
    move-object/from16 v28, v41

    .line 951
    .line 952
    move-object/from16 v41, v1

    .line 953
    .line 954
    move-object/from16 v40, v3

    .line 955
    .line 956
    move-object/from16 v29, v11

    .line 957
    .line 958
    move-object/from16 v39, v20

    .line 959
    .line 960
    move-object/from16 v20, v16

    .line 961
    .line 962
    filled-new-array/range {v20 .. v42}, [Landroid/animation/Animator;

    .line 963
    .line 964
    .line 965
    move-result-object v1

    .line 966
    invoke-static {v7, v8, v1}, Ll/gt0;->x(J[Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 967
    .line 968
    .line 969
    move-result-object v8

    .line 970
    iget-object v1, v2, Lcom/p1/mobile/putong/core/ui/PictureView;->C:Landroid/widget/ImageView;

    .line 971
    .line 972
    const/16 v3, 0x8

    .line 973
    .line 974
    invoke-virtual {v1, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 975
    .line 976
    .line 977
    iget-object v1, v10, Ll/pf60;->b:Ljava/lang/Object;

    .line 978
    .line 979
    check-cast v1, Ll/q3m;

    .line 980
    .line 981
    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 982
    .line 983
    .line 984
    new-instance v3, Ll/o2h0;

    .line 985
    .line 986
    invoke-direct {v3, v1}, Ll/o2h0;-><init>(Ll/q3m;)V

    .line 987
    .line 988
    .line 989
    invoke-static {v8, v3}, Ll/gt0;->v(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 990
    .line 991
    .line 992
    move-object v11, v2

    .line 993
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 994
    .line 995
    .line 996
    move-result-wide v2

    .line 997
    iget-boolean v1, v0, Ll/as20;->d:Z

    .line 998
    .line 999
    if-eqz v1, :cond_d

    .line 1000
    .line 1001
    iget-object v1, v10, Ll/pf60;->b:Ljava/lang/Object;

    .line 1002
    .line 1003
    check-cast v1, Ll/q3m;

    .line 1004
    .line 1005
    invoke-interface {v1}, Ll/q3m;->Q2()Landroid/view/View;

    .line 1006
    .line 1007
    .line 1008
    move-result-object v20

    .line 1009
    invoke-direct {v0}, Ll/as20;->D()I

    .line 1010
    .line 1011
    .line 1012
    move-result v1

    .line 1013
    div-int/lit8 v1, v1, 0x2

    .line 1014
    .line 1015
    int-to-long v12, v1

    .line 1016
    const/4 v7, 0x1

    .line 1017
    new-array v1, v7, [F

    .line 1018
    .line 1019
    aput v43, v1, v19

    .line 1020
    .line 1021
    const-string v21, "alpha"

    .line 1022
    .line 1023
    const-wide/16 v22, 0x0

    .line 1024
    .line 1025
    const/16 v26, 0x0

    .line 1026
    .line 1027
    move-object/from16 v27, v1

    .line 1028
    .line 1029
    move-wide/from16 v24, v12

    .line 1030
    .line 1031
    invoke-static/range {v20 .. v27}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 1032
    .line 1033
    .line 1034
    move-result-object v1

    .line 1035
    invoke-virtual {v1}, Landroid/animation/Animator;->start()V

    .line 1036
    .line 1037
    .line 1038
    :cond_d
    invoke-static {}, Ll/wkh0;->f()Z

    .line 1039
    .line 1040
    .line 1041
    move-result v1

    .line 1042
    if-eqz v1, :cond_e

    .line 1043
    .line 1044
    iget-object v1, v10, Ll/pf60;->b:Ljava/lang/Object;

    .line 1045
    .line 1046
    check-cast v1, Ll/q3m;

    .line 1047
    .line 1048
    invoke-interface {v1}, Ll/q3m;->H1()Landroid/view/View;

    .line 1049
    .line 1050
    .line 1051
    move-result-object v20

    .line 1052
    invoke-direct {v0}, Ll/as20;->D()I

    .line 1053
    .line 1054
    .line 1055
    move-result v1

    .line 1056
    div-int/lit8 v1, v1, 0x2

    .line 1057
    .line 1058
    int-to-long v4, v1

    .line 1059
    const/4 v7, 0x1

    .line 1060
    new-array v1, v7, [F

    .line 1061
    .line 1062
    aput v43, v1, v19

    .line 1063
    .line 1064
    const-string v21, "alpha"

    .line 1065
    .line 1066
    const-wide/16 v22, 0x0

    .line 1067
    .line 1068
    const/16 v26, 0x0

    .line 1069
    .line 1070
    move-object/from16 v27, v1

    .line 1071
    .line 1072
    move-wide/from16 v24, v4

    .line 1073
    .line 1074
    invoke-static/range {v20 .. v27}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 1075
    .line 1076
    .line 1077
    move-result-object v1

    .line 1078
    invoke-virtual {v1}, Landroid/animation/Animator;->start()V

    .line 1079
    .line 1080
    .line 1081
    :cond_e
    iget-object v1, v10, Ll/pf60;->b:Ljava/lang/Object;

    .line 1082
    .line 1083
    check-cast v1, Ll/q3m;

    .line 1084
    .line 1085
    invoke-interface {v1}, Ll/q3m;->C3()Landroid/view/View;

    .line 1086
    .line 1087
    .line 1088
    move-result-object v1

    .line 1089
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 1090
    .line 1091
    .line 1092
    move-result v1

    .line 1093
    if-eqz v1, :cond_f

    .line 1094
    .line 1095
    iget-object v1, v10, Ll/pf60;->b:Ljava/lang/Object;

    .line 1096
    .line 1097
    check-cast v1, Ll/q3m;

    .line 1098
    .line 1099
    invoke-interface {v1}, Ll/q3m;->C3()Landroid/view/View;

    .line 1100
    .line 1101
    .line 1102
    move-result-object v20

    .line 1103
    invoke-direct {v0}, Ll/as20;->D()I

    .line 1104
    .line 1105
    .line 1106
    move-result v1

    .line 1107
    div-int/lit8 v1, v1, 0x2

    .line 1108
    .line 1109
    int-to-long v4, v1

    .line 1110
    const/4 v7, 0x1

    .line 1111
    new-array v1, v7, [F

    .line 1112
    .line 1113
    aput v43, v1, v19

    .line 1114
    .line 1115
    const-string v21, "alpha"

    .line 1116
    .line 1117
    const-wide/16 v22, 0x0

    .line 1118
    .line 1119
    const/16 v26, 0x0

    .line 1120
    .line 1121
    move-object/from16 v27, v1

    .line 1122
    .line 1123
    move-wide/from16 v24, v4

    .line 1124
    .line 1125
    invoke-static/range {v20 .. v27}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 1126
    .line 1127
    .line 1128
    move-result-object v1

    .line 1129
    invoke-virtual {v1}, Landroid/animation/Animator;->start()V

    .line 1130
    .line 1131
    .line 1132
    :cond_f
    new-instance v0, Ll/ur20;

    .line 1133
    .line 1134
    move-object/from16 v1, p0

    .line 1135
    .line 1136
    move-object v4, v10

    .line 1137
    move-object v6, v11

    .line 1138
    move-object/from16 v5, v17

    .line 1139
    .line 1140
    invoke-direct/range {v0 .. v6}, Ll/ur20;-><init>(Ll/as20;JLl/pf60;Lcom/p1/mobile/putong/data/Media;Lcom/p1/mobile/putong/core/ui/PictureView;)V

    .line 1141
    .line 1142
    .line 1143
    invoke-static {v8, v0}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 1144
    .line 1145
    .line 1146
    move-result-object v0

    .line 1147
    const/16 v1, 0xa

    .line 1148
    .line 1149
    invoke-static {v1}, Ll/gt0;->j(I)Landroid/animation/Animator;

    .line 1150
    .line 1151
    .line 1152
    move-result-object v1

    .line 1153
    filled-new-array {v0, v1}, [Landroid/animation/Animator;

    .line 1154
    .line 1155
    .line 1156
    move-result-object v0

    .line 1157
    invoke-static {v0}, Ll/gt0;->s([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 1158
    .line 1159
    .line 1160
    move-result-object v0

    .line 1161
    return-object v0
.end method

.method public static synthetic i()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic j(Ll/as20;Ll/pf60;Lcom/p1/mobile/putong/data/Media;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/as20;->R(Ll/pf60;Lcom/p1/mobile/putong/data/Media;)V

    return-void
.end method

.method public static synthetic k(Ll/as20;Ll/pf60;Lcom/p1/mobile/putong/data/Media;Lcom/p1/mobile/putong/core/ui/PictureView;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/as20;->Q(Ll/pf60;Lcom/p1/mobile/putong/data/Media;Lcom/p1/mobile/putong/core/ui/PictureView;Lcom/p1/mobile/android/app/Act;)V

    return-void
.end method

.method public static synthetic l(Ll/as20;JLl/pf60;Lcom/p1/mobile/putong/data/Media;Lcom/p1/mobile/putong/core/ui/PictureView;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Ll/as20;->T(JLl/pf60;Lcom/p1/mobile/putong/data/Media;Lcom/p1/mobile/putong/core/ui/PictureView;)V

    return-void
.end method

.method public static synthetic m(Ll/pf60;Lcom/p1/mobile/android/app/Act;[I)V
    .locals 20

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    invoke-static {}, Ll/bnl0;->y0()I

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    const/high16 v3, 0x42700000    # 60.0f

    .line 10
    .line 11
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 12
    .line 13
    .line 14
    move-result v3

    .line 15
    sub-int/2addr v2, v3

    .line 16
    invoke-static {}, Ll/fcp;->y()Z

    .line 17
    .line 18
    .line 19
    move-result v3

    .line 20
    if-nez v3, :cond_1

    .line 21
    .line 22
    invoke-static {}, Ll/d79;->V()Z

    .line 23
    .line 24
    .line 25
    move-result v3

    .line 26
    if-eqz v3, :cond_0

    .line 27
    .line 28
    goto :goto_1

    .line 29
    :cond_0
    :goto_0
    move v15, v2

    .line 30
    goto :goto_2

    .line 31
    :cond_1
    :goto_1
    const/4 v2, 0x2

    .line 32
    new-array v3, v2, [I

    .line 33
    .line 34
    iget-object v4, v0, Ll/pf60;->b:Ljava/lang/Object;

    .line 35
    .line 36
    check-cast v4, Ll/q3m;

    .line 37
    .line 38
    invoke-interface {v4}, Ll/q3m;->S1()Landroid/view/View;

    .line 39
    .line 40
    .line 41
    move-result-object v4

    .line 42
    invoke-virtual {v4, v3}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 43
    .line 44
    .line 45
    const/4 v4, 0x0

    .line 46
    aget v3, v3, v4

    .line 47
    .line 48
    const/high16 v4, 0x42180000    # 38.0f

    .line 49
    .line 50
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 51
    .line 52
    .line 53
    move-result v4

    .line 54
    add-int/2addr v3, v4

    .line 55
    mul-int/2addr v3, v2

    .line 56
    const/high16 v2, 0x41a00000    # 20.0f

    .line 57
    .line 58
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 59
    .line 60
    .line 61
    move-result v2

    .line 62
    sub-int v2, v3, v2

    .line 63
    .line 64
    goto :goto_0

    .line 65
    :goto_2
    iget-object v2, v0, Ll/pf60;->b:Ljava/lang/Object;

    .line 66
    .line 67
    check-cast v2, Ll/q3m;

    .line 68
    .line 69
    invoke-interface {v2}, Ll/t3m;->q()Landroid/view/ViewGroup;

    .line 70
    .line 71
    .line 72
    move-result-object v3

    .line 73
    iget-object v0, v0, Ll/pf60;->b:Ljava/lang/Object;

    .line 74
    .line 75
    check-cast v0, Ll/q3m;

    .line 76
    .line 77
    invoke-interface {v0}, Ll/q3m;->S1()Landroid/view/View;

    .line 78
    .line 79
    .line 80
    move-result-object v4

    .line 81
    sget v0, Ll/dbc0;->f:I

    .line 82
    .line 83
    invoke-virtual {v1, v0}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 84
    .line 85
    .line 86
    move-result-object v5

    .line 87
    sget v0, Lcom/p1/mobile/putong/core/R$string;->Vk:I

    .line 88
    .line 89
    invoke-virtual {v1, v0}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v6

    .line 93
    new-instance v19, Ll/qr20;

    .line 94
    .line 95
    invoke-direct/range {v19 .. v19}, Ll/qr20;-><init>()V

    .line 96
    .line 97
    .line 98
    const/4 v7, -0x1

    .line 99
    const/16 v8, 0xe

    .line 100
    .line 101
    const/16 v9, 0x11

    .line 102
    .line 103
    const/16 v10, 0xbb8

    .line 104
    .line 105
    const/4 v11, 0x0

    .line 106
    const/4 v12, 0x0

    .line 107
    const/4 v13, 0x0

    .line 108
    const/4 v14, 0x0

    .line 109
    const/16 v16, 0x11

    .line 110
    .line 111
    const/16 v17, 0x0

    .line 112
    .line 113
    const/16 v18, 0x0

    .line 114
    .line 115
    invoke-static/range {v3 .. v19}, Ll/qnp0;->b1(Landroid/view/ViewGroup;Landroid/view/View;Landroid/graphics/drawable/Drawable;Ljava/lang/CharSequence;IIIIIIIIIIIZLl/x20;)Landroid/view/View;

    .line 116
    .line 117
    .line 118
    return-void
.end method

.method public static synthetic n(Ll/as20;Lcom/p1/mobile/putong/core/ui/PictureView;Ll/bnl0$g;Ll/bnl0$g;ZFFZ[FLandroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p9}, Ll/as20;->M(Lcom/p1/mobile/putong/core/ui/PictureView;Ll/bnl0$g;Ll/bnl0$g;ZFFZ[FLandroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static synthetic o(Ll/as20;Ll/pf60;Lcom/p1/mobile/putong/data/Media;Lcom/p1/mobile/putong/core/ui/PictureView;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/as20;->S(Ll/pf60;Lcom/p1/mobile/putong/data/Media;Lcom/p1/mobile/putong/core/ui/PictureView;)V

    return-void
.end method

.method public static synthetic p(Ll/as20;Ll/pf60;Lcom/p1/mobile/putong/data/Media;Lcom/p1/mobile/putong/core/ui/PictureView;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/as20;->P(Ll/pf60;Lcom/p1/mobile/putong/data/Media;Lcom/p1/mobile/putong/core/ui/PictureView;Lcom/p1/mobile/android/app/Act;)V

    return-void
.end method

.method public static synthetic q(Ll/as20;Ll/pf60;Lcom/p1/mobile/putong/data/Media;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/as20;->O(Ll/pf60;Lcom/p1/mobile/putong/data/Media;)V

    return-void
.end method

.method public static synthetic r(Ll/as20;Lcom/p1/mobile/putong/core/ui/PictureView;Ll/bnl0$g;Ll/bnl0$g;ZFFZ[FLandroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p9}, Ll/as20;->N(Lcom/p1/mobile/putong/core/ui/PictureView;Ll/bnl0$g;Ll/bnl0$g;ZFFZ[FLandroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static bridge synthetic s(Ll/as20;Ll/pf60;)Landroid/animation/Animator;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/as20;->W(Ll/pf60;)Landroid/animation/Animator;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final B(Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;)Ll/q3m;
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->a3()Ll/q3m;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final F(Ll/q3m;II)Landroid/animation/Animator;
    .locals 10

    .line 1
    const/4 p0, 0x0

    .line 2
    invoke-static {p0}, Ll/gt0;->j(I)Landroid/animation/Animator;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    invoke-static {}, Ll/fcp;->y()Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    invoke-interface {p1}, Ll/q3m;->W2()Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    sget p1, Ll/as20;->r:I

    .line 17
    .line 18
    int-to-long v4, p1

    .line 19
    int-to-long v6, p2

    .line 20
    sget-object v8, Ll/gt0;->f:Landroid/view/animation/Interpolator;

    .line 21
    .line 22
    int-to-float p1, p3

    .line 23
    const/4 p2, 0x1

    .line 24
    new-array v9, p2, [F

    .line 25
    .line 26
    aput p1, v9, p0

    .line 27
    .line 28
    const-string v3, "translationY"

    .line 29
    .line 30
    invoke-static/range {v2 .. v9}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    return-object p0

    .line 35
    :cond_0
    return-object v0
.end method

.method public final G(Ll/q3m;II)Landroid/animation/Animator;
    .locals 1

    .line 1
    const/4 p0, 0x0

    .line 2
    invoke-static {p0}, Ll/gt0;->j(I)Landroid/animation/Animator;

    .line 3
    .line 4
    .line 5
    move-result-object p2

    .line 6
    invoke-interface {p1}, Ll/q3m;->F()Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object p3

    .line 10
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result p3

    .line 14
    if-eqz p3, :cond_1

    .line 15
    .line 16
    invoke-interface {p1}, Ll/q3m;->F()Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object p3

    .line 20
    invoke-virtual {p3}, Landroid/view/View;->getAlpha()F

    .line 21
    .line 22
    .line 23
    move-result p3

    .line 24
    const/high16 v0, 0x3f800000    # 1.0f

    .line 25
    .line 26
    cmpg-float p3, p3, v0

    .line 27
    .line 28
    if-gez p3, :cond_0

    .line 29
    .line 30
    invoke-interface {p1}, Ll/q3m;->F()Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-static {p1, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 35
    .line 36
    .line 37
    invoke-static {p0}, Ll/gt0;->j(I)Landroid/animation/Animator;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    return-object p0

    .line 42
    :cond_0
    invoke-interface {p1}, Ll/q3m;->F()Landroid/view/View;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-virtual {p0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move-result p3

    .line 54
    if-eqz p3, :cond_1

    .line 55
    .line 56
    invoke-virtual {p0}, Landroid/view/ViewPropertyAnimator;->cancel()V

    .line 57
    .line 58
    .line 59
    :cond_1
    invoke-interface {p1}, Ll/q3m;->F()Landroid/view/View;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    return-object p2
.end method

.method public final H(Lcom/p1/mobile/putong/core/ui/PictureView;Lcom/p1/mobile/putong/core/ui/PictureView;)Landroid/animation/Animator;
    .locals 17

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {v0}, Ll/gt0;->j(I)Landroid/animation/Animator;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    move-object/from16 v1, p0

    .line 7
    .line 8
    iget-boolean v2, v1, Ll/as20;->c:Z

    .line 9
    .line 10
    if-eqz v2, :cond_0

    .line 11
    .line 12
    invoke-virtual/range {p1 .. p1}, Lcom/p1/mobile/putong/core/ui/PictureView;->getVideoDisplayView()Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v3

    .line 16
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    if-eqz v2, :cond_0

    .line 21
    .line 22
    invoke-static {v3}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    if-eqz v2, :cond_0

    .line 27
    .line 28
    invoke-virtual/range {p1 .. p1}, Lcom/p1/mobile/putong/core/ui/PictureView;->U()V

    .line 29
    .line 30
    .line 31
    invoke-direct {v1}, Ll/as20;->E()I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    int-to-long v7, v0

    .line 36
    sget-object v15, Ll/gt0;->f:Landroid/view/animation/Interpolator;

    .line 37
    .line 38
    const/4 v0, 0x2

    .line 39
    new-array v10, v0, [F

    .line 40
    .line 41
    fill-array-data v10, :array_0

    .line 42
    .line 43
    .line 44
    const-string v4, "alpha"

    .line 45
    .line 46
    const-wide/16 v5, 0x0

    .line 47
    .line 48
    move-object v9, v15

    .line 49
    invoke-static/range {v3 .. v10}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    move-object/from16 v3, p2

    .line 54
    .line 55
    iget-object v9, v3, Lcom/p1/mobile/putong/core/ui/PictureView;->a:Lv/VDraweeView;

    .line 56
    .line 57
    invoke-direct {v1}, Ll/as20;->E()I

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    int-to-long v13, v1

    .line 62
    new-array v0, v0, [F

    .line 63
    .line 64
    fill-array-data v0, :array_1

    .line 65
    .line 66
    .line 67
    const-string v10, "alpha"

    .line 68
    .line 69
    const-wide/16 v11, 0x0

    .line 70
    .line 71
    move-object/from16 v16, v0

    .line 72
    .line 73
    invoke-static/range {v9 .. v16}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    filled-new-array {v2, v0}, [Landroid/animation/Animator;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    invoke-static {v0}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    :cond_0
    return-object v0

    .line 86
    nop

    .line 87
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data

    .line 88
    .line 89
    .line 90
    .line 91
    .line 92
    .line 93
    .line 94
    .line 95
    :array_1
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public final J(Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;)Ll/pf60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;",
            ")",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;",
            "Ll/q3m;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Ll/as20;->B(Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;)Ll/q3m;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object v0, p0, Ll/as20;->b:Ll/zm4;

    .line 6
    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Ll/as20;->b:Ll/zm4;

    .line 14
    .line 15
    invoke-interface {v0}, Ll/zm4;->d()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    iget-object v0, p0, Ll/as20;->b:Ll/zm4;

    .line 26
    .line 27
    invoke-interface {v0}, Ll/zm4;->d()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    instance-of v0, v0, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;

    .line 32
    .line 33
    if-eqz v0, :cond_0

    .line 34
    .line 35
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-eqz v0, :cond_0

    .line 40
    .line 41
    invoke-interface {p1}, Ll/s7m;->K2()Lcom/p1/mobile/putong/data/User;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-eqz v0, :cond_0

    .line 50
    .line 51
    iget-object p0, p0, Ll/as20;->b:Ll/zm4;

    .line 52
    .line 53
    invoke-interface {p0}, Ll/zm4;->d()Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    check-cast p0, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;

    .line 58
    .line 59
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    return-object p0

    .line 64
    :cond_0
    const/4 p0, 0x0

    .line 65
    return-object p0
.end method

.method public final K(Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;Lcom/p1/mobile/putong/data/Media;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, p1, p2, v0}, Ll/as20;->L(Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;Lcom/p1/mobile/putong/data/Media;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final L(Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;Lcom/p1/mobile/putong/data/Media;Z)V
    .locals 0

    .line 1
    sget-object p0, Ll/uqb0;->G:Ll/fsb0;

    .line 2
    .line 3
    iget-object p3, p1, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->T:Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 4
    .line 5
    iget-object p3, p3, Lcom/p1/mobile/putong/core/ui/PictureView;->a:Lv/VDraweeView;

    .line 6
    .line 7
    invoke-virtual {p0, p3}, Ll/am2;->o(Lcom/facebook/drawee/view/DraweeView;)V

    .line 8
    .line 9
    .line 10
    invoke-static {}, Ll/vq8;->b()Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    const/4 p3, 0x0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->F0:Lv/VFrame;

    .line 18
    .line 19
    invoke-static {p0, p3}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 20
    .line 21
    .line 22
    :cond_0
    instance-of p0, p2, Lcom/p1/mobile/putong/data/Video;

    .line 23
    .line 24
    if-eqz p0, :cond_1

    .line 25
    .line 26
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->T:Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 27
    .line 28
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->g:Lv/VFrame_ColorFilter;

    .line 29
    .line 30
    const/4 p2, 0x4

    .line 31
    invoke-virtual {p0, p2}, Landroid/view/View;->setVisibility(I)V

    .line 32
    .line 33
    .line 34
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->T:Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 35
    .line 36
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/core/ui/PictureView;->x(Z)V

    .line 37
    .line 38
    .line 39
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->T:Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 40
    .line 41
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->p:Landroid/widget/LinearLayout;

    .line 42
    .line 43
    invoke-static {p0, p3}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public final synthetic M(Lcom/p1/mobile/putong/core/ui/PictureView;Ll/bnl0$g;Ll/bnl0$g;ZFFZ[FLandroid/animation/ValueAnimator;)V
    .locals 4

    .line 1
    invoke-virtual {p9}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    .line 2
    .line 3
    .line 4
    move-result p9

    .line 5
    iget-object v0, p1, Lcom/p1/mobile/putong/core/ui/PictureView;->a:Lv/VDraweeView;

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget v1, p2, Ll/bnl0$g;->c:I

    .line 12
    .line 13
    int-to-float v2, v1

    .line 14
    iget v3, p3, Ll/bnl0$g;->c:I

    .line 15
    .line 16
    sub-int/2addr v3, v1

    .line 17
    int-to-float v1, v3

    .line 18
    mul-float/2addr v1, p9

    .line 19
    add-float/2addr v2, v1

    .line 20
    float-to-int v1, v2

    .line 21
    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 22
    .line 23
    iget v1, p2, Ll/bnl0$g;->d:I

    .line 24
    .line 25
    int-to-float v2, v1

    .line 26
    iget v3, p3, Ll/bnl0$g;->d:I

    .line 27
    .line 28
    sub-int/2addr v3, v1

    .line 29
    int-to-float v1, v3

    .line 30
    mul-float/2addr v1, p9

    .line 31
    add-float/2addr v2, v1

    .line 32
    float-to-int v1, v2

    .line 33
    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 34
    .line 35
    iget-object v1, p1, Lcom/p1/mobile/putong/core/ui/PictureView;->a:Lv/VDraweeView;

    .line 36
    .line 37
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 38
    .line 39
    .line 40
    iget v1, p2, Ll/bnl0$g;->b:I

    .line 41
    .line 42
    iget v2, p3, Ll/bnl0$g;->b:I

    .line 43
    .line 44
    sub-int/2addr v1, v2

    .line 45
    int-to-float v1, v1

    .line 46
    const/high16 v2, 0x3f800000    # 1.0f

    .line 47
    .line 48
    sub-float/2addr v2, p9

    .line 49
    mul-float/2addr v1, v2

    .line 50
    invoke-virtual {p1, v1}, Landroid/view/View;->setY(F)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 54
    .line 55
    .line 56
    move-result-object p9

    .line 57
    iget v0, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 58
    .line 59
    iput v0, p9, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 60
    .line 61
    invoke-virtual {p1, p9}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 62
    .line 63
    .line 64
    if-eqz p4, :cond_0

    .line 65
    .line 66
    iget-object p4, p1, Lcom/p1/mobile/putong/core/ui/PictureView;->s:Lv/VLinear;

    .line 67
    .line 68
    mul-float/2addr p5, v2

    .line 69
    invoke-virtual {p4, p5}, Landroid/view/View;->setTranslationX(F)V

    .line 70
    .line 71
    .line 72
    iget-object p4, p1, Lcom/p1/mobile/putong/core/ui/PictureView;->s:Lv/VLinear;

    .line 73
    .line 74
    mul-float/2addr p6, v2

    .line 75
    invoke-virtual {p4, p6}, Landroid/view/View;->setTranslationY(F)V

    .line 76
    .line 77
    .line 78
    :cond_0
    if-eqz p7, :cond_1

    .line 79
    .line 80
    iget-boolean p0, p0, Ll/as20;->a:Z

    .line 81
    .line 82
    if-eqz p0, :cond_1

    .line 83
    .line 84
    iget-object p0, p1, Lcom/p1/mobile/putong/core/ui/PictureView;->g:Lv/VFrame_ColorFilter;

    .line 85
    .line 86
    invoke-virtual {p0}, Landroid/view/View;->getTranslationY()F

    .line 87
    .line 88
    .line 89
    move-result p2

    .line 90
    mul-float/2addr p2, v2

    .line 91
    mul-float/2addr p2, v2

    .line 92
    invoke-virtual {p0, p2}, Landroid/view/View;->setTranslationY(F)V

    .line 93
    .line 94
    .line 95
    goto :goto_0

    .line 96
    :cond_1
    if-eqz p7, :cond_2

    .line 97
    .line 98
    iget-object p0, p1, Lcom/p1/mobile/putong/core/ui/PictureView;->g:Lv/VFrame_ColorFilter;

    .line 99
    .line 100
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    check-cast p0, Landroid/widget/FrameLayout$LayoutParams;

    .line 105
    .line 106
    const/high16 p4, 0x42000000    # 32.0f

    .line 107
    .line 108
    invoke-static {p4}, Ll/qa00;->d(F)I

    .line 109
    .line 110
    .line 111
    move-result p4

    .line 112
    iget p2, p2, Ll/bnl0$g;->d:I

    .line 113
    .line 114
    iget p3, p3, Ll/bnl0$g;->d:I

    .line 115
    .line 116
    sub-int/2addr p2, p3

    .line 117
    int-to-float p2, p2

    .line 118
    mul-float/2addr p2, v2

    .line 119
    float-to-int p2, p2

    .line 120
    sub-int/2addr p4, p2

    .line 121
    iput p4, p0, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 122
    .line 123
    iget-object p2, p1, Lcom/p1/mobile/putong/core/ui/PictureView;->g:Lv/VFrame_ColorFilter;

    .line 124
    .line 125
    invoke-virtual {p2, p0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 126
    .line 127
    .line 128
    :cond_2
    :goto_0
    new-instance p0, Landroid/graphics/PointF;

    .line 129
    .line 130
    invoke-direct {p0}, Landroid/graphics/PointF;-><init>()V

    .line 131
    .line 132
    .line 133
    const/4 p2, 0x0

    .line 134
    aget p2, p8, p2

    .line 135
    .line 136
    iput p2, p0, Landroid/graphics/PointF;->x:F

    .line 137
    .line 138
    const/4 p2, 0x1

    .line 139
    aget p2, p8, p2

    .line 140
    .line 141
    iput p2, p0, Landroid/graphics/PointF;->y:F

    .line 142
    .line 143
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/PictureView;->a:Lv/VDraweeView;

    .line 144
    .line 145
    invoke-virtual {p1}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 146
    .line 147
    .line 148
    move-result-object p1

    .line 149
    check-cast p1, Ll/wlj;

    .line 150
    .line 151
    invoke-virtual {p1, p0}, Ll/wlj;->v(Landroid/graphics/PointF;)V

    .line 152
    .line 153
    .line 154
    return-void
.end method

.method public final synthetic N(Lcom/p1/mobile/putong/core/ui/PictureView;Ll/bnl0$g;Ll/bnl0$g;ZFFZ[FLandroid/animation/ValueAnimator;)V
    .locals 4

    .line 1
    invoke-virtual {p9}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    .line 2
    .line 3
    .line 4
    move-result p9

    .line 5
    iget-object v0, p1, Lcom/p1/mobile/putong/core/ui/PictureView;->a:Lv/VDraweeView;

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget v1, p2, Ll/bnl0$g;->c:I

    .line 12
    .line 13
    int-to-float v2, v1

    .line 14
    iget v3, p3, Ll/bnl0$g;->c:I

    .line 15
    .line 16
    sub-int/2addr v3, v1

    .line 17
    int-to-float v1, v3

    .line 18
    mul-float/2addr v1, p9

    .line 19
    add-float/2addr v2, v1

    .line 20
    float-to-int v1, v2

    .line 21
    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 22
    .line 23
    iget v1, p2, Ll/bnl0$g;->d:I

    .line 24
    .line 25
    int-to-float v2, v1

    .line 26
    iget v3, p3, Ll/bnl0$g;->d:I

    .line 27
    .line 28
    sub-int/2addr v3, v1

    .line 29
    int-to-float v1, v3

    .line 30
    mul-float/2addr v1, p9

    .line 31
    add-float/2addr v2, v1

    .line 32
    float-to-int v1, v2

    .line 33
    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 34
    .line 35
    iget-object v1, p1, Lcom/p1/mobile/putong/core/ui/PictureView;->a:Lv/VDraweeView;

    .line 36
    .line 37
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 38
    .line 39
    .line 40
    if-eqz p4, :cond_0

    .line 41
    .line 42
    iget-object p4, p1, Lcom/p1/mobile/putong/core/ui/PictureView;->s:Lv/VLinear;

    .line 43
    .line 44
    mul-float/2addr p5, p9

    .line 45
    invoke-virtual {p4, p5}, Landroid/view/View;->setTranslationX(F)V

    .line 46
    .line 47
    .line 48
    iget-object p4, p1, Lcom/p1/mobile/putong/core/ui/PictureView;->s:Lv/VLinear;

    .line 49
    .line 50
    mul-float/2addr p6, p9

    .line 51
    invoke-virtual {p4, p6}, Landroid/view/View;->setTranslationY(F)V

    .line 52
    .line 53
    .line 54
    :cond_0
    if-eqz p7, :cond_1

    .line 55
    .line 56
    iget-boolean p4, p0, Ll/as20;->a:Z

    .line 57
    .line 58
    if-eqz p4, :cond_1

    .line 59
    .line 60
    iget-object p2, p1, Lcom/p1/mobile/putong/core/ui/PictureView;->g:Lv/VFrame_ColorFilter;

    .line 61
    .line 62
    iget p0, p0, Ll/as20;->g:F

    .line 63
    .line 64
    mul-float/2addr p0, p9

    .line 65
    mul-float/2addr p0, p9

    .line 66
    invoke-virtual {p2, p0}, Landroid/view/View;->setTranslationY(F)V

    .line 67
    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_1
    if-eqz p7, :cond_2

    .line 71
    .line 72
    iget-object p0, p1, Lcom/p1/mobile/putong/core/ui/PictureView;->g:Lv/VFrame_ColorFilter;

    .line 73
    .line 74
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    check-cast p0, Landroid/widget/FrameLayout$LayoutParams;

    .line 79
    .line 80
    const/high16 p4, 0x42000000    # 32.0f

    .line 81
    .line 82
    invoke-static {p4}, Ll/qa00;->d(F)I

    .line 83
    .line 84
    .line 85
    move-result p4

    .line 86
    iget p3, p3, Ll/bnl0$g;->d:I

    .line 87
    .line 88
    iget p2, p2, Ll/bnl0$g;->d:I

    .line 89
    .line 90
    sub-int/2addr p3, p2

    .line 91
    int-to-float p2, p3

    .line 92
    mul-float/2addr p2, p9

    .line 93
    float-to-int p2, p2

    .line 94
    sub-int/2addr p4, p2

    .line 95
    iput p4, p0, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 96
    .line 97
    iget-object p2, p1, Lcom/p1/mobile/putong/core/ui/PictureView;->g:Lv/VFrame_ColorFilter;

    .line 98
    .line 99
    invoke-virtual {p2, p0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 100
    .line 101
    .line 102
    :cond_2
    :goto_0
    new-instance p0, Landroid/graphics/PointF;

    .line 103
    .line 104
    invoke-direct {p0}, Landroid/graphics/PointF;-><init>()V

    .line 105
    .line 106
    .line 107
    const/4 p2, 0x0

    .line 108
    aget p2, p8, p2

    .line 109
    .line 110
    iput p2, p0, Landroid/graphics/PointF;->x:F

    .line 111
    .line 112
    const/4 p2, 0x1

    .line 113
    aget p2, p8, p2

    .line 114
    .line 115
    iput p2, p0, Landroid/graphics/PointF;->y:F

    .line 116
    .line 117
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/PictureView;->a:Lv/VDraweeView;

    .line 118
    .line 119
    invoke-virtual {p1}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 120
    .line 121
    .line 122
    move-result-object p1

    .line 123
    check-cast p1, Ll/wlj;

    .line 124
    .line 125
    invoke-virtual {p1, p0}, Ll/wlj;->v(Landroid/graphics/PointF;)V

    .line 126
    .line 127
    .line 128
    return-void
.end method

.method public final synthetic O(Ll/pf60;Lcom/p1/mobile/putong/data/Media;)V
    .locals 0

    .line 1
    iget-object p1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p1, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ll/as20;->K(Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;Lcom/p1/mobile/putong/data/Media;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic P(Ll/pf60;Lcom/p1/mobile/putong/data/Media;Lcom/p1/mobile/putong/core/ui/PictureView;Lcom/p1/mobile/android/app/Act;)V
    .locals 2

    .line 1
    iget-object v0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;

    .line 4
    .line 5
    invoke-virtual {p0, v0, p2, p3}, Ll/as20;->X(Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;Lcom/p1/mobile/putong/data/Media;Lcom/p1/mobile/putong/core/ui/PictureView;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 9
    .line 10
    check-cast v0, Ll/q3m;

    .line 11
    .line 12
    invoke-interface {v0}, Ll/q3m;->o3()Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    iget-object v0, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 23
    .line 24
    check-cast v0, Ll/q3m;

    .line 25
    .line 26
    invoke-interface {v0}, Ll/q3m;->o3()Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_0

    .line 35
    .line 36
    iget-object v0, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 37
    .line 38
    check-cast v0, Ll/q3m;

    .line 39
    .line 40
    invoke-interface {v0}, Ll/q3m;->o3()Landroid/view/View;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    const/high16 v1, 0x3f800000    # 1.0f

    .line 45
    .line 46
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 47
    .line 48
    .line 49
    :cond_0
    instance-of p2, p2, Lcom/p1/mobile/putong/data/Video;

    .line 50
    .line 51
    if-eqz p2, :cond_5

    .line 52
    .line 53
    invoke-static {}, Ll/asj0;->d0()Z

    .line 54
    .line 55
    .line 56
    move-result p2

    .line 57
    if-eqz p2, :cond_5

    .line 58
    .line 59
    invoke-static {}, Ll/wkh0;->f()Z

    .line 60
    .line 61
    .line 62
    move-result p2

    .line 63
    if-eqz p2, :cond_1

    .line 64
    .line 65
    iget-object p2, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 66
    .line 67
    check-cast p2, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;

    .line 68
    .line 69
    iget-object p2, p2, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->v2:Lcom/p1/mobile/putong/data/User;

    .line 70
    .line 71
    iget-object p2, p2, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 72
    .line 73
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 74
    .line 75
    .line 76
    move-result p2

    .line 77
    const/4 v0, 0x2

    .line 78
    if-lt p2, v0, :cond_1

    .line 79
    .line 80
    iget-boolean p0, p0, Ll/as20;->e:Z

    .line 81
    .line 82
    if-eqz p0, :cond_5

    .line 83
    .line 84
    :cond_1
    invoke-static {}, Ll/gra;->u2()Z

    .line 85
    .line 86
    .line 87
    move-result p0

    .line 88
    if-nez p0, :cond_2

    .line 89
    .line 90
    invoke-static {}, Ll/gra;->y2()Z

    .line 91
    .line 92
    .line 93
    move-result p0

    .line 94
    if-eqz p0, :cond_3

    .line 95
    .line 96
    :cond_2
    iget-object p0, p3, Lcom/p1/mobile/putong/core/ui/PictureView;->s:Lv/VLinear;

    .line 97
    .line 98
    invoke-static {p0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 99
    .line 100
    .line 101
    move-result p0

    .line 102
    if-nez p0, :cond_5

    .line 103
    .line 104
    :cond_3
    iget-object p0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 105
    .line 106
    check-cast p0, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;

    .line 107
    .line 108
    invoke-interface {p0}, Ll/kql;->h()Z

    .line 109
    .line 110
    .line 111
    move-result p0

    .line 112
    if-eqz p0, :cond_4

    .line 113
    .line 114
    goto :goto_0

    .line 115
    :cond_4
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/ui/PictureView;->V()V

    .line 116
    .line 117
    .line 118
    :cond_5
    :goto_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 119
    .line 120
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 121
    .line 122
    invoke-virtual {p0}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 123
    .line 124
    .line 125
    move-result-object p0

    .line 126
    if-eqz p0, :cond_a

    .line 127
    .line 128
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 129
    .line 130
    const-string p2, "male"

    .line 131
    .line 132
    invoke-static {p0, p2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 133
    .line 134
    .line 135
    move-result p0

    .line 136
    if-eqz p0, :cond_a

    .line 137
    .line 138
    iget-object p0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 139
    .line 140
    check-cast p0, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;

    .line 141
    .line 142
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->v2:Lcom/p1/mobile/putong/data/User;

    .line 143
    .line 144
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 145
    .line 146
    const-string p2, "female"

    .line 147
    .line 148
    invoke-static {p0, p2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 149
    .line 150
    .line 151
    move-result p0

    .line 152
    if-eqz p0, :cond_a

    .line 153
    .line 154
    iget-object p0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 155
    .line 156
    check-cast p0, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;

    .line 157
    .line 158
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->v2:Lcom/p1/mobile/putong/data/User;

    .line 159
    .line 160
    iget p0, p0, Lcom/p1/mobile/putong/data/User;->popLevel:I

    .line 161
    .line 162
    int-to-double p2, p0

    .line 163
    const-wide v0, 0x3fe599999999999aL    # 0.675

    .line 164
    .line 165
    .line 166
    .line 167
    .line 168
    cmpl-double p0, p2, v0

    .line 169
    .line 170
    if-lez p0, :cond_a

    .line 171
    .line 172
    invoke-static {}, Ll/nmp;->e()Z

    .line 173
    .line 174
    .line 175
    move-result p0

    .line 176
    if-eqz p0, :cond_a

    .line 177
    .line 178
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/match/a;->w()Lcom/p1/mobile/putong/core/ui/match/a;

    .line 179
    .line 180
    .line 181
    move-result-object p0

    .line 182
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/match/a;->N()Z

    .line 183
    .line 184
    .line 185
    move-result p0

    .line 186
    if-nez p0, :cond_a

    .line 187
    .line 188
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/match/a;->w()Lcom/p1/mobile/putong/core/ui/match/a;

    .line 189
    .line 190
    .line 191
    move-result-object p0

    .line 192
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/match/a;->a:Z

    .line 193
    .line 194
    if-eqz p0, :cond_6

    .line 195
    .line 196
    goto/16 :goto_1

    .line 197
    .line 198
    :cond_6
    iget-object p0, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 199
    .line 200
    check-cast p0, Ll/q3m;

    .line 201
    .line 202
    invoke-interface {p0}, Ll/q3m;->S1()Landroid/view/View;

    .line 203
    .line 204
    .line 205
    move-result-object p0

    .line 206
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 207
    .line 208
    .line 209
    move-result p0

    .line 210
    if-nez p0, :cond_7

    .line 211
    .line 212
    goto :goto_1

    .line 213
    :cond_7
    sget-object p0, Ll/as20;->j:Ll/byd0;

    .line 214
    .line 215
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 216
    .line 217
    .line 218
    move-result-object p0

    .line 219
    check-cast p0, Ljava/lang/Long;

    .line 220
    .line 221
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 222
    .line 223
    .line 224
    move-result-wide p2

    .line 225
    invoke-static {p2, p3}, Ll/pzi0;->D(J)Z

    .line 226
    .line 227
    .line 228
    move-result p0

    .line 229
    const/4 p2, 0x0

    .line 230
    if-nez p0, :cond_8

    .line 231
    .line 232
    sget-object p0, Ll/as20;->i:Ll/vxd0;

    .line 233
    .line 234
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 235
    .line 236
    .line 237
    move-result-object p3

    .line 238
    invoke-virtual {p0, p3}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 239
    .line 240
    .line 241
    sget-object p0, Ll/as20;->j:Ll/byd0;

    .line 242
    .line 243
    invoke-static {}, Ll/pzi0;->o()J

    .line 244
    .line 245
    .line 246
    move-result-wide v0

    .line 247
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 248
    .line 249
    .line 250
    move-result-object p3

    .line 251
    invoke-virtual {p0, p3}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 252
    .line 253
    .line 254
    :cond_8
    sget-object p0, Ll/as20;->i:Ll/vxd0;

    .line 255
    .line 256
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 257
    .line 258
    .line 259
    move-result-object p0

    .line 260
    check-cast p0, Ljava/lang/Integer;

    .line 261
    .line 262
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 263
    .line 264
    .line 265
    move-result p0

    .line 266
    const/4 p3, 0x3

    .line 267
    if-lt p0, p3, :cond_9

    .line 268
    .line 269
    goto :goto_1

    .line 270
    :cond_9
    sget-object p0, Ll/as20;->i:Ll/vxd0;

    .line 271
    .line 272
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 273
    .line 274
    .line 275
    move-result-object p3

    .line 276
    check-cast p3, Ljava/lang/Integer;

    .line 277
    .line 278
    invoke-virtual {p3}, Ljava/lang/Integer;->intValue()I

    .line 279
    .line 280
    .line 281
    move-result p3

    .line 282
    add-int/lit8 p3, p3, 0x1

    .line 283
    .line 284
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 285
    .line 286
    .line 287
    move-result-object p3

    .line 288
    invoke-virtual {p0, p3}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 289
    .line 290
    .line 291
    const-string p0, "p_suggest_user_profile_info_view"

    .line 292
    .line 293
    new-array p2, p2, [Ll/sfj0$a;

    .line 294
    .line 295
    const-string p3, "e_superlike_usage_guide"

    .line 296
    .line 297
    invoke-static {p3, p0, p2}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 298
    .line 299
    .line 300
    iget-object p0, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 301
    .line 302
    check-cast p0, Ll/q3m;

    .line 303
    .line 304
    invoke-interface {p0}, Ll/q3m;->S1()Landroid/view/View;

    .line 305
    .line 306
    .line 307
    move-result-object p0

    .line 308
    new-instance p2, Ll/wr20;

    .line 309
    .line 310
    invoke-direct {p2, p1, p4}, Ll/wr20;-><init>(Ll/pf60;Lcom/p1/mobile/android/app/Act;)V

    .line 311
    .line 312
    .line 313
    invoke-static {p0, p2}, Ll/bnl0;->Q0(Landroid/view/View;Ll/y20;)V

    .line 314
    .line 315
    .line 316
    :cond_a
    :goto_1
    return-void
.end method

.method public final synthetic Q(Ll/pf60;Lcom/p1/mobile/putong/data/Media;Lcom/p1/mobile/putong/core/ui/PictureView;Lcom/p1/mobile/android/app/Act;)V
    .locals 7

    .line 1
    iget-object v0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;

    .line 4
    .line 5
    new-instance v1, Ll/vr20;

    .line 6
    .line 7
    move-object v2, p0

    .line 8
    move-object v3, p1

    .line 9
    move-object v4, p2

    .line 10
    move-object v5, p3

    .line 11
    move-object v6, p4

    .line 12
    invoke-direct/range {v1 .. v6}, Ll/vr20;-><init>(Ll/as20;Ll/pf60;Lcom/p1/mobile/putong/data/Media;Lcom/p1/mobile/putong/core/ui/PictureView;Lcom/p1/mobile/android/app/Act;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 16
    .line 17
    .line 18
    iget-object p0, v3, Ll/pf60;->b:Ljava/lang/Object;

    .line 19
    .line 20
    check-cast p0, Ll/q3m;

    .line 21
    .line 22
    invoke-interface {p0}, Ll/q3m;->o2()V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public final synthetic R(Ll/pf60;Lcom/p1/mobile/putong/data/Media;)V
    .locals 1

    .line 1
    iget-object p1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p1, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p0, p1, p2, v0}, Ll/as20;->L(Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;Lcom/p1/mobile/putong/data/Media;Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic S(Ll/pf60;Lcom/p1/mobile/putong/data/Media;Lcom/p1/mobile/putong/core/ui/PictureView;)V
    .locals 0

    .line 1
    iget-object p1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p1, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2, p3}, Ll/as20;->X(Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;Lcom/p1/mobile/putong/data/Media;Lcom/p1/mobile/putong/core/ui/PictureView;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic T(JLl/pf60;Lcom/p1/mobile/putong/data/Media;Lcom/p1/mobile/putong/core/ui/PictureView;)V
    .locals 2

    .line 1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    sub-long/2addr v0, p1

    .line 6
    const-wide/16 p1, 0x1e

    .line 7
    .line 8
    cmp-long p1, v0, p1

    .line 9
    .line 10
    if-gez p1, :cond_0

    .line 11
    .line 12
    new-instance p1, Ll/xr20;

    .line 13
    .line 14
    invoke-direct {p1, p0, p3, p4, p5}, Ll/xr20;-><init>(Ll/as20;Ll/pf60;Lcom/p1/mobile/putong/data/Media;Lcom/p1/mobile/putong/core/ui/PictureView;)V

    .line 15
    .line 16
    .line 17
    invoke-static {p1}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    iget-object p1, p3, Ll/pf60;->a:Ljava/lang/Object;

    .line 21
    .line 22
    check-cast p1, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;

    .line 23
    .line 24
    invoke-virtual {p0, p1, p4, p5}, Ll/as20;->X(Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;Lcom/p1/mobile/putong/data/Media;Lcom/p1/mobile/putong/core/ui/PictureView;)V

    .line 25
    .line 26
    .line 27
    invoke-static {}, Ll/gra;->u2()Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    if-nez p1, :cond_1

    .line 32
    .line 33
    invoke-static {}, Ll/gra;->y2()Z

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    if-eqz p1, :cond_2

    .line 38
    .line 39
    :cond_1
    iget-object p1, p5, Lcom/p1/mobile/putong/core/ui/PictureView;->s:Lv/VLinear;

    .line 40
    .line 41
    invoke-static {p1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    if-nez p1, :cond_4

    .line 46
    .line 47
    :cond_2
    iget-object p1, p3, Ll/pf60;->a:Ljava/lang/Object;

    .line 48
    .line 49
    check-cast p1, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;

    .line 50
    .line 51
    invoke-interface {p1}, Ll/kql;->h()Z

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    if-eqz p1, :cond_3

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_3
    iget-object p1, p3, Ll/pf60;->a:Ljava/lang/Object;

    .line 59
    .line 60
    check-cast p1, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;

    .line 61
    .line 62
    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->T:Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 63
    .line 64
    invoke-virtual {p0, p1}, Ll/as20;->U(Lcom/p1/mobile/putong/core/ui/PictureView;)V

    .line 65
    .line 66
    .line 67
    :cond_4
    :goto_0
    return-void
.end method

.method public final U(Lcom/p1/mobile/putong/core/ui/PictureView;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/core/ui/PictureView;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    iget-object p0, p1, Lcom/p1/mobile/putong/core/ui/PictureView;->G:Lcom/p1/mobile/putong/data/Media;

    .line 8
    .line 9
    instance-of p0, p0, Lcom/p1/mobile/putong/data/Video;

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    invoke-static {}, Ll/asj0;->d0()Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    iget-boolean p0, p1, Lcom/p1/mobile/putong/core/ui/PictureView;->k0:Z

    .line 20
    .line 21
    if-nez p0, :cond_0

    .line 22
    .line 23
    iget-boolean p0, p1, Lcom/p1/mobile/putong/core/ui/PictureView;->K:Z

    .line 24
    .line 25
    if-eqz p0, :cond_0

    .line 26
    .line 27
    new-instance p0, Ll/zr20;

    .line 28
    .line 29
    invoke-direct {p0, p1}, Ll/zr20;-><init>(Lcom/p1/mobile/putong/core/ui/PictureView;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p1, p0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method

.method public V(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;)V
    .locals 3

    .line 1
    invoke-virtual {p0, p2}, Ll/as20;->J(Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;)Ll/pf60;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_5

    .line 10
    .line 11
    iget-object p1, p0, Ll/pf60;->a:Ljava/lang/Object;

    .line 12
    .line 13
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-eqz p1, :cond_5

    .line 18
    .line 19
    iget-object p1, p0, Ll/pf60;->b:Ljava/lang/Object;

    .line 20
    .line 21
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-eqz p1, :cond_5

    .line 26
    .line 27
    iget-object p1, p0, Ll/pf60;->a:Ljava/lang/Object;

    .line 28
    .line 29
    move-object p2, p1

    .line 30
    check-cast p2, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;

    .line 31
    .line 32
    iget-boolean p2, p2, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->a2:Z

    .line 33
    .line 34
    const/4 v0, 0x0

    .line 35
    if-eqz p2, :cond_0

    .line 36
    .line 37
    check-cast p1, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;

    .line 38
    .line 39
    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->v2:Lcom/p1/mobile/putong/data/User;

    .line 40
    .line 41
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    if-eqz p1, :cond_0

    .line 46
    .line 47
    iget-object p1, p0, Ll/pf60;->b:Ljava/lang/Object;

    .line 48
    .line 49
    instance-of p2, p1, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;

    .line 50
    .line 51
    if-eqz p2, :cond_0

    .line 52
    .line 53
    check-cast p1, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;

    .line 54
    .line 55
    iget-object p2, p0, Ll/pf60;->a:Ljava/lang/Object;

    .line 56
    .line 57
    check-cast p2, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;

    .line 58
    .line 59
    iget-object p2, p2, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->v2:Lcom/p1/mobile/putong/data/User;

    .line 60
    .line 61
    iget-object p2, p2, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 62
    .line 63
    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object p2

    .line 67
    check-cast p2, Lcom/p1/mobile/putong/data/Media;

    .line 68
    .line 69
    iput-object p2, p1, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->t2:Lcom/p1/mobile/putong/data/Media;

    .line 70
    .line 71
    :cond_0
    iget-object p1, p0, Ll/pf60;->a:Ljava/lang/Object;

    .line 72
    .line 73
    move-object p2, p1

    .line 74
    check-cast p2, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;

    .line 75
    .line 76
    iget-object p2, p2, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->T:Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 77
    .line 78
    iget-object p2, p2, Lcom/p1/mobile/putong/core/ui/PictureView;->G:Lcom/p1/mobile/putong/data/Media;

    .line 79
    .line 80
    check-cast p1, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;

    .line 81
    .line 82
    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->v2:Lcom/p1/mobile/putong/data/User;

    .line 83
    .line 84
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 85
    .line 86
    .line 87
    move-result p1

    .line 88
    if-eqz p1, :cond_2

    .line 89
    .line 90
    move p1, v0

    .line 91
    :goto_0
    iget-object v1, p0, Ll/pf60;->a:Ljava/lang/Object;

    .line 92
    .line 93
    check-cast v1, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;

    .line 94
    .line 95
    iget-object v1, v1, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->v2:Lcom/p1/mobile/putong/data/User;

    .line 96
    .line 97
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 98
    .line 99
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 100
    .line 101
    .line 102
    move-result v1

    .line 103
    if-ge p1, v1, :cond_2

    .line 104
    .line 105
    iget-object v1, p0, Ll/pf60;->a:Ljava/lang/Object;

    .line 106
    .line 107
    check-cast v1, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;

    .line 108
    .line 109
    iget-object v1, v1, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->v2:Lcom/p1/mobile/putong/data/User;

    .line 110
    .line 111
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 112
    .line 113
    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    move-result-object v1

    .line 117
    check-cast v1, Lcom/p1/mobile/putong/data/Media;

    .line 118
    .line 119
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 120
    .line 121
    iget-object v2, p2, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 122
    .line 123
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 124
    .line 125
    .line 126
    move-result v1

    .line 127
    if-eqz v1, :cond_1

    .line 128
    .line 129
    goto :goto_1

    .line 130
    :cond_1
    add-int/lit8 p1, p1, 0x1

    .line 131
    .line 132
    goto :goto_0

    .line 133
    :cond_2
    move p1, v0

    .line 134
    :goto_1
    iget-object p2, p0, Ll/pf60;->b:Ljava/lang/Object;

    .line 135
    .line 136
    check-cast p2, Ll/q3m;

    .line 137
    .line 138
    invoke-interface {p2, p1, v0}, Ll/t3m;->m2(IZ)V

    .line 139
    .line 140
    .line 141
    iget-object p2, p0, Ll/pf60;->b:Ljava/lang/Object;

    .line 142
    .line 143
    check-cast p2, Ll/q3m;

    .line 144
    .line 145
    const/4 v0, 0x1

    .line 146
    invoke-interface {p2, v0}, Ll/q3m;->V0(Z)V

    .line 147
    .line 148
    .line 149
    new-instance p2, Ll/pf60;

    .line 150
    .line 151
    iget-object v1, p0, Ll/pf60;->a:Ljava/lang/Object;

    .line 152
    .line 153
    check-cast v1, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;

    .line 154
    .line 155
    iget-object v1, v1, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->T:Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 156
    .line 157
    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    .line 158
    .line 159
    .line 160
    move-result v1

    .line 161
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 162
    .line 163
    .line 164
    move-result-object v1

    .line 165
    iget-object v2, p0, Ll/pf60;->a:Ljava/lang/Object;

    .line 166
    .line 167
    check-cast v2, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;

    .line 168
    .line 169
    iget-object v2, v2, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->T:Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 170
    .line 171
    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    .line 172
    .line 173
    .line 174
    move-result v2

    .line 175
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 176
    .line 177
    .line 178
    move-result-object v2

    .line 179
    invoke-direct {p2, v1, v2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 180
    .line 181
    .line 182
    iget-object v1, p0, Ll/pf60;->b:Ljava/lang/Object;

    .line 183
    .line 184
    check-cast v1, Ll/q3m;

    .line 185
    .line 186
    invoke-interface {v1, p2}, Ll/q3m;->y3(Ll/pf60;)V

    .line 187
    .line 188
    .line 189
    iget-object p2, p0, Ll/pf60;->a:Ljava/lang/Object;

    .line 190
    .line 191
    check-cast p2, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;

    .line 192
    .line 193
    iget-object p2, p2, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->T:Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 194
    .line 195
    iget-object p2, p2, Lcom/p1/mobile/putong/core/ui/PictureView;->o:Lv/VText;

    .line 196
    .line 197
    invoke-static {p2}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 198
    .line 199
    .line 200
    move-result p2

    .line 201
    if-eqz p2, :cond_3

    .line 202
    .line 203
    iget-object p2, p0, Ll/pf60;->b:Ljava/lang/Object;

    .line 204
    .line 205
    check-cast p2, Ll/q3m;

    .line 206
    .line 207
    iget-object v1, p0, Ll/pf60;->a:Ljava/lang/Object;

    .line 208
    .line 209
    check-cast v1, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;

    .line 210
    .line 211
    iget-object v1, v1, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->T:Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 212
    .line 213
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/PictureView;->o:Lv/VText;

    .line 214
    .line 215
    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    .line 216
    .line 217
    .line 218
    move-result v1

    .line 219
    invoke-interface {p2, v1}, Ll/q3m;->u3(I)V

    .line 220
    .line 221
    .line 222
    iget-object p2, p0, Ll/pf60;->b:Ljava/lang/Object;

    .line 223
    .line 224
    check-cast p2, Ll/q3m;

    .line 225
    .line 226
    iget-object v1, p0, Ll/pf60;->a:Ljava/lang/Object;

    .line 227
    .line 228
    check-cast v1, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;

    .line 229
    .line 230
    iget-boolean v1, v1, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->I1:Z

    .line 231
    .line 232
    invoke-interface {p2, v1}, Ll/q3m;->l2(Z)V

    .line 233
    .line 234
    .line 235
    :cond_3
    iget-object p2, p0, Ll/pf60;->b:Ljava/lang/Object;

    .line 236
    .line 237
    check-cast p2, Ll/q3m;

    .line 238
    .line 239
    invoke-interface {p2, p1}, Ll/q3m;->H0(I)V

    .line 240
    .line 241
    .line 242
    iget-object p1, p0, Ll/pf60;->a:Ljava/lang/Object;

    .line 243
    .line 244
    check-cast p1, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;

    .line 245
    .line 246
    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->T:Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 247
    .line 248
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/PictureView;->m:Lv/VText;

    .line 249
    .line 250
    invoke-static {p1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 251
    .line 252
    .line 253
    move-result p1

    .line 254
    if-eqz p1, :cond_4

    .line 255
    .line 256
    iget-object p1, p0, Ll/pf60;->b:Ljava/lang/Object;

    .line 257
    .line 258
    check-cast p1, Ll/q3m;

    .line 259
    .line 260
    invoke-interface {p1, v0}, Ll/q3m;->p1(Z)V

    .line 261
    .line 262
    .line 263
    :cond_4
    iget-object p1, p0, Ll/pf60;->a:Ljava/lang/Object;

    .line 264
    .line 265
    check-cast p1, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;

    .line 266
    .line 267
    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->T:Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 268
    .line 269
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/PictureView;->n:Lv/VImage;

    .line 270
    .line 271
    invoke-static {p1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 272
    .line 273
    .line 274
    move-result p1

    .line 275
    if-eqz p1, :cond_5

    .line 276
    .line 277
    iget-object p0, p0, Ll/pf60;->b:Ljava/lang/Object;

    .line 278
    .line 279
    check-cast p0, Ll/q3m;

    .line 280
    .line 281
    invoke-interface {p0, v0}, Ll/q3m;->S2(Z)V

    .line 282
    .line 283
    .line 284
    :cond_5
    return-void
.end method

.method public final X(Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;Lcom/p1/mobile/putong/data/Media;Lcom/p1/mobile/putong/core/ui/PictureView;)V
    .locals 2

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->y1:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    const/4 p3, 0x0

    .line 4
    invoke-static {p0, p3}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->T:Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 14
    .line 15
    const/4 v0, -0x1

    .line 16
    invoke-interface {p1}, Ll/kql;->h()Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    invoke-virtual {p0, p2, v0, v1}, Lcom/p1/mobile/putong/core/ui/PictureView;->Z(Lcom/p1/mobile/putong/data/Media;IZ)V

    .line 21
    .line 22
    .line 23
    :cond_0
    instance-of p0, p2, Lcom/p1/mobile/putong/data/Video;

    .line 24
    .line 25
    if-eqz p0, :cond_1

    .line 26
    .line 27
    invoke-interface {p1}, Ll/kql;->h()Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-nez p0, :cond_1

    .line 32
    .line 33
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->T:Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 34
    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->g:Lv/VFrame_ColorFilter;

    .line 36
    .line 37
    invoke-virtual {p0, p3}, Landroid/view/View;->setVisibility(I)V

    .line 38
    .line 39
    .line 40
    :cond_1
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->y3(Lcom/p1/mobile/putong/data/Media;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->X1()V

    .line 44
    .line 45
    .line 46
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->v2:Lcom/p1/mobile/putong/data/User;

    .line 47
    .line 48
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result p0

    .line 52
    if-eqz p0, :cond_2

    .line 53
    .line 54
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->n2:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 55
    .line 56
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    move-result p0

    .line 60
    if-eqz p0, :cond_2

    .line 61
    .line 62
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->g1:Lv/VImage;

    .line 63
    .line 64
    invoke-static {p0, p3}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 65
    .line 66
    .line 67
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->v2:Lcom/p1/mobile/putong/data/User;

    .line 68
    .line 69
    iget-object p2, p1, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->n2:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 70
    .line 71
    invoke-virtual {p1, p0, p3, p2}, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->l3(Lcom/p1/mobile/putong/data/User;ILcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)V

    .line 72
    .line 73
    .line 74
    :cond_2
    return-void
.end method

.method public bridge synthetic a(Ljava/lang/Object;)Landroid/view/View;
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/as20;->t(Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public b()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public bridge synthetic c(Ljava/lang/Object;Ljava/lang/Object;)Landroid/animation/Animator;
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    check-cast p2, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ll/as20;->y(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;)Landroid/animation/Animator;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public bridge synthetic d(Ljava/lang/Object;Ljava/lang/Object;)Landroid/animation/Animator;
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    check-cast p2, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ll/as20;->z(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;)Landroid/animation/Animator;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public bridge synthetic h(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    check-cast p2, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ll/as20;->V(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public t(Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/as20;->B(Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;)Ll/q3m;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    invoke-interface {p0}, Ll/t3m;->q()Landroid/view/ViewGroup;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return-object p0
.end method

.method public final u(Ll/q3m;)Landroid/animation/Animator;
    .locals 10

    .line 1
    invoke-interface {p1}, Ll/q3m;->N3()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-interface {p1}, Ll/q3m;->N3()Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    invoke-interface {p1}, Ll/q3m;->N3()Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    invoke-direct {p0}, Ll/as20;->C()I

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    int-to-long v4, p1

    .line 31
    invoke-direct {p0}, Ll/as20;->E()I

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    int-to-long v6, p0

    .line 36
    sget-object v8, Ll/gt0;->d:Landroid/view/animation/Interpolator;

    .line 37
    .line 38
    const/4 p0, 0x1

    .line 39
    new-array v9, p0, [F

    .line 40
    .line 41
    const/4 p0, 0x0

    .line 42
    aput p0, v9, v1

    .line 43
    .line 44
    const-string v3, "translationY"

    .line 45
    .line 46
    invoke-static/range {v2 .. v9}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 47
    .line 48
    .line 49
    :cond_0
    invoke-static {v1}, Ll/gt0;->j(I)Landroid/animation/Animator;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    return-object p0
.end method

.method public final v(Ll/q3m;)Landroid/animation/Animator;
    .locals 10

    .line 1
    const/4 p0, 0x0

    .line 2
    invoke-static {p0}, Ll/gt0;->j(I)Landroid/animation/Animator;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    invoke-static {}, Ll/fcp;->y()Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    invoke-interface {p1}, Ll/q3m;->W2()Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    sget p1, Ll/as20;->r:I

    .line 17
    .line 18
    int-to-long v4, p1

    .line 19
    sget p1, Ll/as20;->p:I

    .line 20
    .line 21
    int-to-long v6, p1

    .line 22
    sget-object v8, Ll/gt0;->d:Landroid/view/animation/Interpolator;

    .line 23
    .line 24
    const/4 p1, 0x1

    .line 25
    new-array v9, p1, [F

    .line 26
    .line 27
    const/4 p1, 0x0

    .line 28
    aput p1, v9, p0

    .line 29
    .line 30
    const-string v3, "translationY"

    .line 31
    .line 32
    invoke-static/range {v2 .. v9}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    return-object p0

    .line 37
    :cond_0
    return-object v0
.end method

.method public final w(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/ui/PictureView;Lcom/p1/mobile/putong/data/Media;Ll/bnl0$g;Ll/bnl0$g;Ll/bnl0$g;Lcom/p1/mobile/putong/core/ui/PictureView;Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;)Landroid/animation/ObjectAnimator;
    .locals 16

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v2, p2

    .line 4
    .line 5
    move-object/from16 v0, p3

    .line 6
    .line 7
    move-object/from16 v10, p4

    .line 8
    .line 9
    move-object/from16 v11, p5

    .line 10
    .line 11
    invoke-static {}, Ll/gra;->y2()Z

    .line 12
    .line 13
    .line 14
    move-result v3

    .line 15
    const/4 v4, 0x1

    .line 16
    const/4 v5, 0x0

    .line 17
    if-eqz v3, :cond_0

    .line 18
    .line 19
    iget-object v3, v2, Lcom/p1/mobile/putong/core/ui/PictureView;->s:Lv/VLinear;

    .line 20
    .line 21
    invoke-static {v3}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    if-eqz v3, :cond_0

    .line 26
    .line 27
    iget-object v3, v2, Lcom/p1/mobile/putong/core/ui/PictureView;->u:Lv/VText;

    .line 28
    .line 29
    invoke-static {v3}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 30
    .line 31
    .line 32
    move-result v3

    .line 33
    if-eqz v3, :cond_0

    .line 34
    .line 35
    move-object/from16 v3, p8

    .line 36
    .line 37
    iget-object v3, v3, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->y1:Landroid/widget/LinearLayout;

    .line 38
    .line 39
    invoke-static {v3}, Ll/bnl0;->i0(Landroid/view/View;)Ll/bnl0$g;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    iget-object v6, v2, Lcom/p1/mobile/putong/core/ui/PictureView;->s:Lv/VLinear;

    .line 44
    .line 45
    invoke-static {v6}, Ll/bnl0;->i0(Landroid/view/View;)Ll/bnl0$g;

    .line 46
    .line 47
    .line 48
    move-result-object v6

    .line 49
    iget-object v7, v2, Lcom/p1/mobile/putong/core/ui/PictureView;->s:Lv/VLinear;

    .line 50
    .line 51
    iget v8, v10, Ll/bnl0$g;->a:I

    .line 52
    .line 53
    neg-int v8, v8

    .line 54
    int-to-float v8, v8

    .line 55
    invoke-virtual {v7, v8}, Landroid/view/View;->setTranslationX(F)V

    .line 56
    .line 57
    .line 58
    iget-object v7, v2, Lcom/p1/mobile/putong/core/ui/PictureView;->s:Lv/VLinear;

    .line 59
    .line 60
    iget v3, v3, Ll/bnl0$g;->b:I

    .line 61
    .line 62
    iget v8, v10, Ll/bnl0$g;->b:I

    .line 63
    .line 64
    sub-int/2addr v3, v8

    .line 65
    iget v6, v6, Ll/bnl0$g;->b:I

    .line 66
    .line 67
    iget v8, v11, Ll/bnl0$g;->b:I

    .line 68
    .line 69
    sub-int/2addr v6, v8

    .line 70
    sub-int/2addr v3, v6

    .line 71
    int-to-float v3, v3

    .line 72
    invoke-virtual {v7, v3}, Landroid/view/View;->setTranslationY(F)V

    .line 73
    .line 74
    .line 75
    move v12, v4

    .line 76
    goto :goto_0

    .line 77
    :cond_0
    move v12, v5

    .line 78
    :goto_0
    iget-object v3, v2, Lcom/p1/mobile/putong/core/ui/PictureView;->s:Lv/VLinear;

    .line 79
    .line 80
    invoke-virtual {v3}, Landroid/view/View;->getTranslationX()F

    .line 81
    .line 82
    .line 83
    move-result v13

    .line 84
    iget-object v3, v2, Lcom/p1/mobile/putong/core/ui/PictureView;->s:Lv/VLinear;

    .line 85
    .line 86
    invoke-virtual {v3}, Landroid/view/View;->getTranslationY()F

    .line 87
    .line 88
    .line 89
    move-result v14

    .line 90
    const/4 v3, 0x2

    .line 91
    new-array v15, v3, [F

    .line 92
    .line 93
    invoke-static {v0, v15}, Lcom/p1/mobile/putong/data/Media;->setFocusPoint(Lcom/p1/mobile/putong/data/Media;[F)V

    .line 94
    .line 95
    .line 96
    iget v3, v10, Ll/bnl0$g;->b:I

    .line 97
    .line 98
    iget v6, v11, Ll/bnl0$g;->b:I

    .line 99
    .line 100
    sub-int/2addr v3, v6

    .line 101
    int-to-float v3, v3

    .line 102
    invoke-virtual {v2, v3}, Landroid/view/View;->setY(F)V

    .line 103
    .line 104
    .line 105
    iget v3, v10, Ll/bnl0$g;->a:I

    .line 106
    .line 107
    int-to-float v3, v3

    .line 108
    invoke-virtual {v2, v3}, Landroid/view/View;->setX(F)V

    .line 109
    .line 110
    .line 111
    instance-of v0, v0, Lcom/p1/mobile/putong/data/Video;

    .line 112
    .line 113
    if-eqz v0, :cond_1

    .line 114
    .line 115
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/PictureView;->U()V

    .line 116
    .line 117
    .line 118
    :cond_1
    invoke-direct {v1}, Ll/as20;->A()I

    .line 119
    .line 120
    .line 121
    move-result v3

    .line 122
    iget-boolean v6, v1, Ll/as20;->a:Z

    .line 123
    .line 124
    if-eqz v6, :cond_2

    .line 125
    .line 126
    iget-object v6, v2, Lcom/p1/mobile/putong/core/ui/PictureView;->g:Lv/VFrame_ColorFilter;

    .line 127
    .line 128
    move-object/from16 v7, p7

    .line 129
    .line 130
    iget-object v7, v7, Lcom/p1/mobile/putong/core/ui/PictureView;->g:Lv/VFrame_ColorFilter;

    .line 131
    .line 132
    invoke-static {v7}, Ll/bnl0;->i0(Landroid/view/View;)Ll/bnl0$g;

    .line 133
    .line 134
    .line 135
    move-result-object v7

    .line 136
    iget-object v8, v2, Lcom/p1/mobile/putong/core/ui/PictureView;->g:Lv/VFrame_ColorFilter;

    .line 137
    .line 138
    invoke-static {v8}, Ll/bnl0;->i0(Landroid/view/View;)Ll/bnl0$g;

    .line 139
    .line 140
    .line 141
    move-result-object v8

    .line 142
    invoke-static {v6, v7, v8}, Ll/bnl0;->K0(Landroid/view/View;Ll/bnl0$g;Ll/bnl0$g;)V

    .line 143
    .line 144
    .line 145
    iget-object v6, v2, Lcom/p1/mobile/putong/core/ui/PictureView;->g:Lv/VFrame_ColorFilter;

    .line 146
    .line 147
    invoke-virtual {v6}, Landroid/view/View;->getTranslationY()F

    .line 148
    .line 149
    .line 150
    move-result v6

    .line 151
    iput v6, v1, Ll/as20;->g:F

    .line 152
    .line 153
    :cond_2
    int-to-long v6, v3

    .line 154
    iget v3, v11, Ll/bnl0$g;->a:I

    .line 155
    .line 156
    neg-int v3, v3

    .line 157
    int-to-float v3, v3

    .line 158
    new-array v9, v4, [F

    .line 159
    .line 160
    aput v3, v9, v5

    .line 161
    .line 162
    const-string v3, "translationX"

    .line 163
    .line 164
    const-wide/16 v4, 0x0

    .line 165
    .line 166
    const/4 v8, 0x0

    .line 167
    invoke-static/range {v2 .. v9}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 168
    .line 169
    .line 170
    move-result-object v3

    .line 171
    check-cast v3, Landroid/animation/ObjectAnimator;

    .line 172
    .line 173
    move v8, v0

    .line 174
    new-instance v0, Ll/sr20;

    .line 175
    .line 176
    move-object v2, v10

    .line 177
    move-object v10, v3

    .line 178
    move-object v3, v2

    .line 179
    move-object/from16 v2, p2

    .line 180
    .line 181
    move-object v4, v11

    .line 182
    move v5, v12

    .line 183
    move v6, v13

    .line 184
    move v7, v14

    .line 185
    move-object v9, v15

    .line 186
    invoke-direct/range {v0 .. v9}, Ll/sr20;-><init>(Ll/as20;Lcom/p1/mobile/putong/core/ui/PictureView;Ll/bnl0$g;Ll/bnl0$g;ZFFZ[F)V

    .line 187
    .line 188
    .line 189
    invoke-virtual {v10, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 190
    .line 191
    .line 192
    return-object v10
.end method

.method public final x(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/ui/PictureView;Lcom/p1/mobile/putong/data/Media;Ll/bnl0$g;Ll/bnl0$g;Ll/bnl0$g;ILcom/p1/mobile/putong/core/ui/PictureView;Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;)Landroid/animation/ObjectAnimator;
    .locals 16

    .line 1
    move-object/from16 v0, p2

    .line 2
    .line 3
    move-object/from16 v1, p3

    .line 4
    .line 5
    move-object/from16 v8, p4

    .line 6
    .line 7
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/PictureView;->b:Lv/VDraweeView;

    .line 8
    .line 9
    invoke-static {v2}, Ll/bnl0;->i0(Landroid/view/View;)Ll/bnl0$g;

    .line 10
    .line 11
    .line 12
    const/4 v2, 0x2

    .line 13
    new-array v9, v2, [F

    .line 14
    .line 15
    invoke-static {v1, v9}, Lcom/p1/mobile/putong/data/Media;->setFocusPoint(Lcom/p1/mobile/putong/data/Media;[F)V

    .line 16
    .line 17
    .line 18
    instance-of v10, v1, Lcom/p1/mobile/putong/data/Video;

    .line 19
    .line 20
    if-eqz v10, :cond_0

    .line 21
    .line 22
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/PictureView;->U()V

    .line 23
    .line 24
    .line 25
    :cond_0
    invoke-static {}, Ll/gra;->y2()Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    const/4 v2, 0x1

    .line 30
    const/4 v3, 0x0

    .line 31
    if-eqz v1, :cond_1

    .line 32
    .line 33
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/PictureView;->s:Lv/VLinear;

    .line 34
    .line 35
    invoke-static {v1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    if-eqz v1, :cond_1

    .line 40
    .line 41
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/PictureView;->u:Lv/VText;

    .line 42
    .line 43
    invoke-static {v1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    if-eqz v1, :cond_1

    .line 48
    .line 49
    move-object/from16 v1, p9

    .line 50
    .line 51
    iget-object v1, v1, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->y1:Landroid/widget/LinearLayout;

    .line 52
    .line 53
    invoke-static {v1}, Ll/bnl0;->i0(Landroid/view/View;)Ll/bnl0$g;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    iget-object v4, v0, Lcom/p1/mobile/putong/core/ui/PictureView;->s:Lv/VLinear;

    .line 58
    .line 59
    invoke-static {v4}, Ll/bnl0;->i0(Landroid/view/View;)Ll/bnl0$g;

    .line 60
    .line 61
    .line 62
    move-result-object v4

    .line 63
    iget v5, v8, Ll/bnl0$g;->a:I

    .line 64
    .line 65
    neg-int v5, v5

    .line 66
    int-to-float v5, v5

    .line 67
    iget v1, v1, Ll/bnl0$g;->b:I

    .line 68
    .line 69
    iget v6, v8, Ll/bnl0$g;->b:I

    .line 70
    .line 71
    sub-int/2addr v1, v6

    .line 72
    iget v4, v4, Ll/bnl0$g;->b:I

    .line 73
    .line 74
    move-object/from16 v11, p5

    .line 75
    .line 76
    iget v6, v11, Ll/bnl0$g;->b:I

    .line 77
    .line 78
    sub-int/2addr v4, v6

    .line 79
    sub-int/2addr v1, v4

    .line 80
    int-to-float v1, v1

    .line 81
    move v12, v1

    .line 82
    move v14, v2

    .line 83
    move v13, v5

    .line 84
    goto :goto_0

    .line 85
    :cond_1
    move-object/from16 v11, p5

    .line 86
    .line 87
    const/4 v5, 0x0

    .line 88
    move v14, v3

    .line 89
    move v12, v5

    .line 90
    move v13, v12

    .line 91
    :goto_0
    invoke-direct/range {p0 .. p0}, Ll/as20;->A()I

    .line 92
    .line 93
    .line 94
    move-result v1

    .line 95
    int-to-long v4, v1

    .line 96
    iget v1, v8, Ll/bnl0$g;->a:I

    .line 97
    .line 98
    int-to-float v1, v1

    .line 99
    new-array v7, v2, [F

    .line 100
    .line 101
    aput v1, v7, v3

    .line 102
    .line 103
    const-string v1, "translationX"

    .line 104
    .line 105
    const-wide/16 v2, 0x0

    .line 106
    .line 107
    const/4 v6, 0x0

    .line 108
    invoke-static/range {v0 .. v7}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 109
    .line 110
    .line 111
    move-result-object v1

    .line 112
    move-object v15, v1

    .line 113
    check-cast v15, Landroid/animation/ObjectAnimator;

    .line 114
    .line 115
    new-instance v0, Ll/yr20;

    .line 116
    .line 117
    move-object/from16 v1, p0

    .line 118
    .line 119
    move-object/from16 v2, p2

    .line 120
    .line 121
    move-object v4, v8

    .line 122
    move v8, v10

    .line 123
    move-object v3, v11

    .line 124
    move v7, v12

    .line 125
    move v6, v13

    .line 126
    move v5, v14

    .line 127
    invoke-direct/range {v0 .. v9}, Ll/yr20;-><init>(Ll/as20;Lcom/p1/mobile/putong/core/ui/PictureView;Ll/bnl0$g;Ll/bnl0$g;ZFFZ[F)V

    .line 128
    .line 129
    .line 130
    invoke-virtual {v15, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 131
    .line 132
    .line 133
    return-object v15
.end method

.method public y(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;)Landroid/animation/Animator;
    .locals 51

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p2

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ll/as20;->J(Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object v9

    .line 9
    invoke-static {v9}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    const/4 v2, 0x0

    .line 14
    if-eqz v1, :cond_10

    .line 15
    .line 16
    iget-object v1, v9, Ll/pf60;->a:Ljava/lang/Object;

    .line 17
    .line 18
    move-object v3, v1

    .line 19
    check-cast v3, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;

    .line 20
    .line 21
    iget-object v3, v3, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->T:Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 22
    .line 23
    iget-object v3, v3, Lcom/p1/mobile/putong/core/ui/PictureView;->G:Lcom/p1/mobile/putong/data/Media;

    .line 24
    .line 25
    check-cast v1, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;

    .line 26
    .line 27
    iget-object v1, v1, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->v2:Lcom/p1/mobile/putong/data/User;

    .line 28
    .line 29
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    const/4 v10, 0x0

    .line 34
    if-eqz v1, :cond_1

    .line 35
    .line 36
    move v1, v10

    .line 37
    :goto_0
    iget-object v4, v9, Ll/pf60;->a:Ljava/lang/Object;

    .line 38
    .line 39
    check-cast v4, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;

    .line 40
    .line 41
    iget-object v4, v4, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->v2:Lcom/p1/mobile/putong/data/User;

    .line 42
    .line 43
    iget-object v4, v4, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 44
    .line 45
    invoke-interface {v4}, Ljava/util/List;->size()I

    .line 46
    .line 47
    .line 48
    move-result v4

    .line 49
    if-ge v1, v4, :cond_1

    .line 50
    .line 51
    iget-object v4, v9, Ll/pf60;->a:Ljava/lang/Object;

    .line 52
    .line 53
    check-cast v4, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;

    .line 54
    .line 55
    iget-object v4, v4, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->v2:Lcom/p1/mobile/putong/data/User;

    .line 56
    .line 57
    iget-object v4, v4, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 58
    .line 59
    invoke-interface {v4, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object v4

    .line 63
    check-cast v4, Lcom/p1/mobile/putong/data/Media;

    .line 64
    .line 65
    iget-object v4, v4, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 66
    .line 67
    iget-object v5, v3, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 68
    .line 69
    invoke-static {v4, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 70
    .line 71
    .line 72
    move-result v4

    .line 73
    if-eqz v4, :cond_0

    .line 74
    .line 75
    goto :goto_1

    .line 76
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_1
    move v1, v10

    .line 80
    :goto_1
    iget-object v4, v9, Ll/pf60;->b:Ljava/lang/Object;

    .line 81
    .line 82
    check-cast v4, Ll/q3m;

    .line 83
    .line 84
    invoke-interface {v4, v1}, Ll/q3m;->r3(I)Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 85
    .line 86
    .line 87
    move-result-object v11

    .line 88
    invoke-static {v11}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 89
    .line 90
    .line 91
    move-result v1

    .line 92
    if-eqz v1, :cond_10

    .line 93
    .line 94
    iget-object v1, v9, Ll/pf60;->a:Ljava/lang/Object;

    .line 95
    .line 96
    check-cast v1, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;

    .line 97
    .line 98
    new-instance v4, Ll/pr20;

    .line 99
    .line 100
    invoke-direct {v4, v0, v9, v3}, Ll/pr20;-><init>(Ll/as20;Ll/pf60;Lcom/p1/mobile/putong/data/Media;)V

    .line 101
    .line 102
    .line 103
    invoke-virtual {v1, v4}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 104
    .line 105
    .line 106
    iget-object v1, v9, Ll/pf60;->a:Ljava/lang/Object;

    .line 107
    .line 108
    check-cast v1, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;

    .line 109
    .line 110
    iget-object v1, v1, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->T:Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 111
    .line 112
    invoke-static {v1}, Ll/bnl0;->i0(Landroid/view/View;)Ll/bnl0$g;

    .line 113
    .line 114
    .line 115
    move-result-object v4

    .line 116
    invoke-static {v11}, Ll/bnl0;->i0(Landroid/view/View;)Ll/bnl0$g;

    .line 117
    .line 118
    .line 119
    move-result-object v5

    .line 120
    iget-object v1, v9, Ll/pf60;->a:Ljava/lang/Object;

    .line 121
    .line 122
    check-cast v1, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;

    .line 123
    .line 124
    iget-object v1, v1, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->T:Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 125
    .line 126
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/PictureView;->b:Lv/VDraweeView;

    .line 127
    .line 128
    invoke-static {v1}, Ll/bnl0;->i0(Landroid/view/View;)Ll/bnl0$g;

    .line 129
    .line 130
    .line 131
    move-result-object v6

    .line 132
    iget-boolean v1, v0, Ll/as20;->c:Z

    .line 133
    .line 134
    if-eqz v1, :cond_2

    .line 135
    .line 136
    iget-object v1, v9, Ll/pf60;->a:Ljava/lang/Object;

    .line 137
    .line 138
    move-object v2, v1

    .line 139
    check-cast v2, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;

    .line 140
    .line 141
    iget-object v2, v2, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->v2:Lcom/p1/mobile/putong/data/User;

    .line 142
    .line 143
    move-object v7, v1

    .line 144
    check-cast v7, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;

    .line 145
    .line 146
    iget-object v7, v7, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->T:Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 147
    .line 148
    move-object v8, v1

    .line 149
    check-cast v8, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;

    .line 150
    .line 151
    move-object v1, v2

    .line 152
    move-object v2, v11

    .line 153
    invoke-virtual/range {v0 .. v8}, Ll/as20;->w(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/ui/PictureView;Lcom/p1/mobile/putong/data/Media;Ll/bnl0$g;Ll/bnl0$g;Ll/bnl0$g;Lcom/p1/mobile/putong/core/ui/PictureView;Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;)Landroid/animation/ObjectAnimator;

    .line 154
    .line 155
    .line 156
    move-result-object v1

    .line 157
    move-object v2, v1

    .line 158
    goto :goto_2

    .line 159
    :cond_2
    invoke-static {v11, v4, v5}, Ll/bnl0;->K0(Landroid/view/View;Ll/bnl0$g;Ll/bnl0$g;)V

    .line 160
    .line 161
    .line 162
    :goto_2
    invoke-static {}, Ll/vq8;->b()Z

    .line 163
    .line 164
    .line 165
    move-result v1

    .line 166
    if-eqz v1, :cond_3

    .line 167
    .line 168
    iget-object v1, v9, Ll/pf60;->b:Ljava/lang/Object;

    .line 169
    .line 170
    check-cast v1, Ll/q3m;

    .line 171
    .line 172
    invoke-interface {v1}, Ll/q3m;->R2()Landroid/view/View;

    .line 173
    .line 174
    .line 175
    move-result-object v1

    .line 176
    iget-object v4, v9, Ll/pf60;->a:Ljava/lang/Object;

    .line 177
    .line 178
    check-cast v4, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;

    .line 179
    .line 180
    iget-object v4, v4, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->F0:Lv/VFrame;

    .line 181
    .line 182
    invoke-static {v4}, Ll/bnl0;->i0(Landroid/view/View;)Ll/bnl0$g;

    .line 183
    .line 184
    .line 185
    move-result-object v4

    .line 186
    iget-object v5, v9, Ll/pf60;->b:Ljava/lang/Object;

    .line 187
    .line 188
    check-cast v5, Ll/q3m;

    .line 189
    .line 190
    invoke-interface {v5}, Ll/q3m;->R2()Landroid/view/View;

    .line 191
    .line 192
    .line 193
    move-result-object v5

    .line 194
    invoke-static {v5}, Ll/bnl0;->i0(Landroid/view/View;)Ll/bnl0$g;

    .line 195
    .line 196
    .line 197
    move-result-object v5

    .line 198
    invoke-static {v1, v4, v5}, Ll/bnl0;->K0(Landroid/view/View;Ll/bnl0$g;Ll/bnl0$g;)V

    .line 199
    .line 200
    .line 201
    :cond_3
    invoke-static {}, Ll/spl0;->a0()Z

    .line 202
    .line 203
    .line 204
    move-result v1

    .line 205
    if-eqz v1, :cond_4

    .line 206
    .line 207
    iget-object v1, v9, Ll/pf60;->a:Ljava/lang/Object;

    .line 208
    .line 209
    check-cast v1, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;

    .line 210
    .line 211
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->a2()V

    .line 212
    .line 213
    .line 214
    :cond_4
    iget-object v1, v9, Ll/pf60;->b:Ljava/lang/Object;

    .line 215
    .line 216
    check-cast v1, Ll/q3m;

    .line 217
    .line 218
    invoke-interface {v1}, Ll/t3m;->q()Landroid/view/ViewGroup;

    .line 219
    .line 220
    .line 221
    move-result-object v1

    .line 222
    invoke-static {v1}, Ll/bnl0;->i0(Landroid/view/View;)Ll/bnl0$g;

    .line 223
    .line 224
    .line 225
    move-result-object v1

    .line 226
    iget-object v4, v9, Ll/pf60;->b:Ljava/lang/Object;

    .line 227
    .line 228
    check-cast v4, Ll/q3m;

    .line 229
    .line 230
    invoke-interface {v4}, Ll/q3m;->U()Ll/bnl0$g;

    .line 231
    .line 232
    .line 233
    move-result-object v4

    .line 234
    invoke-static {v11}, Ll/bnl0;->a0(Landroid/view/View;)V

    .line 235
    .line 236
    .line 237
    iget v5, v1, Ll/bnl0$g;->d:I

    .line 238
    .line 239
    iget v4, v4, Ll/bnl0$g;->b:I

    .line 240
    .line 241
    iget v1, v1, Ll/bnl0$g;->b:I

    .line 242
    .line 243
    sub-int/2addr v4, v1

    .line 244
    sub-int/2addr v5, v4

    .line 245
    const/high16 v1, 0x41f00000    # 30.0f

    .line 246
    .line 247
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 248
    .line 249
    .line 250
    move-result v1

    .line 251
    add-int/2addr v5, v1

    .line 252
    iget-object v1, v9, Ll/pf60;->b:Ljava/lang/Object;

    .line 253
    .line 254
    check-cast v1, Ll/q3m;

    .line 255
    .line 256
    invoke-interface {v1}, Ll/q3m;->o0()Landroid/view/View;

    .line 257
    .line 258
    .line 259
    move-result-object v1

    .line 260
    invoke-static {v1}, Ll/bnl0;->i0(Landroid/view/View;)Ll/bnl0$g;

    .line 261
    .line 262
    .line 263
    move-result-object v1

    .line 264
    iget v1, v1, Ll/bnl0$g;->a:I

    .line 265
    .line 266
    iget-object v1, v9, Ll/pf60;->b:Ljava/lang/Object;

    .line 267
    .line 268
    check-cast v1, Ll/q3m;

    .line 269
    .line 270
    invoke-interface {v1}, Ll/q3m;->B1()Ljava/util/List;

    .line 271
    .line 272
    .line 273
    move-result-object v1

    .line 274
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 275
    .line 276
    .line 277
    move-result-object v1

    .line 278
    :goto_3
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 279
    .line 280
    .line 281
    move-result v4

    .line 282
    if-eqz v4, :cond_5

    .line 283
    .line 284
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 285
    .line 286
    .line 287
    move-result-object v4

    .line 288
    check-cast v4, Landroid/view/View;

    .line 289
    .line 290
    int-to-float v6, v5

    .line 291
    invoke-virtual {v4, v6}, Landroid/view/View;->setTranslationY(F)V

    .line 292
    .line 293
    .line 294
    goto :goto_3

    .line 295
    :cond_5
    iget-object v1, v9, Ll/pf60;->b:Ljava/lang/Object;

    .line 296
    .line 297
    check-cast v1, Ll/q3m;

    .line 298
    .line 299
    invoke-interface {v1}, Ll/q3m;->S1()Landroid/view/View;

    .line 300
    .line 301
    .line 302
    move-result-object v12

    .line 303
    invoke-direct {v0}, Ll/as20;->A()I

    .line 304
    .line 305
    .line 306
    move-result v1

    .line 307
    int-to-long v6, v1

    .line 308
    const/4 v1, 0x2

    .line 309
    new-array v4, v1, [F

    .line 310
    .line 311
    fill-array-data v4, :array_0

    .line 312
    .line 313
    .line 314
    const-string v13, "alpha"

    .line 315
    .line 316
    const-wide/16 v14, 0x0

    .line 317
    .line 318
    const/16 v18, 0x0

    .line 319
    .line 320
    move-object/from16 v19, v4

    .line 321
    .line 322
    move-wide/from16 v16, v6

    .line 323
    .line 324
    invoke-static/range {v12 .. v19}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 325
    .line 326
    .line 327
    move-result-object v19

    .line 328
    iget-object v4, v9, Ll/pf60;->b:Ljava/lang/Object;

    .line 329
    .line 330
    check-cast v4, Ll/q3m;

    .line 331
    .line 332
    invoke-interface {v4}, Ll/q3m;->F()Landroid/view/View;

    .line 333
    .line 334
    .line 335
    move-result-object v20

    .line 336
    invoke-direct {v0}, Ll/as20;->A()I

    .line 337
    .line 338
    .line 339
    move-result v4

    .line 340
    int-to-long v6, v4

    .line 341
    new-array v4, v1, [F

    .line 342
    .line 343
    fill-array-data v4, :array_1

    .line 344
    .line 345
    .line 346
    const-string v21, "alpha"

    .line 347
    .line 348
    const-wide/16 v22, 0x0

    .line 349
    .line 350
    const/16 v26, 0x0

    .line 351
    .line 352
    move-object/from16 v27, v4

    .line 353
    .line 354
    move-wide/from16 v24, v6

    .line 355
    .line 356
    invoke-static/range {v20 .. v27}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 357
    .line 358
    .line 359
    move-result-object v20

    .line 360
    iget-object v4, v9, Ll/pf60;->b:Ljava/lang/Object;

    .line 361
    .line 362
    check-cast v4, Ll/q3m;

    .line 363
    .line 364
    invoke-interface {v4}, Ll/q3m;->J()Landroid/view/View;

    .line 365
    .line 366
    .line 367
    move-result-object v21

    .line 368
    invoke-direct {v0}, Ll/as20;->A()I

    .line 369
    .line 370
    .line 371
    move-result v4

    .line 372
    int-to-long v6, v4

    .line 373
    new-array v4, v1, [F

    .line 374
    .line 375
    fill-array-data v4, :array_2

    .line 376
    .line 377
    .line 378
    const-string v22, "alpha"

    .line 379
    .line 380
    const-wide/16 v23, 0x0

    .line 381
    .line 382
    const/16 v27, 0x0

    .line 383
    .line 384
    move-object/from16 v28, v4

    .line 385
    .line 386
    move-wide/from16 v25, v6

    .line 387
    .line 388
    invoke-static/range {v21 .. v28}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 389
    .line 390
    .line 391
    move-result-object v21

    .line 392
    iget-object v4, v9, Ll/pf60;->b:Ljava/lang/Object;

    .line 393
    .line 394
    check-cast v4, Ll/q3m;

    .line 395
    .line 396
    invoke-interface {v4}, Ll/q3m;->h2()Landroid/view/View;

    .line 397
    .line 398
    .line 399
    move-result-object v22

    .line 400
    invoke-direct {v0}, Ll/as20;->A()I

    .line 401
    .line 402
    .line 403
    move-result v4

    .line 404
    int-to-long v6, v4

    .line 405
    new-array v4, v1, [F

    .line 406
    .line 407
    fill-array-data v4, :array_3

    .line 408
    .line 409
    .line 410
    const-string v23, "alpha"

    .line 411
    .line 412
    const-wide/16 v24, 0x0

    .line 413
    .line 414
    const/16 v28, 0x0

    .line 415
    .line 416
    move-object/from16 v29, v4

    .line 417
    .line 418
    move-wide/from16 v26, v6

    .line 419
    .line 420
    invoke-static/range {v22 .. v29}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 421
    .line 422
    .line 423
    move-result-object v22

    .line 424
    iget-object v4, v9, Ll/pf60;->b:Ljava/lang/Object;

    .line 425
    .line 426
    check-cast v4, Ll/q3m;

    .line 427
    .line 428
    invoke-interface {v4}, Ll/q3m;->o0()Landroid/view/View;

    .line 429
    .line 430
    .line 431
    move-result-object v23

    .line 432
    invoke-direct {v0}, Ll/as20;->A()I

    .line 433
    .line 434
    .line 435
    move-result v4

    .line 436
    int-to-long v6, v4

    .line 437
    new-array v4, v1, [F

    .line 438
    .line 439
    fill-array-data v4, :array_4

    .line 440
    .line 441
    .line 442
    const-string v24, "alpha"

    .line 443
    .line 444
    const-wide/16 v25, 0x0

    .line 445
    .line 446
    const/16 v29, 0x0

    .line 447
    .line 448
    move-object/from16 v30, v4

    .line 449
    .line 450
    move-wide/from16 v27, v6

    .line 451
    .line 452
    invoke-static/range {v23 .. v30}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 453
    .line 454
    .line 455
    move-result-object v23

    .line 456
    iget-object v4, v9, Ll/pf60;->b:Ljava/lang/Object;

    .line 457
    .line 458
    check-cast v4, Ll/q3m;

    .line 459
    .line 460
    invoke-interface {v4}, Ll/q3m;->y1()Landroid/view/View;

    .line 461
    .line 462
    .line 463
    move-result-object v24

    .line 464
    invoke-direct {v0}, Ll/as20;->A()I

    .line 465
    .line 466
    .line 467
    move-result v4

    .line 468
    int-to-long v6, v4

    .line 469
    new-array v4, v1, [F

    .line 470
    .line 471
    fill-array-data v4, :array_5

    .line 472
    .line 473
    .line 474
    const-string v25, "alpha"

    .line 475
    .line 476
    const-wide/16 v26, 0x0

    .line 477
    .line 478
    const/16 v30, 0x0

    .line 479
    .line 480
    move-object/from16 v31, v4

    .line 481
    .line 482
    move-wide/from16 v28, v6

    .line 483
    .line 484
    invoke-static/range {v24 .. v31}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 485
    .line 486
    .line 487
    move-result-object v24

    .line 488
    iget-object v4, v9, Ll/pf60;->b:Ljava/lang/Object;

    .line 489
    .line 490
    check-cast v4, Ll/q3m;

    .line 491
    .line 492
    invoke-interface {v4}, Ll/q3m;->q2()Landroid/view/View;

    .line 493
    .line 494
    .line 495
    move-result-object v25

    .line 496
    invoke-direct {v0}, Ll/as20;->A()I

    .line 497
    .line 498
    .line 499
    move-result v4

    .line 500
    int-to-long v6, v4

    .line 501
    new-array v4, v1, [F

    .line 502
    .line 503
    fill-array-data v4, :array_6

    .line 504
    .line 505
    .line 506
    const-string v26, "alpha"

    .line 507
    .line 508
    const-wide/16 v27, 0x0

    .line 509
    .line 510
    const/16 v31, 0x0

    .line 511
    .line 512
    move-object/from16 v32, v4

    .line 513
    .line 514
    move-wide/from16 v29, v6

    .line 515
    .line 516
    invoke-static/range {v25 .. v32}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 517
    .line 518
    .line 519
    move-result-object v25

    .line 520
    filled-new-array/range {v19 .. v25}, [Landroid/animation/Animator;

    .line 521
    .line 522
    .line 523
    move-result-object v4

    .line 524
    invoke-static {v4}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 525
    .line 526
    .line 527
    move-result-object v4

    .line 528
    invoke-virtual {v4}, Landroid/animation/Animator;->start()V

    .line 529
    .line 530
    .line 531
    iget-object v4, v9, Ll/pf60;->b:Ljava/lang/Object;

    .line 532
    .line 533
    check-cast v4, Ll/q3m;

    .line 534
    .line 535
    invoke-interface {v4}, Ll/q3m;->Q2()Landroid/view/View;

    .line 536
    .line 537
    .line 538
    move-result-object v4

    .line 539
    const/4 v6, 0x0

    .line 540
    invoke-virtual {v4, v6}, Landroid/view/View;->setAlpha(F)V

    .line 541
    .line 542
    .line 543
    invoke-static {}, Ll/wkh0;->f()Z

    .line 544
    .line 545
    .line 546
    move-result v4

    .line 547
    if-eqz v4, :cond_6

    .line 548
    .line 549
    iget-object v4, v9, Ll/pf60;->b:Ljava/lang/Object;

    .line 550
    .line 551
    check-cast v4, Ll/q3m;

    .line 552
    .line 553
    invoke-interface {v4}, Ll/q3m;->H1()Landroid/view/View;

    .line 554
    .line 555
    .line 556
    move-result-object v4

    .line 557
    invoke-virtual {v4, v6}, Landroid/view/View;->setAlpha(F)V

    .line 558
    .line 559
    .line 560
    :cond_6
    iget-object v4, v9, Ll/pf60;->b:Ljava/lang/Object;

    .line 561
    .line 562
    check-cast v4, Ll/q3m;

    .line 563
    .line 564
    invoke-interface {v4}, Ll/q3m;->C3()Landroid/view/View;

    .line 565
    .line 566
    .line 567
    move-result-object v4

    .line 568
    invoke-static {v4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 569
    .line 570
    .line 571
    move-result v4

    .line 572
    if-eqz v4, :cond_7

    .line 573
    .line 574
    iget-object v4, v9, Ll/pf60;->b:Ljava/lang/Object;

    .line 575
    .line 576
    check-cast v4, Ll/q3m;

    .line 577
    .line 578
    invoke-interface {v4}, Ll/q3m;->C3()Landroid/view/View;

    .line 579
    .line 580
    .line 581
    move-result-object v12

    .line 582
    invoke-direct {v0}, Ll/as20;->D()I

    .line 583
    .line 584
    .line 585
    move-result v4

    .line 586
    int-to-long v7, v4

    .line 587
    new-array v4, v1, [F

    .line 588
    .line 589
    fill-array-data v4, :array_7

    .line 590
    .line 591
    .line 592
    const-string v13, "alpha"

    .line 593
    .line 594
    const-wide/16 v14, 0x0

    .line 595
    .line 596
    const/16 v18, 0x0

    .line 597
    .line 598
    move-object/from16 v19, v4

    .line 599
    .line 600
    move-wide/from16 v16, v7

    .line 601
    .line 602
    invoke-static/range {v12 .. v19}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 603
    .line 604
    .line 605
    move-result-object v4

    .line 606
    invoke-virtual {v4}, Landroid/animation/Animator;->start()V

    .line 607
    .line 608
    .line 609
    :cond_7
    invoke-static {}, Ll/fcp;->y()Z

    .line 610
    .line 611
    .line 612
    move-result v4

    .line 613
    if-eqz v4, :cond_8

    .line 614
    .line 615
    iget-object v4, v9, Ll/pf60;->b:Ljava/lang/Object;

    .line 616
    .line 617
    check-cast v4, Ll/q3m;

    .line 618
    .line 619
    invoke-interface {v4}, Ll/q3m;->W2()Landroid/view/View;

    .line 620
    .line 621
    .line 622
    move-result-object v4

    .line 623
    int-to-float v7, v5

    .line 624
    invoke-virtual {v4, v7}, Landroid/view/View;->setTranslationY(F)V

    .line 625
    .line 626
    .line 627
    :cond_8
    iget-object v4, v9, Ll/pf60;->a:Ljava/lang/Object;

    .line 628
    .line 629
    check-cast v4, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;

    .line 630
    .line 631
    iget-object v4, v4, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->T:Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 632
    .line 633
    invoke-static {v4, v11}, Ll/as20;->I(Lcom/p1/mobile/putong/core/ui/PictureView;Lcom/p1/mobile/putong/core/ui/PictureView;)Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 634
    .line 635
    .line 636
    move-result-object v4

    .line 637
    invoke-direct {v0}, Ll/as20;->A()I

    .line 638
    .line 639
    .line 640
    move-result v14

    .line 641
    iget-object v7, v9, Ll/pf60;->b:Ljava/lang/Object;

    .line 642
    .line 643
    check-cast v7, Ll/q3m;

    .line 644
    .line 645
    invoke-interface {v7}, Ll/q3m;->o3()Landroid/view/View;

    .line 646
    .line 647
    .line 648
    move-result-object v7

    .line 649
    invoke-static {v7}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 650
    .line 651
    .line 652
    move-result v7

    .line 653
    if-eqz v7, :cond_9

    .line 654
    .line 655
    iget-object v7, v9, Ll/pf60;->b:Ljava/lang/Object;

    .line 656
    .line 657
    check-cast v7, Ll/q3m;

    .line 658
    .line 659
    invoke-interface {v7}, Ll/q3m;->o3()Landroid/view/View;

    .line 660
    .line 661
    .line 662
    move-result-object v7

    .line 663
    invoke-static {v7}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 664
    .line 665
    .line 666
    move-result v7

    .line 667
    if-eqz v7, :cond_9

    .line 668
    .line 669
    iget-object v7, v9, Ll/pf60;->b:Ljava/lang/Object;

    .line 670
    .line 671
    check-cast v7, Ll/q3m;

    .line 672
    .line 673
    invoke-interface {v7}, Ll/q3m;->o3()Landroid/view/View;

    .line 674
    .line 675
    .line 676
    move-result-object v7

    .line 677
    invoke-virtual {v7, v6}, Landroid/view/View;->setAlpha(F)V

    .line 678
    .line 679
    .line 680
    :cond_9
    invoke-static {}, Ll/wkh0;->f()Z

    .line 681
    .line 682
    .line 683
    move-result v7

    .line 684
    const/4 v8, 0x1

    .line 685
    const/high16 v19, 0x3f800000    # 1.0f

    .line 686
    .line 687
    if-eqz v7, :cond_a

    .line 688
    .line 689
    iget-object v7, v9, Ll/pf60;->b:Ljava/lang/Object;

    .line 690
    .line 691
    check-cast v7, Ll/q3m;

    .line 692
    .line 693
    invoke-interface {v7}, Ll/q3m;->H1()Landroid/view/View;

    .line 694
    .line 695
    .line 696
    move-result-object v20

    .line 697
    invoke-direct {v0}, Ll/as20;->D()I

    .line 698
    .line 699
    .line 700
    move-result v7

    .line 701
    int-to-long v12, v7

    .line 702
    invoke-direct {v0}, Ll/as20;->D()I

    .line 703
    .line 704
    .line 705
    move-result v7

    .line 706
    div-int/2addr v7, v1

    .line 707
    move/from16 p2, v6

    .line 708
    .line 709
    int-to-long v6, v7

    .line 710
    new-array v1, v8, [F

    .line 711
    .line 712
    aput v19, v1, v10

    .line 713
    .line 714
    const-string v21, "alpha"

    .line 715
    .line 716
    const/16 v26, 0x0

    .line 717
    .line 718
    move-object/from16 v27, v1

    .line 719
    .line 720
    move-wide/from16 v24, v6

    .line 721
    .line 722
    move-wide/from16 v22, v12

    .line 723
    .line 724
    invoke-static/range {v20 .. v27}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 725
    .line 726
    .line 727
    move-result-object v1

    .line 728
    :goto_4
    move-object/from16 v20, v1

    .line 729
    .line 730
    goto :goto_5

    .line 731
    :cond_a
    move/from16 p2, v6

    .line 732
    .line 733
    iget-boolean v6, v0, Ll/as20;->d:Z

    .line 734
    .line 735
    iget-object v7, v9, Ll/pf60;->b:Ljava/lang/Object;

    .line 736
    .line 737
    if-eqz v6, :cond_b

    .line 738
    .line 739
    check-cast v7, Ll/q3m;

    .line 740
    .line 741
    invoke-interface {v7}, Ll/q3m;->Q2()Landroid/view/View;

    .line 742
    .line 743
    .line 744
    move-result-object v20

    .line 745
    invoke-direct {v0}, Ll/as20;->D()I

    .line 746
    .line 747
    .line 748
    move-result v6

    .line 749
    int-to-long v6, v6

    .line 750
    invoke-direct {v0}, Ll/as20;->D()I

    .line 751
    .line 752
    .line 753
    move-result v12

    .line 754
    div-int/2addr v12, v1

    .line 755
    int-to-long v12, v12

    .line 756
    new-array v1, v8, [F

    .line 757
    .line 758
    aput v19, v1, v10

    .line 759
    .line 760
    const-string v21, "alpha"

    .line 761
    .line 762
    const/16 v26, 0x0

    .line 763
    .line 764
    move-object/from16 v27, v1

    .line 765
    .line 766
    move-wide/from16 v22, v6

    .line 767
    .line 768
    move-wide/from16 v24, v12

    .line 769
    .line 770
    invoke-static/range {v20 .. v27}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 771
    .line 772
    .line 773
    move-result-object v1

    .line 774
    goto :goto_4

    .line 775
    :cond_b
    check-cast v7, Ll/q3m;

    .line 776
    .line 777
    invoke-interface {v7}, Ll/q3m;->Q2()Landroid/view/View;

    .line 778
    .line 779
    .line 780
    move-result-object v1

    .line 781
    new-array v6, v8, [F

    .line 782
    .line 783
    aput v19, v6, v10

    .line 784
    .line 785
    const-string v7, "alpha"

    .line 786
    .line 787
    invoke-static {v1, v7, v6}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    .line 788
    .line 789
    .line 790
    move-result-object v1

    .line 791
    goto :goto_4

    .line 792
    :goto_5
    iget-object v1, v9, Ll/pf60;->b:Ljava/lang/Object;

    .line 793
    .line 794
    check-cast v1, Ll/q3m;

    .line 795
    .line 796
    invoke-interface {v1}, Ll/q3m;->S1()Landroid/view/View;

    .line 797
    .line 798
    .line 799
    move-result-object v21

    .line 800
    invoke-direct {v0}, Ll/as20;->C()I

    .line 801
    .line 802
    .line 803
    move-result v1

    .line 804
    int-to-long v6, v1

    .line 805
    invoke-direct {v0}, Ll/as20;->E()I

    .line 806
    .line 807
    .line 808
    move-result v1

    .line 809
    int-to-long v12, v1

    .line 810
    sget-object v28, Ll/gt0;->d:Landroid/view/animation/Interpolator;

    .line 811
    .line 812
    new-array v1, v8, [F

    .line 813
    .line 814
    aput p2, v1, v10

    .line 815
    .line 816
    const-string v22, "translationY"

    .line 817
    .line 818
    move-wide/from16 v23, v6

    .line 819
    .line 820
    move-wide/from16 v25, v12

    .line 821
    .line 822
    move-object/from16 v27, v28

    .line 823
    .line 824
    move-object/from16 v28, v1

    .line 825
    .line 826
    invoke-static/range {v21 .. v28}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 827
    .line 828
    .line 829
    move-result-object v21

    .line 830
    move-object/from16 v28, v27

    .line 831
    .line 832
    iget-object v1, v9, Ll/pf60;->b:Ljava/lang/Object;

    .line 833
    .line 834
    check-cast v1, Ll/q3m;

    .line 835
    .line 836
    invoke-virtual {v0, v1}, Ll/as20;->v(Ll/q3m;)Landroid/animation/Animator;

    .line 837
    .line 838
    .line 839
    move-result-object v1

    .line 840
    iget-object v6, v9, Ll/pf60;->b:Ljava/lang/Object;

    .line 841
    .line 842
    check-cast v6, Ll/q3m;

    .line 843
    .line 844
    invoke-virtual {v0, v6}, Ll/as20;->u(Ll/q3m;)Landroid/animation/Animator;

    .line 845
    .line 846
    .line 847
    move-result-object v6

    .line 848
    iget-object v7, v9, Ll/pf60;->b:Ljava/lang/Object;

    .line 849
    .line 850
    check-cast v7, Ll/q3m;

    .line 851
    .line 852
    invoke-interface {v7}, Ll/q3m;->S1()Landroid/view/View;

    .line 853
    .line 854
    .line 855
    move-result-object v22

    .line 856
    invoke-direct {v0}, Ll/as20;->C()I

    .line 857
    .line 858
    .line 859
    move-result v7

    .line 860
    int-to-long v12, v7

    .line 861
    invoke-direct {v0}, Ll/as20;->E()I

    .line 862
    .line 863
    .line 864
    move-result v7

    .line 865
    move/from16 v30, v10

    .line 866
    .line 867
    move-object/from16 v18, v11

    .line 868
    .line 869
    int-to-long v10, v7

    .line 870
    new-array v7, v8, [F

    .line 871
    .line 872
    aput p2, v7, v30

    .line 873
    .line 874
    const-string v23, "rotation"

    .line 875
    .line 876
    move-object/from16 v29, v7

    .line 877
    .line 878
    move-wide/from16 v26, v10

    .line 879
    .line 880
    move-wide/from16 v24, v12

    .line 881
    .line 882
    invoke-static/range {v22 .. v29}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 883
    .line 884
    .line 885
    move-result-object v7

    .line 886
    iget-object v10, v9, Ll/pf60;->b:Ljava/lang/Object;

    .line 887
    .line 888
    check-cast v10, Ll/q3m;

    .line 889
    .line 890
    invoke-interface {v10}, Ll/q3m;->h2()Landroid/view/View;

    .line 891
    .line 892
    .line 893
    move-result-object v22

    .line 894
    invoke-direct {v0}, Ll/as20;->C()I

    .line 895
    .line 896
    .line 897
    move-result v10

    .line 898
    int-to-long v10, v10

    .line 899
    invoke-direct {v0}, Ll/as20;->E()I

    .line 900
    .line 901
    .line 902
    move-result v12

    .line 903
    int-to-long v12, v12

    .line 904
    new-array v15, v8, [F

    .line 905
    .line 906
    aput p2, v15, v30

    .line 907
    .line 908
    const-string v23, "translationY"

    .line 909
    .line 910
    move-wide/from16 v24, v10

    .line 911
    .line 912
    move-wide/from16 v26, v12

    .line 913
    .line 914
    move-object/from16 v29, v15

    .line 915
    .line 916
    invoke-static/range {v22 .. v29}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 917
    .line 918
    .line 919
    move-result-object v10

    .line 920
    iget-object v11, v9, Ll/pf60;->b:Ljava/lang/Object;

    .line 921
    .line 922
    check-cast v11, Ll/q3m;

    .line 923
    .line 924
    invoke-interface {v11}, Ll/q3m;->o0()Landroid/view/View;

    .line 925
    .line 926
    .line 927
    move-result-object v22

    .line 928
    invoke-direct {v0}, Ll/as20;->C()I

    .line 929
    .line 930
    .line 931
    move-result v11

    .line 932
    int-to-long v11, v11

    .line 933
    invoke-direct {v0}, Ll/as20;->E()I

    .line 934
    .line 935
    .line 936
    move-result v13

    .line 937
    move-object/from16 v32, v1

    .line 938
    .line 939
    move-object/from16 v31, v2

    .line 940
    .line 941
    int-to-long v1, v13

    .line 942
    new-array v13, v8, [F

    .line 943
    .line 944
    aput p2, v13, v30

    .line 945
    .line 946
    const-string v23, "translationX"

    .line 947
    .line 948
    move-wide/from16 v26, v1

    .line 949
    .line 950
    move-wide/from16 v24, v11

    .line 951
    .line 952
    move-object/from16 v29, v13

    .line 953
    .line 954
    invoke-static/range {v22 .. v29}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 955
    .line 956
    .line 957
    move-result-object v1

    .line 958
    iget-object v2, v9, Ll/pf60;->b:Ljava/lang/Object;

    .line 959
    .line 960
    check-cast v2, Ll/q3m;

    .line 961
    .line 962
    invoke-interface {v2}, Ll/q3m;->o0()Landroid/view/View;

    .line 963
    .line 964
    .line 965
    move-result-object v22

    .line 966
    invoke-direct {v0}, Ll/as20;->C()I

    .line 967
    .line 968
    .line 969
    move-result v2

    .line 970
    int-to-long v11, v2

    .line 971
    invoke-direct {v0}, Ll/as20;->E()I

    .line 972
    .line 973
    .line 974
    move-result v2

    .line 975
    move-object/from16 v33, v1

    .line 976
    .line 977
    int-to-long v1, v2

    .line 978
    new-array v13, v8, [F

    .line 979
    .line 980
    aput p2, v13, v30

    .line 981
    .line 982
    const-string v23, "rotation"

    .line 983
    .line 984
    move-wide/from16 v26, v1

    .line 985
    .line 986
    move-wide/from16 v24, v11

    .line 987
    .line 988
    move-object/from16 v29, v13

    .line 989
    .line 990
    invoke-static/range {v22 .. v29}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 991
    .line 992
    .line 993
    move-result-object v1

    .line 994
    iget-object v2, v9, Ll/pf60;->b:Ljava/lang/Object;

    .line 995
    .line 996
    check-cast v2, Ll/q3m;

    .line 997
    .line 998
    invoke-interface {v2}, Ll/q3m;->J()Landroid/view/View;

    .line 999
    .line 1000
    .line 1001
    move-result-object v22

    .line 1002
    invoke-direct {v0}, Ll/as20;->C()I

    .line 1003
    .line 1004
    .line 1005
    move-result v2

    .line 1006
    int-to-long v11, v2

    .line 1007
    invoke-direct {v0}, Ll/as20;->E()I

    .line 1008
    .line 1009
    .line 1010
    move-result v2

    .line 1011
    move-object/from16 v34, v1

    .line 1012
    .line 1013
    int-to-long v1, v2

    .line 1014
    new-array v13, v8, [F

    .line 1015
    .line 1016
    aput p2, v13, v30

    .line 1017
    .line 1018
    const-string v23, "translationX"

    .line 1019
    .line 1020
    move-wide/from16 v26, v1

    .line 1021
    .line 1022
    move-wide/from16 v24, v11

    .line 1023
    .line 1024
    move-object/from16 v29, v13

    .line 1025
    .line 1026
    invoke-static/range {v22 .. v29}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 1027
    .line 1028
    .line 1029
    move-result-object v1

    .line 1030
    iget-object v2, v9, Ll/pf60;->b:Ljava/lang/Object;

    .line 1031
    .line 1032
    check-cast v2, Ll/q3m;

    .line 1033
    .line 1034
    invoke-interface {v2}, Ll/q3m;->J()Landroid/view/View;

    .line 1035
    .line 1036
    .line 1037
    move-result-object v22

    .line 1038
    invoke-direct {v0}, Ll/as20;->C()I

    .line 1039
    .line 1040
    .line 1041
    move-result v2

    .line 1042
    int-to-long v11, v2

    .line 1043
    invoke-direct {v0}, Ll/as20;->E()I

    .line 1044
    .line 1045
    .line 1046
    move-result v2

    .line 1047
    move-object/from16 v35, v1

    .line 1048
    .line 1049
    int-to-long v1, v2

    .line 1050
    new-array v13, v8, [F

    .line 1051
    .line 1052
    aput p2, v13, v30

    .line 1053
    .line 1054
    const-string v23, "rotation"

    .line 1055
    .line 1056
    move-wide/from16 v26, v1

    .line 1057
    .line 1058
    move-wide/from16 v24, v11

    .line 1059
    .line 1060
    move-object/from16 v29, v13

    .line 1061
    .line 1062
    invoke-static/range {v22 .. v29}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 1063
    .line 1064
    .line 1065
    move-result-object v29

    .line 1066
    iget-object v1, v9, Ll/pf60;->b:Ljava/lang/Object;

    .line 1067
    .line 1068
    move-object v12, v1

    .line 1069
    check-cast v12, Ll/q3m;

    .line 1070
    .line 1071
    invoke-direct {v0}, Ll/as20;->C()I

    .line 1072
    .line 1073
    .line 1074
    move-result v13

    .line 1075
    sget-object v42, Ll/gt0;->c:Landroid/view/animation/Interpolator;

    .line 1076
    .line 1077
    const/16 v17, 0x0

    .line 1078
    .line 1079
    move/from16 v16, v5

    .line 1080
    .line 1081
    move-object/from16 v15, v42

    .line 1082
    .line 1083
    invoke-static/range {v12 .. v17}, Ll/pza0;->e(Ll/q3m;IILandroid/view/animation/Interpolator;II)Landroid/animation/Animator;

    .line 1084
    .line 1085
    .line 1086
    move-result-object v1

    .line 1087
    iget-object v2, v9, Ll/pf60;->b:Ljava/lang/Object;

    .line 1088
    .line 1089
    check-cast v2, Ll/q3m;

    .line 1090
    .line 1091
    invoke-interface {v2}, Ll/q3m;->y1()Landroid/view/View;

    .line 1092
    .line 1093
    .line 1094
    move-result-object v36

    .line 1095
    invoke-direct {v0}, Ll/as20;->C()I

    .line 1096
    .line 1097
    .line 1098
    move-result v2

    .line 1099
    int-to-long v11, v2

    .line 1100
    int-to-long v13, v14

    .line 1101
    new-array v2, v8, [F

    .line 1102
    .line 1103
    aput p2, v2, v30

    .line 1104
    .line 1105
    const-string v37, "translationY"

    .line 1106
    .line 1107
    move-object/from16 v43, v2

    .line 1108
    .line 1109
    move-wide/from16 v38, v11

    .line 1110
    .line 1111
    move-wide/from16 v40, v13

    .line 1112
    .line 1113
    invoke-static/range {v36 .. v43}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 1114
    .line 1115
    .line 1116
    move-result-object v2

    .line 1117
    move-wide/from16 v47, v40

    .line 1118
    .line 1119
    iget-object v5, v9, Ll/pf60;->b:Ljava/lang/Object;

    .line 1120
    .line 1121
    check-cast v5, Ll/q3m;

    .line 1122
    .line 1123
    invoke-interface {v5}, Ll/q3m;->q2()Landroid/view/View;

    .line 1124
    .line 1125
    .line 1126
    move-result-object v36

    .line 1127
    invoke-direct {v0}, Ll/as20;->C()I

    .line 1128
    .line 1129
    .line 1130
    move-result v5

    .line 1131
    int-to-long v11, v5

    .line 1132
    new-array v5, v8, [F

    .line 1133
    .line 1134
    aput p2, v5, v30

    .line 1135
    .line 1136
    const-string v37, "translationY"

    .line 1137
    .line 1138
    move-object/from16 v43, v5

    .line 1139
    .line 1140
    move-wide/from16 v38, v11

    .line 1141
    .line 1142
    invoke-static/range {v36 .. v43}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 1143
    .line 1144
    .line 1145
    move-result-object v5

    .line 1146
    iget-object v11, v4, Lcom/p1/mobile/putong/core/ui/PictureView;->k:Landroid/widget/LinearLayout;

    .line 1147
    .line 1148
    new-array v12, v8, [F

    .line 1149
    .line 1150
    aput p2, v12, v30

    .line 1151
    .line 1152
    const-string v44, "alpha"

    .line 1153
    .line 1154
    const-wide/16 v45, 0x0

    .line 1155
    .line 1156
    const/16 v49, 0x0

    .line 1157
    .line 1158
    move-object/from16 v43, v11

    .line 1159
    .line 1160
    move-object/from16 v50, v12

    .line 1161
    .line 1162
    invoke-static/range {v43 .. v50}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 1163
    .line 1164
    .line 1165
    move-result-object v22

    .line 1166
    iget-object v4, v4, Lcom/p1/mobile/putong/core/ui/PictureView;->o:Lv/VText;

    .line 1167
    .line 1168
    new-array v11, v8, [F

    .line 1169
    .line 1170
    aput p2, v11, v30

    .line 1171
    .line 1172
    const-string v44, "alpha"

    .line 1173
    .line 1174
    move-object/from16 v43, v4

    .line 1175
    .line 1176
    move-object/from16 v50, v11

    .line 1177
    .line 1178
    invoke-static/range {v43 .. v50}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 1179
    .line 1180
    .line 1181
    move-result-object v4

    .line 1182
    iget-boolean v11, v0, Ll/as20;->c:Z

    .line 1183
    .line 1184
    if-eqz v11, :cond_c

    .line 1185
    .line 1186
    invoke-static/range {v30 .. v30}, Ll/gt0;->j(I)Landroid/animation/Animator;

    .line 1187
    .line 1188
    .line 1189
    move-result-object v11

    .line 1190
    move-object/from16 v23, v11

    .line 1191
    .line 1192
    move-object/from16 v11, v18

    .line 1193
    .line 1194
    goto :goto_6

    .line 1195
    :cond_c
    sget-object v12, Ll/gt0;->i:Landroid/util/Property;

    .line 1196
    .line 1197
    sget-object v17, Ll/gt0;->a:Landroid/view/animation/Interpolator;

    .line 1198
    .line 1199
    new-array v11, v8, [F

    .line 1200
    .line 1201
    aput v19, v11, v30

    .line 1202
    .line 1203
    const-wide/16 v13, 0x0

    .line 1204
    .line 1205
    move-object/from16 v15, v18

    .line 1206
    .line 1207
    move-object/from16 v18, v11

    .line 1208
    .line 1209
    move-object v11, v15

    .line 1210
    move-wide/from16 v15, v47

    .line 1211
    .line 1212
    invoke-static/range {v11 .. v18}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 1213
    .line 1214
    .line 1215
    move-result-object v12

    .line 1216
    move-object/from16 v23, v12

    .line 1217
    .line 1218
    :goto_6
    iget-boolean v12, v0, Ll/as20;->c:Z

    .line 1219
    .line 1220
    if-eqz v12, :cond_d

    .line 1221
    .line 1222
    invoke-static/range {v30 .. v30}, Ll/gt0;->j(I)Landroid/animation/Animator;

    .line 1223
    .line 1224
    .line 1225
    move-result-object v12

    .line 1226
    :goto_7
    move-object/from16 v36, v12

    .line 1227
    .line 1228
    goto :goto_8

    .line 1229
    :cond_d
    sget-object v17, Ll/gt0;->a:Landroid/view/animation/Interpolator;

    .line 1230
    .line 1231
    new-array v12, v8, [F

    .line 1232
    .line 1233
    aput p2, v12, v30

    .line 1234
    .line 1235
    move-object/from16 v18, v12

    .line 1236
    .line 1237
    const-string v12, "translationX"

    .line 1238
    .line 1239
    const-wide/16 v13, 0x0

    .line 1240
    .line 1241
    move-wide/from16 v15, v47

    .line 1242
    .line 1243
    invoke-static/range {v11 .. v18}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 1244
    .line 1245
    .line 1246
    move-result-object v12

    .line 1247
    goto :goto_7

    .line 1248
    :goto_8
    iget-boolean v12, v0, Ll/as20;->c:Z

    .line 1249
    .line 1250
    if-eqz v12, :cond_e

    .line 1251
    .line 1252
    invoke-static/range {v30 .. v30}, Ll/gt0;->j(I)Landroid/animation/Animator;

    .line 1253
    .line 1254
    .line 1255
    move-result-object v12

    .line 1256
    :goto_9
    move-object/from16 v37, v12

    .line 1257
    .line 1258
    goto :goto_a

    .line 1259
    :cond_e
    sget-object v17, Ll/gt0;->a:Landroid/view/animation/Interpolator;

    .line 1260
    .line 1261
    new-array v12, v8, [F

    .line 1262
    .line 1263
    aput p2, v12, v30

    .line 1264
    .line 1265
    move-object/from16 v18, v12

    .line 1266
    .line 1267
    const-string v12, "translationY"

    .line 1268
    .line 1269
    const-wide/16 v13, 0x0

    .line 1270
    .line 1271
    move-wide/from16 v15, v47

    .line 1272
    .line 1273
    invoke-static/range {v11 .. v18}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 1274
    .line 1275
    .line 1276
    move-result-object v12

    .line 1277
    goto :goto_9

    .line 1278
    :goto_a
    iget-boolean v12, v0, Ll/as20;->c:Z

    .line 1279
    .line 1280
    if-eqz v12, :cond_f

    .line 1281
    .line 1282
    move-object/from16 v38, v31

    .line 1283
    .line 1284
    goto :goto_b

    .line 1285
    :cond_f
    invoke-static/range {v30 .. v30}, Ll/gt0;->j(I)Landroid/animation/Animator;

    .line 1286
    .line 1287
    .line 1288
    move-result-object v12

    .line 1289
    move-object/from16 v38, v12

    .line 1290
    .line 1291
    :goto_b
    iget-object v12, v9, Ll/pf60;->b:Ljava/lang/Object;

    .line 1292
    .line 1293
    check-cast v12, Ll/q3m;

    .line 1294
    .line 1295
    invoke-interface {v12}, Ll/q3m;->w3()Landroid/view/View;

    .line 1296
    .line 1297
    .line 1298
    move-result-object v43

    .line 1299
    sget-object v49, Ll/gt0;->a:Landroid/view/animation/Interpolator;

    .line 1300
    .line 1301
    new-array v12, v8, [F

    .line 1302
    .line 1303
    aput p2, v12, v30

    .line 1304
    .line 1305
    const-string v44, "translationX"

    .line 1306
    .line 1307
    const-wide/16 v45, 0x0

    .line 1308
    .line 1309
    move-object/from16 v50, v12

    .line 1310
    .line 1311
    invoke-static/range {v43 .. v50}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 1312
    .line 1313
    .line 1314
    move-result-object v39

    .line 1315
    iget-object v12, v9, Ll/pf60;->b:Ljava/lang/Object;

    .line 1316
    .line 1317
    check-cast v12, Ll/q3m;

    .line 1318
    .line 1319
    invoke-interface {v12}, Ll/q3m;->w3()Landroid/view/View;

    .line 1320
    .line 1321
    .line 1322
    move-result-object v43

    .line 1323
    new-array v12, v8, [F

    .line 1324
    .line 1325
    aput p2, v12, v30

    .line 1326
    .line 1327
    const-string v44, "translationY"

    .line 1328
    .line 1329
    move-object/from16 v50, v12

    .line 1330
    .line 1331
    invoke-static/range {v43 .. v50}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 1332
    .line 1333
    .line 1334
    move-result-object v40

    .line 1335
    iget-object v12, v9, Ll/pf60;->b:Ljava/lang/Object;

    .line 1336
    .line 1337
    check-cast v12, Ll/q3m;

    .line 1338
    .line 1339
    invoke-interface {v12}, Ll/q3m;->R2()Landroid/view/View;

    .line 1340
    .line 1341
    .line 1342
    move-result-object v43

    .line 1343
    new-array v12, v8, [F

    .line 1344
    .line 1345
    aput p2, v12, v30

    .line 1346
    .line 1347
    const-string v44, "translationX"

    .line 1348
    .line 1349
    move-object/from16 v50, v12

    .line 1350
    .line 1351
    invoke-static/range {v43 .. v50}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 1352
    .line 1353
    .line 1354
    move-result-object v41

    .line 1355
    iget-object v12, v9, Ll/pf60;->b:Ljava/lang/Object;

    .line 1356
    .line 1357
    check-cast v12, Ll/q3m;

    .line 1358
    .line 1359
    invoke-interface {v12}, Ll/q3m;->R2()Landroid/view/View;

    .line 1360
    .line 1361
    .line 1362
    move-result-object v43

    .line 1363
    new-array v12, v8, [F

    .line 1364
    .line 1365
    aput p2, v12, v30

    .line 1366
    .line 1367
    const-string v44, "translationY"

    .line 1368
    .line 1369
    move-object/from16 v50, v12

    .line 1370
    .line 1371
    invoke-static/range {v43 .. v50}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 1372
    .line 1373
    .line 1374
    move-result-object v42

    .line 1375
    iget-object v12, v9, Ll/pf60;->b:Ljava/lang/Object;

    .line 1376
    .line 1377
    check-cast v12, Ll/q3m;

    .line 1378
    .line 1379
    invoke-interface {v12}, Ll/q3m;->R2()Landroid/view/View;

    .line 1380
    .line 1381
    .line 1382
    move-result-object v43

    .line 1383
    new-array v12, v8, [F

    .line 1384
    .line 1385
    aput v19, v12, v30

    .line 1386
    .line 1387
    const-string v44, "scaleX"

    .line 1388
    .line 1389
    move-object/from16 v50, v12

    .line 1390
    .line 1391
    invoke-static/range {v43 .. v50}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 1392
    .line 1393
    .line 1394
    move-result-object v12

    .line 1395
    iget-object v13, v9, Ll/pf60;->b:Ljava/lang/Object;

    .line 1396
    .line 1397
    check-cast v13, Ll/q3m;

    .line 1398
    .line 1399
    invoke-interface {v13}, Ll/q3m;->R2()Landroid/view/View;

    .line 1400
    .line 1401
    .line 1402
    move-result-object v43

    .line 1403
    new-array v8, v8, [F

    .line 1404
    .line 1405
    aput v19, v8, v30

    .line 1406
    .line 1407
    const-string v44, "scaleY"

    .line 1408
    .line 1409
    move-object/from16 v50, v8

    .line 1410
    .line 1411
    invoke-static/range {v43 .. v50}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 1412
    .line 1413
    .line 1414
    move-result-object v44

    .line 1415
    move-object/from16 v30, v1

    .line 1416
    .line 1417
    move-object/from16 v31, v2

    .line 1418
    .line 1419
    move-object/from16 v24, v7

    .line 1420
    .line 1421
    move-object/from16 v25, v10

    .line 1422
    .line 1423
    move-object/from16 v43, v12

    .line 1424
    .line 1425
    move-object/from16 v26, v33

    .line 1426
    .line 1427
    move-object/from16 v27, v34

    .line 1428
    .line 1429
    move-object/from16 v28, v35

    .line 1430
    .line 1431
    move-object/from16 v34, v4

    .line 1432
    .line 1433
    move-object/from16 v33, v22

    .line 1434
    .line 1435
    move-object/from16 v35, v23

    .line 1436
    .line 1437
    move-object/from16 v22, v32

    .line 1438
    .line 1439
    move-object/from16 v32, v5

    .line 1440
    .line 1441
    move-object/from16 v23, v6

    .line 1442
    .line 1443
    filled-new-array/range {v20 .. v44}, [Landroid/animation/Animator;

    .line 1444
    .line 1445
    .line 1446
    move-result-object v1

    .line 1447
    invoke-static {v1}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 1448
    .line 1449
    .line 1450
    move-result-object v6

    .line 1451
    new-instance v0, Ll/rr20;

    .line 1452
    .line 1453
    move-object/from16 v1, p0

    .line 1454
    .line 1455
    move-object/from16 v5, p1

    .line 1456
    .line 1457
    move-object v2, v9

    .line 1458
    move-object v4, v11

    .line 1459
    invoke-direct/range {v0 .. v5}, Ll/rr20;-><init>(Ll/as20;Ll/pf60;Lcom/p1/mobile/putong/data/Media;Lcom/p1/mobile/putong/core/ui/PictureView;Lcom/p1/mobile/android/app/Act;)V

    .line 1460
    .line 1461
    .line 1462
    invoke-static {v6, v0}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 1463
    .line 1464
    .line 1465
    move-result-object v0

    .line 1466
    iget-object v1, v2, Ll/pf60;->b:Ljava/lang/Object;

    .line 1467
    .line 1468
    check-cast v1, Ll/q3m;

    .line 1469
    .line 1470
    invoke-interface {v1}, Ll/q3m;->k3()V

    .line 1471
    .line 1472
    .line 1473
    return-object v0

    .line 1474
    :cond_10
    return-object v2

    .line 1475
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 1476
    .line 1477
    .line 1478
    .line 1479
    .line 1480
    .line 1481
    .line 1482
    .line 1483
    :array_1
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 1484
    .line 1485
    .line 1486
    .line 1487
    .line 1488
    .line 1489
    .line 1490
    .line 1491
    :array_2
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 1492
    .line 1493
    .line 1494
    .line 1495
    .line 1496
    .line 1497
    .line 1498
    .line 1499
    :array_3
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 1500
    .line 1501
    .line 1502
    .line 1503
    .line 1504
    .line 1505
    .line 1506
    .line 1507
    :array_4
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 1508
    .line 1509
    .line 1510
    .line 1511
    .line 1512
    .line 1513
    .line 1514
    .line 1515
    :array_5
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 1516
    .line 1517
    .line 1518
    .line 1519
    .line 1520
    .line 1521
    .line 1522
    .line 1523
    :array_6
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 1524
    .line 1525
    .line 1526
    .line 1527
    .line 1528
    .line 1529
    .line 1530
    .line 1531
    :array_7
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public z(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;)Landroid/animation/Animator;
    .locals 7

    .line 1
    invoke-virtual {p0, p2}, Ll/as20;->J(Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;)Ll/pf60;

    .line 2
    .line 3
    .line 4
    move-result-object v4

    .line 5
    const/4 p1, 0x0

    .line 6
    if-eqz v4, :cond_5

    .line 7
    .line 8
    iget-object p2, v4, Ll/pf60;->b:Ljava/lang/Object;

    .line 9
    .line 10
    if-nez p2, :cond_0

    .line 11
    .line 12
    goto/16 :goto_0

    .line 13
    .line 14
    :cond_0
    const/4 p2, 0x1

    .line 15
    iput-boolean p2, p0, Ll/as20;->f:Z

    .line 16
    .line 17
    invoke-static {v4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result p2

    .line 21
    const/4 v0, 0x0

    .line 22
    if-eqz p2, :cond_1

    .line 23
    .line 24
    iget-object p2, v4, Ll/pf60;->a:Ljava/lang/Object;

    .line 25
    .line 26
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result p2

    .line 30
    if-eqz p2, :cond_1

    .line 31
    .line 32
    iget-object p2, v4, Ll/pf60;->a:Ljava/lang/Object;

    .line 33
    .line 34
    check-cast p2, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;

    .line 35
    .line 36
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/core/card/VSwipeCard;->R0(I)V

    .line 37
    .line 38
    .line 39
    :cond_1
    invoke-static {v4}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result p2

    .line 43
    if-eqz p2, :cond_5

    .line 44
    .line 45
    iget-object p2, v4, Ll/pf60;->b:Ljava/lang/Object;

    .line 46
    .line 47
    check-cast p2, Ll/q3m;

    .line 48
    .line 49
    invoke-interface {p2}, Ll/t3m;->W()Landroidx/recyclerview/widget/RecyclerView;

    .line 50
    .line 51
    .line 52
    move-result-object p2

    .line 53
    if-eqz p2, :cond_5

    .line 54
    .line 55
    iget-object p2, v4, Ll/pf60;->b:Ljava/lang/Object;

    .line 56
    .line 57
    check-cast p2, Ll/q3m;

    .line 58
    .line 59
    invoke-interface {p2}, Ll/t3m;->W()Landroidx/recyclerview/widget/RecyclerView;

    .line 60
    .line 61
    .line 62
    move-result-object p2

    .line 63
    invoke-virtual {p2}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$o;

    .line 64
    .line 65
    .line 66
    move-result-object p2

    .line 67
    iget-object v1, v4, Ll/pf60;->b:Ljava/lang/Object;

    .line 68
    .line 69
    check-cast v1, Ll/q3m;

    .line 70
    .line 71
    invoke-interface {v1}, Ll/q3m;->u2()Lcom/p1/mobile/putong/core/ui/profile/views/VPager_SquaredRefactor;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    if-nez v1, :cond_2

    .line 76
    .line 77
    return-object p1

    .line 78
    :cond_2
    instance-of v2, p2, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 79
    .line 80
    if-eqz v2, :cond_3

    .line 81
    .line 82
    invoke-virtual {v1}, Landroid/view/View;->isAttachedToWindow()Z

    .line 83
    .line 84
    .line 85
    move-result v1

    .line 86
    if-eqz v1, :cond_3

    .line 87
    .line 88
    check-cast p2, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 89
    .line 90
    invoke-virtual {p2}, Landroidx/recyclerview/widget/LinearLayoutManager;->findFirstVisibleItemPosition()I

    .line 91
    .line 92
    .line 93
    move-result p2

    .line 94
    if-nez p2, :cond_3

    .line 95
    .line 96
    invoke-direct {p0, v4}, Ll/as20;->W(Ll/pf60;)Landroid/animation/Animator;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    return-object p0

    .line 101
    :cond_3
    const/16 p2, 0xbb8

    .line 102
    .line 103
    invoke-static {p2}, Ll/gt0;->j(I)Landroid/animation/Animator;

    .line 104
    .line 105
    .line 106
    move-result-object v5

    .line 107
    invoke-static {}, Ll/bnl0;->y0()I

    .line 108
    .line 109
    .line 110
    move-result p2

    .line 111
    int-to-float p2, p2

    .line 112
    const v1, 0x3f4ccccd    # 0.8f

    .line 113
    .line 114
    .line 115
    div-float/2addr p2, v1

    .line 116
    float-to-int v3, p2

    .line 117
    iget-object p2, v4, Ll/pf60;->b:Ljava/lang/Object;

    .line 118
    .line 119
    check-cast p2, Ll/q3m;

    .line 120
    .line 121
    invoke-interface {p2}, Ll/t3m;->i3()I

    .line 122
    .line 123
    .line 124
    move-result p2

    .line 125
    add-int v2, v3, p2

    .line 126
    .line 127
    invoke-direct {p0}, Ll/as20;->A()I

    .line 128
    .line 129
    .line 130
    move-result v1

    .line 131
    int-to-float p2, p2

    .line 132
    int-to-float v6, v2

    .line 133
    div-float/2addr p2, v6

    .line 134
    int-to-float v6, v1

    .line 135
    mul-float/2addr p2, v6

    .line 136
    float-to-int p2, p2

    .line 137
    int-to-float p2, p2

    .line 138
    sub-float p2, v6, p2

    .line 139
    .line 140
    div-float/2addr p2, v6

    .line 141
    iput p2, p0, Ll/as20;->h:F

    .line 142
    .line 143
    const v6, 0x3c23d70a    # 0.01f

    .line 144
    .line 145
    .line 146
    cmpg-float p2, p2, v6

    .line 147
    .line 148
    if-gtz p2, :cond_4

    .line 149
    .line 150
    iput v6, p0, Ll/as20;->h:F

    .line 151
    .line 152
    :cond_4
    filled-new-array {v2, v0}, [I

    .line 153
    .line 154
    .line 155
    move-result-object p2

    .line 156
    invoke-static {p2}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    .line 157
    .line 158
    .line 159
    move-result-object p2

    .line 160
    int-to-long v0, v1

    .line 161
    invoke-virtual {p2, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 162
    .line 163
    .line 164
    invoke-virtual {p2, p1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 165
    .line 166
    .line 167
    new-instance v0, Ll/as20$a;

    .line 168
    .line 169
    move-object v1, p0

    .line 170
    invoke-direct/range {v0 .. v5}, Ll/as20$a;-><init>(Ll/as20;IILl/pf60;Landroid/animation/Animator;)V

    .line 171
    .line 172
    .line 173
    invoke-virtual {p2, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 174
    .line 175
    .line 176
    new-instance p0, Ll/l2h0;

    .line 177
    .line 178
    invoke-direct {p0, p2}, Ll/l2h0;-><init>(Landroid/animation/ValueAnimator;)V

    .line 179
    .line 180
    .line 181
    invoke-static {v5, p0}, Ll/gt0;->v(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 182
    .line 183
    .line 184
    return-object v5

    .line 185
    :cond_5
    :goto_0
    return-object p1
.end method
