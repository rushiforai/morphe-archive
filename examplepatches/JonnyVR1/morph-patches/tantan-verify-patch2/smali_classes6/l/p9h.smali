.class public Ll/p9h;
.super Ll/o9h;
.source "SourceFile"


# instance fields
.field public m:Landroid/widget/ImageView;

.field public n:Landroid/widget/TextView;

.field public o:Landroid/widget/TextView;

.field public p:Landroid/view/View;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/o9h;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public c()Z
    .locals 6

    .line 1
    invoke-super {p0}, Ll/o9h;->c()Z

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/l4h;->b:[Landroid/view/View;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/4 v1, 0x1

    .line 11
    if-eqz v0, :cond_4

    .line 12
    .line 13
    iget-object v0, p0, Ll/l4h;->b:[Landroid/view/View;

    .line 14
    .line 15
    array-length v2, v0

    .line 16
    const/4 v3, 0x3

    .line 17
    if-le v2, v3, :cond_4

    .line 18
    .line 19
    aget-object v2, v0, v1

    .line 20
    .line 21
    const/4 v4, 0x2

    .line 22
    aget-object v4, v0, v4

    .line 23
    .line 24
    aget-object v3, v0, v3

    .line 25
    .line 26
    const/4 v5, 0x4

    .line 27
    aget-object v0, v0, v5

    .line 28
    .line 29
    instance-of v5, v2, Landroid/widget/ImageView;

    .line 30
    .line 31
    if-eqz v5, :cond_0

    .line 32
    .line 33
    check-cast v2, Landroid/widget/ImageView;

    .line 34
    .line 35
    iput-object v2, p0, Ll/p9h;->m:Landroid/widget/ImageView;

    .line 36
    .line 37
    :cond_0
    instance-of v2, v4, Landroid/widget/TextView;

    .line 38
    .line 39
    if-eqz v2, :cond_1

    .line 40
    .line 41
    check-cast v4, Landroid/widget/TextView;

    .line 42
    .line 43
    iput-object v4, p0, Ll/p9h;->o:Landroid/widget/TextView;

    .line 44
    .line 45
    :cond_1
    instance-of v2, v3, Landroid/widget/TextView;

    .line 46
    .line 47
    if-eqz v2, :cond_2

    .line 48
    .line 49
    check-cast v3, Landroid/widget/TextView;

    .line 50
    .line 51
    iput-object v3, p0, Ll/p9h;->n:Landroid/widget/TextView;

    .line 52
    .line 53
    :cond_2
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result v2

    .line 57
    if-eqz v2, :cond_3

    .line 58
    .line 59
    iput-object v0, p0, Ll/p9h;->p:Landroid/view/View;

    .line 60
    .line 61
    :cond_3
    invoke-virtual {p0}, Ll/p9h;->l()V

    .line 62
    .line 63
    .line 64
    :cond_4
    return v1
.end method

.method public final l()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/p9h;->m:Landroid/widget/ImageView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/p9h;->m:Landroid/widget/ImageView;

    .line 10
    .line 11
    sget v1, Ll/lbc0;->c2:I

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 14
    .line 15
    .line 16
    :cond_0
    iget-object v0, p0, Ll/p9h;->n:Landroid/widget/TextView;

    .line 17
    .line 18
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    const/high16 v1, 0x41200000    # 10.0f

    .line 23
    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    iget-object v0, p0, Ll/p9h;->n:Landroid/widget/TextView;

    .line 27
    .line 28
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 33
    .line 34
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    iput v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 39
    .line 40
    iget-object v2, p0, Ll/p9h;->n:Landroid/widget/TextView;

    .line 41
    .line 42
    invoke-virtual {v2, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 43
    .line 44
    .line 45
    :cond_1
    iget-object v0, p0, Ll/p9h;->o:Landroid/widget/TextView;

    .line 46
    .line 47
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-eqz v0, :cond_2

    .line 52
    .line 53
    iget-object v0, p0, Ll/p9h;->o:Landroid/widget/TextView;

    .line 54
    .line 55
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 60
    .line 61
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 66
    .line 67
    iget-object v1, p0, Ll/p9h;->o:Landroid/widget/TextView;

    .line 68
    .line 69
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 70
    .line 71
    .line 72
    iget-object v0, p0, Ll/p9h;->o:Landroid/widget/TextView;

    .line 73
    .line 74
    const-string v1, "#212121"

    .line 75
    .line 76
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 77
    .line 78
    .line 79
    move-result v1

    .line 80
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 81
    .line 82
    .line 83
    :cond_2
    iget-object v0, p0, Ll/p9h;->p:Landroid/view/View;

    .line 84
    .line 85
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    if-eqz v0, :cond_3

    .line 90
    .line 91
    iget-object p0, p0, Ll/p9h;->p:Landroid/view/View;

    .line 92
    .line 93
    const/4 v0, 0x0

    .line 94
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 95
    .line 96
    .line 97
    :cond_3
    return-void
.end method
