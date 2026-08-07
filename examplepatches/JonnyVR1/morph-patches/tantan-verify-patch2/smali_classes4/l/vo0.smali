.class public Ll/vo0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/Choreographer$FrameCallback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/vo0$a;
    }
.end annotation


# static fields
.field public static A:F = 0.0f

.field public static B:F = 0.0f

.field public static C:Z = false

.field public static D:F = 0.0f

.field public static E:F = 0.0f

.field public static F:F = 0.0f

.field public static G:F = 0.0f

.field public static H:F = 0.0f

.field public static I:F = 0.0f

.field public static J:Z = false

.field public static K:J = 0x0L

.field public static L:Z = false

.field public static M:Z = false

.field public static N:F = 0.0f

.field public static O:Landroid/view/animation/Interpolator; = null

.field public static e:J = 0x1L

.field public static f:J = 0x118L

.field public static g:J = 0x118L

.field public static h:J = 0x118L

.field public static i:J = 0x1e0L

.field public static j:J = 0x14aL

.field public static k:J = 0xb4L

.field public static l:J = 0x0L

.field public static m:J = 0x3L

.field public static n:F = 30.0f

.field public static o:F = 1.25f

.field public static p:F = 0.8f

.field public static q:F = 15.0f

.field public static r:F = 8.0f

.field public static s:F = 4000.0f

.field public static t:F = 100.0f

.field public static u:F = 100.0f

.field public static v:F = 30.0f

.field public static w:F = 4000.0f

.field public static x:F

.field public static y:Z

.field public static z:F


# instance fields
.field public a:Ll/ox2;

.field public b:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/nh4;",
            ">;"
        }
    .end annotation
.end field

.field public c:Lcom/p1/mobile/putong/core/data/CardSwipeConfig;

.field public d:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    const/high16 v0, 0x43af0000    # 350.0f

    .line 2
    .line 3
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    int-to-float v0, v0

    .line 8
    sput v0, Ll/vo0;->x:F

    .line 9
    .line 10
    const/4 v0, 0x1

    .line 11
    sput-boolean v0, Ll/vo0;->y:Z

    .line 12
    .line 13
    const v1, 0x3f19999a    # 0.6f

    .line 14
    .line 15
    .line 16
    sput v1, Ll/vo0;->z:F

    .line 17
    .line 18
    const/high16 v1, 0x45fa0000    # 8000.0f

    .line 19
    .line 20
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    int-to-float v1, v1

    .line 25
    sput v1, Ll/vo0;->A:F

    .line 26
    .line 27
    const/high16 v1, 0x42c80000    # 100.0f

    .line 28
    .line 29
    sput v1, Ll/vo0;->B:F

    .line 30
    .line 31
    sput-boolean v0, Ll/vo0;->C:Z

    .line 32
    .line 33
    const/high16 v0, 0x43160000    # 150.0f

    .line 34
    .line 35
    sput v0, Ll/vo0;->D:F

    .line 36
    .line 37
    const v0, 0x46bb8000    # 24000.0f

    .line 38
    .line 39
    .line 40
    sput v0, Ll/vo0;->E:F

    .line 41
    .line 42
    const/high16 v0, 0x40000000    # 2.0f

    .line 43
    .line 44
    sput v0, Ll/vo0;->F:F

    .line 45
    .line 46
    const v0, 0x3ce978d5    # 0.0285f

    .line 47
    .line 48
    .line 49
    sput v0, Ll/vo0;->G:F

    .line 50
    .line 51
    const v0, 0x3eb33333    # 0.35f

    .line 52
    .line 53
    .line 54
    sput v0, Ll/vo0;->H:F

    .line 55
    .line 56
    sput v1, Ll/vo0;->I:F

    .line 57
    .line 58
    const/4 v0, 0x0

    .line 59
    sput-boolean v0, Ll/vo0;->J:Z

    .line 60
    .line 61
    const-wide/16 v1, 0xc8

    .line 62
    .line 63
    sput-wide v1, Ll/vo0;->K:J

    .line 64
    .line 65
    sput-boolean v0, Ll/vo0;->L:Z

    .line 66
    .line 67
    sput-boolean v0, Ll/vo0;->M:Z

    .line 68
    .line 69
    const v0, 0x3f99999a    # 1.2f

    .line 70
    .line 71
    .line 72
    sput v0, Ll/vo0;->N:F

    .line 73
    .line 74
    new-instance v0, Ll/vo0$a;

    .line 75
    .line 76
    invoke-direct {v0}, Ll/vo0$a;-><init>()V

    .line 77
    .line 78
    .line 79
    sput-object v0, Ll/vo0;->O:Landroid/view/animation/Interpolator;

    .line 80
    .line 81
    return-void
.end method

.method public constructor <init>(Ll/ox2;Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ll/vo0;->c:Lcom/p1/mobile/putong/core/data/CardSwipeConfig;

    .line 6
    .line 7
    const-string v0, "{\"swipe_left_male_during\":370,\"swipe_right_male_during\":370,\"swipe_up_male_during\":330,\"swipe_auto_male_during\":460,\"swipe_back_male_during\":230,\"swipe_reset_male_during\":180,\"swipe_rotation_male\":30,\"swipe_trans_y_male\":30,\"swipe_speed_factor_male\":12,\"swipe_speed_check_male\":4000,\"swipe_left_female_during\":300,\"swipe_right_female_during\":300,\"swipe_up_female_during\":330,\"swipe_auto_female_during\":460,\"swipe_back_female_during\":230,\"swipe_reset_female_during\":180,\"swipe_rotation_female\":30,\"swipe_trans_y_female\":30,\"swipe_speed_factor_female\":8,\"swipe_speed_check_female\":4000,\"swipe_item_diff_male\":120,\"swipe_out_value_male\":30,\"swipe_mine_value_male\":30,\"swipe_item_diff_female\":120,\"swipe_out_value_female\":20,\"swipe_mine_value_female\":20,\"male_swipe_auto_width\":1.45,\"female_swipe_auto_width\":1.45,\"male_swipe_auto_factor\":0.62,\"female_swipe_auto_factor\":0.8,\"male_swipe_auto_rotate\":10,\"female_swipe_auto_rotate\":15,\"could_double_click\":true,\"swipe_type_factor\":0.6,\"swipe_fix_speed\":8000,\"swipe_scale\":0.0265,\"swipe_scale_start_alpha\":0.25,\"swipe_progress_value\":120,\"config_version\":2,\"scale_opt\":true,\"scale_opt_during\":200,\"scale_use_opt_during\":false,\"scale_alpha_opt\":true,\"scale_alpha_speed\":1.2}"

    .line 8
    .line 9
    iput-object v0, p0, Ll/vo0;->d:Ljava/lang/String;

    .line 10
    .line 11
    iput-object p1, p0, Ll/vo0;->a:Ll/ox2;

    .line 12
    .line 13
    new-instance p1, Ljava/util/ArrayList;

    .line 14
    .line 15
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object p1, p0, Ll/vo0;->b:Ljava/util/List;

    .line 19
    .line 20
    :try_start_0
    sget-object p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 21
    .line 22
    iget-object v0, p0, Ll/vo0;->d:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {p1, v0}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    check-cast p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;

    .line 29
    .line 30
    iput-object p1, p0, Ll/vo0;->c:Lcom/p1/mobile/putong/core/data/CardSwipeConfig;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 31
    .line 32
    :catch_0
    invoke-static {p2}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-virtual {p1}, Landroid/view/ViewConfiguration;->getScaledMaximumFlingVelocity()I

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    int-to-float p1, p1

    .line 41
    sput p1, Ll/vo0;->w:F

    .line 42
    .line 43
    invoke-static {}, Ll/bnl0;->y0()I

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    int-to-float p1, p1

    .line 48
    sput p1, Ll/vo0;->x:F

    .line 49
    .line 50
    sget p1, Ll/vo0;->w:F

    .line 51
    .line 52
    sget v0, Ll/vo0;->s:F

    .line 53
    .line 54
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    int-to-float v0, v0

    .line 59
    invoke-static {p1, v0}, Ljava/lang/Math;->min(FF)F

    .line 60
    .line 61
    .line 62
    move-result p1

    .line 63
    sput p1, Ll/vo0;->w:F

    .line 64
    .line 65
    invoke-static {}, Ll/bnl0;->w0()I

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    div-int/lit8 p1, p1, 0x6

    .line 70
    .line 71
    int-to-float p1, p1

    .line 72
    sput p1, Ll/vo0;->B:F

    .line 73
    .line 74
    invoke-virtual {p0, p2}, Ll/vo0;->i(Landroid/content/Context;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {p0}, Ll/vo0;->c()V

    .line 78
    .line 79
    .line 80
    return-void
.end method


# virtual methods
.method public a(I)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/vo0;->b:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->listIterator()Ljava/util/ListIterator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Ll/nh4;

    .line 18
    .line 19
    iget v0, v0, Ll/nh4;->o:I

    .line 20
    .line 21
    if-ne v0, p1, :cond_0

    .line 22
    .line 23
    invoke-interface {p0}, Ljava/util/Iterator;->remove()V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_1
    return-void
.end method

.method public b()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/vo0;->b:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->listIterator()Ljava/util/ListIterator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Ll/nh4;

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/nh4;->d()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    invoke-interface {p0}, Ljava/util/Iterator;->remove()V

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    return-void
.end method

.method public final c()V
    .locals 14

    .line 1
    iget-object v0, p0, Ll/vo0;->c:Lcom/p1/mobile/putong/core/data/CardSwipeConfig;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Ll/vo0;->c:Lcom/p1/mobile/putong/core/data/CardSwipeConfig;

    .line 10
    .line 11
    iget-wide v1, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_left_male_during:J

    .line 12
    .line 13
    const-wide/16 v3, 0x0

    .line 14
    .line 15
    cmp-long v1, v1, v3

    .line 16
    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    iget-wide v0, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_right_male_during:J

    .line 20
    .line 21
    cmp-long v0, v0, v3

    .line 22
    .line 23
    if-nez v0, :cond_1

    .line 24
    .line 25
    :cond_0
    const/4 v0, 0x0

    .line 26
    iput-object v0, p0, Ll/vo0;->c:Lcom/p1/mobile/putong/core/data/CardSwipeConfig;

    .line 27
    .line 28
    :cond_1
    iget-object v0, p0, Ll/vo0;->c:Lcom/p1/mobile/putong/core/data/CardSwipeConfig;

    .line 29
    .line 30
    const/4 v9, 0x0

    .line 31
    if-nez v0, :cond_2

    .line 32
    .line 33
    invoke-static {}, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->new_()Lcom/p1/mobile/putong/core/data/CardSwipeConfig;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iput-object v0, p0, Ll/vo0;->c:Lcom/p1/mobile/putong/core/data/CardSwipeConfig;

    .line 38
    .line 39
    const-wide/16 v10, 0x10e

    .line 40
    .line 41
    iput-wide v10, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_left_male_during:J

    .line 42
    .line 43
    iput-wide v10, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_right_male_during:J

    .line 44
    .line 45
    const-wide/16 v10, 0x12c

    .line 46
    .line 47
    iput-wide v10, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_auto_male_during:J

    .line 48
    .line 49
    const-wide/16 v12, 0x14a

    .line 50
    .line 51
    iput-wide v12, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_up_male_during:J

    .line 52
    .line 53
    const-wide/16 v1, 0xe6

    .line 54
    .line 55
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_back_male_during:J

    .line 56
    .line 57
    const-wide/16 v3, 0xb4

    .line 58
    .line 59
    iput-wide v3, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_reset_male_during:J

    .line 60
    .line 61
    const-wide/high16 v5, 0x403e000000000000L    # 30.0

    .line 62
    .line 63
    iput-wide v5, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_rotation_male:D

    .line 64
    .line 65
    const-wide/16 v7, 0x1e

    .line 66
    .line 67
    iput-wide v7, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_trans_y_male:J

    .line 68
    .line 69
    const-wide/high16 v7, 0x4020000000000000L    # 8.0

    .line 70
    .line 71
    iput-wide v7, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_speed_factor_male:D

    .line 72
    .line 73
    const-wide v7, 0x40af400000000000L    # 4000.0

    .line 74
    .line 75
    .line 76
    .line 77
    .line 78
    iput-wide v7, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_speed_check_male:D

    .line 79
    .line 80
    const-wide/16 v7, 0x118

    .line 81
    .line 82
    iput-wide v7, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_left_female_during:J

    .line 83
    .line 84
    iput-wide v7, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_right_female_during:J

    .line 85
    .line 86
    iput-wide v10, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_auto_female_during:J

    .line 87
    .line 88
    iput-wide v12, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_up_female_during:J

    .line 89
    .line 90
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_back_female_during:J

    .line 91
    .line 92
    iput-wide v3, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_reset_female_during:J

    .line 93
    .line 94
    iput-wide v5, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_rotation_female:D

    .line 95
    .line 96
    const-wide/16 v1, 0x1e

    .line 97
    .line 98
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_trans_y_female:J

    .line 99
    .line 100
    const-wide/high16 v1, 0x4020000000000000L    # 8.0

    .line 101
    .line 102
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_speed_factor_female:D

    .line 103
    .line 104
    const-wide v1, 0x40af400000000000L    # 4000.0

    .line 105
    .line 106
    .line 107
    .line 108
    .line 109
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_speed_check_female:D

    .line 110
    .line 111
    const/16 v1, 0xc8

    .line 112
    .line 113
    iput v1, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_item_diff_male:I

    .line 114
    .line 115
    const/16 v2, 0x14

    .line 116
    .line 117
    iput v2, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_out_value_male:I

    .line 118
    .line 119
    iput v2, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_mine_value_male:I

    .line 120
    .line 121
    iput v1, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_item_diff_female:I

    .line 122
    .line 123
    iput v2, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_out_value_female:I

    .line 124
    .line 125
    iput v2, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_mine_value_female:I

    .line 126
    .line 127
    const-wide v1, 0x3ff59999a0000000L    # 1.350000023841858

    .line 128
    .line 129
    .line 130
    .line 131
    .line 132
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->male_swipe_auto_width:D

    .line 133
    .line 134
    const-wide/high16 v1, 0x3ff4000000000000L    # 1.25

    .line 135
    .line 136
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->female_swipe_auto_width:D

    .line 137
    .line 138
    const-wide v1, 0x3fdae147a0000000L    # 0.41999998688697815

    .line 139
    .line 140
    .line 141
    .line 142
    .line 143
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->male_swipe_auto_factor:D

    .line 144
    .line 145
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->female_swipe_auto_factor:D

    .line 146
    .line 147
    const-wide/high16 v1, 0x4024000000000000L    # 10.0

    .line 148
    .line 149
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->male_swipe_auto_rotate:D

    .line 150
    .line 151
    const-wide/high16 v1, 0x402e000000000000L    # 15.0

    .line 152
    .line 153
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->female_swipe_auto_rotate:D

    .line 154
    .line 155
    const/4 v1, 0x1

    .line 156
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->could_double_click:Z

    .line 157
    .line 158
    const-wide v1, 0x3fe3333340000000L    # 0.6000000238418579

    .line 159
    .line 160
    .line 161
    .line 162
    .line 163
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_type_factor:D

    .line 164
    .line 165
    const/16 v1, 0x1f40

    .line 166
    .line 167
    iput v1, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_fix_speed:I

    .line 168
    .line 169
    const-wide v1, 0x3f9d2f1aa0000000L    # 0.02850000001490116

    .line 170
    .line 171
    .line 172
    .line 173
    .line 174
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_scale:D

    .line 175
    .line 176
    const-wide v1, 0x3fd3333340000000L    # 0.30000001192092896

    .line 177
    .line 178
    .line 179
    .line 180
    .line 181
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_scale_start_alpha:D

    .line 182
    .line 183
    const/16 v1, 0x64

    .line 184
    .line 185
    iput v1, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_progress_value:I

    .line 186
    .line 187
    iput-boolean v9, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->scale_opt:Z

    .line 188
    .line 189
    const-wide/16 v1, 0xc8

    .line 190
    .line 191
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->scale_opt_during:J

    .line 192
    .line 193
    iput-boolean v9, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->scale_use_opt_during:Z

    .line 194
    .line 195
    iput-boolean v9, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->scale_alpha_opt:Z

    .line 196
    .line 197
    const-wide v1, 0x3ff3333340000000L    # 1.2000000476837158

    .line 198
    .line 199
    .line 200
    .line 201
    .line 202
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->scale_alpha_speed:D

    .line 203
    .line 204
    :cond_2
    iget-object v0, p0, Ll/vo0;->c:Lcom/p1/mobile/putong/core/data/CardSwipeConfig;

    .line 205
    .line 206
    iget v1, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->config_version:I

    .line 207
    .line 208
    if-nez v1, :cond_3

    .line 209
    .line 210
    const-wide v2, 0x3fd3333340000000L    # 0.30000001192092896

    .line 211
    .line 212
    .line 213
    .line 214
    .line 215
    iput-wide v2, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_scale_start_alpha:D

    .line 216
    .line 217
    const/16 v2, 0x64

    .line 218
    .line 219
    iput v2, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_progress_value:I

    .line 220
    .line 221
    const-wide v2, 0x3f9d2f1aa0000000L    # 0.02850000001490116

    .line 222
    .line 223
    .line 224
    .line 225
    .line 226
    iput-wide v2, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_scale:D

    .line 227
    .line 228
    :cond_3
    const/4 v2, 0x2

    .line 229
    if-ge v1, v2, :cond_4

    .line 230
    .line 231
    iput-boolean v9, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->scale_opt:Z

    .line 232
    .line 233
    const-wide/16 v1, 0xc8

    .line 234
    .line 235
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->scale_opt_during:J

    .line 236
    .line 237
    iput-boolean v9, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->scale_use_opt_during:Z

    .line 238
    .line 239
    iput-boolean v9, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->scale_alpha_opt:Z

    .line 240
    .line 241
    const-wide v1, 0x3ff3333340000000L    # 1.2000000476837158

    .line 242
    .line 243
    .line 244
    .line 245
    .line 246
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->scale_alpha_speed:D

    .line 247
    .line 248
    :cond_4
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 249
    .line 250
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 251
    .line 252
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 253
    .line 254
    .line 255
    move-result-object v0

    .line 256
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 257
    .line 258
    .line 259
    move-result v1

    .line 260
    if-eqz v1, :cond_5

    .line 261
    .line 262
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 263
    .line 264
    .line 265
    move-result v0

    .line 266
    if-eqz v0, :cond_5

    .line 267
    .line 268
    iget-object v0, p0, Ll/vo0;->c:Lcom/p1/mobile/putong/core/data/CardSwipeConfig;

    .line 269
    .line 270
    iget-wide v1, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_left_female_during:J

    .line 271
    .line 272
    sput-wide v1, Ll/vo0;->f:J

    .line 273
    .line 274
    iget-wide v1, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_right_female_during:J

    .line 275
    .line 276
    sput-wide v1, Ll/vo0;->g:J

    .line 277
    .line 278
    iget-wide v1, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_up_female_during:J

    .line 279
    .line 280
    sput-wide v1, Ll/vo0;->h:J

    .line 281
    .line 282
    iget-wide v1, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_auto_female_during:J

    .line 283
    .line 284
    sput-wide v1, Ll/vo0;->i:J

    .line 285
    .line 286
    iget-wide v1, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_back_female_during:J

    .line 287
    .line 288
    sget-wide v3, Ll/vo0;->e:J

    .line 289
    .line 290
    mul-long/2addr v1, v3

    .line 291
    sput-wide v1, Ll/vo0;->j:J

    .line 292
    .line 293
    iget-wide v1, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_reset_female_during:J

    .line 294
    .line 295
    mul-long/2addr v1, v3

    .line 296
    sput-wide v1, Ll/vo0;->k:J

    .line 297
    .line 298
    iget-wide v0, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_trans_y_female:J

    .line 299
    .line 300
    long-to-float v0, v0

    .line 301
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 302
    .line 303
    .line 304
    move-result v0

    .line 305
    int-to-long v0, v0

    .line 306
    sput-wide v0, Ll/vo0;->l:J

    .line 307
    .line 308
    iget-object v0, p0, Ll/vo0;->c:Lcom/p1/mobile/putong/core/data/CardSwipeConfig;

    .line 309
    .line 310
    iget-wide v1, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_rotation_female:D

    .line 311
    .line 312
    double-to-float v1, v1

    .line 313
    sput v1, Ll/vo0;->n:F

    .line 314
    .line 315
    iget-wide v1, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_speed_factor_female:D

    .line 316
    .line 317
    double-to-float v1, v1

    .line 318
    sput v1, Ll/vo0;->r:F

    .line 319
    .line 320
    iget-wide v1, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_speed_check_female:D

    .line 321
    .line 322
    double-to-float v1, v1

    .line 323
    sput v1, Ll/vo0;->s:F

    .line 324
    .line 325
    iget v0, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_item_diff_female:I

    .line 326
    .line 327
    int-to-float v0, v0

    .line 328
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 329
    .line 330
    .line 331
    move-result v0

    .line 332
    int-to-float v0, v0

    .line 333
    sput v0, Ll/vo0;->t:F

    .line 334
    .line 335
    iget-object v0, p0, Ll/vo0;->c:Lcom/p1/mobile/putong/core/data/CardSwipeConfig;

    .line 336
    .line 337
    iget v0, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_out_value_female:I

    .line 338
    .line 339
    int-to-float v0, v0

    .line 340
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 341
    .line 342
    .line 343
    move-result v0

    .line 344
    int-to-float v0, v0

    .line 345
    sput v0, Ll/vo0;->u:F

    .line 346
    .line 347
    iget-object v0, p0, Ll/vo0;->c:Lcom/p1/mobile/putong/core/data/CardSwipeConfig;

    .line 348
    .line 349
    iget v0, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_mine_value_female:I

    .line 350
    .line 351
    int-to-float v0, v0

    .line 352
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 353
    .line 354
    .line 355
    move-result v0

    .line 356
    int-to-float v0, v0

    .line 357
    sput v0, Ll/vo0;->v:F

    .line 358
    .line 359
    iget-object v0, p0, Ll/vo0;->c:Lcom/p1/mobile/putong/core/data/CardSwipeConfig;

    .line 360
    .line 361
    iget-wide v1, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->female_swipe_auto_width:D

    .line 362
    .line 363
    double-to-float v1, v1

    .line 364
    sput v1, Ll/vo0;->o:F

    .line 365
    .line 366
    iget-wide v1, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->female_swipe_auto_factor:D

    .line 367
    .line 368
    double-to-float v1, v1

    .line 369
    sput v1, Ll/vo0;->p:F

    .line 370
    .line 371
    iget-wide v1, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->female_swipe_auto_rotate:D

    .line 372
    .line 373
    double-to-float v1, v1

    .line 374
    sput v1, Ll/vo0;->q:F

    .line 375
    .line 376
    iget-boolean v1, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->could_double_click:Z

    .line 377
    .line 378
    sput-boolean v1, Ll/vo0;->y:Z

    .line 379
    .line 380
    iget-wide v0, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_type_factor:D

    .line 381
    .line 382
    double-to-float v0, v0

    .line 383
    sput v0, Ll/vo0;->z:F

    .line 384
    .line 385
    goto :goto_0

    .line 386
    :cond_5
    iget-object v0, p0, Ll/vo0;->c:Lcom/p1/mobile/putong/core/data/CardSwipeConfig;

    .line 387
    .line 388
    iget-wide v1, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_left_male_during:J

    .line 389
    .line 390
    sget-wide v3, Ll/vo0;->e:J

    .line 391
    .line 392
    mul-long/2addr v1, v3

    .line 393
    sput-wide v1, Ll/vo0;->f:J

    .line 394
    .line 395
    iget-wide v1, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_right_male_during:J

    .line 396
    .line 397
    mul-long/2addr v1, v3

    .line 398
    sput-wide v1, Ll/vo0;->g:J

    .line 399
    .line 400
    iget-wide v1, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_up_male_during:J

    .line 401
    .line 402
    mul-long/2addr v1, v3

    .line 403
    sput-wide v1, Ll/vo0;->h:J

    .line 404
    .line 405
    iget-wide v1, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_auto_male_during:J

    .line 406
    .line 407
    mul-long/2addr v1, v3

    .line 408
    sput-wide v1, Ll/vo0;->i:J

    .line 409
    .line 410
    iget-wide v1, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_back_male_during:J

    .line 411
    .line 412
    mul-long/2addr v1, v3

    .line 413
    sput-wide v1, Ll/vo0;->j:J

    .line 414
    .line 415
    iget-wide v1, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_reset_male_during:J

    .line 416
    .line 417
    mul-long/2addr v1, v3

    .line 418
    sput-wide v1, Ll/vo0;->k:J

    .line 419
    .line 420
    iget-wide v0, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_trans_y_male:J

    .line 421
    .line 422
    long-to-float v0, v0

    .line 423
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 424
    .line 425
    .line 426
    move-result v0

    .line 427
    int-to-long v0, v0

    .line 428
    sput-wide v0, Ll/vo0;->l:J

    .line 429
    .line 430
    iget-object v0, p0, Ll/vo0;->c:Lcom/p1/mobile/putong/core/data/CardSwipeConfig;

    .line 431
    .line 432
    iget-wide v1, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_rotation_male:D

    .line 433
    .line 434
    double-to-float v1, v1

    .line 435
    sput v1, Ll/vo0;->n:F

    .line 436
    .line 437
    iget-wide v1, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_speed_factor_male:D

    .line 438
    .line 439
    double-to-float v1, v1

    .line 440
    sput v1, Ll/vo0;->r:F

    .line 441
    .line 442
    iget-wide v1, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_speed_check_male:D

    .line 443
    .line 444
    double-to-float v1, v1

    .line 445
    sput v1, Ll/vo0;->s:F

    .line 446
    .line 447
    iget v0, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_item_diff_male:I

    .line 448
    .line 449
    int-to-float v0, v0

    .line 450
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 451
    .line 452
    .line 453
    move-result v0

    .line 454
    int-to-float v0, v0

    .line 455
    sput v0, Ll/vo0;->t:F

    .line 456
    .line 457
    iget-object v0, p0, Ll/vo0;->c:Lcom/p1/mobile/putong/core/data/CardSwipeConfig;

    .line 458
    .line 459
    iget v0, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_out_value_male:I

    .line 460
    .line 461
    int-to-float v0, v0

    .line 462
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 463
    .line 464
    .line 465
    move-result v0

    .line 466
    int-to-float v0, v0

    .line 467
    sput v0, Ll/vo0;->u:F

    .line 468
    .line 469
    iget-object v0, p0, Ll/vo0;->c:Lcom/p1/mobile/putong/core/data/CardSwipeConfig;

    .line 470
    .line 471
    iget v0, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_mine_value_male:I

    .line 472
    .line 473
    int-to-float v0, v0

    .line 474
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 475
    .line 476
    .line 477
    move-result v0

    .line 478
    int-to-float v0, v0

    .line 479
    sput v0, Ll/vo0;->v:F

    .line 480
    .line 481
    iget-object v0, p0, Ll/vo0;->c:Lcom/p1/mobile/putong/core/data/CardSwipeConfig;

    .line 482
    .line 483
    iget-wide v1, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->male_swipe_auto_width:D

    .line 484
    .line 485
    double-to-float v1, v1

    .line 486
    sput v1, Ll/vo0;->o:F

    .line 487
    .line 488
    iget-wide v1, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->male_swipe_auto_factor:D

    .line 489
    .line 490
    double-to-float v1, v1

    .line 491
    sput v1, Ll/vo0;->p:F

    .line 492
    .line 493
    iget-wide v1, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->male_swipe_auto_rotate:D

    .line 494
    .line 495
    double-to-float v1, v1

    .line 496
    sput v1, Ll/vo0;->q:F

    .line 497
    .line 498
    iget-boolean v1, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->could_double_click:Z

    .line 499
    .line 500
    sput-boolean v1, Ll/vo0;->y:Z

    .line 501
    .line 502
    iget-wide v0, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_type_factor:D

    .line 503
    .line 504
    double-to-float v0, v0

    .line 505
    sput v0, Ll/vo0;->z:F

    .line 506
    .line 507
    :goto_0
    iget-object v0, p0, Ll/vo0;->c:Lcom/p1/mobile/putong/core/data/CardSwipeConfig;

    .line 508
    .line 509
    iget v0, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_fix_speed:I

    .line 510
    .line 511
    int-to-float v0, v0

    .line 512
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 513
    .line 514
    .line 515
    move-result v0

    .line 516
    int-to-float v0, v0

    .line 517
    sput v0, Ll/vo0;->A:F

    .line 518
    .line 519
    iget-object v0, p0, Ll/vo0;->c:Lcom/p1/mobile/putong/core/data/CardSwipeConfig;

    .line 520
    .line 521
    iget-wide v1, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_scale:D

    .line 522
    .line 523
    double-to-float v1, v1

    .line 524
    sput v1, Ll/vo0;->G:F

    .line 525
    .line 526
    iget-wide v1, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_scale_start_alpha:D

    .line 527
    .line 528
    double-to-float v1, v1

    .line 529
    sput v1, Ll/vo0;->H:F

    .line 530
    .line 531
    iget v0, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_progress_value:I

    .line 532
    .line 533
    int-to-float v0, v0

    .line 534
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 535
    .line 536
    .line 537
    move-result v0

    .line 538
    int-to-float v0, v0

    .line 539
    sput v0, Ll/vo0;->I:F

    .line 540
    .line 541
    iget-object p0, p0, Ll/vo0;->c:Lcom/p1/mobile/putong/core/data/CardSwipeConfig;

    .line 542
    .line 543
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->scale_opt:Z

    .line 544
    .line 545
    sput-boolean v0, Ll/vo0;->J:Z

    .line 546
    .line 547
    iget-wide v0, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->scale_opt_during:J

    .line 548
    .line 549
    sget-wide v2, Ll/vo0;->e:J

    .line 550
    .line 551
    mul-long/2addr v0, v2

    .line 552
    sput-wide v0, Ll/vo0;->K:J

    .line 553
    .line 554
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->scale_use_opt_during:Z

    .line 555
    .line 556
    sput-boolean v0, Ll/vo0;->L:Z

    .line 557
    .line 558
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->scale_alpha_opt:Z

    .line 559
    .line 560
    sput-boolean v0, Ll/vo0;->M:Z

    .line 561
    .line 562
    iget-wide v0, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->scale_alpha_speed:D

    .line 563
    .line 564
    double-to-float p0, v0

    .line 565
    sput p0, Ll/vo0;->N:F

    .line 566
    .line 567
    return-void
.end method

.method public varargs d([Ll/nh4;)V
    .locals 4

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    array-length v0, p1

    .line 4
    if-lez v0, :cond_1

    .line 5
    .line 6
    array-length v0, p1

    .line 7
    const/4 v1, 0x0

    .line 8
    :goto_0
    if-ge v1, v0, :cond_0

    .line 9
    .line 10
    aget-object v2, p1, v1

    .line 11
    .line 12
    iget-object v3, p0, Ll/vo0;->b:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    iget-object v3, p0, Ll/vo0;->a:Ll/ox2;

    .line 18
    .line 19
    invoke-virtual {v3, v2}, Ll/ox2;->N(Ll/nh4;)V

    .line 20
    .line 21
    .line 22
    add-int/lit8 v1, v1, 0x1

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {p1, p0}, Landroid/view/Choreographer;->removeFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 30
    .line 31
    .line 32
    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-virtual {p1, p0}, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 37
    .line 38
    .line 39
    :cond_1
    return-void
.end method

.method public doFrame(J)V
    .locals 9

    .line 1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 2
    .line 3
    .line 4
    move-result-wide p1

    .line 5
    iget-object v0, p0, Ll/vo0;->b:Ljava/util/List;

    .line 6
    .line 7
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const/4 v1, 0x0

    .line 12
    move v2, v1

    .line 13
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 14
    .line 15
    .line 16
    move-result v3

    .line 17
    if-eqz v3, :cond_3

    .line 18
    .line 19
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    check-cast v3, Ll/nh4;

    .line 24
    .line 25
    iget-object v4, v3, Ll/nh4;->b:Lcom/p1/mobile/putong/core/newui/home/opt/CardAnimType;

    .line 26
    .line 27
    sget-object v5, Lcom/p1/mobile/putong/core/newui/home/opt/CardAnimType;->ANIM_INVALID:Lcom/p1/mobile/putong/core/newui/home/opt/CardAnimType;

    .line 28
    .line 29
    const/4 v6, 0x1

    .line 30
    if-ne v4, v5, :cond_0

    .line 31
    .line 32
    iput-boolean v6, v3, Ll/nh4;->n:Z

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    iget-object v4, p0, Ll/vo0;->a:Ll/ox2;

    .line 36
    .line 37
    invoke-virtual {v4, v3, p1, p2}, Ll/ox2;->K(Ll/nh4;J)V

    .line 38
    .line 39
    .line 40
    iget-wide v4, v3, Ll/nh4;->d:J

    .line 41
    .line 42
    iget-wide v7, v3, Ll/nh4;->c:J

    .line 43
    .line 44
    add-long/2addr v4, v7

    .line 45
    cmp-long v4, p1, v4

    .line 46
    .line 47
    if-ltz v4, :cond_1

    .line 48
    .line 49
    move v4, v6

    .line 50
    goto :goto_1

    .line 51
    :cond_1
    move v4, v1

    .line 52
    :goto_1
    if-eqz v4, :cond_2

    .line 53
    .line 54
    iput-boolean v6, v3, Ll/nh4;->n:Z

    .line 55
    .line 56
    :cond_2
    xor-int/lit8 v3, v4, 0x1

    .line 57
    .line 58
    or-int/2addr v2, v3

    .line 59
    goto :goto_0

    .line 60
    :cond_3
    iget-object v0, p0, Ll/vo0;->b:Ljava/util/List;

    .line 61
    .line 62
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    :cond_4
    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    if-eqz v1, :cond_6

    .line 71
    .line 72
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    check-cast v1, Ll/nh4;

    .line 77
    .line 78
    iget-boolean v3, v1, Ll/nh4;->n:Z

    .line 79
    .line 80
    if-eqz v3, :cond_4

    .line 81
    .line 82
    sget-boolean v3, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->d:Z

    .line 83
    .line 84
    if-eqz v3, :cond_5

    .line 85
    .line 86
    iget-object v3, v1, Ll/nh4;->b:Lcom/p1/mobile/putong/core/newui/home/opt/CardAnimType;

    .line 87
    .line 88
    invoke-static {v3}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    :cond_5
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    .line 92
    .line 93
    .line 94
    iget-object v3, p0, Ll/vo0;->a:Ll/ox2;

    .line 95
    .line 96
    invoke-virtual {v3, v1, p1, p2}, Ll/ox2;->I(Ll/nh4;J)V

    .line 97
    .line 98
    .line 99
    goto :goto_2

    .line 100
    :cond_6
    if-eqz v2, :cond_7

    .line 101
    .line 102
    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    invoke-virtual {p1, p0}, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 107
    .line 108
    .line 109
    :cond_7
    return-void
.end method

.method public e(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/nh4;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-lez v0, :cond_1

    .line 8
    .line 9
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Ll/nh4;

    .line 24
    .line 25
    iget-object v1, p0, Ll/vo0;->b:Ljava/util/List;

    .line 26
    .line 27
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    iget-object v1, p0, Ll/vo0;->a:Ll/ox2;

    .line 31
    .line 32
    invoke-virtual {v1, v0}, Ll/ox2;->N(Ll/nh4;)V

    .line 33
    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-virtual {p1, p0}, Landroid/view/Choreographer;->removeFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 41
    .line 42
    .line 43
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 44
    .line 45
    .line 46
    move-result-wide v0

    .line 47
    invoke-virtual {p0, v0, v1}, Ll/vo0;->doFrame(J)V

    .line 48
    .line 49
    .line 50
    :cond_1
    return-void
.end method

.method public f()Z
    .locals 3

    .line 1
    iget-object p0, p0, Ll/vo0;->b:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->listIterator()Ljava/util/ListIterator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Ll/nh4;

    .line 18
    .line 19
    iget-object v1, v0, Ll/nh4;->b:Lcom/p1/mobile/putong/core/newui/home/opt/CardAnimType;

    .line 20
    .line 21
    sget-object v2, Lcom/p1/mobile/putong/core/newui/home/opt/CardAnimType;->ANIM_INSERT:Lcom/p1/mobile/putong/core/newui/home/opt/CardAnimType;

    .line 22
    .line 23
    if-ne v1, v2, :cond_0

    .line 24
    .line 25
    iget-object v0, v0, Ll/nh4;->g:Lcom/p1/mobile/putong/core/newui/home/opt/CardSwipeOutState;

    .line 26
    .line 27
    sget-object v1, Lcom/p1/mobile/putong/core/newui/home/opt/CardSwipeOutState;->INVALID:Lcom/p1/mobile/putong/core/newui/home/opt/CardSwipeOutState;

    .line 28
    .line 29
    if-ne v0, v1, :cond_0

    .line 30
    .line 31
    const/4 p0, 0x1

    .line 32
    return p0

    .line 33
    :cond_1
    const/4 p0, 0x0

    .line 34
    return p0
.end method

.method public g()Z
    .locals 3

    .line 1
    iget-object p0, p0, Ll/vo0;->b:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->listIterator()Ljava/util/ListIterator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_2

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Ll/nh4;

    .line 18
    .line 19
    iget-object v1, v0, Ll/nh4;->b:Lcom/p1/mobile/putong/core/newui/home/opt/CardAnimType;

    .line 20
    .line 21
    sget-object v2, Lcom/p1/mobile/putong/core/newui/home/opt/CardAnimType;->ANIM_OUT:Lcom/p1/mobile/putong/core/newui/home/opt/CardAnimType;

    .line 22
    .line 23
    if-ne v1, v2, :cond_0

    .line 24
    .line 25
    iget-object v1, v0, Ll/nh4;->g:Lcom/p1/mobile/putong/core/newui/home/opt/CardSwipeOutState;

    .line 26
    .line 27
    sget-object v2, Lcom/p1/mobile/putong/core/newui/home/opt/CardSwipeOutState;->INVALID:Lcom/p1/mobile/putong/core/newui/home/opt/CardSwipeOutState;

    .line 28
    .line 29
    if-eq v1, v2, :cond_1

    .line 30
    .line 31
    iget-boolean v0, v0, Ll/nh4;->j:Z

    .line 32
    .line 33
    if-nez v0, :cond_0

    .line 34
    .line 35
    :cond_1
    const/4 p0, 0x1

    .line 36
    return p0

    .line 37
    :cond_2
    const/4 p0, 0x0

    .line 38
    return p0
.end method

.method public h(I)Z
    .locals 3

    .line 1
    sget-boolean v0, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->d:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/vo0;->b:Ljava/util/List;

    .line 6
    .line 7
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/vo0;->b:Ljava/util/List;

    .line 11
    .line 12
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 13
    .line 14
    .line 15
    :cond_0
    iget-object p0, p0, Ll/vo0;->b:Ljava/util/List;

    .line 16
    .line 17
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    :cond_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    const/4 v1, 0x0

    .line 26
    if-eqz v0, :cond_3

    .line 27
    .line 28
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    check-cast v0, Ll/nh4;

    .line 33
    .line 34
    sget-boolean v2, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->d:Z

    .line 35
    .line 36
    if-eqz v2, :cond_2

    .line 37
    .line 38
    iget-object v2, v0, Ll/nh4;->m:Ljava/util/List;

    .line 39
    .line 40
    invoke-interface {v2}, Ljava/util/List;->toArray()[Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    aget-object v1, v2, v1

    .line 45
    .line 46
    invoke-static {v1}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    :cond_2
    invoke-virtual {v0, p1}, Ll/nh4;->m(I)Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-eqz v0, :cond_1

    .line 54
    .line 55
    const/4 p0, 0x1

    .line 56
    return p0

    .line 57
    :cond_3
    return v1
.end method

.method public final i(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroid/view/ViewConfiguration;->getScaledMinimumFlingVelocity()I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    int-to-float p1, p1

    .line 10
    sput p1, Ll/vo0;->D:F

    .line 11
    .line 12
    invoke-virtual {p0}, Landroid/view/ViewConfiguration;->getScaledMaximumFlingVelocity()I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    int-to-float p0, p0

    .line 17
    sput p0, Ll/vo0;->E:F

    .line 18
    .line 19
    sget-object p0, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->c:Ljava/lang/String;

    .line 20
    .line 21
    return-void
.end method
