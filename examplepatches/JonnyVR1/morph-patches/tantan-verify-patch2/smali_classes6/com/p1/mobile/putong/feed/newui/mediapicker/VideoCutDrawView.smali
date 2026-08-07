.class public Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;
.super Landroid/view/View;
.source "SourceFile"


# instance fields
.field public a:I

.field public b:I

.field public c:I

.field public d:I

.field public e:I

.field public f:I

.field public g:I

.field public h:I

.field public i:I

.field public j:I

.field public k:I

.field public l:I

.field public m:I

.field public n:I

.field public o:I

.field public p:I

.field public q:I

.field public r:Z

.field public s:Z

.field public t:Landroid/view/GestureDetector;

.field public u:Landroid/graphics/Paint;

.field public v:Landroid/graphics/Paint;

.field public w:Landroid/graphics/Paint;

.field public x:Ll/a30;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/a30<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->g:I

    .line 6
    .line 7
    const/high16 p1, 0x41600000    # 14.0f

    .line 8
    .line 9
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->h:I

    .line 14
    .line 15
    const/high16 p1, 0x40000000    # 2.0f

    .line 16
    .line 17
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->i:I

    .line 22
    .line 23
    const/high16 p1, 0x41d80000    # 27.0f

    .line 24
    .line 25
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->j:I

    .line 30
    .line 31
    const/high16 p1, 0x42240000    # 41.0f

    .line 32
    .line 33
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->k:I

    .line 38
    .line 39
    const/high16 p1, 0x41100000    # 9.0f

    .line 40
    .line 41
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->l:I

    .line 46
    .line 47
    const/high16 p1, 0x40d00000    # 6.5f

    .line 48
    .line 49
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->m:I

    .line 54
    .line 55
    const/high16 p1, 0x40f00000    # 7.5f

    .line 56
    .line 57
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 58
    .line 59
    .line 60
    move-result p1

    .line 61
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->n:I

    .line 62
    .line 63
    const/high16 p1, 0x40600000    # 3.5f

    .line 64
    .line 65
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->o:I

    .line 70
    .line 71
    const/high16 p1, 0x40900000    # 4.5f

    .line 72
    .line 73
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 74
    .line 75
    .line 76
    move-result p1

    .line 77
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->p:I

    .line 78
    .line 79
    const/high16 p1, 0x40a00000    # 5.0f

    .line 80
    .line 81
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 82
    .line 83
    .line 84
    move-result p1

    .line 85
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->q:I

    .line 86
    .line 87
    const/4 p1, 0x1

    .line 88
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->s:Z

    .line 89
    .line 90
    new-instance p1, Landroid/graphics/Paint;

    .line 91
    .line 92
    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    .line 93
    .line 94
    .line 95
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->u:Landroid/graphics/Paint;

    .line 96
    .line 97
    new-instance p1, Landroid/graphics/Paint;

    .line 98
    .line 99
    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    .line 100
    .line 101
    .line 102
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->v:Landroid/graphics/Paint;

    .line 103
    .line 104
    new-instance p1, Landroid/graphics/Paint;

    .line 105
    .line 106
    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    .line 107
    .line 108
    .line 109
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->w:Landroid/graphics/Paint;

    .line 110
    .line 111
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 112
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 113
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->g:I

    const/high16 p1, 0x41600000    # 14.0f

    .line 114
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->h:I

    const/high16 p1, 0x40000000    # 2.0f

    .line 115
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->i:I

    const/high16 p1, 0x41d80000    # 27.0f

    .line 116
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->j:I

    const/high16 p1, 0x42240000    # 41.0f

    .line 117
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->k:I

    const/high16 p1, 0x41100000    # 9.0f

    .line 118
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->l:I

    const/high16 p1, 0x40d00000    # 6.5f

    .line 119
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->m:I

    const/high16 p1, 0x40f00000    # 7.5f

    .line 120
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->n:I

    const/high16 p1, 0x40600000    # 3.5f

    .line 121
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->o:I

    const/high16 p1, 0x40900000    # 4.5f

    .line 122
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->p:I

    const/high16 p1, 0x40a00000    # 5.0f

    .line 123
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->q:I

    const/4 p1, 0x1

    .line 124
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->s:Z

    .line 125
    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->u:Landroid/graphics/Paint;

    .line 126
    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->v:Landroid/graphics/Paint;

    .line 127
    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->w:Landroid/graphics/Paint;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 128
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 129
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->g:I

    const/high16 p1, 0x41600000    # 14.0f

    .line 130
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->h:I

    const/high16 p1, 0x40000000    # 2.0f

    .line 131
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->i:I

    const/high16 p1, 0x41d80000    # 27.0f

    .line 132
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->j:I

    const/high16 p1, 0x42240000    # 41.0f

    .line 133
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->k:I

    const/high16 p1, 0x41100000    # 9.0f

    .line 134
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->l:I

    const/high16 p1, 0x40d00000    # 6.5f

    .line 135
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->m:I

    const/high16 p1, 0x40f00000    # 7.5f

    .line 136
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->n:I

    const/high16 p1, 0x40600000    # 3.5f

    .line 137
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->o:I

    const/high16 p1, 0x40900000    # 4.5f

    .line 138
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->p:I

    const/high16 p1, 0x40a00000    # 5.0f

    .line 139
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->q:I

    const/4 p1, 0x1

    .line 140
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->s:Z

    .line 141
    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->u:Landroid/graphics/Paint;

    .line 142
    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->v:Landroid/graphics/Paint;

    .line 143
    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->w:Landroid/graphics/Paint;

    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->a:I

    return p0
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->b:I

    return p0
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->r:Z

    return p0
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->h:I

    return p0
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->f:I

    return p0
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->c:I

    return p0
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->e:I

    return p0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->d:I

    return p0
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->a:I

    return-void
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->b:I

    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->r:Z

    return-void
.end method


# virtual methods
.method public l(IIIILl/a30;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IIII",
            "Ll/a30<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p5, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->x:Ll/a30;

    .line 2
    .line 3
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->a:I

    .line 4
    .line 5
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->g:I

    .line 6
    .line 7
    if-le p4, p2, :cond_0

    .line 8
    .line 9
    move p5, p2

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    move p5, p4

    .line 12
    :goto_0
    add-int/2addr p1, p5

    .line 13
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->b:I

    .line 14
    .line 15
    iput p2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->c:I

    .line 16
    .line 17
    iput p2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->d:I

    .line 18
    .line 19
    iput p3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->e:I

    .line 20
    .line 21
    iput p4, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->f:I

    .line 22
    .line 23
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->u:Landroid/graphics/Paint;

    .line 24
    .line 25
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 26
    .line 27
    .line 28
    move-result-object p2

    .line 29
    sget p3, Ll/k9c0;->W:I

    .line 30
    .line 31
    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getColor(I)I

    .line 32
    .line 33
    .line 34
    move-result p2

    .line 35
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setColor(I)V

    .line 36
    .line 37
    .line 38
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->v:Landroid/graphics/Paint;

    .line 39
    .line 40
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 41
    .line 42
    .line 43
    move-result-object p2

    .line 44
    sget p3, Ll/k9c0;->X:I

    .line 45
    .line 46
    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getColor(I)I

    .line 47
    .line 48
    .line 49
    move-result p2

    .line 50
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setColor(I)V

    .line 51
    .line 52
    .line 53
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->w:Landroid/graphics/Paint;

    .line 54
    .line 55
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 56
    .line 57
    .line 58
    move-result-object p2

    .line 59
    sget p3, Ll/k9c0;->n:I

    .line 60
    .line 61
    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getColor(I)I

    .line 62
    .line 63
    .line 64
    move-result p2

    .line 65
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setColor(I)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->m()V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public final m()V
    .locals 2

    .line 1
    new-instance v0, Landroid/view/GestureDetector;

    .line 2
    .line 3
    new-instance v1, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView$a;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView$a;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;)V

    .line 6
    .line 7
    .line 8
    invoke-direct {v0, v1}, Landroid/view/GestureDetector;-><init>(Landroid/view/GestureDetector$OnGestureListener;)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->t:Landroid/view/GestureDetector;

    .line 12
    .line 13
    return-void
.end method

.method public n(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->c:I

    .line 2
    .line 3
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 9
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x15
    .end annotation

    .line 1
    invoke-super/range {p0 .. p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 5
    .line 6
    .line 7
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->a:I

    .line 8
    .line 9
    iget v3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->o:I

    .line 10
    .line 11
    iget v4, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->h:I

    .line 12
    .line 13
    add-int/2addr v4, v2

    .line 14
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 15
    .line 16
    .line 17
    move-result v5

    .line 18
    iget v6, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->o:I

    .line 19
    .line 20
    sub-int/2addr v5, v6

    .line 21
    invoke-virtual {p1, v2, v3, v4, v5}, Landroid/graphics/Canvas;->clipRect(IIII)Z

    .line 22
    .line 23
    .line 24
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->a:I

    .line 25
    .line 26
    move v3, v2

    .line 27
    int-to-float v2, v3

    .line 28
    iget v4, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->o:I

    .line 29
    .line 30
    int-to-float v4, v4

    .line 31
    iget v5, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->h:I

    .line 32
    .line 33
    add-int/2addr v3, v5

    .line 34
    iget v5, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->p:I

    .line 35
    .line 36
    add-int/2addr v3, v5

    .line 37
    int-to-float v3, v3

    .line 38
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 39
    .line 40
    .line 41
    move-result v5

    .line 42
    iget v6, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->o:I

    .line 43
    .line 44
    sub-int/2addr v5, v6

    .line 45
    int-to-float v5, v5

    .line 46
    iget v6, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->p:I

    .line 47
    .line 48
    int-to-float v7, v6

    .line 49
    int-to-float v6, v6

    .line 50
    iget-object v8, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->u:Landroid/graphics/Paint;

    .line 51
    .line 52
    move v1, v4

    .line 53
    move v4, v3

    .line 54
    move v3, v1

    .line 55
    move v1, v7

    .line 56
    move v7, v6

    .line 57
    move v6, v1

    .line 58
    move-object v1, p1

    .line 59
    invoke-virtual/range {v1 .. v8}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 63
    .line 64
    .line 65
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 66
    .line 67
    .line 68
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->b:I

    .line 69
    .line 70
    iget v3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->h:I

    .line 71
    .line 72
    sub-int v3, v2, v3

    .line 73
    .line 74
    iget v4, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->o:I

    .line 75
    .line 76
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 77
    .line 78
    .line 79
    move-result v5

    .line 80
    iget v6, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->o:I

    .line 81
    .line 82
    sub-int/2addr v5, v6

    .line 83
    invoke-virtual {p1, v3, v4, v2, v5}, Landroid/graphics/Canvas;->clipRect(IIII)Z

    .line 84
    .line 85
    .line 86
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->b:I

    .line 87
    .line 88
    iget v3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->h:I

    .line 89
    .line 90
    sub-int v3, v2, v3

    .line 91
    .line 92
    iget v4, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->p:I

    .line 93
    .line 94
    sub-int/2addr v3, v4

    .line 95
    int-to-float v3, v3

    .line 96
    iget v4, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->o:I

    .line 97
    .line 98
    int-to-float v4, v4

    .line 99
    int-to-float v2, v2

    .line 100
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 101
    .line 102
    .line 103
    move-result v5

    .line 104
    iget v6, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->o:I

    .line 105
    .line 106
    sub-int/2addr v5, v6

    .line 107
    int-to-float v5, v5

    .line 108
    iget v6, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->p:I

    .line 109
    .line 110
    int-to-float v7, v6

    .line 111
    int-to-float v6, v6

    .line 112
    iget-object v8, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->u:Landroid/graphics/Paint;

    .line 113
    .line 114
    move v1, v4

    .line 115
    move v4, v2

    .line 116
    move v2, v3

    .line 117
    move v3, v1

    .line 118
    move v1, v7

    .line 119
    move v7, v6

    .line 120
    move v6, v1

    .line 121
    move-object v1, p1

    .line 122
    invoke-virtual/range {v1 .. v8}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    .line 123
    .line 124
    .line 125
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 126
    .line 127
    .line 128
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 129
    .line 130
    .line 131
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 132
    .line 133
    .line 134
    move-result v2

    .line 135
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 136
    .line 137
    .line 138
    move-result v3

    .line 139
    const/4 v4, 0x0

    .line 140
    invoke-virtual {p1, v4, v4, v2, v3}, Landroid/graphics/Canvas;->clipRect(IIII)Z

    .line 141
    .line 142
    .line 143
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->a:I

    .line 144
    .line 145
    iget v3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->o:I

    .line 146
    .line 147
    add-int/2addr v2, v3

    .line 148
    int-to-float v2, v2

    .line 149
    move v4, v3

    .line 150
    int-to-float v3, v4

    .line 151
    iget v5, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->b:I

    .line 152
    .line 153
    sub-int/2addr v5, v4

    .line 154
    int-to-float v5, v5

    .line 155
    iget v6, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->i:I

    .line 156
    .line 157
    add-int/2addr v6, v4

    .line 158
    int-to-float v4, v6

    .line 159
    iget-object v6, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->u:Landroid/graphics/Paint;

    .line 160
    .line 161
    move v1, v5

    .line 162
    move v5, v4

    .line 163
    move v4, v1

    .line 164
    move-object v1, p1

    .line 165
    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 166
    .line 167
    .line 168
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->a:I

    .line 169
    .line 170
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->o:I

    .line 171
    .line 172
    add-int/2addr v1, v2

    .line 173
    int-to-float v2, v1

    .line 174
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 175
    .line 176
    .line 177
    move-result v1

    .line 178
    iget v3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->i:I

    .line 179
    .line 180
    sub-int/2addr v1, v3

    .line 181
    iget v3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->o:I

    .line 182
    .line 183
    sub-int/2addr v1, v3

    .line 184
    int-to-float v1, v1

    .line 185
    iget v4, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->b:I

    .line 186
    .line 187
    sub-int/2addr v4, v3

    .line 188
    int-to-float v4, v4

    .line 189
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 190
    .line 191
    .line 192
    move-result v3

    .line 193
    iget v5, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->o:I

    .line 194
    .line 195
    sub-int/2addr v3, v5

    .line 196
    int-to-float v5, v3

    .line 197
    iget-object v6, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->u:Landroid/graphics/Paint;

    .line 198
    .line 199
    move v3, v1

    .line 200
    move-object v1, p1

    .line 201
    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 202
    .line 203
    .line 204
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->a:I

    .line 205
    .line 206
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->q:I

    .line 207
    .line 208
    add-int/2addr v2, v1

    .line 209
    int-to-float v2, v2

    .line 210
    iget v3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->j:I

    .line 211
    .line 212
    int-to-float v3, v3

    .line 213
    iget v4, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->m:I

    .line 214
    .line 215
    add-int/2addr v1, v4

    .line 216
    int-to-float v4, v1

    .line 217
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->k:I

    .line 218
    .line 219
    int-to-float v5, v1

    .line 220
    iget-object v6, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->v:Landroid/graphics/Paint;

    .line 221
    .line 222
    move-object v1, p1

    .line 223
    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 224
    .line 225
    .line 226
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->a:I

    .line 227
    .line 228
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->n:I

    .line 229
    .line 230
    add-int/2addr v2, v1

    .line 231
    int-to-float v2, v2

    .line 232
    iget v3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->j:I

    .line 233
    .line 234
    int-to-float v3, v3

    .line 235
    iget v4, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->l:I

    .line 236
    .line 237
    add-int/2addr v1, v4

    .line 238
    int-to-float v4, v1

    .line 239
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->k:I

    .line 240
    .line 241
    int-to-float v5, v1

    .line 242
    iget-object v6, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->v:Landroid/graphics/Paint;

    .line 243
    .line 244
    move-object v1, p1

    .line 245
    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 246
    .line 247
    .line 248
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->b:I

    .line 249
    .line 250
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->m:I

    .line 251
    .line 252
    sub-int v2, v1, v2

    .line 253
    .line 254
    int-to-float v2, v2

    .line 255
    iget v3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->j:I

    .line 256
    .line 257
    int-to-float v3, v3

    .line 258
    iget v4, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->q:I

    .line 259
    .line 260
    sub-int/2addr v1, v4

    .line 261
    int-to-float v4, v1

    .line 262
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->k:I

    .line 263
    .line 264
    int-to-float v5, v1

    .line 265
    iget-object v6, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->v:Landroid/graphics/Paint;

    .line 266
    .line 267
    move-object v1, p1

    .line 268
    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 269
    .line 270
    .line 271
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->b:I

    .line 272
    .line 273
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->l:I

    .line 274
    .line 275
    sub-int v2, v1, v2

    .line 276
    .line 277
    int-to-float v2, v2

    .line 278
    iget v3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->j:I

    .line 279
    .line 280
    int-to-float v3, v3

    .line 281
    iget v4, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->n:I

    .line 282
    .line 283
    sub-int/2addr v1, v4

    .line 284
    int-to-float v4, v1

    .line 285
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->k:I

    .line 286
    .line 287
    int-to-float v5, v1

    .line 288
    iget-object v6, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->v:Landroid/graphics/Paint;

    .line 289
    .line 290
    move-object v1, p1

    .line 291
    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 292
    .line 293
    .line 294
    iget-boolean v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->s:Z

    .line 295
    .line 296
    if-eqz v1, :cond_0

    .line 297
    .line 298
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->g:I

    .line 299
    .line 300
    move v2, v1

    .line 301
    int-to-float v1, v2

    .line 302
    iget v3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->p:I

    .line 303
    .line 304
    add-int/2addr v2, v3

    .line 305
    int-to-float v3, v2

    .line 306
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 307
    .line 308
    .line 309
    move-result v2

    .line 310
    int-to-float v4, v2

    .line 311
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->o:I

    .line 312
    .line 313
    int-to-float v5, v2

    .line 314
    int-to-float v6, v2

    .line 315
    iget-object v7, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->w:Landroid/graphics/Paint;

    .line 316
    .line 317
    const/4 v2, 0x0

    .line 318
    move-object v0, p1

    .line 319
    invoke-virtual/range {v0 .. v7}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    .line 320
    .line 321
    .line 322
    :cond_0
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 323
    .line 324
    .line 325
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-eq v0, v1, :cond_1

    .line 7
    .line 8
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const/4 v2, 0x3

    .line 13
    if-ne v0, v2, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->t:Landroid/view/GestureDetector;

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    return p0

    .line 23
    :cond_1
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->x:Ll/a30;

    .line 24
    .line 25
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-eqz p1, :cond_2

    .line 30
    .line 31
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->x:Ll/a30;

    .line 32
    .line 33
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->a:I

    .line 34
    .line 35
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->b:I

    .line 40
    .line 41
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 46
    .line 47
    invoke-interface {p1, v0, p0, v2}, Ll/a30;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 48
    .line 49
    .line 50
    :cond_2
    return v1
.end method

.method public setPointIndex(I)V
    .locals 3

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->b:I

    .line 2
    .line 3
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->a:I

    .line 4
    .line 5
    sub-int v2, v0, v1

    .line 6
    .line 7
    if-le p1, v2, :cond_0

    .line 8
    .line 9
    sub-int p1, v0, v1

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    if-gez p1, :cond_1

    .line 13
    .line 14
    const/4 p1, 0x0

    .line 15
    :cond_1
    :goto_0
    add-int/2addr v1, p1

    .line 16
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/VideoCutDrawView;->g:I

    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/view/View;->postInvalidate()V

    .line 19
    .line 20
    .line 21
    return-void
.end method
