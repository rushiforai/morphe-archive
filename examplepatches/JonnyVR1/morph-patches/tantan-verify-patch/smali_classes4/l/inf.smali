.class public Ll/inf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/Choreographer$FrameCallback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/inf$a;,
        Ll/inf$b;
    }
.end annotation


# static fields
.field public static s:Landroid/view/animation/PathInterpolator;


# instance fields
.field public a:Ll/jnf;

.field public b:Ll/inf$a;

.field public c:Ll/inf$a;

.field public d:Ll/inf$b;

.field public e:Ll/inf$a;

.field public f:Ll/inf$a;

.field public g:Ll/inf$a;

.field public h:Ll/inf$a;

.field public i:Ll/inf$a;

.field public j:Ll/inf$a;

.field public k:Ll/inf$a;

.field public l:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;",
            "Ll/inf$a;",
            ">;"
        }
    .end annotation
.end field

.field public m:Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;

.field public n:Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;

.field public o:Z

.field public p:F

.field public q:F

.field public r:Ll/la5;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Landroid/view/animation/PathInterpolator;

    .line 2
    .line 3
    const v1, 0x3e8f5c29    # 0.28f

    .line 4
    .line 5
    .line 6
    const/high16 v2, 0x3f800000    # 1.0f

    .line 7
    .line 8
    const/4 v3, 0x0

    .line 9
    invoke-direct {v0, v3, v3, v1, v2}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 10
    .line 11
    .line 12
    sput-object v0, Ll/inf;->s:Landroid/view/animation/PathInterpolator;

    .line 13
    .line 14
    return-void
.end method

.method public constructor <init>(Ll/jnf;Ll/inf$b;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;->UNKNOWN:Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;

    .line 5
    .line 6
    iput-object v0, p0, Ll/inf;->m:Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Ll/inf;->n:Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-boolean v0, p0, Ll/inf;->o:Z

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    iput v0, p0, Ll/inf;->p:F

    .line 16
    .line 17
    const/high16 v0, 0x3fc00000    # 1.5f

    .line 18
    .line 19
    iput v0, p0, Ll/inf;->q:F

    .line 20
    .line 21
    iput-object p1, p0, Ll/inf;->a:Ll/jnf;

    .line 22
    .line 23
    new-instance p1, Ll/inf$a;

    .line 24
    .line 25
    invoke-direct {p1}, Ll/inf$a;-><init>()V

    .line 26
    .line 27
    .line 28
    iput-object p1, p0, Ll/inf;->b:Ll/inf$a;

    .line 29
    .line 30
    new-instance p1, Ll/inf$a;

    .line 31
    .line 32
    invoke-direct {p1}, Ll/inf$a;-><init>()V

    .line 33
    .line 34
    .line 35
    iput-object p1, p0, Ll/inf;->c:Ll/inf$a;

    .line 36
    .line 37
    new-instance p1, Ll/inf$a;

    .line 38
    .line 39
    invoke-direct {p1}, Ll/inf$a;-><init>()V

    .line 40
    .line 41
    .line 42
    iput-object p1, p0, Ll/inf;->e:Ll/inf$a;

    .line 43
    .line 44
    new-instance p1, Ll/inf$a;

    .line 45
    .line 46
    invoke-direct {p1}, Ll/inf$a;-><init>()V

    .line 47
    .line 48
    .line 49
    iput-object p1, p0, Ll/inf;->f:Ll/inf$a;

    .line 50
    .line 51
    new-instance p1, Ll/inf$a;

    .line 52
    .line 53
    invoke-direct {p1}, Ll/inf$a;-><init>()V

    .line 54
    .line 55
    .line 56
    iput-object p1, p0, Ll/inf;->g:Ll/inf$a;

    .line 57
    .line 58
    new-instance p1, Ll/inf$a;

    .line 59
    .line 60
    invoke-direct {p1}, Ll/inf$a;-><init>()V

    .line 61
    .line 62
    .line 63
    iput-object p1, p0, Ll/inf;->h:Ll/inf$a;

    .line 64
    .line 65
    new-instance p1, Ll/inf$a;

    .line 66
    .line 67
    invoke-direct {p1}, Ll/inf$a;-><init>()V

    .line 68
    .line 69
    .line 70
    iput-object p1, p0, Ll/inf;->i:Ll/inf$a;

    .line 71
    .line 72
    new-instance p1, Ll/inf$a;

    .line 73
    .line 74
    invoke-direct {p1}, Ll/inf$a;-><init>()V

    .line 75
    .line 76
    .line 77
    iput-object p1, p0, Ll/inf;->j:Ll/inf$a;

    .line 78
    .line 79
    new-instance p1, Ll/inf$a;

    .line 80
    .line 81
    invoke-direct {p1}, Ll/inf$a;-><init>()V

    .line 82
    .line 83
    .line 84
    iput-object p1, p0, Ll/inf;->k:Ll/inf$a;

    .line 85
    .line 86
    new-instance p1, Ljava/util/HashMap;

    .line 87
    .line 88
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 89
    .line 90
    .line 91
    iput-object p1, p0, Ll/inf;->l:Ljava/util/HashMap;

    .line 92
    .line 93
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;->EXPANDED_CARD:Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;

    .line 94
    .line 95
    iget-object v1, p0, Ll/inf;->e:Ll/inf$a;

    .line 96
    .line 97
    invoke-virtual {p1, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 98
    .line 99
    .line 100
    iget-object p1, p0, Ll/inf;->l:Ljava/util/HashMap;

    .line 101
    .line 102
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;->EXPANDED_PROFILE:Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;

    .line 103
    .line 104
    iget-object v1, p0, Ll/inf;->f:Ll/inf$a;

    .line 105
    .line 106
    invoke-virtual {p1, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 107
    .line 108
    .line 109
    iget-object p1, p0, Ll/inf;->l:Ljava/util/HashMap;

    .line 110
    .line 111
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;->SWIPE_CLIP:Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;

    .line 112
    .line 113
    iget-object v1, p0, Ll/inf;->g:Ll/inf$a;

    .line 114
    .line 115
    invoke-virtual {p1, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 116
    .line 117
    .line 118
    iget-object p1, p0, Ll/inf;->l:Ljava/util/HashMap;

    .line 119
    .line 120
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;->SWIPE_CLIP_PROFILE:Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;

    .line 121
    .line 122
    iget-object v1, p0, Ll/inf;->h:Ll/inf$a;

    .line 123
    .line 124
    invoke-virtual {p1, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 125
    .line 126
    .line 127
    iget-object p1, p0, Ll/inf;->l:Ljava/util/HashMap;

    .line 128
    .line 129
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;->SCROLL_CLIP:Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;

    .line 130
    .line 131
    iget-object v1, p0, Ll/inf;->i:Ll/inf$a;

    .line 132
    .line 133
    invoke-virtual {p1, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 134
    .line 135
    .line 136
    iget-object p1, p0, Ll/inf;->l:Ljava/util/HashMap;

    .line 137
    .line 138
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;->SWIPE_CLIP_ANCHOR:Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;

    .line 139
    .line 140
    iget-object v1, p0, Ll/inf;->j:Ll/inf$a;

    .line 141
    .line 142
    invoke-virtual {p1, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 143
    .line 144
    .line 145
    iget-object p1, p0, Ll/inf;->l:Ljava/util/HashMap;

    .line 146
    .line 147
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;->FLING_CLIP:Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;

    .line 148
    .line 149
    iget-object v1, p0, Ll/inf;->k:Ll/inf$a;

    .line 150
    .line 151
    invoke-virtual {p1, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 152
    .line 153
    .line 154
    new-instance p1, Ll/la5;

    .line 155
    .line 156
    invoke-direct {p1}, Ll/la5;-><init>()V

    .line 157
    .line 158
    .line 159
    iput-object p1, p0, Ll/inf;->r:Ll/la5;

    .line 160
    .line 161
    iput-object p2, p0, Ll/inf;->d:Ll/inf$b;

    .line 162
    .line 163
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    const/16 v1, 0x8

    .line 3
    .line 4
    if-ge v0, v1, :cond_1

    .line 5
    .line 6
    iget-object v1, p0, Ll/inf;->b:Ll/inf$a;

    .line 7
    .line 8
    iget-object v2, v1, Ll/inf$a;->g:[F

    .line 9
    .line 10
    const/4 v3, 0x4

    .line 11
    if-ge v0, v3, :cond_0

    .line 12
    .line 13
    iget v1, v1, Ll/inf$a;->e:F

    .line 14
    .line 15
    goto :goto_1

    .line 16
    :cond_0
    iget v1, v1, Ll/inf$a;->f:F

    .line 17
    .line 18
    :goto_1
    aput v1, v2, v0

    .line 19
    .line 20
    add-int/lit8 v0, v0, 0x1

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    return-void
.end method

.method public b(FLcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;Ll/inf$a;FLjava/lang/String;)V
    .locals 8

    .line 1
    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    .line 2
    .line 3
    .line 4
    move-result-object p5

    .line 5
    invoke-virtual {p5, p0}, Landroid/view/Choreographer;->removeFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 6
    .line 7
    .line 8
    const/high16 p5, 0x3f800000    # 1.0f

    .line 9
    .line 10
    invoke-static {p5, p1}, Ljava/lang/Math;->min(FF)F

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;->EXPANDED_CARD:Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;

    .line 15
    .line 16
    if-ne p2, v0, :cond_0

    .line 17
    .line 18
    iget-object v0, p0, Ll/inf;->e:Ll/inf$a;

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;->SWIPE_CLIP:Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;

    .line 22
    .line 23
    if-ne p2, v0, :cond_1

    .line 24
    .line 25
    iget-object v0, p0, Ll/inf;->g:Ll/inf$a;

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;->SCROLL_CLIP:Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;

    .line 29
    .line 30
    if-ne p2, v0, :cond_2

    .line 31
    .line 32
    iget-object v0, p0, Ll/inf;->i:Ll/inf$a;

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_2
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;->FLING_CLIP:Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;

    .line 36
    .line 37
    if-ne p2, v0, :cond_3

    .line 38
    .line 39
    iget-object v0, p0, Ll/inf;->k:Ll/inf$a;

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_3
    iget-object v0, p0, Ll/inf;->m:Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;

    .line 43
    .line 44
    sget-object v1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;->SWIPE_CLIP_PROFILE:Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;

    .line 45
    .line 46
    if-ne v0, v1, :cond_4

    .line 47
    .line 48
    iget-object v0, p0, Ll/inf;->h:Ll/inf$a;

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_4
    sget-object v1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;->EXPANDED_PROFILE:Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;

    .line 52
    .line 53
    if-ne v0, v1, :cond_5

    .line 54
    .line 55
    iget-object v0, p0, Ll/inf;->f:Ll/inf$a;

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_5
    const/4 v0, 0x0

    .line 59
    :goto_0
    if-nez v0, :cond_6

    .line 60
    .line 61
    goto :goto_1

    .line 62
    :cond_6
    iput-object p2, p0, Ll/inf;->m:Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;

    .line 63
    .line 64
    iget-object v1, p0, Ll/inf;->b:Ll/inf$a;

    .line 65
    .line 66
    iget p2, p3, Ll/inf$a;->a:F

    .line 67
    .line 68
    iget v2, v0, Ll/inf$a;->a:F

    .line 69
    .line 70
    sub-float/2addr v2, p2

    .line 71
    mul-float/2addr v2, p1

    .line 72
    add-float/2addr v2, p2

    .line 73
    iget p2, p3, Ll/inf$a;->b:F

    .line 74
    .line 75
    iget v3, v0, Ll/inf$a;->b:F

    .line 76
    .line 77
    sub-float/2addr v3, p2

    .line 78
    mul-float v4, p1, p5

    .line 79
    .line 80
    invoke-static {p5, v4}, Ljava/lang/Math;->min(FF)F

    .line 81
    .line 82
    .line 83
    move-result v5

    .line 84
    mul-float/2addr v3, v5

    .line 85
    add-float/2addr v3, p2

    .line 86
    iget p2, p3, Ll/inf$a;->c:F

    .line 87
    .line 88
    iget v5, v0, Ll/inf$a;->c:F

    .line 89
    .line 90
    sub-float/2addr v5, p2

    .line 91
    mul-float/2addr v5, p1

    .line 92
    add-float/2addr p2, v5

    .line 93
    iget v5, p3, Ll/inf$a;->d:F

    .line 94
    .line 95
    iget v6, v0, Ll/inf$a;->d:F

    .line 96
    .line 97
    sub-float/2addr v6, v5

    .line 98
    invoke-static {p5, v4}, Ljava/lang/Math;->min(FF)F

    .line 99
    .line 100
    .line 101
    move-result v4

    .line 102
    mul-float/2addr v6, v4

    .line 103
    add-float/2addr v5, v6

    .line 104
    iget v4, p3, Ll/inf$a;->e:F

    .line 105
    .line 106
    iget v6, v0, Ll/inf$a;->e:F

    .line 107
    .line 108
    sub-float/2addr v6, v4

    .line 109
    mul-float/2addr p4, p1

    .line 110
    invoke-static {p5, p4}, Ljava/lang/Math;->min(FF)F

    .line 111
    .line 112
    .line 113
    move-result v7

    .line 114
    mul-float/2addr v6, v7

    .line 115
    add-float/2addr v6, v4

    .line 116
    iget p3, p3, Ll/inf$a;->f:F

    .line 117
    .line 118
    iget v0, v0, Ll/inf$a;->f:F

    .line 119
    .line 120
    sub-float/2addr v0, p3

    .line 121
    invoke-static {p5, p4}, Ljava/lang/Math;->min(FF)F

    .line 122
    .line 123
    .line 124
    move-result p4

    .line 125
    mul-float/2addr v0, p4

    .line 126
    add-float v7, p3, v0

    .line 127
    .line 128
    move v4, p2

    .line 129
    invoke-virtual/range {v1 .. v7}, Ll/inf$a;->c(FFFFFF)V

    .line 130
    .line 131
    .line 132
    iget-object p2, p0, Ll/inf;->d:Ll/inf$b;

    .line 133
    .line 134
    if-eqz p2, :cond_7

    .line 135
    .line 136
    iget-object p0, p0, Ll/inf;->m:Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;

    .line 137
    .line 138
    invoke-interface {p2, p0, p1}, Ll/inf$b;->u(Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;F)V

    .line 139
    .line 140
    .line 141
    :cond_7
    :goto_1
    return-void
.end method

.method public c(Ll/inf$a;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/inf;->b:Ll/inf$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/inf$a;->b(Ll/inf$a;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public d()Z
    .locals 2

    .line 1
    iget-object p0, p0, Ll/inf;->b:Ll/inf$a;

    .line 2
    .line 3
    iget v0, p0, Ll/inf$a;->e:F

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    cmpl-float v0, v0, v1

    .line 7
    .line 8
    if-gtz v0, :cond_1

    .line 9
    .line 10
    iget v0, p0, Ll/inf$a;->f:F

    .line 11
    .line 12
    cmpl-float v0, v0, v1

    .line 13
    .line 14
    if-gtz v0, :cond_1

    .line 15
    .line 16
    iget p0, p0, Ll/inf$a;->b:F

    .line 17
    .line 18
    cmpl-float p0, p0, v1

    .line 19
    .line 20
    if-lez p0, :cond_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    return p0

    .line 25
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 26
    return p0
.end method

.method public doFrame(J)V
    .locals 3

    .line 1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 2
    .line 3
    .line 4
    move-result-wide p1

    .line 5
    iget-object v0, p0, Ll/inf;->r:Ll/la5;

    .line 6
    .line 7
    iget-wide v1, v0, Ll/la5;->b:J

    .line 8
    .line 9
    cmp-long v1, p1, v1

    .line 10
    .line 11
    if-gez v1, :cond_0

    .line 12
    .line 13
    iget-wide v1, v0, Ll/la5;->a:J

    .line 14
    .line 15
    sub-long/2addr p1, v1

    .line 16
    long-to-float p1, p1

    .line 17
    iget-wide v0, v0, Ll/la5;->c:J

    .line 18
    .line 19
    long-to-float p2, v0

    .line 20
    div-float/2addr p1, p2

    .line 21
    iput p1, p0, Ll/inf;->p:F

    .line 22
    .line 23
    sget-object p2, Ll/inf;->s:Landroid/view/animation/PathInterpolator;

    .line 24
    .line 25
    invoke-virtual {p2, p1}, Landroid/view/animation/PathInterpolator;->getInterpolation(F)F

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    iput p1, p0, Ll/inf;->p:F

    .line 30
    .line 31
    invoke-virtual {p0}, Ll/inf;->h()V

    .line 32
    .line 33
    .line 34
    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-virtual {p1, p0}, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_0
    const/high16 p1, 0x3f800000    # 1.0f

    .line 43
    .line 44
    iput p1, p0, Ll/inf;->p:F

    .line 45
    .line 46
    invoke-virtual {p0}, Ll/inf;->h()V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public e(Landroid/graphics/Path;)V
    .locals 7

    .line 1
    invoke-virtual {p0}, Ll/inf;->a()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/inf;->b:Ll/inf$a;

    .line 5
    .line 6
    iget v1, p0, Ll/inf$a;->a:F

    .line 7
    .line 8
    iget v2, p0, Ll/inf$a;->b:F

    .line 9
    .line 10
    iget v3, p0, Ll/inf$a;->c:F

    .line 11
    .line 12
    iget v4, p0, Ll/inf$a;->d:F

    .line 13
    .line 14
    iget-object v5, p0, Ll/inf$a;->g:[F

    .line 15
    .line 16
    sget-object v6, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    .line 17
    .line 18
    move-object v0, p1

    .line 19
    invoke-virtual/range {v0 .. v6}, Landroid/graphics/Path;->addRoundRect(FFFF[FLandroid/graphics/Path$Direction;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public f(Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;)Ll/inf$a;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/inf;->l:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/inf$a;

    .line 8
    .line 9
    return-object p0
.end method

.method public g(II)V
    .locals 21

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move/from16 v1, p1

    .line 4
    .line 5
    move/from16 v2, p2

    .line 6
    .line 7
    iget-object v3, v0, Ll/inf;->a:Ll/jnf;

    .line 8
    .line 9
    invoke-virtual {v3, v1, v2}, Ll/jnf;->a(II)V

    .line 10
    .line 11
    .line 12
    iget-object v4, v0, Ll/inf;->e:Ll/inf$a;

    .line 13
    .line 14
    int-to-float v7, v1

    .line 15
    int-to-float v12, v2

    .line 16
    const/4 v9, 0x0

    .line 17
    const/4 v10, 0x0

    .line 18
    const/4 v5, 0x0

    .line 19
    const/4 v6, 0x0

    .line 20
    move v8, v12

    .line 21
    invoke-virtual/range {v4 .. v10}, Ll/inf$a;->c(FFFFFF)V

    .line 22
    .line 23
    .line 24
    iget-object v3, v0, Ll/inf;->g:Ll/inf$a;

    .line 25
    .line 26
    iget-object v4, v0, Ll/inf;->a:Ll/jnf;

    .line 27
    .line 28
    iget v5, v4, Ll/jnf;->a:I

    .line 29
    .line 30
    int-to-float v5, v5

    .line 31
    iget v6, v4, Ll/jnf;->b:I

    .line 32
    .line 33
    int-to-float v6, v6

    .line 34
    iget v7, v4, Ll/jnf;->c:I

    .line 35
    .line 36
    sub-int v7, v1, v7

    .line 37
    .line 38
    int-to-float v7, v7

    .line 39
    iget v8, v4, Ll/jnf;->d:I

    .line 40
    .line 41
    sub-int v8, v2, v8

    .line 42
    .line 43
    int-to-float v8, v8

    .line 44
    move v9, v5

    .line 45
    move v5, v6

    .line 46
    move v6, v7

    .line 47
    move v7, v8

    .line 48
    iget v8, v4, Ll/jnf;->f:F

    .line 49
    .line 50
    iget v4, v4, Ll/jnf;->g:F

    .line 51
    .line 52
    move/from16 v20, v9

    .line 53
    .line 54
    move v9, v4

    .line 55
    move/from16 v4, v20

    .line 56
    .line 57
    invoke-virtual/range {v3 .. v9}, Ll/inf$a;->c(FFFFFF)V

    .line 58
    .line 59
    .line 60
    invoke-static {}, Ll/gra;->N3()Z

    .line 61
    .line 62
    .line 63
    move-result v3

    .line 64
    if-eqz v3, :cond_0

    .line 65
    .line 66
    iget-object v4, v0, Ll/inf;->e:Ll/inf$a;

    .line 67
    .line 68
    iget-object v3, v0, Ll/inf;->a:Ll/jnf;

    .line 69
    .line 70
    iget v5, v3, Ll/jnf;->a:I

    .line 71
    .line 72
    int-to-float v5, v5

    .line 73
    iget v3, v3, Ll/jnf;->c:I

    .line 74
    .line 75
    sub-int v3, v1, v3

    .line 76
    .line 77
    int-to-float v7, v3

    .line 78
    const/high16 v3, 0x42c80000    # 100.0f

    .line 79
    .line 80
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 81
    .line 82
    .line 83
    move-result v6

    .line 84
    sub-int v6, v2, v6

    .line 85
    .line 86
    int-to-float v8, v6

    .line 87
    iget-object v6, v0, Ll/inf;->a:Ll/jnf;

    .line 88
    .line 89
    iget v10, v6, Ll/jnf;->g:F

    .line 90
    .line 91
    const/4 v6, 0x0

    .line 92
    const/4 v9, 0x0

    .line 93
    invoke-virtual/range {v4 .. v10}, Ll/inf$a;->c(FFFFFF)V

    .line 94
    .line 95
    .line 96
    iget-object v8, v0, Ll/inf;->f:Ll/inf$a;

    .line 97
    .line 98
    iget-object v4, v0, Ll/inf;->a:Ll/jnf;

    .line 99
    .line 100
    iget v5, v4, Ll/jnf;->a:I

    .line 101
    .line 102
    int-to-float v9, v5

    .line 103
    iget v4, v4, Ll/jnf;->c:I

    .line 104
    .line 105
    sub-int v4, v1, v4

    .line 106
    .line 107
    int-to-float v11, v4

    .line 108
    const/4 v13, 0x0

    .line 109
    const/4 v14, 0x0

    .line 110
    const/4 v10, 0x0

    .line 111
    invoke-virtual/range {v8 .. v14}, Ll/inf$a;->c(FFFFFF)V

    .line 112
    .line 113
    .line 114
    iget-object v4, v0, Ll/inf;->g:Ll/inf$a;

    .line 115
    .line 116
    iget-object v5, v0, Ll/inf;->a:Ll/jnf;

    .line 117
    .line 118
    iget v6, v5, Ll/jnf;->a:I

    .line 119
    .line 120
    int-to-float v6, v6

    .line 121
    iget v7, v5, Ll/jnf;->b:I

    .line 122
    .line 123
    int-to-float v7, v7

    .line 124
    iget v5, v5, Ll/jnf;->c:I

    .line 125
    .line 126
    sub-int v5, v1, v5

    .line 127
    .line 128
    int-to-float v5, v5

    .line 129
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 130
    .line 131
    .line 132
    move-result v3

    .line 133
    sub-int v3, v2, v3

    .line 134
    .line 135
    int-to-float v8, v3

    .line 136
    iget-object v3, v0, Ll/inf;->a:Ll/jnf;

    .line 137
    .line 138
    iget v9, v3, Ll/jnf;->f:F

    .line 139
    .line 140
    iget v10, v3, Ll/jnf;->g:F

    .line 141
    .line 142
    move/from16 v20, v7

    .line 143
    .line 144
    move v7, v5

    .line 145
    move v5, v6

    .line 146
    move/from16 v6, v20

    .line 147
    .line 148
    invoke-virtual/range {v4 .. v10}, Ll/inf$a;->c(FFFFFF)V

    .line 149
    .line 150
    .line 151
    iget-object v13, v0, Ll/inf;->h:Ll/inf$a;

    .line 152
    .line 153
    iget-object v3, v0, Ll/inf;->a:Ll/jnf;

    .line 154
    .line 155
    iget v4, v3, Ll/jnf;->a:I

    .line 156
    .line 157
    int-to-float v14, v4

    .line 158
    iget v4, v3, Ll/jnf;->b:I

    .line 159
    .line 160
    int-to-float v15, v4

    .line 161
    iget v4, v3, Ll/jnf;->c:I

    .line 162
    .line 163
    sub-int v4, v1, v4

    .line 164
    .line 165
    int-to-float v4, v4

    .line 166
    iget v5, v3, Ll/jnf;->d:I

    .line 167
    .line 168
    sub-int v5, v2, v5

    .line 169
    .line 170
    int-to-float v5, v5

    .line 171
    iget v6, v3, Ll/jnf;->f:F

    .line 172
    .line 173
    iget v3, v3, Ll/jnf;->g:F

    .line 174
    .line 175
    move/from16 v19, v3

    .line 176
    .line 177
    move/from16 v16, v4

    .line 178
    .line 179
    move/from16 v17, v5

    .line 180
    .line 181
    move/from16 v18, v6

    .line 182
    .line 183
    invoke-virtual/range {v13 .. v19}, Ll/inf$a;->c(FFFFFF)V

    .line 184
    .line 185
    .line 186
    :cond_0
    iget-object v8, v0, Ll/inf;->i:Ll/inf$a;

    .line 187
    .line 188
    iget-object v3, v0, Ll/inf;->a:Ll/jnf;

    .line 189
    .line 190
    iget v4, v3, Ll/jnf;->a:I

    .line 191
    .line 192
    int-to-float v9, v4

    .line 193
    iget v4, v3, Ll/jnf;->b:I

    .line 194
    .line 195
    iget v5, v3, Ll/jnf;->e:I

    .line 196
    .line 197
    add-int/2addr v4, v5

    .line 198
    int-to-float v10, v4

    .line 199
    iget v4, v3, Ll/jnf;->c:I

    .line 200
    .line 201
    sub-int v4, v1, v4

    .line 202
    .line 203
    int-to-float v11, v4

    .line 204
    iget v13, v3, Ll/jnf;->f:F

    .line 205
    .line 206
    const/4 v14, 0x0

    .line 207
    invoke-virtual/range {v8 .. v14}, Ll/inf$a;->c(FFFFFF)V

    .line 208
    .line 209
    .line 210
    iget-object v8, v0, Ll/inf;->j:Ll/inf$a;

    .line 211
    .line 212
    iget-object v3, v0, Ll/inf;->a:Ll/jnf;

    .line 213
    .line 214
    iget v4, v3, Ll/jnf;->a:I

    .line 215
    .line 216
    int-to-float v9, v4

    .line 217
    iget v4, v3, Ll/jnf;->b:I

    .line 218
    .line 219
    int-to-float v10, v4

    .line 220
    iget v4, v3, Ll/jnf;->c:I

    .line 221
    .line 222
    sub-int v4, v1, v4

    .line 223
    .line 224
    int-to-float v11, v4

    .line 225
    iget v13, v3, Ll/jnf;->f:F

    .line 226
    .line 227
    invoke-virtual/range {v8 .. v14}, Ll/inf$a;->c(FFFFFF)V

    .line 228
    .line 229
    .line 230
    iget-object v8, v0, Ll/inf;->i:Ll/inf$a;

    .line 231
    .line 232
    iget-object v3, v0, Ll/inf;->a:Ll/jnf;

    .line 233
    .line 234
    iget v4, v3, Ll/jnf;->a:I

    .line 235
    .line 236
    int-to-float v9, v4

    .line 237
    iget v4, v3, Ll/jnf;->b:I

    .line 238
    .line 239
    iget v5, v3, Ll/jnf;->e:I

    .line 240
    .line 241
    add-int/2addr v4, v5

    .line 242
    int-to-float v10, v4

    .line 243
    iget v4, v3, Ll/jnf;->c:I

    .line 244
    .line 245
    sub-int v4, v1, v4

    .line 246
    .line 247
    int-to-float v11, v4

    .line 248
    iget v13, v3, Ll/jnf;->f:F

    .line 249
    .line 250
    invoke-virtual/range {v8 .. v14}, Ll/inf$a;->c(FFFFFF)V

    .line 251
    .line 252
    .line 253
    iget-object v1, v0, Ll/inf;->k:Ll/inf$a;

    .line 254
    .line 255
    div-int/lit8 v3, p1, 0x2

    .line 256
    .line 257
    int-to-float v3, v3

    .line 258
    iget-object v4, v0, Ll/inf;->a:Ll/jnf;

    .line 259
    .line 260
    iget v5, v4, Ll/jnf;->f:F

    .line 261
    .line 262
    const/high16 v6, 0x3fc00000    # 1.5f

    .line 263
    .line 264
    mul-float v7, v5, v6

    .line 265
    .line 266
    sub-float v7, v3, v7

    .line 267
    .line 268
    div-int/lit8 v2, v2, 0x2

    .line 269
    .line 270
    int-to-float v2, v2

    .line 271
    mul-float v8, v5, v6

    .line 272
    .line 273
    sub-float v8, v2, v8

    .line 274
    .line 275
    mul-float v9, v5, v6

    .line 276
    .line 277
    add-float/2addr v3, v9

    .line 278
    mul-float v9, v5, v6

    .line 279
    .line 280
    add-float/2addr v2, v9

    .line 281
    mul-float/2addr v5, v6

    .line 282
    iget v4, v4, Ll/jnf;->g:F

    .line 283
    .line 284
    mul-float/2addr v4, v6

    .line 285
    move v6, v5

    .line 286
    move v5, v2

    .line 287
    move v2, v7

    .line 288
    move v7, v4

    .line 289
    move v4, v3

    .line 290
    move v3, v8

    .line 291
    invoke-virtual/range {v1 .. v7}, Ll/inf$a;->c(FFFFFF)V

    .line 292
    .line 293
    .line 294
    iget-object v1, v0, Ll/inf;->m:Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;

    .line 295
    .line 296
    sget-object v2, Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;->UNKNOWN:Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;

    .line 297
    .line 298
    if-ne v1, v2, :cond_2

    .line 299
    .line 300
    iget-object v1, v0, Ll/inf;->n:Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;

    .line 301
    .line 302
    if-eqz v1, :cond_1

    .line 303
    .line 304
    iget-boolean v2, v0, Ll/inf;->o:Z

    .line 305
    .line 306
    const/4 v3, 0x1

    .line 307
    invoke-virtual {v0, v1, v2, v3, v3}, Ll/inf;->j(Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;ZZZ)V

    .line 308
    .line 309
    .line 310
    return-void

    .line 311
    :cond_1
    sget-object v1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;->EXPANDED_CARD:Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;

    .line 312
    .line 313
    iput-object v1, v0, Ll/inf;->m:Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;

    .line 314
    .line 315
    iget-object v1, v0, Ll/inf;->e:Ll/inf$a;

    .line 316
    .line 317
    iget-object v2, v0, Ll/inf;->c:Ll/inf$a;

    .line 318
    .line 319
    invoke-virtual {v1, v2}, Ll/inf$a;->b(Ll/inf$a;)V

    .line 320
    .line 321
    .line 322
    iget-object v1, v0, Ll/inf;->e:Ll/inf$a;

    .line 323
    .line 324
    iget-object v0, v0, Ll/inf;->b:Ll/inf$a;

    .line 325
    .line 326
    invoke-virtual {v1, v0}, Ll/inf$a;->b(Ll/inf$a;)V

    .line 327
    .line 328
    .line 329
    :cond_2
    return-void
.end method

.method public final h()V
    .locals 11

    .line 1
    iget-object v0, p0, Ll/inf;->m:Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;->EXPANDED_CARD:Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/inf;->e:Ll/inf$a;

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    sget-object v1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;->EXPANDED_PROFILE:Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;

    .line 11
    .line 12
    if-ne v0, v1, :cond_1

    .line 13
    .line 14
    iget-object v0, p0, Ll/inf;->f:Ll/inf$a;

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_1
    sget-object v1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;->SWIPE_CLIP:Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;

    .line 18
    .line 19
    if-ne v0, v1, :cond_2

    .line 20
    .line 21
    iget-object v0, p0, Ll/inf;->g:Ll/inf$a;

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_2
    sget-object v1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;->SWIPE_CLIP_PROFILE:Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;

    .line 25
    .line 26
    if-ne v0, v1, :cond_3

    .line 27
    .line 28
    iget-object v0, p0, Ll/inf;->h:Ll/inf$a;

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_3
    sget-object v1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;->SCROLL_CLIP:Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;

    .line 32
    .line 33
    if-ne v0, v1, :cond_4

    .line 34
    .line 35
    iget-object v0, p0, Ll/inf;->i:Ll/inf$a;

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_4
    sget-object v1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;->FLING_CLIP:Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;

    .line 39
    .line 40
    if-ne v0, v1, :cond_5

    .line 41
    .line 42
    iget-object v0, p0, Ll/inf;->k:Ll/inf$a;

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_5
    const/4 v0, 0x0

    .line 46
    :goto_0
    if-nez v0, :cond_6

    .line 47
    .line 48
    goto :goto_1

    .line 49
    :cond_6
    iget-object v1, p0, Ll/inf;->b:Ll/inf$a;

    .line 50
    .line 51
    iget-object v2, p0, Ll/inf;->c:Ll/inf$a;

    .line 52
    .line 53
    iget v3, v2, Ll/inf$a;->a:F

    .line 54
    .line 55
    iget v4, v0, Ll/inf$a;->a:F

    .line 56
    .line 57
    sub-float/2addr v4, v3

    .line 58
    iget v5, p0, Ll/inf;->p:F

    .line 59
    .line 60
    mul-float/2addr v4, v5

    .line 61
    add-float/2addr v3, v4

    .line 62
    iget v2, v2, Ll/inf$a;->b:F

    .line 63
    .line 64
    iget v4, v0, Ll/inf$a;->b:F

    .line 65
    .line 66
    sub-float/2addr v4, v2

    .line 67
    iget v6, p0, Ll/inf;->q:F

    .line 68
    .line 69
    mul-float/2addr v5, v6

    .line 70
    const/high16 v6, 0x3f800000    # 1.0f

    .line 71
    .line 72
    invoke-static {v6, v5}, Ljava/lang/Math;->min(FF)F

    .line 73
    .line 74
    .line 75
    move-result v5

    .line 76
    mul-float/2addr v4, v5

    .line 77
    add-float/2addr v2, v4

    .line 78
    iget-object v4, p0, Ll/inf;->c:Ll/inf$a;

    .line 79
    .line 80
    iget v5, v4, Ll/inf$a;->c:F

    .line 81
    .line 82
    iget v7, v0, Ll/inf$a;->c:F

    .line 83
    .line 84
    sub-float/2addr v7, v5

    .line 85
    iget v8, p0, Ll/inf;->p:F

    .line 86
    .line 87
    mul-float/2addr v7, v8

    .line 88
    add-float/2addr v5, v7

    .line 89
    iget v4, v4, Ll/inf$a;->d:F

    .line 90
    .line 91
    iget v7, v0, Ll/inf$a;->d:F

    .line 92
    .line 93
    sub-float/2addr v7, v4

    .line 94
    iget v9, p0, Ll/inf;->q:F

    .line 95
    .line 96
    mul-float/2addr v8, v9

    .line 97
    invoke-static {v6, v8}, Ljava/lang/Math;->min(FF)F

    .line 98
    .line 99
    .line 100
    move-result v6

    .line 101
    mul-float/2addr v7, v6

    .line 102
    add-float/2addr v4, v7

    .line 103
    iget-object v6, p0, Ll/inf;->c:Ll/inf$a;

    .line 104
    .line 105
    iget v7, v6, Ll/inf$a;->e:F

    .line 106
    .line 107
    iget v8, v0, Ll/inf$a;->e:F

    .line 108
    .line 109
    sub-float/2addr v8, v7

    .line 110
    iget v9, p0, Ll/inf;->p:F

    .line 111
    .line 112
    mul-float/2addr v8, v9

    .line 113
    add-float/2addr v7, v8

    .line 114
    iget v6, v6, Ll/inf$a;->f:F

    .line 115
    .line 116
    iget v0, v0, Ll/inf$a;->f:F

    .line 117
    .line 118
    sub-float/2addr v0, v6

    .line 119
    mul-float/2addr v0, v9

    .line 120
    add-float/2addr v6, v0

    .line 121
    move v10, v3

    .line 122
    move v3, v2

    .line 123
    move v2, v10

    .line 124
    move v10, v5

    .line 125
    move v5, v4

    .line 126
    move v4, v10

    .line 127
    move v10, v7

    .line 128
    move v7, v6

    .line 129
    move v6, v10

    .line 130
    invoke-virtual/range {v1 .. v7}, Ll/inf$a;->c(FFFFFF)V

    .line 131
    .line 132
    .line 133
    iget-object v0, p0, Ll/inf;->d:Ll/inf$b;

    .line 134
    .line 135
    if-eqz v0, :cond_7

    .line 136
    .line 137
    iget-object v1, p0, Ll/inf;->m:Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;

    .line 138
    .line 139
    iget p0, p0, Ll/inf;->p:F

    .line 140
    .line 141
    invoke-interface {v0, v1, p0}, Ll/inf$b;->u(Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;F)V

    .line 142
    .line 143
    .line 144
    :cond_7
    :goto_1
    return-void
.end method

.method public i(Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;Z)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x1

    .line 3
    invoke-virtual {p0, p1, p2, v0, v1}, Ll/inf;->j(Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;ZZZ)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public j(Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;ZZZ)V
    .locals 2

    .line 1
    if-nez p3, :cond_0

    .line 2
    .line 3
    iget-object p3, p0, Ll/inf;->m:Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;

    .line 4
    .line 5
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;->UNKNOWN:Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;

    .line 6
    .line 7
    if-ne p3, v0, :cond_0

    .line 8
    .line 9
    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    .line 10
    .line 11
    .line 12
    move-result-object p3

    .line 13
    invoke-virtual {p3, p0}, Landroid/view/Choreographer;->removeFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Ll/inf;->n:Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;

    .line 17
    .line 18
    iput-boolean p2, p0, Ll/inf;->o:Z

    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    iget-object p3, p0, Ll/inf;->m:Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;

    .line 22
    .line 23
    if-ne p1, p3, :cond_1

    .line 24
    .line 25
    if-nez p4, :cond_3

    .line 26
    .line 27
    :cond_1
    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    .line 28
    .line 29
    .line 30
    move-result-object p3

    .line 31
    invoke-virtual {p3, p0}, Landroid/view/Choreographer;->removeFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 32
    .line 33
    .line 34
    const/4 p3, 0x0

    .line 35
    if-eqz p2, :cond_2

    .line 36
    .line 37
    iget-object p2, p0, Ll/inf;->b:Ll/inf$a;

    .line 38
    .line 39
    iget-object p4, p0, Ll/inf;->c:Ll/inf$a;

    .line 40
    .line 41
    invoke-virtual {p2, p4}, Ll/inf$a;->b(Ll/inf$a;)V

    .line 42
    .line 43
    .line 44
    iput p3, p0, Ll/inf;->p:F

    .line 45
    .line 46
    iget-object p2, p0, Ll/inf;->r:Ll/la5;

    .line 47
    .line 48
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 49
    .line 50
    .line 51
    move-result-wide p3

    .line 52
    const-wide/16 v0, 0x154

    .line 53
    .line 54
    invoke-virtual {p2, p3, p4, v0, v1}, Ll/la5;->a(JJ)V

    .line 55
    .line 56
    .line 57
    iput-object p1, p0, Ll/inf;->m:Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;

    .line 58
    .line 59
    invoke-virtual {p0}, Ll/inf;->h()V

    .line 60
    .line 61
    .line 62
    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    invoke-virtual {p1, p0}, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 67
    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_2
    iget-object p2, p0, Ll/inf;->l:Ljava/util/HashMap;

    .line 71
    .line 72
    invoke-virtual {p2, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object p2

    .line 76
    check-cast p2, Ll/inf$a;

    .line 77
    .line 78
    iput-object p1, p0, Ll/inf;->m:Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;

    .line 79
    .line 80
    iput p3, p0, Ll/inf;->p:F

    .line 81
    .line 82
    iget-object p1, p0, Ll/inf;->b:Ll/inf$a;

    .line 83
    .line 84
    invoke-virtual {p2, p1}, Ll/inf$a;->b(Ll/inf$a;)V

    .line 85
    .line 86
    .line 87
    iget-object p1, p0, Ll/inf;->c:Ll/inf$a;

    .line 88
    .line 89
    invoke-virtual {p2, p1}, Ll/inf$a;->b(Ll/inf$a;)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {p0}, Ll/inf;->h()V

    .line 93
    .line 94
    .line 95
    :cond_3
    :goto_0
    const/4 p1, 0x0

    .line 96
    iput-object p1, p0, Ll/inf;->n:Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;

    .line 97
    .line 98
    const/4 p1, 0x0

    .line 99
    iput-boolean p1, p0, Ll/inf;->o:Z

    .line 100
    .line 101
    return-void
.end method
