.class public abstract Ll/z0u;
.super Ll/d3q;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<V:",
        "Landroid/view/View;",
        ">",
        "Ll/d3q<",
        "TV;>;"
    }
.end annotation


# static fields
.field public static final i:I


# instance fields
.field public a:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field public b:Lcom/p1/mobile/putong/live/base/data/BLiveSettings;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public c:I
    .annotation build Landroidx/annotation/IntRange;
        from = 0x1L
        to = 0x7fffffffL
    .end annotation
.end field

.field public d:F

.field public e:I

.field public volatile f:Z

.field public g:I

.field public h:Landroid/view/View;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TV;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/high16 v0, 0x40800000    # 4.0f

    .line 2
    .line 3
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    sput v0, Ll/z0u;->i:I

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;Lcom/p1/mobile/putong/live/base/data/BLiveSettings;II)V
    .locals 1
    .param p1    # Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/p1/mobile/putong/live/base/data/BLiveSettings;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p4    # I
        .annotation build Landroidx/annotation/IntRange;
            from = 0x1L
            to = 0x7fffffffL
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ll/d3q;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/z0u;->d:F

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-boolean v0, p0, Ll/z0u;->f:Z

    .line 9
    .line 10
    iput v0, p0, Ll/z0u;->g:I

    .line 11
    .line 12
    iput-object p2, p0, Ll/z0u;->b:Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 13
    .line 14
    iput-object p1, p0, Ll/z0u;->a:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 15
    .line 16
    iput p3, p0, Ll/z0u;->e:I

    .line 17
    .line 18
    iput p4, p0, Ll/z0u;->c:I

    .line 19
    .line 20
    invoke-static {p3}, Ll/z0u;->J(I)I

    .line 21
    .line 22
    .line 23
    move-result p2

    .line 24
    iput p2, p0, Ll/z0u;->g:I

    .line 25
    .line 26
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->videoCaptureUrl:Ljava/lang/String;

    .line 27
    .line 28
    if-eqz p1, :cond_0

    .line 29
    .line 30
    const/high16 p1, 0x42c80000    # 100.0f

    .line 31
    .line 32
    iput p1, p0, Ll/z0u;->d:F

    .line 33
    .line 34
    :cond_0
    return-void
.end method

.method public static J(I)I
    .locals 3

    .line 1
    sget v0, Ll/z0u;->i:I

    .line 2
    .line 3
    mul-int/lit8 v0, v0, 0x2

    .line 4
    .line 5
    if-gtz p0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/bnl0;->y0()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    sub-int/2addr p0, v0

    .line 12
    return p0

    .line 13
    :cond_0
    invoke-static {}, Ll/bnl0;->y0()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    add-int/lit8 v2, p0, 0x1

    .line 18
    .line 19
    mul-int/2addr v2, v0

    .line 20
    sub-int/2addr v1, v2

    .line 21
    div-int/2addr v1, p0

    .line 22
    add-int/2addr v1, v0

    .line 23
    return v1
.end method


# virtual methods
.method public F(Ll/j80;)Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/z0u;->I()Ll/kfd0$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/kfd0$a;->a()Ll/kfd0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p1}, Ll/j80;->a()Ljava/util/Map;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p0}, Ll/z0u;->P()Ljava/util/HashMap;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    invoke-interface {p1, v1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    invoke-virtual {p0}, Ll/d3q;->p()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-static {v0, p0, p1}, Ll/bfu;->h(Ll/kfd0;Ljava/lang/String;Ljava/util/Map;)V

    .line 27
    .line 28
    .line 29
    const/4 p0, 0x1

    .line 30
    return p0
.end method

.method public H()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/z0u;->a:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->videoCaptureUrl:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    xor-int/lit8 p0, p0, 0x1

    .line 10
    .line 11
    return p0
.end method

.method public final I()Ll/kfd0$a;
    .locals 5

    .line 1
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/z0u;->K()Lcom/p1/mobile/putong/live/base/data/BLiveTrackShowLabel;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    const-string v2, "0"

    .line 11
    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    :try_start_0
    const-string v3, "distance"

    .line 15
    .line 16
    iget-object v4, v1, Lcom/p1/mobile/putong/live/base/data/BLiveTrackShowLabel;->distance:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {v0, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 19
    .line 20
    .line 21
    const-string v3, "room_name"

    .line 22
    .line 23
    iget-object v4, v1, Lcom/p1/mobile/putong/live/base/data/BLiveTrackShowLabel;->room_name:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {v0, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 26
    .line 27
    .line 28
    const-string v3, "label_name"

    .line 29
    .line 30
    iget-object v4, v1, Lcom/p1/mobile/putong/live/base/data/BLiveTrackShowLabel;->label_name:Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {v0, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 33
    .line 34
    .line 35
    const-string v3, "viewer"

    .line 36
    .line 37
    iget-object v4, v1, Lcom/p1/mobile/putong/live/base/data/BLiveTrackShowLabel;->viewer:Ljava/lang/String;

    .line 38
    .line 39
    invoke-virtual {v0, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 40
    .line 41
    .line 42
    const-string v3, "label_name_top"

    .line 43
    .line 44
    iget-object v4, v1, Lcom/p1/mobile/putong/live/base/data/BLiveTrackShowLabel;->label_name_top:Ljava/lang/String;

    .line 45
    .line 46
    invoke-virtual {v0, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 47
    .line 48
    .line 49
    const-string v3, "label_name_sp"

    .line 50
    .line 51
    iget-object v4, v1, Lcom/p1/mobile/putong/live/base/data/BLiveTrackShowLabel;->label_name_sp:Ljava/lang/String;

    .line 52
    .line 53
    invoke-virtual {v0, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 54
    .line 55
    .line 56
    const-string v3, "label_name_tool"

    .line 57
    .line 58
    iget-object v4, v1, Lcom/p1/mobile/putong/live/base/data/BLiveTrackShowLabel;->label_name_tool:Ljava/lang/String;

    .line 59
    .line 60
    invoke-virtual {v0, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 61
    .line 62
    .line 63
    const-string v3, "state_label"

    .line 64
    .line 65
    iget-object v4, v1, Lcom/p1/mobile/putong/live/base/data/BLiveTrackShowLabel;->state_label:Ljava/lang/String;

    .line 66
    .line 67
    invoke-virtual {v0, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 68
    .line 69
    .line 70
    const-string v3, "label_name_custom"

    .line 71
    .line 72
    iget-object v4, v1, Lcom/p1/mobile/putong/live/base/data/BLiveTrackShowLabel;->label_name_custom:Ljava/lang/String;

    .line 73
    .line 74
    invoke-virtual {v0, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 75
    .line 76
    .line 77
    const-string v3, "label_name_fixed"

    .line 78
    .line 79
    iget-object v4, v1, Lcom/p1/mobile/putong/live/base/data/BLiveTrackShowLabel;->label_name_fixed:Ljava/lang/String;

    .line 80
    .line 81
    invoke-virtual {v0, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 82
    .line 83
    .line 84
    iget-object v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveTrackShowLabel;->have_red_packet:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 85
    .line 86
    goto :goto_0

    .line 87
    :catch_0
    move-exception v1

    .line 88
    invoke-static {v1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 89
    .line 90
    .line 91
    invoke-static {v1}, Ll/wu80;->b(Ljava/lang/Exception;)V

    .line 92
    .line 93
    .line 94
    :cond_0
    :goto_0
    iget-object v1, p0, Ll/z0u;->a:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 95
    .line 96
    if-eqz v1, :cond_3

    .line 97
    .line 98
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->state:Ljava/lang/String;

    .line 99
    .line 100
    const-string v3, "stopped"

    .line 101
    .line 102
    invoke-static {v1, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 103
    .line 104
    .line 105
    move-result v1

    .line 106
    if-eqz v1, :cond_1

    .line 107
    .line 108
    const-string v1, "off"

    .line 109
    .line 110
    goto :goto_1

    .line 111
    :cond_1
    iget-object v1, p0, Ll/z0u;->a:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 112
    .line 113
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->multiCallInfo:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInfo;

    .line 114
    .line 115
    if-eqz v1, :cond_2

    .line 116
    .line 117
    iget-boolean v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInfo;->onGoing:Z

    .line 118
    .line 119
    if-eqz v1, :cond_2

    .line 120
    .line 121
    const-string v1, "video_live"

    .line 122
    .line 123
    goto :goto_1

    .line 124
    :cond_2
    const-string v1, "common_live"

    .line 125
    .line 126
    goto :goto_1

    .line 127
    :cond_3
    const-string v1, "NA"

    .line 128
    .line 129
    :goto_1
    invoke-static {}, Ll/kfd0;->x()Ll/kfd0$a;

    .line 130
    .line 131
    .line 132
    move-result-object v3

    .line 133
    iget-object v4, p0, Ll/z0u;->a:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 134
    .line 135
    invoke-virtual {v3, v4}, Ll/kfd0$a;->c(Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;)Ll/kfd0$a;

    .line 136
    .line 137
    .line 138
    move-result-object v3

    .line 139
    iget v4, p0, Ll/z0u;->c:I

    .line 140
    .line 141
    invoke-virtual {v3, v4}, Ll/kfd0$a;->l(I)Ll/kfd0$a;

    .line 142
    .line 143
    .line 144
    move-result-object v3

    .line 145
    invoke-virtual {v3, v1}, Ll/kfd0$a;->t(Ljava/lang/String;)Ll/kfd0$a;

    .line 146
    .line 147
    .line 148
    move-result-object v1

    .line 149
    const-string v3, "page"

    .line 150
    .line 151
    invoke-virtual {v1, v3}, Ll/kfd0$a;->w(Ljava/lang/String;)Ll/kfd0$a;

    .line 152
    .line 153
    .line 154
    move-result-object v1

    .line 155
    invoke-virtual {v1, v0}, Ll/kfd0$a;->A(Ljava/lang/Object;)Ll/kfd0$a;

    .line 156
    .line 157
    .line 158
    move-result-object v0

    .line 159
    invoke-virtual {v0, v2}, Ll/kfd0$a;->p(Ljava/lang/String;)Ll/kfd0$a;

    .line 160
    .line 161
    .line 162
    move-result-object v0

    .line 163
    iget-boolean v1, p0, Ll/z0u;->f:Z

    .line 164
    .line 165
    invoke-virtual {v0, v1}, Ll/kfd0$a;->o(Z)Ll/kfd0$a;

    .line 166
    .line 167
    .line 168
    move-result-object v0

    .line 169
    iget-object p0, p0, Ll/z0u;->a:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 170
    .line 171
    invoke-virtual {v0, p0}, Ll/kfd0$a;->y(Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;)Ll/kfd0$a;

    .line 172
    .line 173
    .line 174
    move-result-object p0

    .line 175
    return-object p0
.end method

.method public K()Lcom/p1/mobile/putong/live/base/data/BLiveTrackShowLabel;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public L(Landroid/view/View;Ljava/util/List;)V
    .locals 0
    .param p2    # Ljava/util/List;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TV;",
            "Ljava/util/List<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 1
    return-void
.end method

.method public abstract N(Landroid/view/View;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TV;)V"
        }
    .end annotation
.end method

.method public abstract O(Landroid/view/View;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TV;)V"
        }
    .end annotation
.end method

.method public P()Ljava/util/HashMap;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public Q()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/z0u;->I()Ll/kfd0$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/kfd0$a;->a()Ll/kfd0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0}, Ll/d3q;->p()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-static {v0, p0}, Ll/bfu;->c(Ll/kfd0;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public R()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/z0u;->h:Landroid/view/View;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v0, 0x0

    .line 7
    iput-boolean v0, p0, Ll/z0u;->f:Z

    .line 8
    .line 9
    iget-object v0, p0, Ll/z0u;->h:Landroid/view/View;

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ll/z0u;->O(Landroid/view/View;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public a()F
    .locals 0

    .line 1
    iget p0, p0, Ll/z0u;->d:F

    .line 2
    .line 3
    return p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p0, p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    const/4 v1, 0x0

    .line 6
    if-eqz p1, :cond_2

    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 13
    .line 14
    .line 15
    move-result-object v3

    .line 16
    if-eq v2, v3, :cond_1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_1
    check-cast p1, Ll/z0u;

    .line 20
    .line 21
    iget v2, p0, Ll/z0u;->d:F

    .line 22
    .line 23
    iget v3, p1, Ll/z0u;->d:F

    .line 24
    .line 25
    cmpl-float v2, v2, v3

    .line 26
    .line 27
    if-nez v2, :cond_2

    .line 28
    .line 29
    iget v2, p0, Ll/z0u;->e:I

    .line 30
    .line 31
    iget v3, p1, Ll/z0u;->e:I

    .line 32
    .line 33
    if-ne v2, v3, :cond_2

    .line 34
    .line 35
    iget-boolean v2, p0, Ll/z0u;->f:Z

    .line 36
    .line 37
    iget-boolean v3, p1, Ll/z0u;->f:Z

    .line 38
    .line 39
    if-ne v2, v3, :cond_2

    .line 40
    .line 41
    iget v2, p0, Ll/z0u;->c:I

    .line 42
    .line 43
    iget v3, p1, Ll/z0u;->c:I

    .line 44
    .line 45
    if-ne v2, v3, :cond_2

    .line 46
    .line 47
    iget-object p0, p0, Ll/z0u;->a:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 48
    .line 49
    iget-object p1, p1, Ll/z0u;->a:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 50
    .line 51
    invoke-static {p0, p1}, Ll/k950;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    if-eqz p0, :cond_2

    .line 56
    .line 57
    return v0

    .line 58
    :cond_2
    :goto_0
    return v1
.end method

.method public hashCode()I
    .locals 4

    .line 1
    iget-object v0, p0, Ll/z0u;->a:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 2
    .line 3
    iget v1, p0, Ll/z0u;->d:F

    .line 4
    .line 5
    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iget v2, p0, Ll/z0u;->c:I

    .line 10
    .line 11
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    iget v3, p0, Ll/z0u;->e:I

    .line 16
    .line 17
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    iget-boolean p0, p0, Ll/z0u;->f:Z

    .line 22
    .line 23
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    filled-new-array {v0, v1, v2, v3, p0}, [Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-static {p0}, Ll/k950;->b([Ljava/lang/Object;)I

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    const-string v2, "class = "

    .line 12
    .line 13
    invoke-virtual {v2, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    const-string v1, ": uniqueId = "

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    iget-object v1, p0, Ll/d3q;->uniqueId:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    const-string v1, ", liveId = "

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    iget-object p0, p0, Ll/z0u;->a:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 36
    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->id:Ljava/lang/String;

    .line 38
    .line 39
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    return-object p0
.end method

.method public v(Landroid/view/View;Ljava/util/List;)V
    .locals 2
    .param p2    # Ljava/util/List;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/CallSuper;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TV;",
            "Ljava/util/List<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-super {p0, p1, p2}, Ll/d3q;->v(Landroid/view/View;Ljava/util/List;)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/z0u;->h:Landroid/view/View;

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    instance-of v1, v0, Ll/gj1;

    .line 12
    .line 13
    if-eqz v1, :cond_2

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/d3q;->C()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    check-cast v0, Ll/gj1;

    .line 19
    .line 20
    iget-boolean p2, p0, Ll/z0u;->f:Z

    .line 21
    .line 22
    iget-boolean v0, v0, Ll/gj1;->a:Z

    .line 23
    .line 24
    if-ne p2, v0, :cond_0

    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    iput-boolean v0, p0, Ll/z0u;->f:Z

    .line 28
    .line 29
    iget-boolean p2, p0, Ll/z0u;->f:Z

    .line 30
    .line 31
    if-eqz p2, :cond_1

    .line 32
    .line 33
    iget-object p2, p0, Ll/z0u;->a:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 34
    .line 35
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->videoCaptureUrl:Ljava/lang/String;

    .line 36
    .line 37
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 38
    .line 39
    .line 40
    move-result p2

    .line 41
    if-nez p2, :cond_1

    .line 42
    .line 43
    invoke-virtual {p0, p1}, Ll/z0u;->N(Landroid/view/View;)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_1
    invoke-virtual {p0, p1}, Ll/z0u;->O(Landroid/view/View;)V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_2
    invoke-virtual {p0, p1, p2}, Ll/z0u;->L(Landroid/view/View;Ljava/util/List;)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public w(Landroid/view/View;)V
    .locals 1
    .annotation build Landroidx/annotation/CallSuper;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TV;)V"
        }
    .end annotation

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->w(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Ll/z0u;->f:Z

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-boolean v0, p0, Ll/z0u;->f:Z

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/d3q;->C()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Ll/z0u;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, p1}, Ll/z0u;->O(Landroid/view/View;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    const/4 p1, 0x0

    .line 21
    iput-object p1, p0, Ll/z0u;->h:Landroid/view/View;

    .line 22
    .line 23
    return-void
.end method

.method public y(Landroid/view/View;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TV;)V"
        }
    .end annotation

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->y(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Ll/z0u;->f:Z

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-boolean v0, p0, Ll/z0u;->f:Z

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ll/z0u;->O(Landroid/view/View;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method
