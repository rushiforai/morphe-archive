.class public final Lcom/google/android/exoplayer2/k$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/exoplayer2/k;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "b"
.end annotation


# instance fields
.field public A:I

.field public B:I

.field public C:I

.field public D:I

.field public E:I

.field public F:I

.field public a:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public b:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public c:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public d:I

.field public e:I

.field public f:I

.field public g:I

.field public h:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public i:Lcom/google/android/exoplayer2/metadata/Metadata;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public j:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public k:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public l:I

.field public m:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "[B>;"
        }
    .end annotation
.end field

.field public n:Lcom/google/android/exoplayer2/drm/DrmInitData;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public o:J

.field public p:I

.field public q:I

.field public r:F

.field public s:I

.field public t:F

.field public u:[B
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public v:I

.field public w:Ll/df5;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public x:I

.field public y:I

.field public z:I


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 133
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    .line 134
    iput v0, p0, Lcom/google/android/exoplayer2/k$b;->f:I

    .line 135
    iput v0, p0, Lcom/google/android/exoplayer2/k$b;->g:I

    .line 136
    iput v0, p0, Lcom/google/android/exoplayer2/k$b;->l:I

    const-wide v1, 0x7fffffffffffffffL

    .line 137
    iput-wide v1, p0, Lcom/google/android/exoplayer2/k$b;->o:J

    .line 138
    iput v0, p0, Lcom/google/android/exoplayer2/k$b;->p:I

    .line 139
    iput v0, p0, Lcom/google/android/exoplayer2/k$b;->q:I

    const/high16 v1, -0x40800000    # -1.0f

    .line 140
    iput v1, p0, Lcom/google/android/exoplayer2/k$b;->r:F

    const/high16 v1, 0x3f800000    # 1.0f

    .line 141
    iput v1, p0, Lcom/google/android/exoplayer2/k$b;->t:F

    .line 142
    iput v0, p0, Lcom/google/android/exoplayer2/k$b;->v:I

    .line 143
    iput v0, p0, Lcom/google/android/exoplayer2/k$b;->x:I

    .line 144
    iput v0, p0, Lcom/google/android/exoplayer2/k$b;->y:I

    .line 145
    iput v0, p0, Lcom/google/android/exoplayer2/k$b;->z:I

    .line 146
    iput v0, p0, Lcom/google/android/exoplayer2/k$b;->C:I

    .line 147
    iput v0, p0, Lcom/google/android/exoplayer2/k$b;->D:I

    .line 148
    iput v0, p0, Lcom/google/android/exoplayer2/k$b;->E:I

    const/4 v0, 0x0

    .line 149
    iput v0, p0, Lcom/google/android/exoplayer2/k$b;->F:I

    return-void
.end method

.method public constructor <init>(Lcom/google/android/exoplayer2/k;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p1, Lcom/google/android/exoplayer2/k;->a:Ljava/lang/String;

    .line 5
    .line 6
    iput-object v0, p0, Lcom/google/android/exoplayer2/k$b;->a:Ljava/lang/String;

    .line 7
    .line 8
    iget-object v0, p1, Lcom/google/android/exoplayer2/k;->b:Ljava/lang/String;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/google/android/exoplayer2/k$b;->b:Ljava/lang/String;

    .line 11
    .line 12
    iget-object v0, p1, Lcom/google/android/exoplayer2/k;->c:Ljava/lang/String;

    .line 13
    .line 14
    iput-object v0, p0, Lcom/google/android/exoplayer2/k$b;->c:Ljava/lang/String;

    .line 15
    .line 16
    iget v0, p1, Lcom/google/android/exoplayer2/k;->d:I

    .line 17
    .line 18
    iput v0, p0, Lcom/google/android/exoplayer2/k$b;->d:I

    .line 19
    .line 20
    iget v0, p1, Lcom/google/android/exoplayer2/k;->e:I

    .line 21
    .line 22
    iput v0, p0, Lcom/google/android/exoplayer2/k$b;->e:I

    .line 23
    .line 24
    iget v0, p1, Lcom/google/android/exoplayer2/k;->f:I

    .line 25
    .line 26
    iput v0, p0, Lcom/google/android/exoplayer2/k$b;->f:I

    .line 27
    .line 28
    iget v0, p1, Lcom/google/android/exoplayer2/k;->g:I

    .line 29
    .line 30
    iput v0, p0, Lcom/google/android/exoplayer2/k$b;->g:I

    .line 31
    .line 32
    iget-object v0, p1, Lcom/google/android/exoplayer2/k;->i:Ljava/lang/String;

    .line 33
    .line 34
    iput-object v0, p0, Lcom/google/android/exoplayer2/k$b;->h:Ljava/lang/String;

    .line 35
    .line 36
    iget-object v0, p1, Lcom/google/android/exoplayer2/k;->j:Lcom/google/android/exoplayer2/metadata/Metadata;

    .line 37
    .line 38
    iput-object v0, p0, Lcom/google/android/exoplayer2/k$b;->i:Lcom/google/android/exoplayer2/metadata/Metadata;

    .line 39
    .line 40
    iget-object v0, p1, Lcom/google/android/exoplayer2/k;->k:Ljava/lang/String;

    .line 41
    .line 42
    iput-object v0, p0, Lcom/google/android/exoplayer2/k$b;->j:Ljava/lang/String;

    .line 43
    .line 44
    iget-object v0, p1, Lcom/google/android/exoplayer2/k;->l:Ljava/lang/String;

    .line 45
    .line 46
    iput-object v0, p0, Lcom/google/android/exoplayer2/k$b;->k:Ljava/lang/String;

    .line 47
    .line 48
    iget v0, p1, Lcom/google/android/exoplayer2/k;->m:I

    .line 49
    .line 50
    iput v0, p0, Lcom/google/android/exoplayer2/k$b;->l:I

    .line 51
    .line 52
    iget-object v0, p1, Lcom/google/android/exoplayer2/k;->n:Ljava/util/List;

    .line 53
    .line 54
    iput-object v0, p0, Lcom/google/android/exoplayer2/k$b;->m:Ljava/util/List;

    .line 55
    .line 56
    iget-object v0, p1, Lcom/google/android/exoplayer2/k;->o:Lcom/google/android/exoplayer2/drm/DrmInitData;

    .line 57
    .line 58
    iput-object v0, p0, Lcom/google/android/exoplayer2/k$b;->n:Lcom/google/android/exoplayer2/drm/DrmInitData;

    .line 59
    .line 60
    iget-wide v0, p1, Lcom/google/android/exoplayer2/k;->p:J

    .line 61
    .line 62
    iput-wide v0, p0, Lcom/google/android/exoplayer2/k$b;->o:J

    .line 63
    .line 64
    iget v0, p1, Lcom/google/android/exoplayer2/k;->q:I

    .line 65
    .line 66
    iput v0, p0, Lcom/google/android/exoplayer2/k$b;->p:I

    .line 67
    .line 68
    iget v0, p1, Lcom/google/android/exoplayer2/k;->r:I

    .line 69
    .line 70
    iput v0, p0, Lcom/google/android/exoplayer2/k$b;->q:I

    .line 71
    .line 72
    iget v0, p1, Lcom/google/android/exoplayer2/k;->s:F

    .line 73
    .line 74
    iput v0, p0, Lcom/google/android/exoplayer2/k$b;->r:F

    .line 75
    .line 76
    iget v0, p1, Lcom/google/android/exoplayer2/k;->t:I

    .line 77
    .line 78
    iput v0, p0, Lcom/google/android/exoplayer2/k$b;->s:I

    .line 79
    .line 80
    iget v0, p1, Lcom/google/android/exoplayer2/k;->u:F

    .line 81
    .line 82
    iput v0, p0, Lcom/google/android/exoplayer2/k$b;->t:F

    .line 83
    .line 84
    iget-object v0, p1, Lcom/google/android/exoplayer2/k;->v:[B

    .line 85
    .line 86
    iput-object v0, p0, Lcom/google/android/exoplayer2/k$b;->u:[B

    .line 87
    .line 88
    iget v0, p1, Lcom/google/android/exoplayer2/k;->w:I

    .line 89
    .line 90
    iput v0, p0, Lcom/google/android/exoplayer2/k$b;->v:I

    .line 91
    .line 92
    iget-object v0, p1, Lcom/google/android/exoplayer2/k;->x:Ll/df5;

    .line 93
    .line 94
    iput-object v0, p0, Lcom/google/android/exoplayer2/k$b;->w:Ll/df5;

    .line 95
    .line 96
    iget v0, p1, Lcom/google/android/exoplayer2/k;->y:I

    .line 97
    .line 98
    iput v0, p0, Lcom/google/android/exoplayer2/k$b;->x:I

    .line 99
    .line 100
    iget v0, p1, Lcom/google/android/exoplayer2/k;->z:I

    .line 101
    .line 102
    iput v0, p0, Lcom/google/android/exoplayer2/k$b;->y:I

    .line 103
    .line 104
    iget v0, p1, Lcom/google/android/exoplayer2/k;->A:I

    .line 105
    .line 106
    iput v0, p0, Lcom/google/android/exoplayer2/k$b;->z:I

    .line 107
    .line 108
    iget v0, p1, Lcom/google/android/exoplayer2/k;->B:I

    .line 109
    .line 110
    iput v0, p0, Lcom/google/android/exoplayer2/k$b;->A:I

    .line 111
    .line 112
    iget v0, p1, Lcom/google/android/exoplayer2/k;->C:I

    .line 113
    .line 114
    iput v0, p0, Lcom/google/android/exoplayer2/k$b;->B:I

    .line 115
    .line 116
    iget v0, p1, Lcom/google/android/exoplayer2/k;->D:I

    .line 117
    .line 118
    iput v0, p0, Lcom/google/android/exoplayer2/k$b;->C:I

    .line 119
    .line 120
    iget v0, p1, Lcom/google/android/exoplayer2/k;->E:I

    .line 121
    .line 122
    iput v0, p0, Lcom/google/android/exoplayer2/k$b;->D:I

    .line 123
    .line 124
    iget v0, p1, Lcom/google/android/exoplayer2/k;->F:I

    .line 125
    .line 126
    iput v0, p0, Lcom/google/android/exoplayer2/k$b;->E:I

    .line 127
    .line 128
    iget p1, p1, Lcom/google/android/exoplayer2/k;->G:I

    .line 129
    .line 130
    iput p1, p0, Lcom/google/android/exoplayer2/k$b;->F:I

    .line 131
    .line 132
    return-void
.end method

.method public synthetic constructor <init>(Lcom/google/android/exoplayer2/k;Lcom/google/android/exoplayer2/k$a;)V
    .locals 0

    .line 150
    invoke-direct {p0, p1}, Lcom/google/android/exoplayer2/k$b;-><init>(Lcom/google/android/exoplayer2/k;)V

    return-void
.end method

.method public static synthetic A(Lcom/google/android/exoplayer2/k$b;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/google/android/exoplayer2/k$b;->d:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic B(Lcom/google/android/exoplayer2/k$b;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/google/android/exoplayer2/k$b;->e:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic C(Lcom/google/android/exoplayer2/k$b;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/google/android/exoplayer2/k$b;->f:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic D(Lcom/google/android/exoplayer2/k$b;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/google/android/exoplayer2/k$b;->g:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic E(Lcom/google/android/exoplayer2/k$b;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/k$b;->h:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic F(Lcom/google/android/exoplayer2/k$b;)Lcom/google/android/exoplayer2/metadata/Metadata;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/k$b;->i:Lcom/google/android/exoplayer2/metadata/Metadata;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic a(Lcom/google/android/exoplayer2/k$b;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/k$b;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic b(Lcom/google/android/exoplayer2/k$b;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/k$b;->j:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic c(Lcom/google/android/exoplayer2/k$b;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/k$b;->k:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic d(Lcom/google/android/exoplayer2/k$b;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/google/android/exoplayer2/k$b;->l:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic e(Lcom/google/android/exoplayer2/k$b;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/k$b;->m:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic f(Lcom/google/android/exoplayer2/k$b;)Lcom/google/android/exoplayer2/drm/DrmInitData;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/k$b;->n:Lcom/google/android/exoplayer2/drm/DrmInitData;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic g(Lcom/google/android/exoplayer2/k$b;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/google/android/exoplayer2/k$b;->o:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic h(Lcom/google/android/exoplayer2/k$b;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/google/android/exoplayer2/k$b;->p:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic i(Lcom/google/android/exoplayer2/k$b;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/google/android/exoplayer2/k$b;->q:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic j(Lcom/google/android/exoplayer2/k$b;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/google/android/exoplayer2/k$b;->r:F

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic k(Lcom/google/android/exoplayer2/k$b;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/google/android/exoplayer2/k$b;->s:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic l(Lcom/google/android/exoplayer2/k$b;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/k$b;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic m(Lcom/google/android/exoplayer2/k$b;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/google/android/exoplayer2/k$b;->t:F

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic n(Lcom/google/android/exoplayer2/k$b;)[B
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/k$b;->u:[B

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic o(Lcom/google/android/exoplayer2/k$b;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/google/android/exoplayer2/k$b;->v:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic p(Lcom/google/android/exoplayer2/k$b;)Ll/df5;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/k$b;->w:Ll/df5;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic q(Lcom/google/android/exoplayer2/k$b;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/google/android/exoplayer2/k$b;->x:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic r(Lcom/google/android/exoplayer2/k$b;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/google/android/exoplayer2/k$b;->y:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic s(Lcom/google/android/exoplayer2/k$b;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/google/android/exoplayer2/k$b;->z:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic t(Lcom/google/android/exoplayer2/k$b;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/google/android/exoplayer2/k$b;->A:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic u(Lcom/google/android/exoplayer2/k$b;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/google/android/exoplayer2/k$b;->B:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic v(Lcom/google/android/exoplayer2/k$b;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/google/android/exoplayer2/k$b;->C:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic w(Lcom/google/android/exoplayer2/k$b;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/k$b;->c:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic x(Lcom/google/android/exoplayer2/k$b;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/google/android/exoplayer2/k$b;->D:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic y(Lcom/google/android/exoplayer2/k$b;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/google/android/exoplayer2/k$b;->E:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic z(Lcom/google/android/exoplayer2/k$b;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/google/android/exoplayer2/k$b;->F:I

    .line 2
    .line 3
    return p0
.end method


# virtual methods
.method public G()Lcom/google/android/exoplayer2/k;
    .locals 2

    .line 1
    new-instance v0, Lcom/google/android/exoplayer2/k;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p0, v1}, Lcom/google/android/exoplayer2/k;-><init>(Lcom/google/android/exoplayer2/k$b;Lcom/google/android/exoplayer2/k$a;)V

    .line 5
    .line 6
    .line 7
    return-object v0
.end method

.method public H(I)Lcom/google/android/exoplayer2/k$b;
    .locals 0

    .line 1
    iput p1, p0, Lcom/google/android/exoplayer2/k$b;->C:I

    .line 2
    .line 3
    return-object p0
.end method

.method public I(I)Lcom/google/android/exoplayer2/k$b;
    .locals 0

    .line 1
    iput p1, p0, Lcom/google/android/exoplayer2/k$b;->f:I

    .line 2
    .line 3
    return-object p0
.end method

.method public J(I)Lcom/google/android/exoplayer2/k$b;
    .locals 0

    .line 1
    iput p1, p0, Lcom/google/android/exoplayer2/k$b;->x:I

    .line 2
    .line 3
    return-object p0
.end method

.method public K(Ljava/lang/String;)Lcom/google/android/exoplayer2/k$b;
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/google/android/exoplayer2/k$b;->h:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public L(Ll/df5;)Lcom/google/android/exoplayer2/k$b;
    .locals 0
    .param p1    # Ll/df5;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/google/android/exoplayer2/k$b;->w:Ll/df5;

    .line 2
    .line 3
    return-object p0
.end method

.method public M(Ljava/lang/String;)Lcom/google/android/exoplayer2/k$b;
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/google/android/exoplayer2/k$b;->j:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public N(I)Lcom/google/android/exoplayer2/k$b;
    .locals 0

    .line 1
    iput p1, p0, Lcom/google/android/exoplayer2/k$b;->F:I

    .line 2
    .line 3
    return-object p0
.end method

.method public O(Lcom/google/android/exoplayer2/drm/DrmInitData;)Lcom/google/android/exoplayer2/k$b;
    .locals 0
    .param p1    # Lcom/google/android/exoplayer2/drm/DrmInitData;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/google/android/exoplayer2/k$b;->n:Lcom/google/android/exoplayer2/drm/DrmInitData;

    .line 2
    .line 3
    return-object p0
.end method

.method public P(I)Lcom/google/android/exoplayer2/k$b;
    .locals 0

    .line 1
    iput p1, p0, Lcom/google/android/exoplayer2/k$b;->A:I

    .line 2
    .line 3
    return-object p0
.end method

.method public Q(I)Lcom/google/android/exoplayer2/k$b;
    .locals 0

    .line 1
    iput p1, p0, Lcom/google/android/exoplayer2/k$b;->B:I

    .line 2
    .line 3
    return-object p0
.end method

.method public R(F)Lcom/google/android/exoplayer2/k$b;
    .locals 0

    .line 1
    iput p1, p0, Lcom/google/android/exoplayer2/k$b;->r:F

    .line 2
    .line 3
    return-object p0
.end method

.method public S(I)Lcom/google/android/exoplayer2/k$b;
    .locals 0

    .line 1
    iput p1, p0, Lcom/google/android/exoplayer2/k$b;->q:I

    .line 2
    .line 3
    return-object p0
.end method

.method public T(I)Lcom/google/android/exoplayer2/k$b;
    .locals 0

    .line 1
    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Lcom/google/android/exoplayer2/k$b;->a:Ljava/lang/String;

    .line 6
    .line 7
    return-object p0
.end method

.method public U(Ljava/lang/String;)Lcom/google/android/exoplayer2/k$b;
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/google/android/exoplayer2/k$b;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public V(Ljava/util/List;)Lcom/google/android/exoplayer2/k$b;
    .locals 0
    .param p1    # Ljava/util/List;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "[B>;)",
            "Lcom/google/android/exoplayer2/k$b;"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/google/android/exoplayer2/k$b;->m:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public W(Ljava/lang/String;)Lcom/google/android/exoplayer2/k$b;
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/google/android/exoplayer2/k$b;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public X(Ljava/lang/String;)Lcom/google/android/exoplayer2/k$b;
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/google/android/exoplayer2/k$b;->c:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public Y(I)Lcom/google/android/exoplayer2/k$b;
    .locals 0

    .line 1
    iput p1, p0, Lcom/google/android/exoplayer2/k$b;->l:I

    .line 2
    .line 3
    return-object p0
.end method

.method public Z(Lcom/google/android/exoplayer2/metadata/Metadata;)Lcom/google/android/exoplayer2/k$b;
    .locals 0
    .param p1    # Lcom/google/android/exoplayer2/metadata/Metadata;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/google/android/exoplayer2/k$b;->i:Lcom/google/android/exoplayer2/metadata/Metadata;

    .line 2
    .line 3
    return-object p0
.end method

.method public a0(I)Lcom/google/android/exoplayer2/k$b;
    .locals 0

    .line 1
    iput p1, p0, Lcom/google/android/exoplayer2/k$b;->z:I

    .line 2
    .line 3
    return-object p0
.end method

.method public b0(I)Lcom/google/android/exoplayer2/k$b;
    .locals 0

    .line 1
    iput p1, p0, Lcom/google/android/exoplayer2/k$b;->g:I

    .line 2
    .line 3
    return-object p0
.end method

.method public c0(F)Lcom/google/android/exoplayer2/k$b;
    .locals 0

    .line 1
    iput p1, p0, Lcom/google/android/exoplayer2/k$b;->t:F

    .line 2
    .line 3
    return-object p0
.end method

.method public d0([B)Lcom/google/android/exoplayer2/k$b;
    .locals 0
    .param p1    # [B
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/google/android/exoplayer2/k$b;->u:[B

    .line 2
    .line 3
    return-object p0
.end method

.method public e0(I)Lcom/google/android/exoplayer2/k$b;
    .locals 0

    .line 1
    iput p1, p0, Lcom/google/android/exoplayer2/k$b;->e:I

    .line 2
    .line 3
    return-object p0
.end method

.method public f0(I)Lcom/google/android/exoplayer2/k$b;
    .locals 0

    .line 1
    iput p1, p0, Lcom/google/android/exoplayer2/k$b;->s:I

    .line 2
    .line 3
    return-object p0
.end method

.method public g0(Ljava/lang/String;)Lcom/google/android/exoplayer2/k$b;
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/google/android/exoplayer2/k$b;->k:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public h0(I)Lcom/google/android/exoplayer2/k$b;
    .locals 0

    .line 1
    iput p1, p0, Lcom/google/android/exoplayer2/k$b;->y:I

    .line 2
    .line 3
    return-object p0
.end method

.method public i0(I)Lcom/google/android/exoplayer2/k$b;
    .locals 0

    .line 1
    iput p1, p0, Lcom/google/android/exoplayer2/k$b;->d:I

    .line 2
    .line 3
    return-object p0
.end method

.method public j0(I)Lcom/google/android/exoplayer2/k$b;
    .locals 0

    .line 1
    iput p1, p0, Lcom/google/android/exoplayer2/k$b;->v:I

    .line 2
    .line 3
    return-object p0
.end method

.method public k0(J)Lcom/google/android/exoplayer2/k$b;
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/google/android/exoplayer2/k$b;->o:J

    .line 2
    .line 3
    return-object p0
.end method

.method public l0(I)Lcom/google/android/exoplayer2/k$b;
    .locals 0

    .line 1
    iput p1, p0, Lcom/google/android/exoplayer2/k$b;->D:I

    .line 2
    .line 3
    return-object p0
.end method

.method public m0(I)Lcom/google/android/exoplayer2/k$b;
    .locals 0

    .line 1
    iput p1, p0, Lcom/google/android/exoplayer2/k$b;->E:I

    .line 2
    .line 3
    return-object p0
.end method

.method public n0(I)Lcom/google/android/exoplayer2/k$b;
    .locals 0

    .line 1
    iput p1, p0, Lcom/google/android/exoplayer2/k$b;->p:I

    .line 2
    .line 3
    return-object p0
.end method
