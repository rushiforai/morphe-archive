.class public Ll/zvk;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/zvk$a;,
        Ll/zvk$b;
    }
.end annotation


# static fields
.field public static A:I = 0x1

.field public static B:I = 0x10

.field public static C:I = 0x100

.field public static D:I = 0x1000

.field public static E:I = 0x100000


# instance fields
.field public a:Ljava/lang/String;

.field public b:[I

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

.field public o:J

.field public p:Ll/zvk$a;

.field public q:Ll/zvk$b;

.field public r:Z

.field public s:Z

.field public t:I

.field public u:I

.field public v:Landroid/view/View;

.field public w:Z

.field public x:Z

.field public y:I

.field public z:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Ll/zvk;->a:Ljava/lang/String;

    .line 7
    .line 8
    const/4 v0, -0x1

    .line 9
    iput v0, p0, Ll/zvk;->u:I

    .line 10
    .line 11
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    iget v1, v1, Landroid/util/DisplayMetrics;->density:F

    .line 20
    .line 21
    float-to-int v1, v1

    .line 22
    mul-int/lit8 v1, v1, 0xa

    .line 23
    .line 24
    iput v1, p0, Ll/zvk;->h:I

    .line 25
    .line 26
    iput v1, p0, Ll/zvk;->j:I

    .line 27
    .line 28
    iput v1, p0, Ll/zvk;->i:I

    .line 29
    .line 30
    iput v1, p0, Ll/zvk;->g:I

    .line 31
    .line 32
    sget v1, Ll/zvk;->A:I

    .line 33
    .line 34
    sget v2, Ll/zvk;->E:I

    .line 35
    .line 36
    or-int/2addr v1, v2

    .line 37
    iput v1, p0, Ll/zvk;->d:I

    .line 38
    .line 39
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    iget v1, v1, Landroid/util/DisplayMetrics;->density:F

    .line 48
    .line 49
    float-to-int v1, v1

    .line 50
    mul-int/lit8 v1, v1, 0x9

    .line 51
    .line 52
    iput v1, p0, Ll/zvk;->l:I

    .line 53
    .line 54
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    iget v1, v1, Landroid/util/DisplayMetrics;->density:F

    .line 63
    .line 64
    float-to-int v1, v1

    .line 65
    mul-int/lit8 v1, v1, 0x5

    .line 66
    .line 67
    iput v1, p0, Ll/zvk;->n:I

    .line 68
    .line 69
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    iget p1, p1, Landroid/util/DisplayMetrics;->density:F

    .line 78
    .line 79
    float-to-int p1, p1

    .line 80
    mul-int/lit8 p1, p1, 0x5

    .line 81
    .line 82
    iput p1, p0, Ll/zvk;->k:I

    .line 83
    .line 84
    const/16 p1, 0xe

    .line 85
    .line 86
    iput p1, p0, Ll/zvk;->c:I

    .line 87
    .line 88
    const/16 p1, 0x53

    .line 89
    .line 90
    iput p1, p0, Ll/zvk;->m:I

    .line 91
    .line 92
    const-wide/16 v1, -0x1

    .line 93
    .line 94
    iput-wide v1, p0, Ll/zvk;->o:J

    .line 95
    .line 96
    const/4 p1, 0x0

    .line 97
    iput-boolean p1, p0, Ll/zvk;->r:Z

    .line 98
    .line 99
    const p1, -0x86acd

    .line 100
    .line 101
    .line 102
    const v1, -0x83ccd

    .line 103
    .line 104
    .line 105
    filled-new-array {p1, v1}, [I

    .line 106
    .line 107
    .line 108
    move-result-object p1

    .line 109
    iput-object p1, p0, Ll/zvk;->b:[I

    .line 110
    .line 111
    const/4 p1, 0x1

    .line 112
    iput-boolean p1, p0, Ll/zvk;->s:Z

    .line 113
    .line 114
    iput v0, p0, Ll/zvk;->t:I

    .line 115
    .line 116
    iput-boolean p1, p0, Ll/zvk;->x:Z

    .line 117
    .line 118
    return-void
.end method


# virtual methods
.method public a(J)Ll/zvk;
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v0, p1, v0

    .line 4
    .line 5
    if-gtz v0, :cond_0

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    iput-wide p1, p0, Ll/zvk;->o:J

    .line 9
    .line 10
    return-object p0
.end method

.method public b(Ll/zvk$a;)Ll/zvk;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/zvk;->p:Ll/zvk$a;

    .line 2
    .line 3
    return-object p0
.end method

.method public c(Z)Ll/zvk;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/zvk;->r:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public d(Ll/zvk$b;)Ll/zvk;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/zvk;->q:Ll/zvk$b;

    .line 2
    .line 3
    return-object p0
.end method

.method public varargs e([I)Ll/zvk;
    .locals 1

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    array-length v0, p1

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    goto :goto_0

    .line 7
    :cond_0
    iput-object p1, p0, Ll/zvk;->b:[I

    .line 8
    .line 9
    :cond_1
    :goto_0
    return-object p0
.end method

.method public f(I)Ll/zvk;
    .locals 0

    .line 1
    iput p1, p0, Ll/zvk;->l:I

    .line 2
    .line 3
    return-object p0
.end method

.method public g(II)Ll/zvk;
    .locals 1

    .line 1
    sget v0, Ll/zvk;->B:I

    .line 2
    .line 3
    if-eq p1, v0, :cond_0

    .line 4
    .line 5
    sget v0, Ll/zvk;->C:I

    .line 6
    .line 7
    if-ne p1, v0, :cond_1

    .line 8
    .line 9
    :cond_0
    if-gtz p2, :cond_2

    .line 10
    .line 11
    :cond_1
    return-object p0

    .line 12
    :cond_2
    iget v0, p0, Ll/zvk;->d:I

    .line 13
    .line 14
    or-int/2addr p1, v0

    .line 15
    iput p1, p0, Ll/zvk;->d:I

    .line 16
    .line 17
    iput p2, p0, Ll/zvk;->u:I

    .line 18
    .line 19
    return-object p0
.end method

.method public h(I)Ll/zvk;
    .locals 0

    .line 1
    iput p1, p0, Ll/zvk;->m:I

    .line 2
    .line 3
    return-object p0
.end method

.method public i(I)Ll/zvk;
    .locals 0

    .line 1
    iput p1, p0, Ll/zvk;->d:I

    .line 2
    .line 3
    return-object p0
.end method

.method public j(Landroid/view/View;)Ll/zvk;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/zvk;->v:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method public k(Z)Ll/zvk;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/zvk;->x:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public l(I)Ll/zvk;
    .locals 0

    .line 1
    iput p1, p0, Ll/zvk;->z:I

    .line 2
    .line 3
    iput p1, p0, Ll/zvk;->y:I

    .line 4
    .line 5
    return-object p0
.end method

.method public m(I)Ll/zvk;
    .locals 0

    .line 1
    iput p1, p0, Ll/zvk;->y:I

    .line 2
    .line 3
    return-object p0
.end method

.method public n(I)Ll/zvk;
    .locals 0

    .line 1
    iput p1, p0, Ll/zvk;->z:I

    .line 2
    .line 3
    return-object p0
.end method

.method public o(I)Ll/zvk;
    .locals 0

    .line 1
    iput p1, p0, Ll/zvk;->f:I

    .line 2
    .line 3
    return-object p0
.end method

.method public p(I)Ll/zvk;
    .locals 0

    .line 1
    iput p1, p0, Ll/zvk;->n:I

    .line 2
    .line 3
    return-object p0
.end method

.method public q(I)Ll/zvk;
    .locals 0

    .line 1
    iput p1, p0, Ll/zvk;->t:I

    .line 2
    .line 3
    return-object p0
.end method

.method public r(Z)Ll/zvk;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/zvk;->w:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public s(IIII)Ll/zvk;
    .locals 0

    .line 1
    iput p1, p0, Ll/zvk;->g:I

    .line 2
    .line 3
    iput p2, p0, Ll/zvk;->h:I

    .line 4
    .line 5
    iput p3, p0, Ll/zvk;->i:I

    .line 6
    .line 7
    iput p4, p0, Ll/zvk;->j:I

    .line 8
    .line 9
    return-object p0
.end method

.method public t(I)Ll/zvk;
    .locals 0

    .line 1
    iput p1, p0, Ll/zvk;->c:I

    .line 2
    .line 3
    return-object p0
.end method

.method public u(Ljava/lang/String;)Ll/zvk;
    .locals 1

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
    return-object p0

    .line 8
    :cond_0
    iput-object p1, p0, Ll/zvk;->a:Ljava/lang/String;

    .line 9
    .line 10
    return-object p0
.end method

.method public v(Z)Ll/zvk;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/zvk;->s:Z

    .line 2
    .line 3
    return-object p0
.end method
