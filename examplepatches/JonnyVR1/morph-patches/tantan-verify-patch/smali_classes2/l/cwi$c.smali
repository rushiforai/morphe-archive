.class public Ll/cwi$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/cwi;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "c"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "TT;>;"
    }
.end annotation


# instance fields
.field public final a:Landroid/graphics/Rect;

.field public final b:Landroid/graphics/Rect;

.field public final c:Z

.field public final d:Ll/cwi$a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/cwi$a<",
            "TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(ZLl/cwi$a;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Ll/cwi$a<",
            "TT;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/graphics/Rect;

    .line 5
    .line 6
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/cwi$c;->a:Landroid/graphics/Rect;

    .line 10
    .line 11
    new-instance v0, Landroid/graphics/Rect;

    .line 12
    .line 13
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/cwi$c;->b:Landroid/graphics/Rect;

    .line 17
    .line 18
    iput-boolean p1, p0, Ll/cwi$c;->c:Z

    .line 19
    .line 20
    iput-object p2, p0, Ll/cwi$c;->d:Ll/cwi$a;

    .line 21
    .line 22
    return-void
.end method


# virtual methods
.method public compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TT;)I"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/cwi$c;->a:Landroid/graphics/Rect;

    .line 2
    .line 3
    iget-object v1, p0, Ll/cwi$c;->b:Landroid/graphics/Rect;

    .line 4
    .line 5
    iget-object v2, p0, Ll/cwi$c;->d:Ll/cwi$a;

    .line 6
    .line 7
    invoke-interface {v2, p1, v0}, Ll/cwi$a;->a(Ljava/lang/Object;Landroid/graphics/Rect;)V

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Ll/cwi$c;->d:Ll/cwi$a;

    .line 11
    .line 12
    invoke-interface {p1, p2, v1}, Ll/cwi$a;->a(Ljava/lang/Object;Landroid/graphics/Rect;)V

    .line 13
    .line 14
    .line 15
    iget p1, v0, Landroid/graphics/Rect;->top:I

    .line 16
    .line 17
    iget p2, v1, Landroid/graphics/Rect;->top:I

    .line 18
    .line 19
    const/4 v2, -0x1

    .line 20
    if-ge p1, p2, :cond_0

    .line 21
    .line 22
    return v2

    .line 23
    :cond_0
    const/4 v3, 0x1

    .line 24
    if-le p1, p2, :cond_1

    .line 25
    .line 26
    return v3

    .line 27
    :cond_1
    iget p1, v0, Landroid/graphics/Rect;->left:I

    .line 28
    .line 29
    iget p2, v1, Landroid/graphics/Rect;->left:I

    .line 30
    .line 31
    if-ge p1, p2, :cond_3

    .line 32
    .line 33
    iget-boolean p0, p0, Ll/cwi$c;->c:Z

    .line 34
    .line 35
    if-eqz p0, :cond_2

    .line 36
    .line 37
    return v3

    .line 38
    :cond_2
    return v2

    .line 39
    :cond_3
    if-le p1, p2, :cond_5

    .line 40
    .line 41
    iget-boolean p0, p0, Ll/cwi$c;->c:Z

    .line 42
    .line 43
    if-eqz p0, :cond_4

    .line 44
    .line 45
    return v2

    .line 46
    :cond_4
    return v3

    .line 47
    :cond_5
    iget p1, v0, Landroid/graphics/Rect;->bottom:I

    .line 48
    .line 49
    iget p2, v1, Landroid/graphics/Rect;->bottom:I

    .line 50
    .line 51
    if-ge p1, p2, :cond_6

    .line 52
    .line 53
    return v2

    .line 54
    :cond_6
    if-le p1, p2, :cond_7

    .line 55
    .line 56
    return v3

    .line 57
    :cond_7
    iget p1, v0, Landroid/graphics/Rect;->right:I

    .line 58
    .line 59
    iget p2, v1, Landroid/graphics/Rect;->right:I

    .line 60
    .line 61
    if-ge p1, p2, :cond_9

    .line 62
    .line 63
    iget-boolean p0, p0, Ll/cwi$c;->c:Z

    .line 64
    .line 65
    if-eqz p0, :cond_8

    .line 66
    .line 67
    return v3

    .line 68
    :cond_8
    return v2

    .line 69
    :cond_9
    if-le p1, p2, :cond_b

    .line 70
    .line 71
    iget-boolean p0, p0, Ll/cwi$c;->c:Z

    .line 72
    .line 73
    if-eqz p0, :cond_a

    .line 74
    .line 75
    return v2

    .line 76
    :cond_a
    return v3

    .line 77
    :cond_b
    const/4 p0, 0x0

    .line 78
    return p0
.end method
