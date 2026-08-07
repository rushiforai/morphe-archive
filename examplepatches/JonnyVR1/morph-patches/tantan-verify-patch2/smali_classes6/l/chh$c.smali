.class public Ll/chh$c;
.super Landroidx/recyclerview/widget/RecyclerView$n;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/chh;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "c"
.end annotation


# instance fields
.field public final synthetic a:Ll/chh;


# direct methods
.method public constructor <init>(Ll/chh;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/chh$c;->a:Ll/chh;

    .line 2
    .line 3
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$n;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public getItemOffsets(Landroid/graphics/Rect;Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$a0;)V
    .locals 0

    .line 1
    invoke-virtual {p3, p2}, Landroidx/recyclerview/widget/RecyclerView;->getChildAdapterPosition(Landroid/view/View;)I

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    iget-object p0, p0, Ll/chh$c;->a:Ll/chh;

    .line 6
    .line 7
    invoke-static {p0}, Ll/chh;->d(Ll/chh;)Ll/rzh;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0, p2}, Ll/rzh;->F(I)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_1

    .line 16
    .line 17
    invoke-static {}, Ll/chh;->j()I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-nez p2, :cond_0

    .line 22
    .line 23
    const/high16 p2, 0x40800000    # 4.0f

    .line 24
    .line 25
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 26
    .line 27
    .line 28
    move-result p2

    .line 29
    add-int/2addr p0, p2

    .line 30
    :cond_0
    iput p0, p1, Landroid/graphics/Rect;->top:I

    .line 31
    .line 32
    invoke-static {}, Ll/chh;->i()I

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    iput p0, p1, Landroid/graphics/Rect;->bottom:I

    .line 37
    .line 38
    invoke-static {}, Ll/chh;->f()I

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    iput p0, p1, Landroid/graphics/Rect;->left:I

    .line 43
    .line 44
    invoke-static {}, Ll/chh;->f()I

    .line 45
    .line 46
    .line 47
    move-result p0

    .line 48
    iput p0, p1, Landroid/graphics/Rect;->right:I

    .line 49
    .line 50
    return-void

    .line 51
    :cond_1
    invoke-static {}, Ll/chh;->f()I

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    iput p0, p1, Landroid/graphics/Rect;->left:I

    .line 56
    .line 57
    invoke-static {}, Ll/chh;->f()I

    .line 58
    .line 59
    .line 60
    move-result p0

    .line 61
    iput p0, p1, Landroid/graphics/Rect;->right:I

    .line 62
    .line 63
    invoke-static {}, Ll/chh;->e()I

    .line 64
    .line 65
    .line 66
    move-result p0

    .line 67
    iput p0, p1, Landroid/graphics/Rect;->top:I

    .line 68
    .line 69
    invoke-static {}, Ll/chh;->e()I

    .line 70
    .line 71
    .line 72
    move-result p0

    .line 73
    iput p0, p1, Landroid/graphics/Rect;->bottom:I

    .line 74
    .line 75
    return-void
.end method
