.class public Landroidx/gridlayout/widget/GridLayout;
.super Landroid/view/ViewGroup;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/gridlayout/widget/GridLayout$i;,
        Landroidx/gridlayout/widget/GridLayout$q;,
        Landroidx/gridlayout/widget/GridLayout$m;,
        Landroidx/gridlayout/widget/GridLayout$l;,
        Landroidx/gridlayout/widget/GridLayout$p;,
        Landroidx/gridlayout/widget/GridLayout$Assoc;,
        Landroidx/gridlayout/widget/GridLayout$o;,
        Landroidx/gridlayout/widget/GridLayout$j;,
        Landroidx/gridlayout/widget/GridLayout$n;,
        Landroidx/gridlayout/widget/GridLayout$k;
    }
.end annotation


# static fields
.field public static final A:Landroidx/gridlayout/widget/GridLayout$i;

.field public static final B:Landroidx/gridlayout/widget/GridLayout$i;

.field public static final C:Landroidx/gridlayout/widget/GridLayout$i;

.field public static final i:Landroid/util/Printer;

.field public static final j:Landroid/util/Printer;

.field public static final k:I

.field public static final l:I

.field public static final m:I

.field public static final n:I

.field public static final o:I

.field public static final p:I

.field public static final q:I

.field public static final r:Landroidx/gridlayout/widget/GridLayout$i;

.field public static final s:Landroidx/gridlayout/widget/GridLayout$i;

.field public static final t:Landroidx/gridlayout/widget/GridLayout$i;

.field public static final u:Landroidx/gridlayout/widget/GridLayout$i;

.field public static final v:Landroidx/gridlayout/widget/GridLayout$i;

.field public static final w:Landroidx/gridlayout/widget/GridLayout$i;

.field public static final x:Landroidx/gridlayout/widget/GridLayout$i;

.field public static final y:Landroidx/gridlayout/widget/GridLayout$i;

.field public static final z:Landroidx/gridlayout/widget/GridLayout$i;


# instance fields
.field public final a:Landroidx/gridlayout/widget/GridLayout$k;

.field public final b:Landroidx/gridlayout/widget/GridLayout$k;

.field public c:I

.field public d:Z

.field public e:I

.field public f:I

.field public g:I

.field public h:Landroid/util/Printer;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Landroid/util/LogPrinter;

    .line 2
    .line 3
    const-class v1, Landroidx/gridlayout/widget/GridLayout;

    .line 4
    .line 5
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const/4 v2, 0x3

    .line 10
    invoke-direct {v0, v2, v1}, Landroid/util/LogPrinter;-><init>(ILjava/lang/String;)V

    .line 11
    .line 12
    .line 13
    sput-object v0, Landroidx/gridlayout/widget/GridLayout;->i:Landroid/util/Printer;

    .line 14
    .line 15
    new-instance v0, Landroidx/gridlayout/widget/GridLayout$a;

    .line 16
    .line 17
    invoke-direct {v0}, Landroidx/gridlayout/widget/GridLayout$a;-><init>()V

    .line 18
    .line 19
    .line 20
    sput-object v0, Landroidx/gridlayout/widget/GridLayout;->j:Landroid/util/Printer;

    .line 21
    .line 22
    sget v0, Ll/dic0;->e:I

    .line 23
    .line 24
    sput v0, Landroidx/gridlayout/widget/GridLayout;->k:I

    .line 25
    .line 26
    sget v0, Ll/dic0;->f:I

    .line 27
    .line 28
    sput v0, Landroidx/gridlayout/widget/GridLayout;->l:I

    .line 29
    .line 30
    sget v0, Ll/dic0;->c:I

    .line 31
    .line 32
    sput v0, Landroidx/gridlayout/widget/GridLayout;->m:I

    .line 33
    .line 34
    sget v0, Ll/dic0;->h:I

    .line 35
    .line 36
    sput v0, Landroidx/gridlayout/widget/GridLayout;->n:I

    .line 37
    .line 38
    sget v0, Ll/dic0;->b:I

    .line 39
    .line 40
    sput v0, Landroidx/gridlayout/widget/GridLayout;->o:I

    .line 41
    .line 42
    sget v0, Ll/dic0;->g:I

    .line 43
    .line 44
    sput v0, Landroidx/gridlayout/widget/GridLayout;->p:I

    .line 45
    .line 46
    sget v0, Ll/dic0;->d:I

    .line 47
    .line 48
    sput v0, Landroidx/gridlayout/widget/GridLayout;->q:I

    .line 49
    .line 50
    new-instance v0, Landroidx/gridlayout/widget/GridLayout$b;

    .line 51
    .line 52
    invoke-direct {v0}, Landroidx/gridlayout/widget/GridLayout$b;-><init>()V

    .line 53
    .line 54
    .line 55
    sput-object v0, Landroidx/gridlayout/widget/GridLayout;->r:Landroidx/gridlayout/widget/GridLayout$i;

    .line 56
    .line 57
    new-instance v0, Landroidx/gridlayout/widget/GridLayout$c;

    .line 58
    .line 59
    invoke-direct {v0}, Landroidx/gridlayout/widget/GridLayout$c;-><init>()V

    .line 60
    .line 61
    .line 62
    sput-object v0, Landroidx/gridlayout/widget/GridLayout;->s:Landroidx/gridlayout/widget/GridLayout$i;

    .line 63
    .line 64
    new-instance v1, Landroidx/gridlayout/widget/GridLayout$d;

    .line 65
    .line 66
    invoke-direct {v1}, Landroidx/gridlayout/widget/GridLayout$d;-><init>()V

    .line 67
    .line 68
    .line 69
    sput-object v1, Landroidx/gridlayout/widget/GridLayout;->t:Landroidx/gridlayout/widget/GridLayout$i;

    .line 70
    .line 71
    sput-object v0, Landroidx/gridlayout/widget/GridLayout;->u:Landroidx/gridlayout/widget/GridLayout$i;

    .line 72
    .line 73
    sput-object v1, Landroidx/gridlayout/widget/GridLayout;->v:Landroidx/gridlayout/widget/GridLayout$i;

    .line 74
    .line 75
    sput-object v0, Landroidx/gridlayout/widget/GridLayout;->w:Landroidx/gridlayout/widget/GridLayout$i;

    .line 76
    .line 77
    sput-object v1, Landroidx/gridlayout/widget/GridLayout;->x:Landroidx/gridlayout/widget/GridLayout$i;

    .line 78
    .line 79
    invoke-static {v0, v1}, Landroidx/gridlayout/widget/GridLayout;->h(Landroidx/gridlayout/widget/GridLayout$i;Landroidx/gridlayout/widget/GridLayout$i;)Landroidx/gridlayout/widget/GridLayout$i;

    .line 80
    .line 81
    .line 82
    move-result-object v2

    .line 83
    sput-object v2, Landroidx/gridlayout/widget/GridLayout;->y:Landroidx/gridlayout/widget/GridLayout$i;

    .line 84
    .line 85
    invoke-static {v1, v0}, Landroidx/gridlayout/widget/GridLayout;->h(Landroidx/gridlayout/widget/GridLayout$i;Landroidx/gridlayout/widget/GridLayout$i;)Landroidx/gridlayout/widget/GridLayout$i;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    sput-object v0, Landroidx/gridlayout/widget/GridLayout;->z:Landroidx/gridlayout/widget/GridLayout$i;

    .line 90
    .line 91
    new-instance v0, Landroidx/gridlayout/widget/GridLayout$f;

    .line 92
    .line 93
    invoke-direct {v0}, Landroidx/gridlayout/widget/GridLayout$f;-><init>()V

    .line 94
    .line 95
    .line 96
    sput-object v0, Landroidx/gridlayout/widget/GridLayout;->A:Landroidx/gridlayout/widget/GridLayout$i;

    .line 97
    .line 98
    new-instance v0, Landroidx/gridlayout/widget/GridLayout$g;

    .line 99
    .line 100
    invoke-direct {v0}, Landroidx/gridlayout/widget/GridLayout$g;-><init>()V

    .line 101
    .line 102
    .line 103
    sput-object v0, Landroidx/gridlayout/widget/GridLayout;->B:Landroidx/gridlayout/widget/GridLayout$i;

    .line 104
    .line 105
    new-instance v0, Landroidx/gridlayout/widget/GridLayout$h;

    .line 106
    .line 107
    invoke-direct {v0}, Landroidx/gridlayout/widget/GridLayout$h;-><init>()V

    .line 108
    .line 109
    .line 110
    sput-object v0, Landroidx/gridlayout/widget/GridLayout;->C:Landroidx/gridlayout/widget/GridLayout$i;

    .line 111
    .line 112
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 125
    invoke-direct {p0, p1, v0}, Landroidx/gridlayout/widget/GridLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 124
    invoke-direct {p0, p1, p2, v0}, Landroidx/gridlayout/widget/GridLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 3

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    new-instance p3, Landroidx/gridlayout/widget/GridLayout$k;

    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    invoke-direct {p3, p0, v0}, Landroidx/gridlayout/widget/GridLayout$k;-><init>(Landroidx/gridlayout/widget/GridLayout;Z)V

    .line 8
    .line 9
    .line 10
    iput-object p3, p0, Landroidx/gridlayout/widget/GridLayout;->a:Landroidx/gridlayout/widget/GridLayout$k;

    .line 11
    .line 12
    new-instance p3, Landroidx/gridlayout/widget/GridLayout$k;

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    invoke-direct {p3, p0, v1}, Landroidx/gridlayout/widget/GridLayout$k;-><init>(Landroidx/gridlayout/widget/GridLayout;Z)V

    .line 16
    .line 17
    .line 18
    iput-object p3, p0, Landroidx/gridlayout/widget/GridLayout;->b:Landroidx/gridlayout/widget/GridLayout$k;

    .line 19
    .line 20
    iput v1, p0, Landroidx/gridlayout/widget/GridLayout;->c:I

    .line 21
    .line 22
    iput-boolean v1, p0, Landroidx/gridlayout/widget/GridLayout;->d:Z

    .line 23
    .line 24
    iput v0, p0, Landroidx/gridlayout/widget/GridLayout;->e:I

    .line 25
    .line 26
    iput v1, p0, Landroidx/gridlayout/widget/GridLayout;->g:I

    .line 27
    .line 28
    sget-object p3, Landroidx/gridlayout/widget/GridLayout;->i:Landroid/util/Printer;

    .line 29
    .line 30
    iput-object p3, p0, Landroidx/gridlayout/widget/GridLayout;->h:Landroid/util/Printer;

    .line 31
    .line 32
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 33
    .line 34
    .line 35
    move-result-object p3

    .line 36
    sget v2, Ll/pac0;->a:I

    .line 37
    .line 38
    invoke-virtual {p3, v2}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    .line 39
    .line 40
    .line 41
    move-result p3

    .line 42
    iput p3, p0, Landroidx/gridlayout/widget/GridLayout;->f:I

    .line 43
    .line 44
    sget-object p3, Ll/dic0;->a:[I

    .line 45
    .line 46
    invoke-virtual {p1, p2, p3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    :try_start_0
    sget p2, Landroidx/gridlayout/widget/GridLayout;->l:I

    .line 51
    .line 52
    const/high16 p3, -0x80000000

    .line 53
    .line 54
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 55
    .line 56
    .line 57
    move-result p2

    .line 58
    invoke-virtual {p0, p2}, Landroidx/gridlayout/widget/GridLayout;->setRowCount(I)V

    .line 59
    .line 60
    .line 61
    sget p2, Landroidx/gridlayout/widget/GridLayout;->m:I

    .line 62
    .line 63
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 64
    .line 65
    .line 66
    move-result p2

    .line 67
    invoke-virtual {p0, p2}, Landroidx/gridlayout/widget/GridLayout;->setColumnCount(I)V

    .line 68
    .line 69
    .line 70
    sget p2, Landroidx/gridlayout/widget/GridLayout;->k:I

    .line 71
    .line 72
    invoke-virtual {p1, p2, v1}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 73
    .line 74
    .line 75
    move-result p2

    .line 76
    invoke-virtual {p0, p2}, Landroidx/gridlayout/widget/GridLayout;->setOrientation(I)V

    .line 77
    .line 78
    .line 79
    sget p2, Landroidx/gridlayout/widget/GridLayout;->n:I

    .line 80
    .line 81
    invoke-virtual {p1, p2, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 82
    .line 83
    .line 84
    move-result p2

    .line 85
    invoke-virtual {p0, p2}, Landroidx/gridlayout/widget/GridLayout;->setUseDefaultMargins(Z)V

    .line 86
    .line 87
    .line 88
    sget p2, Landroidx/gridlayout/widget/GridLayout;->o:I

    .line 89
    .line 90
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 91
    .line 92
    .line 93
    move-result p2

    .line 94
    invoke-virtual {p0, p2}, Landroidx/gridlayout/widget/GridLayout;->setAlignmentMode(I)V

    .line 95
    .line 96
    .line 97
    sget p2, Landroidx/gridlayout/widget/GridLayout;->p:I

    .line 98
    .line 99
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 100
    .line 101
    .line 102
    move-result p2

    .line 103
    invoke-virtual {p0, p2}, Landroidx/gridlayout/widget/GridLayout;->setRowOrderPreserved(Z)V

    .line 104
    .line 105
    .line 106
    sget p2, Landroidx/gridlayout/widget/GridLayout;->q:I

    .line 107
    .line 108
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 109
    .line 110
    .line 111
    move-result p2

    .line 112
    invoke-virtual {p0, p2}, Landroidx/gridlayout/widget/GridLayout;->setColumnOrderPreserved(Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 113
    .line 114
    .line 115
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 116
    .line 117
    .line 118
    return-void

    .line 119
    :catchall_0
    move-exception p0

    .line 120
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 121
    .line 122
    .line 123
    throw p0
.end method

.method public static A([II)I
    .locals 3

    .line 1
    array-length v0, p0

    .line 2
    const/4 v1, 0x0

    .line 3
    :goto_0
    if-ge v1, v0, :cond_0

    .line 4
    .line 5
    aget v2, p0, v1

    .line 6
    .line 7
    invoke-static {p1, v2}, Ljava/lang/Math;->max(II)I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    add-int/lit8 v1, v1, 0x1

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    return p1
.end method

.method public static D([IIII)V
    .locals 1

    .line 1
    array-length v0, p0

    .line 2
    invoke-static {p1, v0}, Ljava/lang/Math;->min(II)I

    .line 3
    .line 4
    .line 5
    move-result p1

    .line 6
    invoke-static {p2, v0}, Ljava/lang/Math;->min(II)I

    .line 7
    .line 8
    .line 9
    move-result p2

    .line 10
    invoke-static {p0, p1, p2, p3}, Ljava/util/Arrays;->fill([IIII)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static E(Landroidx/gridlayout/widget/GridLayout$n;IIII)V
    .locals 1

    .line 1
    new-instance v0, Landroidx/gridlayout/widget/GridLayout$m;

    .line 2
    .line 3
    add-int/2addr p2, p1

    .line 4
    invoke-direct {v0, p1, p2}, Landroidx/gridlayout/widget/GridLayout$m;-><init>(II)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroidx/gridlayout/widget/GridLayout$n;->d(Landroidx/gridlayout/widget/GridLayout$m;)V

    .line 8
    .line 9
    .line 10
    new-instance p1, Landroidx/gridlayout/widget/GridLayout$m;

    .line 11
    .line 12
    add-int/2addr p4, p3

    .line 13
    invoke-direct {p1, p3, p4}, Landroidx/gridlayout/widget/GridLayout$m;-><init>(II)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, p1}, Landroidx/gridlayout/widget/GridLayout$n;->c(Landroidx/gridlayout/widget/GridLayout$m;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public static F(I)Landroidx/gridlayout/widget/GridLayout$q;
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-static {p0, v0}, Landroidx/gridlayout/widget/GridLayout;->G(II)Landroidx/gridlayout/widget/GridLayout$q;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public static G(II)Landroidx/gridlayout/widget/GridLayout$q;
    .locals 1

    .line 1
    sget-object v0, Landroidx/gridlayout/widget/GridLayout;->r:Landroidx/gridlayout/widget/GridLayout$i;

    .line 2
    .line 3
    invoke-static {p0, p1, v0}, Landroidx/gridlayout/widget/GridLayout;->H(IILandroidx/gridlayout/widget/GridLayout$i;)Landroidx/gridlayout/widget/GridLayout$q;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static H(IILandroidx/gridlayout/widget/GridLayout$i;)Landroidx/gridlayout/widget/GridLayout$q;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, p1, p2, v0}, Landroidx/gridlayout/widget/GridLayout;->I(IILandroidx/gridlayout/widget/GridLayout$i;F)Landroidx/gridlayout/widget/GridLayout$q;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public static I(IILandroidx/gridlayout/widget/GridLayout$i;F)Landroidx/gridlayout/widget/GridLayout$q;
    .locals 6

    .line 1
    new-instance v0, Landroidx/gridlayout/widget/GridLayout$q;

    .line 2
    .line 3
    const/high16 v1, -0x80000000

    .line 4
    .line 5
    if-eq p0, v1, :cond_0

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    :goto_0
    move v2, p0

    .line 9
    move v3, p1

    .line 10
    move-object v4, p2

    .line 11
    move v5, p3

    .line 12
    goto :goto_1

    .line 13
    :cond_0
    const/4 v1, 0x0

    .line 14
    goto :goto_0

    .line 15
    :goto_1
    invoke-direct/range {v0 .. v5}, Landroidx/gridlayout/widget/GridLayout$q;-><init>(ZIILandroidx/gridlayout/widget/GridLayout$i;F)V

    .line 16
    .line 17
    .line 18
    return-object v0
.end method

.method public static a(II)I
    .locals 0

    .line 1
    add-int/2addr p1, p0

    .line 2
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 3
    .line 4
    .line 5
    move-result p1

    .line 6
    invoke-static {p0}, Landroid/view/View$MeasureSpec;->getMode(I)I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    invoke-static {p1, p0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    return p0
.end method

.method public static b([Ljava/lang/Object;[Ljava/lang/Object;)[Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([TT;[TT;)[TT;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    array-length v1, p0

    .line 10
    array-length v2, p1

    .line 11
    add-int/2addr v1, v2

    .line 12
    invoke-static {v0, v1}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, [Ljava/lang/Object;

    .line 17
    .line 18
    array-length v1, p0

    .line 19
    const/4 v2, 0x0

    .line 20
    invoke-static {p0, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 21
    .line 22
    .line 23
    array-length p0, p0

    .line 24
    array-length v1, p1

    .line 25
    invoke-static {p1, v2, v0, p0, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 26
    .line 27
    .line 28
    return-object v0
.end method

.method public static c(I)Z
    .locals 0

    .line 1
    and-int/lit8 p0, p0, 0x2

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public static e(Landroidx/gridlayout/widget/GridLayout$m;ZI)I
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroidx/gridlayout/widget/GridLayout$m;->b()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez p2, :cond_0

    .line 6
    .line 7
    return v0

    .line 8
    :cond_0
    if-eqz p1, :cond_1

    .line 9
    .line 10
    iget p0, p0, Landroidx/gridlayout/widget/GridLayout$m;->a:I

    .line 11
    .line 12
    invoke-static {p0, p2}, Ljava/lang/Math;->min(II)I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    goto :goto_0

    .line 17
    :cond_1
    const/4 p0, 0x0

    .line 18
    :goto_0
    sub-int/2addr p2, p0

    .line 19
    invoke-static {v0, p2}, Ljava/lang/Math;->min(II)I

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    return p0
.end method

.method public static h(Landroidx/gridlayout/widget/GridLayout$i;Landroidx/gridlayout/widget/GridLayout$i;)Landroidx/gridlayout/widget/GridLayout$i;
    .locals 1

    .line 1
    new-instance v0, Landroidx/gridlayout/widget/GridLayout$e;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Landroidx/gridlayout/widget/GridLayout$e;-><init>(Landroidx/gridlayout/widget/GridLayout$i;Landroidx/gridlayout/widget/GridLayout$i;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static i([IIII)Z
    .locals 2

    .line 1
    array-length v0, p0

    .line 2
    const/4 v1, 0x0

    .line 3
    if-le p3, v0, :cond_0

    .line 4
    .line 5
    return v1

    .line 6
    :cond_0
    :goto_0
    if-ge p2, p3, :cond_2

    .line 7
    .line 8
    aget v0, p0, p2

    .line 9
    .line 10
    if-le v0, p1, :cond_1

    .line 11
    .line 12
    return v1

    .line 13
    :cond_1
    add-int/lit8 p2, p2, 0x1

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_2
    const/4 p0, 0x1

    .line 17
    return p0
.end method

.method public static m(IZ)Landroidx/gridlayout/widget/GridLayout$i;
    .locals 3

    .line 1
    const/4 v0, 0x7

    .line 2
    if-eqz p1, :cond_0

    .line 3
    .line 4
    move v1, v0

    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const/16 v1, 0x70

    .line 7
    .line 8
    :goto_0
    if-eqz p1, :cond_1

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    goto :goto_1

    .line 12
    :cond_1
    const/4 v2, 0x4

    .line 13
    :goto_1
    and-int/2addr p0, v1

    .line 14
    shr-int/2addr p0, v2

    .line 15
    const/4 v1, 0x1

    .line 16
    if-eq p0, v1, :cond_9

    .line 17
    .line 18
    const/4 v1, 0x3

    .line 19
    if-eq p0, v1, :cond_7

    .line 20
    .line 21
    const/4 v1, 0x5

    .line 22
    if-eq p0, v1, :cond_5

    .line 23
    .line 24
    if-eq p0, v0, :cond_4

    .line 25
    .line 26
    const p1, 0x800003

    .line 27
    .line 28
    .line 29
    if-eq p0, p1, :cond_3

    .line 30
    .line 31
    const p1, 0x800005

    .line 32
    .line 33
    .line 34
    if-eq p0, p1, :cond_2

    .line 35
    .line 36
    sget-object p0, Landroidx/gridlayout/widget/GridLayout;->r:Landroidx/gridlayout/widget/GridLayout$i;

    .line 37
    .line 38
    return-object p0

    .line 39
    :cond_2
    sget-object p0, Landroidx/gridlayout/widget/GridLayout;->x:Landroidx/gridlayout/widget/GridLayout$i;

    .line 40
    .line 41
    return-object p0

    .line 42
    :cond_3
    sget-object p0, Landroidx/gridlayout/widget/GridLayout;->w:Landroidx/gridlayout/widget/GridLayout$i;

    .line 43
    .line 44
    return-object p0

    .line 45
    :cond_4
    sget-object p0, Landroidx/gridlayout/widget/GridLayout;->C:Landroidx/gridlayout/widget/GridLayout$i;

    .line 46
    .line 47
    return-object p0

    .line 48
    :cond_5
    if-eqz p1, :cond_6

    .line 49
    .line 50
    sget-object p0, Landroidx/gridlayout/widget/GridLayout;->z:Landroidx/gridlayout/widget/GridLayout$i;

    .line 51
    .line 52
    return-object p0

    .line 53
    :cond_6
    sget-object p0, Landroidx/gridlayout/widget/GridLayout;->v:Landroidx/gridlayout/widget/GridLayout$i;

    .line 54
    .line 55
    return-object p0

    .line 56
    :cond_7
    if-eqz p1, :cond_8

    .line 57
    .line 58
    sget-object p0, Landroidx/gridlayout/widget/GridLayout;->y:Landroidx/gridlayout/widget/GridLayout$i;

    .line 59
    .line 60
    return-object p0

    .line 61
    :cond_8
    sget-object p0, Landroidx/gridlayout/widget/GridLayout;->u:Landroidx/gridlayout/widget/GridLayout$i;

    .line 62
    .line 63
    return-object p0

    .line 64
    :cond_9
    sget-object p0, Landroidx/gridlayout/widget/GridLayout;->A:Landroidx/gridlayout/widget/GridLayout$i;

    .line 65
    .line 66
    return-object p0
.end method

.method public static w(Ljava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string p0, ". "

    .line 12
    .line 13
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    throw v0
.end method


# virtual methods
.method public final B(Landroid/view/View;IIII)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, p1, v0}, Landroidx/gridlayout/widget/GridLayout;->v(Landroid/view/View;Z)I

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    invoke-static {p2, v0, p4}, Landroid/view/ViewGroup;->getChildMeasureSpec(III)I

    .line 7
    .line 8
    .line 9
    move-result p2

    .line 10
    const/4 p4, 0x0

    .line 11
    invoke-virtual {p0, p1, p4}, Landroidx/gridlayout/widget/GridLayout;->v(Landroid/view/View;Z)I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    invoke-static {p3, p0, p5}, Landroid/view/ViewGroup;->getChildMeasureSpec(III)I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    invoke-virtual {p1, p2, p0}, Landroid/view/View;->measure(II)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final C(IIZ)V
    .locals 9

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    move v2, v1

    .line 7
    :goto_0
    if-ge v2, v0, :cond_7

    .line 8
    .line 9
    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v4

    .line 13
    invoke-virtual {v4}, Landroid/view/View;->getVisibility()I

    .line 14
    .line 15
    .line 16
    move-result v3

    .line 17
    const/16 v5, 0x8

    .line 18
    .line 19
    if-ne v3, v5, :cond_0

    .line 20
    .line 21
    move-object v3, p0

    .line 22
    move v5, p1

    .line 23
    move v6, p2

    .line 24
    goto/16 :goto_4

    .line 25
    .line 26
    :cond_0
    invoke-virtual {p0, v4}, Landroidx/gridlayout/widget/GridLayout;->q(Landroid/view/View;)Landroidx/gridlayout/widget/GridLayout$n;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    if-eqz p3, :cond_1

    .line 31
    .line 32
    iget v7, v3, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 33
    .line 34
    iget v8, v3, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 35
    .line 36
    move-object v3, p0

    .line 37
    move v5, p1

    .line 38
    move v6, p2

    .line 39
    invoke-virtual/range {v3 .. v8}, Landroidx/gridlayout/widget/GridLayout;->B(Landroid/view/View;IIII)V

    .line 40
    .line 41
    .line 42
    goto :goto_4

    .line 43
    :cond_1
    move v5, p1

    .line 44
    move v6, p2

    .line 45
    iget p1, p0, Landroidx/gridlayout/widget/GridLayout;->c:I

    .line 46
    .line 47
    if-nez p1, :cond_2

    .line 48
    .line 49
    const/4 p1, 0x1

    .line 50
    goto :goto_1

    .line 51
    :cond_2
    move p1, v1

    .line 52
    :goto_1
    if-eqz p1, :cond_3

    .line 53
    .line 54
    iget-object p2, v3, Landroidx/gridlayout/widget/GridLayout$n;->b:Landroidx/gridlayout/widget/GridLayout$q;

    .line 55
    .line 56
    goto :goto_2

    .line 57
    :cond_3
    iget-object p2, v3, Landroidx/gridlayout/widget/GridLayout$n;->a:Landroidx/gridlayout/widget/GridLayout$q;

    .line 58
    .line 59
    :goto_2
    invoke-virtual {p2, p1}, Landroidx/gridlayout/widget/GridLayout$q;->b(Z)Landroidx/gridlayout/widget/GridLayout$i;

    .line 60
    .line 61
    .line 62
    move-result-object v7

    .line 63
    sget-object v8, Landroidx/gridlayout/widget/GridLayout;->C:Landroidx/gridlayout/widget/GridLayout$i;

    .line 64
    .line 65
    if-ne v7, v8, :cond_6

    .line 66
    .line 67
    iget-object p2, p2, Landroidx/gridlayout/widget/GridLayout$q;->b:Landroidx/gridlayout/widget/GridLayout$m;

    .line 68
    .line 69
    if-eqz p1, :cond_4

    .line 70
    .line 71
    iget-object v7, p0, Landroidx/gridlayout/widget/GridLayout;->a:Landroidx/gridlayout/widget/GridLayout$k;

    .line 72
    .line 73
    goto :goto_3

    .line 74
    :cond_4
    iget-object v7, p0, Landroidx/gridlayout/widget/GridLayout;->b:Landroidx/gridlayout/widget/GridLayout$k;

    .line 75
    .line 76
    :goto_3
    invoke-virtual {v7}, Landroidx/gridlayout/widget/GridLayout$k;->u()[I

    .line 77
    .line 78
    .line 79
    move-result-object v7

    .line 80
    iget v8, p2, Landroidx/gridlayout/widget/GridLayout$m;->b:I

    .line 81
    .line 82
    aget v8, v7, v8

    .line 83
    .line 84
    iget p2, p2, Landroidx/gridlayout/widget/GridLayout$m;->a:I

    .line 85
    .line 86
    aget p2, v7, p2

    .line 87
    .line 88
    sub-int/2addr v8, p2

    .line 89
    invoke-virtual {p0, v4, p1}, Landroidx/gridlayout/widget/GridLayout;->v(Landroid/view/View;Z)I

    .line 90
    .line 91
    .line 92
    move-result p2

    .line 93
    sub-int v7, v8, p2

    .line 94
    .line 95
    if-eqz p1, :cond_5

    .line 96
    .line 97
    iget v8, v3, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 98
    .line 99
    move-object v3, p0

    .line 100
    invoke-virtual/range {v3 .. v8}, Landroidx/gridlayout/widget/GridLayout;->B(Landroid/view/View;IIII)V

    .line 101
    .line 102
    .line 103
    goto :goto_4

    .line 104
    :cond_5
    iget p1, v3, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 105
    .line 106
    move-object v3, p0

    .line 107
    move v8, v7

    .line 108
    move v7, p1

    .line 109
    invoke-virtual/range {v3 .. v8}, Landroidx/gridlayout/widget/GridLayout;->B(Landroid/view/View;IIII)V

    .line 110
    .line 111
    .line 112
    goto :goto_4

    .line 113
    :cond_6
    move-object v3, p0

    .line 114
    :goto_4
    add-int/lit8 v2, v2, 0x1

    .line 115
    .line 116
    move-object p0, v3

    .line 117
    move p1, v5

    .line 118
    move p2, v6

    .line 119
    goto :goto_0

    .line 120
    :cond_7
    return-void
.end method

.method public final J()V
    .locals 14

    .line 1
    iget v0, p0, Landroidx/gridlayout/widget/GridLayout;->c:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    move v0, v1

    .line 9
    :goto_0
    if-eqz v0, :cond_1

    .line 10
    .line 11
    iget-object v2, p0, Landroidx/gridlayout/widget/GridLayout;->a:Landroidx/gridlayout/widget/GridLayout$k;

    .line 12
    .line 13
    goto :goto_1

    .line 14
    :cond_1
    iget-object v2, p0, Landroidx/gridlayout/widget/GridLayout;->b:Landroidx/gridlayout/widget/GridLayout$k;

    .line 15
    .line 16
    :goto_1
    iget v2, v2, Landroidx/gridlayout/widget/GridLayout$k;->b:I

    .line 17
    .line 18
    const/high16 v3, -0x80000000

    .line 19
    .line 20
    if-eq v2, v3, :cond_2

    .line 21
    .line 22
    goto :goto_2

    .line 23
    :cond_2
    move v2, v1

    .line 24
    :goto_2
    new-array v3, v2, [I

    .line 25
    .line 26
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 27
    .line 28
    .line 29
    move-result v4

    .line 30
    move v5, v1

    .line 31
    move v6, v5

    .line 32
    move v7, v6

    .line 33
    :goto_3
    if-ge v5, v4, :cond_d

    .line 34
    .line 35
    invoke-virtual {p0, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 36
    .line 37
    .line 38
    move-result-object v8

    .line 39
    invoke-virtual {v8}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 40
    .line 41
    .line 42
    move-result-object v8

    .line 43
    check-cast v8, Landroidx/gridlayout/widget/GridLayout$n;

    .line 44
    .line 45
    if-eqz v0, :cond_3

    .line 46
    .line 47
    iget-object v9, v8, Landroidx/gridlayout/widget/GridLayout$n;->a:Landroidx/gridlayout/widget/GridLayout$q;

    .line 48
    .line 49
    goto :goto_4

    .line 50
    :cond_3
    iget-object v9, v8, Landroidx/gridlayout/widget/GridLayout$n;->b:Landroidx/gridlayout/widget/GridLayout$q;

    .line 51
    .line 52
    :goto_4
    iget-object v10, v9, Landroidx/gridlayout/widget/GridLayout$q;->b:Landroidx/gridlayout/widget/GridLayout$m;

    .line 53
    .line 54
    iget-boolean v9, v9, Landroidx/gridlayout/widget/GridLayout$q;->a:Z

    .line 55
    .line 56
    invoke-virtual {v10}, Landroidx/gridlayout/widget/GridLayout$m;->b()I

    .line 57
    .line 58
    .line 59
    move-result v11

    .line 60
    if-eqz v9, :cond_4

    .line 61
    .line 62
    iget v6, v10, Landroidx/gridlayout/widget/GridLayout$m;->a:I

    .line 63
    .line 64
    :cond_4
    if-eqz v0, :cond_5

    .line 65
    .line 66
    iget-object v10, v8, Landroidx/gridlayout/widget/GridLayout$n;->b:Landroidx/gridlayout/widget/GridLayout$q;

    .line 67
    .line 68
    goto :goto_5

    .line 69
    :cond_5
    iget-object v10, v8, Landroidx/gridlayout/widget/GridLayout$n;->a:Landroidx/gridlayout/widget/GridLayout$q;

    .line 70
    .line 71
    :goto_5
    iget-object v12, v10, Landroidx/gridlayout/widget/GridLayout$q;->b:Landroidx/gridlayout/widget/GridLayout$m;

    .line 72
    .line 73
    iget-boolean v10, v10, Landroidx/gridlayout/widget/GridLayout$q;->a:Z

    .line 74
    .line 75
    invoke-static {v12, v10, v2}, Landroidx/gridlayout/widget/GridLayout;->e(Landroidx/gridlayout/widget/GridLayout$m;ZI)I

    .line 76
    .line 77
    .line 78
    move-result v13

    .line 79
    if-eqz v10, :cond_6

    .line 80
    .line 81
    iget v7, v12, Landroidx/gridlayout/widget/GridLayout$m;->a:I

    .line 82
    .line 83
    :cond_6
    if-eqz v2, :cond_b

    .line 84
    .line 85
    if-eqz v9, :cond_7

    .line 86
    .line 87
    if-nez v10, :cond_a

    .line 88
    .line 89
    :cond_7
    :goto_6
    add-int v9, v7, v13

    .line 90
    .line 91
    invoke-static {v3, v6, v7, v9}, Landroidx/gridlayout/widget/GridLayout;->i([IIII)Z

    .line 92
    .line 93
    .line 94
    move-result v12

    .line 95
    if-nez v12, :cond_a

    .line 96
    .line 97
    if-eqz v10, :cond_8

    .line 98
    .line 99
    add-int/lit8 v6, v6, 0x1

    .line 100
    .line 101
    goto :goto_6

    .line 102
    :cond_8
    if-gt v9, v2, :cond_9

    .line 103
    .line 104
    add-int/lit8 v7, v7, 0x1

    .line 105
    .line 106
    goto :goto_6

    .line 107
    :cond_9
    add-int/lit8 v6, v6, 0x1

    .line 108
    .line 109
    move v7, v1

    .line 110
    goto :goto_6

    .line 111
    :cond_a
    add-int v9, v7, v13

    .line 112
    .line 113
    add-int v10, v6, v11

    .line 114
    .line 115
    invoke-static {v3, v7, v9, v10}, Landroidx/gridlayout/widget/GridLayout;->D([IIII)V

    .line 116
    .line 117
    .line 118
    :cond_b
    if-eqz v0, :cond_c

    .line 119
    .line 120
    invoke-static {v8, v6, v11, v7, v13}, Landroidx/gridlayout/widget/GridLayout;->E(Landroidx/gridlayout/widget/GridLayout$n;IIII)V

    .line 121
    .line 122
    .line 123
    goto :goto_7

    .line 124
    :cond_c
    invoke-static {v8, v7, v13, v6, v11}, Landroidx/gridlayout/widget/GridLayout;->E(Landroidx/gridlayout/widget/GridLayout$n;IIII)V

    .line 125
    .line 126
    .line 127
    :goto_7
    add-int/2addr v7, v13

    .line 128
    add-int/lit8 v5, v5, 0x1

    .line 129
    .line 130
    goto :goto_3

    .line 131
    :cond_d
    return-void
.end method

.method public checkLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Z
    .locals 2

    .line 1
    instance-of v0, p1, Landroidx/gridlayout/widget/GridLayout$n;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    check-cast p1, Landroidx/gridlayout/widget/GridLayout$n;

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    invoke-virtual {p0, p1, v0}, Landroidx/gridlayout/widget/GridLayout;->d(Landroidx/gridlayout/widget/GridLayout$n;Z)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, p1, v1}, Landroidx/gridlayout/widget/GridLayout;->d(Landroidx/gridlayout/widget/GridLayout$n;Z)V

    .line 14
    .line 15
    .line 16
    return v0
.end method

.method public final d(Landroidx/gridlayout/widget/GridLayout$n;Z)V
    .locals 3

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    const-string v0, "column"

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const-string v0, "row"

    .line 7
    .line 8
    :goto_0
    if-eqz p2, :cond_1

    .line 9
    .line 10
    iget-object p1, p1, Landroidx/gridlayout/widget/GridLayout$n;->b:Landroidx/gridlayout/widget/GridLayout$q;

    .line 11
    .line 12
    goto :goto_1

    .line 13
    :cond_1
    iget-object p1, p1, Landroidx/gridlayout/widget/GridLayout$n;->a:Landroidx/gridlayout/widget/GridLayout$q;

    .line 14
    .line 15
    :goto_1
    iget-object p1, p1, Landroidx/gridlayout/widget/GridLayout$q;->b:Landroidx/gridlayout/widget/GridLayout$m;

    .line 16
    .line 17
    iget v1, p1, Landroidx/gridlayout/widget/GridLayout$m;->a:I

    .line 18
    .line 19
    const/high16 v2, -0x80000000

    .line 20
    .line 21
    if-eq v1, v2, :cond_2

    .line 22
    .line 23
    if-gez v1, :cond_2

    .line 24
    .line 25
    const-string v1, " indices must be positive"

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-static {v1}, Landroidx/gridlayout/widget/GridLayout;->w(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    :cond_2
    if-eqz p2, :cond_3

    .line 35
    .line 36
    iget-object p0, p0, Landroidx/gridlayout/widget/GridLayout;->a:Landroidx/gridlayout/widget/GridLayout$k;

    .line 37
    .line 38
    goto :goto_2

    .line 39
    :cond_3
    iget-object p0, p0, Landroidx/gridlayout/widget/GridLayout;->b:Landroidx/gridlayout/widget/GridLayout$k;

    .line 40
    .line 41
    :goto_2
    iget p0, p0, Landroidx/gridlayout/widget/GridLayout$k;->b:I

    .line 42
    .line 43
    if-eq p0, v2, :cond_5

    .line 44
    .line 45
    iget p2, p1, Landroidx/gridlayout/widget/GridLayout$m;->b:I

    .line 46
    .line 47
    const-string v1, " count"

    .line 48
    .line 49
    if-le p2, p0, :cond_4

    .line 50
    .line 51
    new-instance p2, Ljava/lang/StringBuilder;

    .line 52
    .line 53
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    const-string v2, " indices (start + span) mustn\'t exceed the "

    .line 60
    .line 61
    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object p2

    .line 74
    invoke-static {p2}, Landroidx/gridlayout/widget/GridLayout;->w(Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    :cond_4
    invoke-virtual {p1}, Landroidx/gridlayout/widget/GridLayout$m;->b()I

    .line 78
    .line 79
    .line 80
    move-result p1

    .line 81
    if-le p1, p0, :cond_5

    .line 82
    .line 83
    new-instance p0, Ljava/lang/StringBuilder;

    .line 84
    .line 85
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 86
    .line 87
    .line 88
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    const-string p1, " span mustn\'t exceed the "

    .line 92
    .line 93
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    invoke-static {p0}, Landroidx/gridlayout/widget/GridLayout;->w(Ljava/lang/String;)V

    .line 107
    .line 108
    .line 109
    :cond_5
    return-void
.end method

.method public final f()I
    .locals 6

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    const/4 v2, 0x0

    .line 7
    :goto_0
    if-ge v2, v0, :cond_1

    .line 8
    .line 9
    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v3

    .line 13
    invoke-virtual {v3}, Landroid/view/View;->getVisibility()I

    .line 14
    .line 15
    .line 16
    move-result v4

    .line 17
    const/16 v5, 0x8

    .line 18
    .line 19
    if-ne v4, v5, :cond_0

    .line 20
    .line 21
    goto :goto_1

    .line 22
    :cond_0
    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    check-cast v3, Landroidx/gridlayout/widget/GridLayout$n;

    .line 27
    .line 28
    mul-int/lit8 v1, v1, 0x1f

    .line 29
    .line 30
    invoke-virtual {v3}, Landroidx/gridlayout/widget/GridLayout$n;->hashCode()I

    .line 31
    .line 32
    .line 33
    move-result v3

    .line 34
    add-int/2addr v1, v3

    .line 35
    :goto_1
    add-int/lit8 v2, v2, 0x1

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_1
    return v1
.end method

.method public final g()V
    .locals 2

    .line 1
    iget v0, p0, Landroidx/gridlayout/widget/GridLayout;->g:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroidx/gridlayout/widget/GridLayout;->J()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Landroidx/gridlayout/widget/GridLayout;->f()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput v0, p0, Landroidx/gridlayout/widget/GridLayout;->g:I

    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-virtual {p0}, Landroidx/gridlayout/widget/GridLayout;->f()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eq v0, v1, :cond_1

    .line 20
    .line 21
    iget-object v0, p0, Landroidx/gridlayout/widget/GridLayout;->h:Landroid/util/Printer;

    .line 22
    .line 23
    const-string v1, "The fields of some layout parameters were modified in between layout operations. Check the javadoc for GridLayout.LayoutParams#rowSpec."

    .line 24
    .line 25
    invoke-interface {v0, v1}, Landroid/util/Printer;->println(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0}, Landroidx/gridlayout/widget/GridLayout;->x()V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0}, Landroidx/gridlayout/widget/GridLayout;->g()V

    .line 32
    .line 33
    .line 34
    :cond_1
    return-void
.end method

.method public bridge synthetic generateDefaultLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroidx/gridlayout/widget/GridLayout;->j()Landroidx/gridlayout/widget/GridLayout$n;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic generateLayoutParams(Landroid/util/AttributeSet;)Landroid/view/ViewGroup$LayoutParams;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Landroidx/gridlayout/widget/GridLayout;->k(Landroid/util/AttributeSet;)Landroidx/gridlayout/widget/GridLayout$n;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;
    .locals 0

    .line 6
    invoke-virtual {p0, p1}, Landroidx/gridlayout/widget/GridLayout;->l(Landroid/view/ViewGroup$LayoutParams;)Landroidx/gridlayout/widget/GridLayout$n;

    move-result-object p0

    return-object p0
.end method

.method public getAlignmentMode()I
    .locals 0

    .line 1
    iget p0, p0, Landroidx/gridlayout/widget/GridLayout;->e:I

    .line 2
    .line 3
    return p0
.end method

.method public getColumnCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/gridlayout/widget/GridLayout;->a:Landroidx/gridlayout/widget/GridLayout$k;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/gridlayout/widget/GridLayout$k;->p()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getOrientation()I
    .locals 0

    .line 1
    iget p0, p0, Landroidx/gridlayout/widget/GridLayout;->c:I

    .line 2
    .line 3
    return p0
.end method

.method public getPrinter()Landroid/util/Printer;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/gridlayout/widget/GridLayout;->h:Landroid/util/Printer;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRowCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/gridlayout/widget/GridLayout;->b:Landroidx/gridlayout/widget/GridLayout$k;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/gridlayout/widget/GridLayout$k;->p()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getUseDefaultMargins()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Landroidx/gridlayout/widget/GridLayout;->d:Z

    .line 2
    .line 3
    return p0
.end method

.method public j()Landroidx/gridlayout/widget/GridLayout$n;
    .locals 0

    .line 1
    new-instance p0, Landroidx/gridlayout/widget/GridLayout$n;

    .line 2
    .line 3
    invoke-direct {p0}, Landroidx/gridlayout/widget/GridLayout$n;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public k(Landroid/util/AttributeSet;)Landroidx/gridlayout/widget/GridLayout$n;
    .locals 1

    .line 1
    new-instance v0, Landroidx/gridlayout/widget/GridLayout$n;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-direct {v0, p0, p1}, Landroidx/gridlayout/widget/GridLayout$n;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method

.method public l(Landroid/view/ViewGroup$LayoutParams;)Landroidx/gridlayout/widget/GridLayout$n;
    .locals 0

    .line 1
    instance-of p0, p1, Landroidx/gridlayout/widget/GridLayout$n;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    new-instance p0, Landroidx/gridlayout/widget/GridLayout$n;

    .line 6
    .line 7
    check-cast p1, Landroidx/gridlayout/widget/GridLayout$n;

    .line 8
    .line 9
    invoke-direct {p0, p1}, Landroidx/gridlayout/widget/GridLayout$n;-><init>(Landroidx/gridlayout/widget/GridLayout$n;)V

    .line 10
    .line 11
    .line 12
    return-object p0

    .line 13
    :cond_0
    instance-of p0, p1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 14
    .line 15
    if-eqz p0, :cond_1

    .line 16
    .line 17
    new-instance p0, Landroidx/gridlayout/widget/GridLayout$n;

    .line 18
    .line 19
    check-cast p1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 20
    .line 21
    invoke-direct {p0, p1}, Landroidx/gridlayout/widget/GridLayout$n;-><init>(Landroid/view/ViewGroup$MarginLayoutParams;)V

    .line 22
    .line 23
    .line 24
    return-object p0

    .line 25
    :cond_1
    new-instance p0, Landroidx/gridlayout/widget/GridLayout$n;

    .line 26
    .line 27
    invoke-direct {p0, p1}, Landroidx/gridlayout/widget/GridLayout$n;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    .line 28
    .line 29
    .line 30
    return-object p0
.end method

.method public final n(Landroid/view/View;Landroidx/gridlayout/widget/GridLayout$n;ZZ)I
    .locals 4

    .line 1
    iget-boolean v0, p0, Landroidx/gridlayout/widget/GridLayout;->d:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    if-eqz p3, :cond_1

    .line 8
    .line 9
    iget-object p2, p2, Landroidx/gridlayout/widget/GridLayout$n;->b:Landroidx/gridlayout/widget/GridLayout$q;

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_1
    iget-object p2, p2, Landroidx/gridlayout/widget/GridLayout$n;->a:Landroidx/gridlayout/widget/GridLayout$q;

    .line 13
    .line 14
    :goto_0
    if-eqz p3, :cond_2

    .line 15
    .line 16
    iget-object v0, p0, Landroidx/gridlayout/widget/GridLayout;->a:Landroidx/gridlayout/widget/GridLayout$k;

    .line 17
    .line 18
    goto :goto_1

    .line 19
    :cond_2
    iget-object v0, p0, Landroidx/gridlayout/widget/GridLayout;->b:Landroidx/gridlayout/widget/GridLayout$k;

    .line 20
    .line 21
    :goto_1
    iget-object p2, p2, Landroidx/gridlayout/widget/GridLayout$q;->b:Landroidx/gridlayout/widget/GridLayout$m;

    .line 22
    .line 23
    const/4 v2, 0x1

    .line 24
    if-eqz p3, :cond_4

    .line 25
    .line 26
    invoke-virtual {p0}, Landroidx/gridlayout/widget/GridLayout;->z()Z

    .line 27
    .line 28
    .line 29
    move-result v3

    .line 30
    if-eqz v3, :cond_4

    .line 31
    .line 32
    if-nez p4, :cond_3

    .line 33
    .line 34
    move v3, v2

    .line 35
    goto :goto_2

    .line 36
    :cond_3
    move v3, v1

    .line 37
    goto :goto_2

    .line 38
    :cond_4
    move v3, p4

    .line 39
    :goto_2
    if-eqz v3, :cond_5

    .line 40
    .line 41
    iget p2, p2, Landroidx/gridlayout/widget/GridLayout$m;->a:I

    .line 42
    .line 43
    if-nez p2, :cond_6

    .line 44
    .line 45
    :goto_3
    move v1, v2

    .line 46
    goto :goto_4

    .line 47
    :cond_5
    iget p2, p2, Landroidx/gridlayout/widget/GridLayout$m;->b:I

    .line 48
    .line 49
    invoke-virtual {v0}, Landroidx/gridlayout/widget/GridLayout$k;->p()I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-ne p2, v0, :cond_6

    .line 54
    .line 55
    goto :goto_3

    .line 56
    :cond_6
    :goto_4
    invoke-virtual {p0, p1, v1, p3, p4}, Landroidx/gridlayout/widget/GridLayout;->p(Landroid/view/View;ZZZ)I

    .line 57
    .line 58
    .line 59
    move-result p0

    .line 60
    return p0
.end method

.method public final o(Landroid/view/View;ZZ)I
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    const-class p3, Landroidx/legacy/widget/Space;

    .line 6
    .line 7
    if-eq p2, p3, :cond_1

    .line 8
    .line 9
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    const-class p2, Landroid/widget/Space;

    .line 14
    .line 15
    if-ne p1, p2, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    iget p0, p0, Landroidx/gridlayout/widget/GridLayout;->f:I

    .line 19
    .line 20
    div-int/lit8 p0, p0, 0x2

    .line 21
    .line 22
    return p0

    .line 23
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 24
    return p0
.end method

.method public onLayout(ZIIII)V
    .locals 28

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    invoke-virtual {v1}, Landroidx/gridlayout/widget/GridLayout;->g()V

    .line 4
    .line 5
    .line 6
    sub-int v6, p4, p2

    .line 7
    .line 8
    sub-int v0, p5, p3

    .line 9
    .line 10
    invoke-virtual {v1}, Landroid/view/View;->getPaddingLeft()I

    .line 11
    .line 12
    .line 13
    move-result v7

    .line 14
    invoke-virtual {v1}, Landroid/view/View;->getPaddingTop()I

    .line 15
    .line 16
    .line 17
    move-result v8

    .line 18
    invoke-virtual {v1}, Landroid/view/View;->getPaddingRight()I

    .line 19
    .line 20
    .line 21
    move-result v9

    .line 22
    invoke-virtual {v1}, Landroid/view/View;->getPaddingBottom()I

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    iget-object v3, v1, Landroidx/gridlayout/widget/GridLayout;->a:Landroidx/gridlayout/widget/GridLayout$k;

    .line 27
    .line 28
    sub-int v4, v6, v7

    .line 29
    .line 30
    sub-int/2addr v4, v9

    .line 31
    invoke-virtual {v3, v4}, Landroidx/gridlayout/widget/GridLayout$k;->G(I)V

    .line 32
    .line 33
    .line 34
    iget-object v3, v1, Landroidx/gridlayout/widget/GridLayout;->b:Landroidx/gridlayout/widget/GridLayout$k;

    .line 35
    .line 36
    sub-int/2addr v0, v8

    .line 37
    sub-int/2addr v0, v2

    .line 38
    invoke-virtual {v3, v0}, Landroidx/gridlayout/widget/GridLayout$k;->G(I)V

    .line 39
    .line 40
    .line 41
    iget-object v0, v1, Landroidx/gridlayout/widget/GridLayout;->a:Landroidx/gridlayout/widget/GridLayout$k;

    .line 42
    .line 43
    invoke-virtual {v0}, Landroidx/gridlayout/widget/GridLayout$k;->u()[I

    .line 44
    .line 45
    .line 46
    move-result-object v10

    .line 47
    iget-object v0, v1, Landroidx/gridlayout/widget/GridLayout;->b:Landroidx/gridlayout/widget/GridLayout$k;

    .line 48
    .line 49
    invoke-virtual {v0}, Landroidx/gridlayout/widget/GridLayout$k;->u()[I

    .line 50
    .line 51
    .line 52
    move-result-object v11

    .line 53
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 54
    .line 55
    .line 56
    move-result v12

    .line 57
    const/4 v14, 0x0

    .line 58
    :goto_0
    if-ge v14, v12, :cond_4

    .line 59
    .line 60
    invoke-virtual {v1, v14}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    invoke-virtual {v2}, Landroid/view/View;->getVisibility()I

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    const/16 v3, 0x8

    .line 69
    .line 70
    if-ne v0, v3, :cond_0

    .line 71
    .line 72
    move/from16 p4, v6

    .line 73
    .line 74
    move/from16 p5, v7

    .line 75
    .line 76
    move/from16 p2, v8

    .line 77
    .line 78
    const/16 v26, 0x0

    .line 79
    .line 80
    goto/16 :goto_2

    .line 81
    .line 82
    :cond_0
    invoke-virtual {v1, v2}, Landroidx/gridlayout/widget/GridLayout;->q(Landroid/view/View;)Landroidx/gridlayout/widget/GridLayout$n;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    iget-object v3, v0, Landroidx/gridlayout/widget/GridLayout$n;->b:Landroidx/gridlayout/widget/GridLayout$q;

    .line 87
    .line 88
    iget-object v0, v0, Landroidx/gridlayout/widget/GridLayout$n;->a:Landroidx/gridlayout/widget/GridLayout$q;

    .line 89
    .line 90
    iget-object v4, v3, Landroidx/gridlayout/widget/GridLayout$q;->b:Landroidx/gridlayout/widget/GridLayout$m;

    .line 91
    .line 92
    iget-object v5, v0, Landroidx/gridlayout/widget/GridLayout$q;->b:Landroidx/gridlayout/widget/GridLayout$m;

    .line 93
    .line 94
    iget v15, v4, Landroidx/gridlayout/widget/GridLayout$m;->a:I

    .line 95
    .line 96
    aget v15, v10, v15

    .line 97
    .line 98
    iget v13, v5, Landroidx/gridlayout/widget/GridLayout$m;->a:I

    .line 99
    .line 100
    aget v13, v11, v13

    .line 101
    .line 102
    iget v4, v4, Landroidx/gridlayout/widget/GridLayout$m;->b:I

    .line 103
    .line 104
    aget v4, v10, v4

    .line 105
    .line 106
    iget v5, v5, Landroidx/gridlayout/widget/GridLayout$m;->b:I

    .line 107
    .line 108
    aget v5, v11, v5

    .line 109
    .line 110
    sub-int v16, v4, v15

    .line 111
    .line 112
    sub-int v17, v5, v13

    .line 113
    .line 114
    const/4 v4, 0x1

    .line 115
    invoke-virtual {v1, v2, v4}, Landroidx/gridlayout/widget/GridLayout;->t(Landroid/view/View;Z)I

    .line 116
    .line 117
    .line 118
    move-result v5

    .line 119
    move/from16 p2, v5

    .line 120
    .line 121
    move/from16 p4, v6

    .line 122
    .line 123
    const/4 v5, 0x0

    .line 124
    invoke-virtual {v1, v2, v5}, Landroidx/gridlayout/widget/GridLayout;->t(Landroid/view/View;Z)I

    .line 125
    .line 126
    .line 127
    move-result v6

    .line 128
    invoke-virtual {v3, v4}, Landroidx/gridlayout/widget/GridLayout$q;->b(Z)Landroidx/gridlayout/widget/GridLayout$i;

    .line 129
    .line 130
    .line 131
    move-result-object v3

    .line 132
    invoke-virtual {v0, v5}, Landroidx/gridlayout/widget/GridLayout$q;->b(Z)Landroidx/gridlayout/widget/GridLayout$i;

    .line 133
    .line 134
    .line 135
    move-result-object v0

    .line 136
    iget-object v5, v1, Landroidx/gridlayout/widget/GridLayout;->a:Landroidx/gridlayout/widget/GridLayout$k;

    .line 137
    .line 138
    invoke-virtual {v5}, Landroidx/gridlayout/widget/GridLayout$k;->s()Landroidx/gridlayout/widget/GridLayout$p;

    .line 139
    .line 140
    .line 141
    move-result-object v5

    .line 142
    invoke-virtual {v5, v14}, Landroidx/gridlayout/widget/GridLayout$p;->c(I)Ljava/lang/Object;

    .line 143
    .line 144
    .line 145
    move-result-object v5

    .line 146
    check-cast v5, Landroidx/gridlayout/widget/GridLayout$l;

    .line 147
    .line 148
    iget-object v4, v1, Landroidx/gridlayout/widget/GridLayout;->b:Landroidx/gridlayout/widget/GridLayout$k;

    .line 149
    .line 150
    invoke-virtual {v4}, Landroidx/gridlayout/widget/GridLayout$k;->s()Landroidx/gridlayout/widget/GridLayout$p;

    .line 151
    .line 152
    .line 153
    move-result-object v4

    .line 154
    invoke-virtual {v4, v14}, Landroidx/gridlayout/widget/GridLayout$p;->c(I)Ljava/lang/Object;

    .line 155
    .line 156
    .line 157
    move-result-object v4

    .line 158
    check-cast v4, Landroidx/gridlayout/widget/GridLayout$l;

    .line 159
    .line 160
    move/from16 p5, v7

    .line 161
    .line 162
    const/4 v7, 0x1

    .line 163
    invoke-virtual {v5, v7}, Landroidx/gridlayout/widget/GridLayout$l;->e(Z)I

    .line 164
    .line 165
    .line 166
    move-result v18

    .line 167
    move-object/from16 p3, v5

    .line 168
    .line 169
    sub-int v5, v16, v18

    .line 170
    .line 171
    invoke-virtual {v3, v2, v5}, Landroidx/gridlayout/widget/GridLayout$i;->d(Landroid/view/View;I)I

    .line 172
    .line 173
    .line 174
    move-result v18

    .line 175
    invoke-virtual {v4, v7}, Landroidx/gridlayout/widget/GridLayout$l;->e(Z)I

    .line 176
    .line 177
    .line 178
    move-result v5

    .line 179
    sub-int v5, v17, v5

    .line 180
    .line 181
    invoke-virtual {v0, v2, v5}, Landroidx/gridlayout/widget/GridLayout$i;->d(Landroid/view/View;I)I

    .line 182
    .line 183
    .line 184
    move-result v19

    .line 185
    invoke-virtual {v1, v2, v7, v7}, Landroidx/gridlayout/widget/GridLayout;->r(Landroid/view/View;ZZ)I

    .line 186
    .line 187
    .line 188
    move-result v20

    .line 189
    const/4 v5, 0x0

    .line 190
    invoke-virtual {v1, v2, v5, v7}, Landroidx/gridlayout/widget/GridLayout;->r(Landroid/view/View;ZZ)I

    .line 191
    .line 192
    .line 193
    move-result v21

    .line 194
    invoke-virtual {v1, v2, v7, v5}, Landroidx/gridlayout/widget/GridLayout;->r(Landroid/view/View;ZZ)I

    .line 195
    .line 196
    .line 197
    move-result v7

    .line 198
    invoke-virtual {v1, v2, v5, v5}, Landroidx/gridlayout/widget/GridLayout;->r(Landroid/view/View;ZZ)I

    .line 199
    .line 200
    .line 201
    move-result v22

    .line 202
    add-int v23, v20, v7

    .line 203
    .line 204
    add-int v22, v21, v22

    .line 205
    .line 206
    move-object/from16 v24, v4

    .line 207
    .line 208
    add-int v4, p2, v23

    .line 209
    .line 210
    move/from16 v25, v5

    .line 211
    .line 212
    const/4 v5, 0x1

    .line 213
    move/from16 p1, v7

    .line 214
    .line 215
    move/from16 v26, v25

    .line 216
    .line 217
    move/from16 v7, p2

    .line 218
    .line 219
    move-object/from16 v25, v24

    .line 220
    .line 221
    move-object/from16 v24, v0

    .line 222
    .line 223
    move-object/from16 v0, p3

    .line 224
    .line 225
    invoke-virtual/range {v0 .. v5}, Landroidx/gridlayout/widget/GridLayout$l;->a(Landroidx/gridlayout/widget/GridLayout;Landroid/view/View;Landroidx/gridlayout/widget/GridLayout$i;IZ)I

    .line 226
    .line 227
    .line 228
    move-result v27

    .line 229
    add-int v4, v6, v22

    .line 230
    .line 231
    const/4 v5, 0x0

    .line 232
    move-object/from16 v1, p0

    .line 233
    .line 234
    move/from16 p2, v8

    .line 235
    .line 236
    move-object/from16 v0, v25

    .line 237
    .line 238
    move-object v8, v3

    .line 239
    move-object/from16 v3, v24

    .line 240
    .line 241
    invoke-virtual/range {v0 .. v5}, Landroidx/gridlayout/widget/GridLayout$l;->a(Landroidx/gridlayout/widget/GridLayout;Landroid/view/View;Landroidx/gridlayout/widget/GridLayout$i;IZ)I

    .line 242
    .line 243
    .line 244
    move-result v0

    .line 245
    sub-int v1, v16, v23

    .line 246
    .line 247
    invoke-virtual {v8, v2, v7, v1}, Landroidx/gridlayout/widget/GridLayout$i;->e(Landroid/view/View;II)I

    .line 248
    .line 249
    .line 250
    move-result v1

    .line 251
    sub-int v4, v17, v22

    .line 252
    .line 253
    invoke-virtual {v3, v2, v6, v4}, Landroidx/gridlayout/widget/GridLayout$i;->e(Landroid/view/View;II)I

    .line 254
    .line 255
    .line 256
    move-result v3

    .line 257
    add-int v15, v15, v18

    .line 258
    .line 259
    add-int v15, v15, v27

    .line 260
    .line 261
    invoke-virtual/range {p0 .. p0}, Landroidx/gridlayout/widget/GridLayout;->z()Z

    .line 262
    .line 263
    .line 264
    move-result v4

    .line 265
    if-nez v4, :cond_1

    .line 266
    .line 267
    add-int v7, p5, v20

    .line 268
    .line 269
    add-int/2addr v7, v15

    .line 270
    goto :goto_1

    .line 271
    :cond_1
    sub-int v6, p4, v1

    .line 272
    .line 273
    sub-int/2addr v6, v9

    .line 274
    sub-int v6, v6, p1

    .line 275
    .line 276
    sub-int v7, v6, v15

    .line 277
    .line 278
    :goto_1
    add-int v8, p2, v13

    .line 279
    .line 280
    add-int v8, v8, v19

    .line 281
    .line 282
    add-int/2addr v8, v0

    .line 283
    add-int v8, v8, v21

    .line 284
    .line 285
    invoke-virtual {v2}, Landroid/view/View;->getMeasuredWidth()I

    .line 286
    .line 287
    .line 288
    move-result v0

    .line 289
    if-ne v1, v0, :cond_2

    .line 290
    .line 291
    invoke-virtual {v2}, Landroid/view/View;->getMeasuredHeight()I

    .line 292
    .line 293
    .line 294
    move-result v0

    .line 295
    if-eq v3, v0, :cond_3

    .line 296
    .line 297
    :cond_2
    const/high16 v0, 0x40000000    # 2.0f

    .line 298
    .line 299
    invoke-static {v1, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 300
    .line 301
    .line 302
    move-result v4

    .line 303
    invoke-static {v3, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 304
    .line 305
    .line 306
    move-result v0

    .line 307
    invoke-virtual {v2, v4, v0}, Landroid/view/View;->measure(II)V

    .line 308
    .line 309
    .line 310
    :cond_3
    add-int/2addr v1, v7

    .line 311
    add-int/2addr v3, v8

    .line 312
    invoke-virtual {v2, v7, v8, v1, v3}, Landroid/view/View;->layout(IIII)V

    .line 313
    .line 314
    .line 315
    :goto_2
    add-int/lit8 v14, v14, 0x1

    .line 316
    .line 317
    move-object/from16 v1, p0

    .line 318
    .line 319
    move/from16 v8, p2

    .line 320
    .line 321
    move/from16 v6, p4

    .line 322
    .line 323
    move/from16 v7, p5

    .line 324
    .line 325
    goto/16 :goto_0

    .line 326
    .line 327
    :cond_4
    return-void
.end method

.method public onMeasure(II)V
    .locals 7

    .line 1
    invoke-virtual {p0}, Landroidx/gridlayout/widget/GridLayout;->g()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroidx/gridlayout/widget/GridLayout;->y()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    add-int/2addr v0, v1

    .line 16
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    add-int/2addr v1, v2

    .line 25
    neg-int v2, v0

    .line 26
    invoke-static {p1, v2}, Landroidx/gridlayout/widget/GridLayout;->a(II)I

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    neg-int v3, v1

    .line 31
    invoke-static {p2, v3}, Landroidx/gridlayout/widget/GridLayout;->a(II)I

    .line 32
    .line 33
    .line 34
    move-result v3

    .line 35
    const/4 v4, 0x1

    .line 36
    invoke-virtual {p0, v2, v3, v4}, Landroidx/gridlayout/widget/GridLayout;->C(IIZ)V

    .line 37
    .line 38
    .line 39
    iget v4, p0, Landroidx/gridlayout/widget/GridLayout;->c:I

    .line 40
    .line 41
    const/4 v5, 0x0

    .line 42
    if-nez v4, :cond_0

    .line 43
    .line 44
    iget-object v4, p0, Landroidx/gridlayout/widget/GridLayout;->a:Landroidx/gridlayout/widget/GridLayout$k;

    .line 45
    .line 46
    invoke-virtual {v4, v2}, Landroidx/gridlayout/widget/GridLayout$k;->w(I)I

    .line 47
    .line 48
    .line 49
    move-result v4

    .line 50
    invoke-virtual {p0, v2, v3, v5}, Landroidx/gridlayout/widget/GridLayout;->C(IIZ)V

    .line 51
    .line 52
    .line 53
    iget-object v2, p0, Landroidx/gridlayout/widget/GridLayout;->b:Landroidx/gridlayout/widget/GridLayout$k;

    .line 54
    .line 55
    invoke-virtual {v2, v3}, Landroidx/gridlayout/widget/GridLayout$k;->w(I)I

    .line 56
    .line 57
    .line 58
    move-result v2

    .line 59
    goto :goto_0

    .line 60
    :cond_0
    iget-object v4, p0, Landroidx/gridlayout/widget/GridLayout;->b:Landroidx/gridlayout/widget/GridLayout$k;

    .line 61
    .line 62
    invoke-virtual {v4, v3}, Landroidx/gridlayout/widget/GridLayout$k;->w(I)I

    .line 63
    .line 64
    .line 65
    move-result v4

    .line 66
    invoke-virtual {p0, v2, v3, v5}, Landroidx/gridlayout/widget/GridLayout;->C(IIZ)V

    .line 67
    .line 68
    .line 69
    iget-object v3, p0, Landroidx/gridlayout/widget/GridLayout;->a:Landroidx/gridlayout/widget/GridLayout$k;

    .line 70
    .line 71
    invoke-virtual {v3, v2}, Landroidx/gridlayout/widget/GridLayout$k;->w(I)I

    .line 72
    .line 73
    .line 74
    move-result v2

    .line 75
    move v6, v4

    .line 76
    move v4, v2

    .line 77
    move v2, v6

    .line 78
    :goto_0
    add-int/2addr v4, v0

    .line 79
    invoke-virtual {p0}, Landroid/view/View;->getSuggestedMinimumWidth()I

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    invoke-static {v4, v0}, Ljava/lang/Math;->max(II)I

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    add-int/2addr v2, v1

    .line 88
    invoke-virtual {p0}, Landroid/view/View;->getSuggestedMinimumHeight()I

    .line 89
    .line 90
    .line 91
    move-result v1

    .line 92
    invoke-static {v2, v1}, Ljava/lang/Math;->max(II)I

    .line 93
    .line 94
    .line 95
    move-result v1

    .line 96
    invoke-static {v0, p1, v5}, Landroid/view/View;->resolveSizeAndState(III)I

    .line 97
    .line 98
    .line 99
    move-result p1

    .line 100
    invoke-static {v1, p2, v5}, Landroid/view/View;->resolveSizeAndState(III)I

    .line 101
    .line 102
    .line 103
    move-result p2

    .line 104
    invoke-virtual {p0, p1, p2}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 105
    .line 106
    .line 107
    return-void
.end method

.method public final p(Landroid/view/View;ZZZ)I
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p3, p4}, Landroidx/gridlayout/widget/GridLayout;->o(Landroid/view/View;ZZ)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public final q(Landroid/view/View;)Landroidx/gridlayout/widget/GridLayout$n;
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Landroidx/gridlayout/widget/GridLayout$n;

    .line 6
    .line 7
    return-object p0
.end method

.method public final r(Landroid/view/View;ZZ)I
    .locals 2

    .line 1
    iget v0, p0, Landroidx/gridlayout/widget/GridLayout;->e:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0, p1, p2, p3}, Landroidx/gridlayout/widget/GridLayout;->s(Landroid/view/View;ZZ)I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0

    .line 11
    :cond_0
    if-eqz p2, :cond_1

    .line 12
    .line 13
    iget-object v0, p0, Landroidx/gridlayout/widget/GridLayout;->a:Landroidx/gridlayout/widget/GridLayout$k;

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_1
    iget-object v0, p0, Landroidx/gridlayout/widget/GridLayout;->b:Landroidx/gridlayout/widget/GridLayout$k;

    .line 17
    .line 18
    :goto_0
    if-eqz p3, :cond_2

    .line 19
    .line 20
    invoke-virtual {v0}, Landroidx/gridlayout/widget/GridLayout$k;->t()[I

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    goto :goto_1

    .line 25
    :cond_2
    invoke-virtual {v0}, Landroidx/gridlayout/widget/GridLayout$k;->y()[I

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    :goto_1
    invoke-virtual {p0, p1}, Landroidx/gridlayout/widget/GridLayout;->q(Landroid/view/View;)Landroidx/gridlayout/widget/GridLayout$n;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    if-eqz p2, :cond_3

    .line 34
    .line 35
    iget-object p0, p0, Landroidx/gridlayout/widget/GridLayout$n;->b:Landroidx/gridlayout/widget/GridLayout$q;

    .line 36
    .line 37
    goto :goto_2

    .line 38
    :cond_3
    iget-object p0, p0, Landroidx/gridlayout/widget/GridLayout$n;->a:Landroidx/gridlayout/widget/GridLayout$q;

    .line 39
    .line 40
    :goto_2
    iget-object p0, p0, Landroidx/gridlayout/widget/GridLayout$q;->b:Landroidx/gridlayout/widget/GridLayout$m;

    .line 41
    .line 42
    if-eqz p3, :cond_4

    .line 43
    .line 44
    iget p0, p0, Landroidx/gridlayout/widget/GridLayout$m;->a:I

    .line 45
    .line 46
    goto :goto_3

    .line 47
    :cond_4
    iget p0, p0, Landroidx/gridlayout/widget/GridLayout$m;->b:I

    .line 48
    .line 49
    :goto_3
    aget p0, v0, p0

    .line 50
    .line 51
    return p0
.end method

.method public requestLayout()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->requestLayout()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroidx/gridlayout/widget/GridLayout;->x()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public s(Landroid/view/View;ZZ)I
    .locals 3

    .line 1
    invoke-virtual {p0, p1}, Landroidx/gridlayout/widget/GridLayout;->q(Landroid/view/View;)Landroidx/gridlayout/widget/GridLayout$n;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz p2, :cond_1

    .line 6
    .line 7
    if-eqz p3, :cond_0

    .line 8
    .line 9
    iget v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_1
    if-eqz p3, :cond_2

    .line 16
    .line 17
    iget v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_2
    iget v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 21
    .line 22
    :goto_0
    const/high16 v2, -0x80000000

    .line 23
    .line 24
    if-ne v1, v2, :cond_3

    .line 25
    .line 26
    invoke-virtual {p0, p1, v0, p2, p3}, Landroidx/gridlayout/widget/GridLayout;->n(Landroid/view/View;Landroidx/gridlayout/widget/GridLayout$n;ZZ)I

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    return p0

    .line 31
    :cond_3
    return v1
.end method

.method public setAlignmentMode(I)V
    .locals 0

    .line 1
    iput p1, p0, Landroidx/gridlayout/widget/GridLayout;->e:I

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/gridlayout/widget/GridLayout;->requestLayout()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setColumnCount(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/gridlayout/widget/GridLayout;->a:Landroidx/gridlayout/widget/GridLayout$k;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroidx/gridlayout/widget/GridLayout$k;->J(I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroidx/gridlayout/widget/GridLayout;->x()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Landroidx/gridlayout/widget/GridLayout;->requestLayout()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public setColumnOrderPreserved(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/gridlayout/widget/GridLayout;->a:Landroidx/gridlayout/widget/GridLayout$k;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroidx/gridlayout/widget/GridLayout$k;->K(Z)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroidx/gridlayout/widget/GridLayout;->x()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Landroidx/gridlayout/widget/GridLayout;->requestLayout()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public setOrientation(I)V
    .locals 1

    .line 1
    iget v0, p0, Landroidx/gridlayout/widget/GridLayout;->c:I

    .line 2
    .line 3
    if-eq v0, p1, :cond_0

    .line 4
    .line 5
    iput p1, p0, Landroidx/gridlayout/widget/GridLayout;->c:I

    .line 6
    .line 7
    invoke-virtual {p0}, Landroidx/gridlayout/widget/GridLayout;->x()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Landroidx/gridlayout/widget/GridLayout;->requestLayout()V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public setPrinter(Landroid/util/Printer;)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    sget-object p1, Landroidx/gridlayout/widget/GridLayout;->j:Landroid/util/Printer;

    .line 4
    .line 5
    :cond_0
    iput-object p1, p0, Landroidx/gridlayout/widget/GridLayout;->h:Landroid/util/Printer;

    .line 6
    .line 7
    return-void
.end method

.method public setRowCount(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/gridlayout/widget/GridLayout;->b:Landroidx/gridlayout/widget/GridLayout$k;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroidx/gridlayout/widget/GridLayout$k;->J(I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroidx/gridlayout/widget/GridLayout;->x()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Landroidx/gridlayout/widget/GridLayout;->requestLayout()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public setRowOrderPreserved(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/gridlayout/widget/GridLayout;->b:Landroidx/gridlayout/widget/GridLayout$k;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroidx/gridlayout/widget/GridLayout$k;->K(Z)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroidx/gridlayout/widget/GridLayout;->x()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Landroidx/gridlayout/widget/GridLayout;->requestLayout()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public setUseDefaultMargins(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Landroidx/gridlayout/widget/GridLayout;->d:Z

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/gridlayout/widget/GridLayout;->requestLayout()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final t(Landroid/view/View;Z)I
    .locals 0

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0

    .line 8
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method public final u(Landroid/view/View;Z)I
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/16 v1, 0x8

    .line 6
    .line 7
    if-ne v0, v1, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return p0

    .line 11
    :cond_0
    invoke-virtual {p0, p1, p2}, Landroidx/gridlayout/widget/GridLayout;->t(Landroid/view/View;Z)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    invoke-virtual {p0, p1, p2}, Landroidx/gridlayout/widget/GridLayout;->v(Landroid/view/View;Z)I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    add-int/2addr v0, p0

    .line 20
    return v0
.end method

.method public final v(Landroid/view/View;Z)I
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, p1, p2, v0}, Landroidx/gridlayout/widget/GridLayout;->r(Landroid/view/View;ZZ)I

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-virtual {p0, p1, p2, v1}, Landroidx/gridlayout/widget/GridLayout;->r(Landroid/view/View;ZZ)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    add-int/2addr v0, p0

    .line 12
    return v0
.end method

.method public final x()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Landroidx/gridlayout/widget/GridLayout;->g:I

    .line 3
    .line 4
    iget-object v0, p0, Landroidx/gridlayout/widget/GridLayout;->a:Landroidx/gridlayout/widget/GridLayout$k;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0}, Landroidx/gridlayout/widget/GridLayout$k;->E()V

    .line 9
    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Landroidx/gridlayout/widget/GridLayout;->b:Landroidx/gridlayout/widget/GridLayout$k;

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-virtual {v0}, Landroidx/gridlayout/widget/GridLayout$k;->E()V

    .line 16
    .line 17
    .line 18
    :cond_1
    invoke-virtual {p0}, Landroidx/gridlayout/widget/GridLayout;->y()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final y()V
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/gridlayout/widget/GridLayout;->a:Landroidx/gridlayout/widget/GridLayout$k;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Landroidx/gridlayout/widget/GridLayout;->b:Landroidx/gridlayout/widget/GridLayout$k;

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Landroidx/gridlayout/widget/GridLayout$k;->F()V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Landroidx/gridlayout/widget/GridLayout;->b:Landroidx/gridlayout/widget/GridLayout$k;

    .line 13
    .line 14
    invoke-virtual {p0}, Landroidx/gridlayout/widget/GridLayout$k;->F()V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public final z()Z
    .locals 1

    .line 1
    invoke-static {p0}, Ll/kkl0;->x(Landroid/view/View;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x1

    .line 6
    if-ne p0, v0, :cond_0

    .line 7
    .line 8
    return v0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method
