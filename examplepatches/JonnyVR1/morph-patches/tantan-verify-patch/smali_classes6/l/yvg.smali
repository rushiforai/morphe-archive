.class public Ll/yvg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/q1i;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/q1i<",
        "Lcom/p1/mobile/putong/feed/data/Frame;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/android/app/Act;

.field public b:J

.field public c:Z

.field public d:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/yvg;->a:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    iput-object p2, p0, Ll/yvg;->d:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic a(Ll/yvg;Lcom/p1/mobile/putong/feed/data/Frame;Landroid/view/View;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/yvg;->l(Lcom/p1/mobile/putong/feed/data/Frame;Landroid/view/View;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/yvg;Lcom/p1/mobile/putong/feed/data/Frame;Landroid/view/View;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/yvg;->m(Lcom/p1/mobile/putong/feed/data/Frame;Landroid/view/View;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic d(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic e(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic f(Ll/yvg;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yvg;->n(Lcom/p1/mobile/putong/data/Envelope;)V

    return-void
.end method

.method public static synthetic g(Lcom/p1/mobile/putong/data/OMSConfigEnvelope;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic h(Ll/yvg;Landroid/view/View;Lcom/p1/mobile/putong/feed/data/Frame;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/yvg;->k(Landroid/view/View;Lcom/p1/mobile/putong/feed/data/Frame;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final i(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/bnl0;->y0()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/high16 v0, 0x42a00000    # 80.0f

    .line 6
    .line 7
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    sub-int/2addr p0, v0

    .line 12
    int-to-float v0, p0

    .line 13
    const/high16 v1, 0x43e20000    # 452.0f

    .line 14
    .line 15
    mul-float/2addr v0, v1

    .line 16
    const v1, 0x43938000    # 295.0f

    .line 17
    .line 18
    .line 19
    div-float/2addr v0, v1

    .line 20
    float-to-int v0, v0

    .line 21
    invoke-static {p1, v0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 22
    .line 23
    .line 24
    filled-new-array {p1}, [Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-static {p0, p1}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public j(Lcom/p1/mobile/putong/feed/data/Frame;)Landroid/view/View;
    .locals 7

    .line 1
    iget-object v0, p0, Ll/yvg;->a:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget v1, Ll/tec0;->e0:I

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    sget v1, Ll/hdc0;->O1:I

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    check-cast v1, Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectPlayer;

    .line 21
    .line 22
    sget v2, Ll/hdc0;->w:I

    .line 23
    .line 24
    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    sget v3, Ll/hdc0;->m0:I

    .line 29
    .line 30
    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    check-cast v3, Lv/VDraweeView;

    .line 35
    .line 36
    new-instance v4, Ll/uvg;

    .line 37
    .line 38
    invoke-direct {v4}, Ll/uvg;-><init>()V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 42
    .line 43
    .line 44
    const/4 v4, 0x4

    .line 45
    invoke-virtual {v2, v4}, Landroid/view/View;->setVisibility(I)V

    .line 46
    .line 47
    .line 48
    new-instance v4, Ll/vvg;

    .line 49
    .line 50
    invoke-direct {v4, p0, v0, p1}, Ll/vvg;-><init>(Ll/yvg;Landroid/view/View;Lcom/p1/mobile/putong/feed/data/Frame;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v2, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 54
    .line 55
    .line 56
    iget-object v4, p0, Ll/yvg;->d:Ljava/lang/String;

    .line 57
    .line 58
    const-string v5, "activity_id"

    .line 59
    .line 60
    iget-object v6, p1, Lcom/p1/mobile/putong/feed/data/Frame;->id:Ljava/lang/String;

    .line 61
    .line 62
    invoke-static {v5, v6}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 63
    .line 64
    .line 65
    move-result-object v5

    .line 66
    filled-new-array {v5}, [Ll/pf60;

    .line 67
    .line 68
    .line 69
    move-result-object v5

    .line 70
    const-string v6, "e_moment_activity_popup"

    .line 71
    .line 72
    invoke-static {v6, v4, v5}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 73
    .line 74
    .line 75
    iget-object v4, p1, Lcom/p1/mobile/putong/feed/data/Frame;->content:Lcom/p1/mobile/putong/feed/data/FrameContent;

    .line 76
    .line 77
    iget-object v4, v4, Lcom/p1/mobile/putong/feed/data/FrameContent;->resource:Lcom/p1/mobile/putong/feed/data/FrameResource;

    .line 78
    .line 79
    iget-object v4, v4, Lcom/p1/mobile/putong/feed/data/FrameResource;->type:Ljava/lang/String;

    .line 80
    .line 81
    const-string v5, "svg"

    .line 82
    .line 83
    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 84
    .line 85
    .line 86
    move-result v4

    .line 87
    const/16 v5, 0x8

    .line 88
    .line 89
    const/4 v6, 0x0

    .line 90
    if-eqz v4, :cond_0

    .line 91
    .line 92
    invoke-virtual {v2, v6}, Landroid/view/View;->setVisibility(I)V

    .line 93
    .line 94
    .line 95
    invoke-virtual {v1, v6}, Landroid/view/View;->setVisibility(I)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {v3, v5}, Landroid/view/View;->setVisibility(I)V

    .line 99
    .line 100
    .line 101
    invoke-virtual {p0, v1}, Ll/yvg;->i(Landroid/view/View;)V

    .line 102
    .line 103
    .line 104
    iget-object v2, p1, Lcom/p1/mobile/putong/feed/data/Frame;->content:Lcom/p1/mobile/putong/feed/data/FrameContent;

    .line 105
    .line 106
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/data/FrameContent;->resource:Lcom/p1/mobile/putong/feed/data/FrameResource;

    .line 107
    .line 108
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/data/FrameResource;->url:Ljava/lang/String;

    .line 109
    .line 110
    new-instance v4, Ll/yvg$a;

    .line 111
    .line 112
    invoke-direct {v4, p0, v1}, Ll/yvg$a;-><init>(Ll/yvg;Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectPlayer;)V

    .line 113
    .line 114
    .line 115
    const/4 v5, 0x1

    .line 116
    const/4 v6, -0x1

    .line 117
    invoke-virtual {v1, v2, v6, v4, v5}, Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectPlayer;->loadAnimWithListener(Ljava/lang/String;ILcom/tantanapp/media/ttmediaeffect/anim/AnimListener;Z)V

    .line 118
    .line 119
    .line 120
    goto :goto_0

    .line 121
    :cond_0
    invoke-virtual {v3, v6}, Landroid/view/View;->setVisibility(I)V

    .line 122
    .line 123
    .line 124
    invoke-virtual {v1, v5}, Landroid/view/View;->setVisibility(I)V

    .line 125
    .line 126
    .line 127
    sget-object v4, Ll/uqb0;->G:Ll/fsb0;

    .line 128
    .line 129
    iget-object v5, p1, Lcom/p1/mobile/putong/feed/data/Frame;->content:Lcom/p1/mobile/putong/feed/data/FrameContent;

    .line 130
    .line 131
    iget-object v5, v5, Lcom/p1/mobile/putong/feed/data/FrameContent;->resource:Lcom/p1/mobile/putong/feed/data/FrameResource;

    .line 132
    .line 133
    iget-object v5, v5, Lcom/p1/mobile/putong/feed/data/FrameResource;->url:Ljava/lang/String;

    .line 134
    .line 135
    new-instance v6, Ll/yvg$b;

    .line 136
    .line 137
    invoke-direct {v6, p0, v3, v2}, Ll/yvg$b;-><init>(Ll/yvg;Lv/VDraweeView;Landroid/view/View;)V

    .line 138
    .line 139
    .line 140
    invoke-virtual {v4, v3, v5, v6}, Ll/fsb0;->M0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;Ll/fn2;)V

    .line 141
    .line 142
    .line 143
    :goto_0
    new-instance v2, Ll/wvg;

    .line 144
    .line 145
    invoke-direct {v2, p0, p1, v0}, Ll/wvg;-><init>(Ll/yvg;Lcom/p1/mobile/putong/feed/data/Frame;Landroid/view/View;)V

    .line 146
    .line 147
    .line 148
    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 149
    .line 150
    .line 151
    new-instance v1, Ll/xvg;

    .line 152
    .line 153
    invoke-direct {v1, p0, p1, v0}, Ll/xvg;-><init>(Ll/yvg;Lcom/p1/mobile/putong/feed/data/Frame;Landroid/view/View;)V

    .line 154
    .line 155
    .line 156
    invoke-virtual {v3, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 157
    .line 158
    .line 159
    return-object v0
.end method

.method public final synthetic k(Landroid/view/View;Lcom/p1/mobile/putong/feed/data/Frame;Landroid/view/View;)V
    .locals 0

    .line 1
    const/16 p3, 0x8

    .line 2
    .line 3
    invoke-virtual {p1, p3}, Landroid/view/View;->setVisibility(I)V

    .line 4
    .line 5
    .line 6
    iget-object p3, p0, Ll/yvg;->a:Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    invoke-virtual {p3}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 9
    .line 10
    .line 11
    move-result-object p3

    .line 12
    invoke-virtual {p3}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object p3

    .line 16
    check-cast p3, Landroid/widget/FrameLayout;

    .line 17
    .line 18
    invoke-virtual {p3, p1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Ll/yvg;->d:Ljava/lang/String;

    .line 22
    .line 23
    const-string p1, "activity_id"

    .line 24
    .line 25
    iget-object p2, p2, Lcom/p1/mobile/putong/feed/data/Frame;->id:Ljava/lang/String;

    .line 26
    .line 27
    invoke-static {p1, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    filled-new-array {p1}, [Ll/pf60;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    const-string p2, "e_moment_activity_popup_cancel"

    .line 36
    .line 37
    invoke-static {p2, p0, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public final synthetic l(Lcom/p1/mobile/putong/feed/data/Frame;Landroid/view/View;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/yvg;->o(Lcom/p1/mobile/putong/feed/data/Frame;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic m(Lcom/p1/mobile/putong/feed/data/Frame;Landroid/view/View;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/yvg;->o(Lcom/p1/mobile/putong/feed/data/Frame;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic n(Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 5

    .line 1
    const-class v0, Lcom/p1/mobile/putong/feed/data/FeedData;

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Lcom/p1/mobile/putong/feed/data/FeedData;

    .line 8
    .line 9
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->frames:Ljava/util/List;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    check-cast v1, Lcom/p1/mobile/putong/feed/data/Frame;

    .line 17
    .line 18
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/Frame;->id:Ljava/lang/String;

    .line 19
    .line 20
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    if-lez v2, :cond_0

    .line 25
    .line 26
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    if-nez v2, :cond_0

    .line 31
    .line 32
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    check-cast v2, Lcom/p1/mobile/putong/feed/data/Frame;

    .line 37
    .line 38
    invoke-virtual {p0, v2}, Ll/yvg;->q(Lcom/p1/mobile/putong/feed/data/Frame;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0, v1}, Ll/yvg;->r(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 45
    .line 46
    .line 47
    move-result-wide v1

    .line 48
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    check-cast p1, Lcom/p1/mobile/putong/feed/data/Frame;

    .line 53
    .line 54
    iget p1, p1, Lcom/p1/mobile/putong/feed/data/Frame;->intervalSec:I

    .line 55
    .line 56
    mul-int/lit16 p1, p1, 0x3e8

    .line 57
    .line 58
    int-to-long v3, p1

    .line 59
    add-long/2addr v1, v3

    .line 60
    iput-wide v1, p0, Ll/yvg;->b:J

    .line 61
    .line 62
    return-void
.end method

.method public o(Lcom/p1/mobile/putong/feed/data/Frame;Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/yvg;->d:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "activity_id"

    .line 4
    .line 5
    iget-object v2, p1, Lcom/p1/mobile/putong/feed/data/Frame;->id:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    filled-new-array {v1}, [Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    const-string v2, "e_moment_activity_popup"

    .line 16
    .line 17
    invoke-static {v2, v0, v1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 18
    .line 19
    .line 20
    const/16 v0, 0x8

    .line 21
    .line 22
    invoke-virtual {p2, v0}, Landroid/view/View;->setVisibility(I)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Ll/yvg;->a:Lcom/p1/mobile/android/app/Act;

    .line 26
    .line 27
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    check-cast v0, Landroid/widget/FrameLayout;

    .line 36
    .line 37
    invoke-virtual {v0, p2}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 38
    .line 39
    .line 40
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Frame;->content:Lcom/p1/mobile/putong/feed/data/FrameContent;

    .line 41
    .line 42
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/FrameContent;->deeplink:Ljava/lang/String;

    .line 43
    .line 44
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 45
    .line 46
    .line 47
    move-result p2

    .line 48
    if-nez p2, :cond_0

    .line 49
    .line 50
    iget-object p0, p0, Ll/yvg;->a:Lcom/p1/mobile/android/app/Act;

    .line 51
    .line 52
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-static {p0, p1}, Ll/ryh;->b(Landroid/app/Activity;Landroid/net/Uri;)V

    .line 57
    .line 58
    .line 59
    :cond_0
    return-void
.end method

.method public p()V
    .locals 4

    .line 1
    iget-wide v0, p0, Ll/yvg;->b:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v2, v0, v2

    .line 6
    .line 7
    if-eqz v2, :cond_0

    .line 8
    .line 9
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 10
    .line 11
    .line 12
    move-result-wide v2

    .line 13
    cmp-long v0, v0, v2

    .line 14
    .line 15
    if-lez v0, :cond_0

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 19
    .line 20
    invoke-virtual {v0}, Ll/jka;->ed()Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    new-instance v1, Ll/qvg;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/qvg;-><init>(Ll/yvg;)V

    .line 27
    .line 28
    .line 29
    new-instance p0, Ll/rvg;

    .line 30
    .line 31
    invoke-direct {p0}, Ll/rvg;-><init>()V

    .line 32
    .line 33
    .line 34
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public final q(Lcom/p1/mobile/putong/feed/data/Frame;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/yvg;->c:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Ll/yvg;->c:Z

    .line 8
    .line 9
    iget-object v0, p0, Ll/yvg;->a:Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Landroid/widget/FrameLayout;

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Ll/yvg;->j(Lcom/p1/mobile/putong/feed/data/Frame;)Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {v0, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public final r(Ljava/lang/String;)V
    .locals 2

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/OMSCounterInfo;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/OMSCounterInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSCounterInfo;->id:Ljava/lang/String;

    .line 7
    .line 8
    new-instance p1, Lcom/p1/mobile/putong/data/OMSConstraint;

    .line 9
    .line 10
    invoke-direct {p1}, Lcom/p1/mobile/putong/data/OMSConstraint;-><init>()V

    .line 11
    .line 12
    .line 13
    const-wide/16 v0, 0x1

    .line 14
    .line 15
    iput-wide v0, p1, Lcom/p1/mobile/putong/data/OMSConstraint;->count:J

    .line 16
    .line 17
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 18
    .line 19
    .line 20
    move-result-wide v0

    .line 21
    iput-wide v0, p1, Lcom/p1/mobile/putong/data/OMSConstraint;->latestMs:J

    .line 22
    .line 23
    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSCounterInfo;->constraint:Lcom/p1/mobile/putong/data/OMSConstraint;

    .line 24
    .line 25
    new-instance p1, Lcom/p1/mobile/putong/data/OMSData;

    .line 26
    .line 27
    invoke-direct {p1}, Lcom/p1/mobile/putong/data/OMSData;-><init>()V

    .line 28
    .line 29
    .line 30
    new-instance v0, Ljava/util/ArrayList;

    .line 31
    .line 32
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 33
    .line 34
    .line 35
    iput-object v0, p1, Lcom/p1/mobile/putong/data/OMSData;->counters:Ljava/util/List;

    .line 36
    .line 37
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-virtual {p0}, Ll/pk50;->c()Ll/dj50;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {p0, p1}, Ll/dj50;->P(Lcom/p1/mobile/putong/data/OMSData;)Lrx/c;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    new-instance p1, Ll/svg;

    .line 53
    .line 54
    invoke-direct {p1}, Ll/svg;-><init>()V

    .line 55
    .line 56
    .line 57
    new-instance v0, Ll/tvg;

    .line 58
    .line 59
    invoke-direct {v0}, Ll/tvg;-><init>()V

    .line 60
    .line 61
    .line 62
    invoke-static {p1, v0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 67
    .line 68
    .line 69
    return-void
.end method
