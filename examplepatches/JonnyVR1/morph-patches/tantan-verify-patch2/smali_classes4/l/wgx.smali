.class public Ll/wgx;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ryl;


# static fields
.field public static volatile p:Ll/wgx;


# instance fields
.field public a:Ljava/lang/String;

.field public b:Lcom/p1/mobile/putong/core/data/MatchPopAnim;

.field public c:I

.field public d:Ll/l4g0;

.field public e:Landroid/view/GestureDetector;

.field public f:Landroid/widget/PopupWindow;

.field public g:Ll/syl;

.field public h:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public i:Lcom/p1/mobile/putong/data/User;

.field public j:J

.field public k:Z

.field public l:J

.field public m:Z

.field public n:Z

.field public o:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput v0, p0, Ll/wgx;->c:I

    .line 6
    .line 7
    new-instance v0, Ll/wgx$f;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Ll/wgx$f;-><init>(Ll/wgx;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ll/wgx;->o:Ljava/lang/Runnable;

    .line 13
    .line 14
    :try_start_0
    iget-object v0, p0, Ll/wgx;->b:Lcom/p1/mobile/putong/core/data/MatchPopAnim;

    .line 15
    .line 16
    if-nez v0, :cond_0

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/wgx;->C()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 19
    .line 20
    .line 21
    :catch_0
    :cond_0
    return-void
.end method

.method public static A()Ll/wgx;
    .locals 2

    .line 1
    sget-object v0, Ll/wgx;->p:Ll/wgx;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Ll/wgx;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Ll/wgx;->p:Ll/wgx;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ll/wgx;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/wgx;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Ll/wgx;->p:Ll/wgx;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception v1

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    monitor-exit v0

    .line 23
    goto :goto_2

    .line 24
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw v1

    .line 26
    :cond_1
    :goto_2
    sget-object v0, Ll/wgx;->p:Ll/wgx;

    .line 27
    .line 28
    return-object v0
.end method

.method public static B(Lcom/p1/mobile/android/app/Act;)I
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "dimen"

    .line 10
    .line 11
    const-string v2, "android"

    .line 12
    .line 13
    const-string v3, "status_bar_height"

    .line 14
    .line 15
    invoke-virtual {v0, v3, v1, v2}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-lez v0, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    return p0

    .line 34
    :cond_0
    const/4 p0, 0x0

    .line 35
    return p0
.end method

.method public static bridge synthetic d(Ll/wgx;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/wgx;->k:Z

    return p0
.end method

.method public static bridge synthetic e(Ll/wgx;)Lcom/p1/mobile/putong/data/User;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wgx;->i:Lcom/p1/mobile/putong/data/User;

    return-object p0
.end method

.method public static bridge synthetic g(Ll/wgx;)Ljava/lang/Runnable;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wgx;->o:Ljava/lang/Runnable;

    return-object p0
.end method

.method public static bridge synthetic h(Ll/wgx;)Landroid/view/GestureDetector;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wgx;->e:Landroid/view/GestureDetector;

    return-object p0
.end method

.method public static bridge synthetic i(Ll/wgx;)Ll/l4g0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wgx;->d:Ll/l4g0;

    return-object p0
.end method

.method public static bridge synthetic j(Ll/wgx;)Ll/syl;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wgx;->g:Ll/syl;

    return-object p0
.end method

.method public static bridge synthetic k(Ll/wgx;)Landroid/widget/PopupWindow;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wgx;->f:Landroid/widget/PopupWindow;

    return-object p0
.end method

.method public static bridge synthetic l(Ll/wgx;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/wgx;->k:Z

    return-void
.end method

.method public static bridge synthetic m(Ll/wgx;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/wgx;->i:Lcom/p1/mobile/putong/data/User;

    return-void
.end method

.method public static bridge synthetic n(Ll/wgx;Landroid/view/GestureDetector;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/wgx;->e:Landroid/view/GestureDetector;

    return-void
.end method

.method public static bridge synthetic o(Ll/wgx;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/wgx;->m:Z

    return-void
.end method

.method public static bridge synthetic p(Ll/wgx;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/wgx;->n:Z

    return-void
.end method

.method public static bridge synthetic q(Ll/wgx;Landroid/widget/PopupWindow;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/wgx;->f:Landroid/widget/PopupWindow;

    return-void
.end method

.method public static bridge synthetic r(Ll/wgx;Ljava/util/LinkedList;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/wgx;->h:Ljava/util/LinkedList;

    return-void
.end method

.method public static bridge synthetic s(Ll/wgx;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/wgx;->F(Lcom/p1/mobile/android/app/Act;)V

    return-void
.end method

.method public static bridge synthetic t(Ll/wgx;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/wgx;->H(Lcom/p1/mobile/android/app/Act;)V

    return-void
.end method

.method public static bridge synthetic u(Ll/wgx;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/wgx;->M(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static bridge synthetic v(Ll/wgx;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/wgx;->P()V

    return-void
.end method


# virtual methods
.method public final C()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MatchPopAnim;->new_()Lcom/p1/mobile/putong/core/data/MatchPopAnim;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Ll/wgx;->b:Lcom/p1/mobile/putong/core/data/MatchPopAnim;

    .line 6
    .line 7
    const/16 p0, 0x12c

    .line 8
    .line 9
    iput p0, v0, Lcom/p1/mobile/putong/core/data/MatchPopAnim;->popEnter:I

    .line 10
    .line 11
    iput p0, v0, Lcom/p1/mobile/putong/core/data/MatchPopAnim;->popOut:I

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    iput p0, v0, Lcom/p1/mobile/putong/core/data/MatchPopAnim;->speed:I

    .line 15
    .line 16
    const/16 v1, 0xc8

    .line 17
    .line 18
    iput v1, v0, Lcom/p1/mobile/putong/core/data/MatchPopAnim;->avatarDelay:I

    .line 19
    .line 20
    const/16 v1, 0x5dc

    .line 21
    .line 22
    iput v1, v0, Lcom/p1/mobile/putong/core/data/MatchPopAnim;->avatarX:I

    .line 23
    .line 24
    const/16 v1, 0x64

    .line 25
    .line 26
    iput v1, v0, Lcom/p1/mobile/putong/core/data/MatchPopAnim;->avatarAlpha:I

    .line 27
    .line 28
    iput p0, v0, Lcom/p1/mobile/putong/core/data/MatchPopAnim;->delaySpeed:I

    .line 29
    .line 30
    const/16 p0, 0x14

    .line 31
    .line 32
    iput p0, v0, Lcom/p1/mobile/putong/core/data/MatchPopAnim;->avatarTransX:I

    .line 33
    .line 34
    const/16 p0, 0xc

    .line 35
    .line 36
    iput p0, v0, Lcom/p1/mobile/putong/core/data/MatchPopAnim;->avatarRepeatTransX:I

    .line 37
    .line 38
    return-void
.end method

.method public final D(Lcom/p1/mobile/putong/data/User;)V
    .locals 7

    .line 1
    const-string v0, "matched_received_page_type"

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-boolean v1, p0, Ll/wgx;->n:Z

    .line 7
    .line 8
    const-string v2, "female"

    .line 9
    .line 10
    if-eqz v1, :cond_1

    .line 11
    .line 12
    const-string v1, "fisrt_liked"

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_1
    move-object v1, v2

    .line 16
    :goto_0
    iget-object v3, p0, Ll/wgx;->a:Ljava/lang/String;

    .line 17
    .line 18
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 19
    .line 20
    .line 21
    move-result v3

    .line 22
    const-string v4, "long_time_no_see"

    .line 23
    .line 24
    if-nez v3, :cond_2

    .line 25
    .line 26
    iget-object v1, p0, Ll/wgx;->a:Ljava/lang/String;

    .line 27
    .line 28
    invoke-static {v1, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 29
    .line 30
    .line 31
    move-result v3

    .line 32
    if-eqz v3, :cond_2

    .line 33
    .line 34
    goto :goto_1

    .line 35
    :cond_2
    move-object v2, v1

    .line 36
    :goto_1
    new-instance v1, Ll/l4g0;

    .line 37
    .line 38
    const-class v3, Ll/wgx;

    .line 39
    .line 40
    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    const-string v5, "p_successful_match_view"

    .line 45
    .line 46
    invoke-direct {v1, v5, v3}, Ll/l4g0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    iput-object v1, p0, Ll/wgx;->d:Ll/l4g0;

    .line 50
    .line 51
    new-instance v1, Lorg/json/JSONObject;

    .line 52
    .line 53
    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 54
    .line 55
    .line 56
    :try_start_0
    const-string v3, "match_source"

    .line 57
    .line 58
    iget-boolean v6, p0, Ll/wgx;->n:Z

    .line 59
    .line 60
    if-eqz v6, :cond_3

    .line 61
    .line 62
    const-string v6, "negative"

    .line 63
    .line 64
    goto :goto_2

    .line 65
    :catch_0
    move-exception p1

    .line 66
    goto :goto_3

    .line 67
    :cond_3
    const-string v6, "positive"

    .line 68
    .line 69
    :goto_2
    invoke-virtual {v1, v3, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 70
    .line 71
    .line 72
    const-string v3, "moments_user_id"

    .line 73
    .line 74
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 75
    .line 76
    invoke-virtual {v1, v3, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 77
    .line 78
    .line 79
    invoke-virtual {v1, v0, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 80
    .line 81
    .line 82
    invoke-static {}, Ll/gra;->r1()Z

    .line 83
    .line 84
    .line 85
    move-result p1

    .line 86
    if-eqz p1, :cond_4

    .line 87
    .line 88
    const-string p1, "is_matched_longtimenosee"

    .line 89
    .line 90
    iget-object v3, p0, Ll/wgx;->a:Ljava/lang/String;

    .line 91
    .line 92
    invoke-static {v3, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 93
    .line 94
    .line 95
    move-result v3

    .line 96
    invoke-virtual {v1, p1, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 97
    .line 98
    .line 99
    :cond_4
    iget-object p1, p0, Ll/wgx;->d:Ll/l4g0;

    .line 100
    .line 101
    invoke-virtual {p1, v1}, Ll/l4g0;->o(Lorg/json/JSONObject;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 102
    .line 103
    .line 104
    goto :goto_4

    .line 105
    :goto_3
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 106
    .line 107
    .line 108
    :goto_4
    iget-object p1, p0, Ll/wgx;->d:Ll/l4g0;

    .line 109
    .line 110
    invoke-virtual {p1}, Ll/l4g0;->i()V

    .line 111
    .line 112
    .line 113
    iget-object p0, p0, Ll/wgx;->d:Ll/l4g0;

    .line 114
    .line 115
    invoke-virtual {p0}, Ll/l4g0;->l()V

    .line 116
    .line 117
    .line 118
    const-string p0, "e_matched_text_box"

    .line 119
    .line 120
    const/4 p1, 0x0

    .line 121
    new-array v1, p1, [Ll/sfj0$a;

    .line 122
    .line 123
    invoke-static {p0, v5, v1}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 124
    .line 125
    .line 126
    const-string p0, "e_matched_later"

    .line 127
    .line 128
    new-array p1, p1, [Ll/sfj0$a;

    .line 129
    .line 130
    invoke-static {p0, v5, p1}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 131
    .line 132
    .line 133
    invoke-static {v0, v2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 134
    .line 135
    .line 136
    move-result-object p0

    .line 137
    filled-new-array {p0}, [Ll/sfj0$a;

    .line 138
    .line 139
    .line 140
    move-result-object p0

    .line 141
    const-string p1, "e_matched_push_other_area"

    .line 142
    .line 143
    invoke-static {p1, v5, p0}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 144
    .line 145
    .line 146
    const-string p0, "emoji_quantity"

    .line 147
    .line 148
    const/4 p1, 0x3

    .line 149
    invoke-static {p0, p1}, Ll/sfj0$a;->f(Ljava/lang/String;I)Ll/sfj0$a;

    .line 150
    .line 151
    .line 152
    move-result-object p0

    .line 153
    filled-new-array {p0}, [Ll/sfj0$a;

    .line 154
    .line 155
    .line 156
    move-result-object p0

    .line 157
    const-string p1, "e_match_emoji"

    .line 158
    .line 159
    invoke-static {p1, v5, p0}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 160
    .line 161
    .line 162
    return-void
.end method

.method public final E(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Act;)V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/wgx;->e:Landroid/view/GestureDetector;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Landroid/view/GestureDetector;

    .line 6
    .line 7
    new-instance v1, Ll/wgx$l;

    .line 8
    .line 9
    invoke-direct {v1, p0, p2}, Ll/wgx$l;-><init>(Ll/wgx;Lcom/p1/mobile/android/app/Act;)V

    .line 10
    .line 11
    .line 12
    invoke-direct {v0, p2, v1}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Ll/wgx;->e:Landroid/view/GestureDetector;

    .line 16
    .line 17
    :cond_0
    iget-object v0, p0, Ll/wgx;->f:Landroid/widget/PopupWindow;

    .line 18
    .line 19
    if-nez v0, :cond_3

    .line 20
    .line 21
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 22
    .line 23
    .line 24
    move-result-wide v0

    .line 25
    iput-wide v0, p0, Ll/wgx;->j:J

    .line 26
    .line 27
    sget v0, Ll/kec0;->h8:I

    .line 28
    .line 29
    const/high16 v1, 0x436c0000    # 236.0f

    .line 30
    .line 31
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    invoke-static {}, Ll/gra;->U2()Z

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    if-eqz v2, :cond_1

    .line 40
    .line 41
    sget v0, Ll/kec0;->i8:I

    .line 42
    .line 43
    const/high16 v1, 0x42c80000    # 100.0f

    .line 44
    .line 45
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    :cond_1
    new-instance v2, Landroid/widget/PopupWindow;

    .line 50
    .line 51
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 52
    .line 53
    .line 54
    move-result-object v3

    .line 55
    const/4 v4, 0x0

    .line 56
    invoke-virtual {v3, v0, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-static {}, Ll/bnl0;->y0()I

    .line 61
    .line 62
    .line 63
    move-result v3

    .line 64
    const/4 v4, 0x0

    .line 65
    invoke-direct {v2, v0, v3, v1, v4}, Landroid/widget/PopupWindow;-><init>(Landroid/view/View;IIZ)V

    .line 66
    .line 67
    .line 68
    iput-object v2, p0, Ll/wgx;->f:Landroid/widget/PopupWindow;

    .line 69
    .line 70
    invoke-virtual {v2}, Landroid/widget/PopupWindow;->getContentView()Landroid/view/View;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    sget v1, Ll/adc0;->L6:I

    .line 75
    .line 76
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    check-cast v0, Ll/syl;

    .line 81
    .line 82
    iput-object v0, p0, Ll/wgx;->g:Ll/syl;

    .line 83
    .line 84
    invoke-interface {v0, p0}, Ll/syl;->x(Ll/ryl;)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {p0}, Ll/wgx;->w()Z

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    if-eqz v0, :cond_2

    .line 92
    .line 93
    return-void

    .line 94
    :cond_2
    iget-object v0, p0, Ll/wgx;->g:Ll/syl;

    .line 95
    .line 96
    invoke-interface {v0}, Ll/syl;->r()V

    .line 97
    .line 98
    .line 99
    iget-object v0, p0, Ll/wgx;->f:Landroid/widget/PopupWindow;

    .line 100
    .line 101
    invoke-virtual {v0, v4}, Landroid/widget/PopupWindow;->setClippingEnabled(Z)V

    .line 102
    .line 103
    .line 104
    iget-object v0, p0, Ll/wgx;->g:Ll/syl;

    .line 105
    .line 106
    invoke-interface {v0}, Ll/syl;->getRootView()Landroid/view/View;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    const/4 v1, 0x1

    .line 111
    invoke-virtual {v0, v1}, Landroid/view/View;->setClickable(Z)V

    .line 112
    .line 113
    .line 114
    iget-object v0, p0, Ll/wgx;->g:Ll/syl;

    .line 115
    .line 116
    invoke-interface {v0}, Ll/syl;->getRootView()Landroid/view/View;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    new-instance v1, Ll/wgx$m;

    .line 121
    .line 122
    invoke-direct {v1, p0}, Ll/wgx$m;-><init>(Ll/wgx;)V

    .line 123
    .line 124
    .line 125
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 126
    .line 127
    .line 128
    new-instance v0, Ll/wgx$n;

    .line 129
    .line 130
    invoke-direct {v0, p0, p2}, Ll/wgx$n;-><init>(Ll/wgx;Lcom/p1/mobile/android/app/Act;)V

    .line 131
    .line 132
    .line 133
    invoke-virtual {p2, v0}, Lcom/p1/mobile/android/app/Act;->registerOnActivityResultListener(Lcom/p1/mobile/android/app/a$a;)V

    .line 134
    .line 135
    .line 136
    iget-object p2, p0, Ll/wgx;->f:Landroid/widget/PopupWindow;

    .line 137
    .line 138
    new-instance v0, Ll/wgx$a;

    .line 139
    .line 140
    invoke-direct {v0, p0}, Ll/wgx$a;-><init>(Ll/wgx;)V

    .line 141
    .line 142
    .line 143
    invoke-virtual {p2, v0}, Landroid/widget/PopupWindow;->setOnDismissListener(Landroid/widget/PopupWindow$OnDismissListener;)V

    .line 144
    .line 145
    .line 146
    :cond_3
    invoke-virtual {p0, p1}, Ll/wgx;->D(Lcom/p1/mobile/putong/data/User;)V

    .line 147
    .line 148
    .line 149
    return-void
.end method

.method public final F(Lcom/p1/mobile/android/app/Act;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/wgx;->i:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 7
    .line 8
    const/4 v1, 0x2

    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-static {p1, v0, v2, v2, v1}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l2(Landroid/content/Context;Ljava/lang/String;ZZI)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 15
    .line 16
    .line 17
    iget-boolean p1, p0, Ll/wgx;->n:Z

    .line 18
    .line 19
    if-eqz p1, :cond_1

    .line 20
    .line 21
    const-string p1, "fisrt_liked"

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_1
    const-string p1, "female"

    .line 25
    .line 26
    :goto_0
    iget-object v0, p0, Ll/wgx;->a:Ljava/lang/String;

    .line 27
    .line 28
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-nez v0, :cond_2

    .line 33
    .line 34
    iget-object p1, p0, Ll/wgx;->a:Ljava/lang/String;

    .line 35
    .line 36
    :cond_2
    const-string v0, "matched_received_page_type"

    .line 37
    .line 38
    invoke-static {v0, p1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    filled-new-array {p1}, [Ll/sfj0$a;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    const-string v0, "e_matched_push_other_area"

    .line 47
    .line 48
    const-string v1, "p_successful_match_view"

    .line 49
    .line 50
    invoke-static {v0, v1, p1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 51
    .line 52
    .line 53
    iget-object p1, p0, Ll/wgx;->o:Ljava/lang/Runnable;

    .line 54
    .line 55
    invoke-static {p1}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 56
    .line 57
    .line 58
    iget-object p0, p0, Ll/wgx;->o:Ljava/lang/Runnable;

    .line 59
    .line 60
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method public final G(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Act;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/wgx;->g:Ll/syl;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/syl;->s()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ll/wgx;->y(Lcom/p1/mobile/putong/data/User;)V

    .line 7
    .line 8
    .line 9
    new-instance p1, Ll/wgx$d;

    .line 10
    .line 11
    invoke-direct {p1, p0, p2}, Ll/wgx$d;-><init>(Ll/wgx;Lcom/p1/mobile/android/app/Act;)V

    .line 12
    .line 13
    .line 14
    iget p0, p0, Ll/wgx;->c:I

    .line 15
    .line 16
    mul-int/lit16 p0, p0, 0x7d0

    .line 17
    .line 18
    int-to-long v0, p0

    .line 19
    invoke-static {p2, p1, v0, v1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final H(Lcom/p1/mobile/android/app/Act;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/wgx;->f:Landroid/widget/PopupWindow;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/widget/PopupWindow;->isShowing()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/wgx;->h:Ljava/util/LinkedList;

    .line 12
    .line 13
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    new-instance v0, Ll/wgx$b;

    .line 20
    .line 21
    invoke-direct {v0, p0, p1}, Ll/wgx$b;-><init>(Ll/wgx;Lcom/p1/mobile/android/app/Act;)V

    .line 22
    .line 23
    .line 24
    iget p0, p0, Ll/wgx;->c:I

    .line 25
    .line 26
    mul-int/lit16 p0, p0, 0x1f4

    .line 27
    .line 28
    int-to-long v1, p0

    .line 29
    invoke-static {p1, v0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    new-instance v0, Ll/wgx$c;

    .line 34
    .line 35
    invoke-direct {v0, p0, p1}, Ll/wgx$c;-><init>(Ll/wgx;Lcom/p1/mobile/android/app/Act;)V

    .line 36
    .line 37
    .line 38
    iget p0, p0, Ll/wgx;->c:I

    .line 39
    .line 40
    mul-int/lit16 p0, p0, 0xed8

    .line 41
    .line 42
    int-to-long v1, p0

    .line 43
    invoke-static {p1, v0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public I()V
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    sput-object p0, Ll/wgx;->p:Ll/wgx;

    .line 3
    .line 4
    return-void
.end method

.method public final J(Lcom/p1/mobile/putong/data/User;Z)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    iput-object p1, p0, Ll/wgx;->i:Lcom/p1/mobile/putong/data/User;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/wgx;->w()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    :goto_0
    return-void

    .line 13
    :cond_1
    iget-object p0, p0, Ll/wgx;->g:Ll/syl;

    .line 14
    .line 15
    invoke-interface {p0, p1, p2}, Ll/syl;->w(Lcom/p1/mobile/putong/data/User;Z)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public K(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Z)V
    .locals 1

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, v0}, Ll/wgx;->L(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZLjava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public L(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZLjava/lang/String;)V
    .locals 0

    .line 1
    iput-object p4, p0, Ll/wgx;->a:Ljava/lang/String;

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-static {}, Ll/hlh0;->a()Ll/hlh0;

    .line 7
    .line 8
    .line 9
    move-result-object p4

    .line 10
    invoke-virtual {p4}, Ll/hlh0;->e()Z

    .line 11
    .line 12
    .line 13
    move-result p4

    .line 14
    if-eqz p4, :cond_1

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_1
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 18
    .line 19
    .line 20
    move-result-object p4

    .line 21
    if-nez p4, :cond_2

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_2
    invoke-virtual {p4}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object p4

    .line 28
    if-nez p4, :cond_3

    .line 29
    .line 30
    :goto_0
    return-void

    .line 31
    :cond_3
    iput-boolean p3, p0, Ll/wgx;->n:Z

    .line 32
    .line 33
    new-instance p3, Ll/wgx$j;

    .line 34
    .line 35
    invoke-direct {p3, p0, p1, p2}, Ll/wgx$j;-><init>(Ll/wgx;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p4, p3}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public final M(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)V
    .locals 4

    .line 1
    if-eqz p1, :cond_5

    .line 2
    .line 3
    if-nez p2, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_5

    .line 11
    .line 12
    invoke-virtual {p1}, Landroid/app/Activity;->isDestroyed()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_1
    invoke-virtual {p0, p2, p1}, Ll/wgx;->E(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Act;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ll/wgx;->f:Landroid/widget/PopupWindow;

    .line 23
    .line 24
    if-nez v0, :cond_2

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_2
    invoke-virtual {v0}, Landroid/widget/PopupWindow;->isShowing()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_4

    .line 32
    .line 33
    iget-object p1, p0, Ll/wgx;->h:Ljava/util/LinkedList;

    .line 34
    .line 35
    if-nez p1, :cond_3

    .line 36
    .line 37
    new-instance p1, Ljava/util/LinkedList;

    .line 38
    .line 39
    invoke-direct {p1}, Ljava/util/LinkedList;-><init>()V

    .line 40
    .line 41
    .line 42
    iput-object p1, p0, Ll/wgx;->h:Ljava/util/LinkedList;

    .line 43
    .line 44
    :cond_3
    iget-object p0, p0, Ll/wgx;->h:Ljava/util/LinkedList;

    .line 45
    .line 46
    invoke-virtual {p0, p2}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_4
    iget-object v0, p0, Ll/wgx;->o:Ljava/lang/Runnable;

    .line 51
    .line 52
    invoke-static {v0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 53
    .line 54
    .line 55
    const/4 v0, 0x0

    .line 56
    invoke-virtual {p0, p2, v0}, Ll/wgx;->J(Lcom/p1/mobile/putong/data/User;Z)V

    .line 57
    .line 58
    .line 59
    iget-object p2, p0, Ll/wgx;->f:Landroid/widget/PopupWindow;

    .line 60
    .line 61
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    invoke-virtual {v1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    const/16 v2, 0x31

    .line 70
    .line 71
    invoke-static {p1}, Ll/wgx;->B(Lcom/p1/mobile/android/app/Act;)I

    .line 72
    .line 73
    .line 74
    move-result v3

    .line 75
    invoke-virtual {p2, v1, v2, v0, v3}, Landroid/widget/PopupWindow;->showAtLocation(Landroid/view/View;III)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {p0}, Ll/wgx;->O()V

    .line 79
    .line 80
    .line 81
    new-instance p2, Ll/wgx$k;

    .line 82
    .line 83
    invoke-direct {p2, p0, p1}, Ll/wgx$k;-><init>(Ll/wgx;Lcom/p1/mobile/android/app/Act;)V

    .line 84
    .line 85
    .line 86
    iget p0, p0, Ll/wgx;->c:I

    .line 87
    .line 88
    mul-int/lit16 p0, p0, 0xed8

    .line 89
    .line 90
    int-to-long v0, p0

    .line 91
    invoke-static {p1, p2, v0, v1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 92
    .line 93
    .line 94
    :cond_5
    :goto_0
    return-void
.end method

.method public N(Ljava/lang/String;)V
    .locals 3

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
    invoke-virtual {p0}, Ll/wgx;->z()Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-static {v0}, Ll/w20;->f(Lcom/p1/mobile/android/app/Act;)Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-nez v1, :cond_1

    .line 17
    .line 18
    :goto_0
    return-void

    .line 19
    :cond_1
    const/4 v1, 0x1

    .line 20
    iput-boolean v1, p0, Ll/wgx;->n:Z

    .line 21
    .line 22
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 23
    .line 24
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 25
    .line 26
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/api/g;->Fo()Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    new-instance v2, Ll/wgx$g;

    .line 35
    .line 36
    invoke-direct {v2, p0, p1}, Ll/wgx$g;-><init>(Ll/wgx;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v1, v2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    new-instance v1, Ll/wgx$h;

    .line 44
    .line 45
    invoke-direct {v1, p0, v0}, Ll/wgx$h;-><init>(Ll/wgx;Lcom/p1/mobile/android/app/Act;)V

    .line 46
    .line 47
    .line 48
    new-instance v0, Ll/wgx$i;

    .line 49
    .line 50
    invoke-direct {v0, p0}, Ll/wgx$i;-><init>(Ll/wgx;)V

    .line 51
    .line 52
    .line 53
    invoke-static {v1, v0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public final O()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wgx;->g:Ll/syl;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/syl;->V()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final P()V
    .locals 9

    .line 1
    iget-object v0, p0, Ll/wgx;->o:Ljava/lang/Runnable;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v1, p0, Ll/wgx;->f:Landroid/widget/PopupWindow;

    .line 6
    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-static {v0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/wgx;->f:Landroid/widget/PopupWindow;

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/widget/PopupWindow;->getContentView()Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    sget-object v2, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    .line 20
    .line 21
    new-instance v7, Landroid/view/animation/AccelerateInterpolator;

    .line 22
    .line 23
    invoke-direct {v7}, Landroid/view/animation/AccelerateInterpolator;-><init>()V

    .line 24
    .line 25
    .line 26
    const/high16 v0, 0x436c0000    # 236.0f

    .line 27
    .line 28
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    neg-int v0, v0

    .line 33
    int-to-float v0, v0

    .line 34
    const/4 v3, 0x2

    .line 35
    new-array v8, v3, [F

    .line 36
    .line 37
    const/4 v3, 0x0

    .line 38
    const/4 v4, 0x0

    .line 39
    aput v3, v8, v4

    .line 40
    .line 41
    const/4 v3, 0x1

    .line 42
    aput v0, v8, v3

    .line 43
    .line 44
    const-wide/16 v3, 0x0

    .line 45
    .line 46
    const-wide/16 v5, 0xc8

    .line 47
    .line 48
    invoke-static/range {v1 .. v8}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    new-instance v1, Ll/wgx$e;

    .line 53
    .line 54
    invoke-direct {v1, p0, v0}, Ll/wgx$e;-><init>(Ll/wgx;Landroid/animation/Animator;)V

    .line 55
    .line 56
    .line 57
    invoke-static {v0, v1}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0}, Landroid/animation/Animator;->start()V

    .line 61
    .line 62
    .line 63
    :cond_1
    :goto_0
    return-void
.end method

.method public a(Lcom/p1/mobile/android/app/Act;Z)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/wgx;->m:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Ll/wgx;->f:Landroid/widget/PopupWindow;

    .line 7
    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/widget/PopupWindow;->isShowing()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    iget-object v0, p0, Ll/wgx;->h:Ljava/util/LinkedList;

    .line 17
    .line 18
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-nez v0, :cond_1

    .line 23
    .line 24
    iget-object p2, p0, Ll/wgx;->h:Ljava/util/LinkedList;

    .line 25
    .line 26
    invoke-virtual {p2}, Ljava/util/LinkedList;->pop()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    check-cast p2, Lcom/p1/mobile/putong/data/User;

    .line 31
    .line 32
    invoke-virtual {p0, p2, p1}, Ll/wgx;->G(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Act;)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_1
    invoke-virtual {p0, p2}, Ll/wgx;->x(Z)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public b(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/wgx;->m:Z

    .line 2
    .line 3
    return-void
.end method

.method public c(Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/wgx;->x(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public f()Lcom/p1/mobile/putong/data/User;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wgx;->i:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    return-object p0
.end method

.method public getConfig()Lcom/p1/mobile/putong/core/data/MatchPopAnim;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wgx;->b:Lcom/p1/mobile/putong/core/data/MatchPopAnim;

    .line 2
    .line 3
    return-object p0
.end method

.method public final w()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/wgx;->f:Landroid/widget/PopupWindow;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object p0, p0, Ll/wgx;->g:Ll/syl;

    .line 6
    .line 7
    if-eqz p0, :cond_1

    .line 8
    .line 9
    invoke-interface {p0}, Ll/syl;->a0()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0

    .line 18
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 19
    return p0
.end method

.method public x(Z)V
    .locals 4

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    iget-wide v2, p0, Ll/wgx;->j:J

    .line 8
    .line 9
    sub-long/2addr v0, v2

    .line 10
    const-wide/16 v2, 0xed8

    .line 11
    .line 12
    cmp-long p1, v0, v2

    .line 13
    .line 14
    if-gez p1, :cond_0

    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    iget-object p1, p0, Ll/wgx;->o:Ljava/lang/Runnable;

    .line 18
    .line 19
    invoke-static {p1}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Ll/wgx;->o:Ljava/lang/Runnable;

    .line 23
    .line 24
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final y(Lcom/p1/mobile/putong/data/User;)V
    .locals 4

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-wide v2, p0, Ll/wgx;->l:J

    .line 6
    .line 7
    sub-long/2addr v0, v2

    .line 8
    const-wide/16 v2, 0x1f4

    .line 9
    .line 10
    cmp-long v0, v0, v2

    .line 11
    .line 12
    if-ltz v0, :cond_1

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/wgx;->w()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 22
    .line 23
    .line 24
    move-result-wide v0

    .line 25
    iput-wide v0, p0, Ll/wgx;->l:J

    .line 26
    .line 27
    iget-object p0, p0, Ll/wgx;->g:Ll/syl;

    .line 28
    .line 29
    invoke-interface {p0, p1}, Ll/syl;->E(Lcom/p1/mobile/putong/data/User;)V

    .line 30
    .line 31
    .line 32
    :cond_1
    :goto_0
    return-void
.end method

.method public final z()Lcom/p1/mobile/android/app/Act;
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground_()Lcom/p1/mobile/android/app/Act$r;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 32
    .line 33
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    instance-of v0, v0, Lcom/p1/mobile/android/app/Act;

    .line 38
    .line 39
    if-eqz v0, :cond_0

    .line 40
    .line 41
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 42
    .line 43
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 48
    .line 49
    return-object p0

    .line 50
    :cond_0
    const/4 p0, 0x0

    .line 51
    return-object p0
.end method
