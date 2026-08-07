.class public final Ll/sug0;
.super Ll/wkg0;
.source "SourceFile"


# instance fields
.field public e:Ll/yeg0;

.field public f:Landroid/util/SparseArray;


# direct methods
.method public constructor <init>(I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/wkg0;-><init>(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final a(Ll/bog0;)V
    .locals 6

    .line 1
    iput-object p1, p0, Ll/wkg0;->b:Ll/bog0;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/bog0;->e()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    iput-wide v0, p0, Ll/wkg0;->c:J

    .line 8
    .line 9
    new-instance v0, Landroid/util/SparseArray;

    .line 10
    .line 11
    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    .line 12
    .line 13
    .line 14
    iget-object v1, p1, Ll/bog0;->g:Ljava/util/ArrayList;

    .line 15
    .line 16
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    const/4 v2, 0x0

    .line 21
    move v3, v2

    .line 22
    :goto_0
    if-ge v3, v1, :cond_0

    .line 23
    .line 24
    iget-object v4, p1, Ll/bog0;->g:Ljava/util/ArrayList;

    .line 25
    .line 26
    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v4

    .line 30
    check-cast v4, Ll/akg0;

    .line 31
    .line 32
    iget-object v4, v4, Ll/akg0;->c:Ljava/util/concurrent/atomic/AtomicLong;

    .line 33
    .line 34
    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    .line 35
    .line 36
    .line 37
    move-result-wide v4

    .line 38
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 39
    .line 40
    .line 41
    move-result-object v4

    .line 42
    invoke-virtual {v0, v3, v4}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 43
    .line 44
    .line 45
    add-int/lit8 v3, v3, 0x1

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_0
    iput-object v0, p0, Ll/wkg0;->d:Landroid/util/SparseArray;

    .line 49
    .line 50
    new-instance v0, Ll/yeg0;

    .line 51
    .line 52
    invoke-direct {v0}, Ll/yeg0;-><init>()V

    .line 53
    .line 54
    .line 55
    iput-object v0, p0, Ll/sug0;->e:Ll/yeg0;

    .line 56
    .line 57
    new-instance v0, Landroid/util/SparseArray;

    .line 58
    .line 59
    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    .line 60
    .line 61
    .line 62
    iput-object v0, p0, Ll/sug0;->f:Landroid/util/SparseArray;

    .line 63
    .line 64
    iget-object p1, p1, Ll/bog0;->g:Ljava/util/ArrayList;

    .line 65
    .line 66
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 67
    .line 68
    .line 69
    move-result p1

    .line 70
    :goto_1
    if-ge v2, p1, :cond_1

    .line 71
    .line 72
    iget-object v0, p0, Ll/sug0;->f:Landroid/util/SparseArray;

    .line 73
    .line 74
    new-instance v1, Ll/yeg0;

    .line 75
    .line 76
    invoke-direct {v1}, Ll/yeg0;-><init>()V

    .line 77
    .line 78
    .line 79
    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 80
    .line 81
    .line 82
    add-int/lit8 v2, v2, 0x1

    .line 83
    .line 84
    goto :goto_1

    .line 85
    :cond_1
    return-void
.end method
