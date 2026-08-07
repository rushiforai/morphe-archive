.class public Ll/fnp0$b$a;
.super Landroidx/recyclerview/widget/RecyclerView$n;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/fnp0$b;-><init>(Landroid/view/View;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Ll/fnp0$b;


# direct methods
.method public constructor <init>(Ll/fnp0$b;Z)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/fnp0$b$a;->b:Ll/fnp0$b;

    .line 2
    .line 3
    iput-boolean p2, p0, Ll/fnp0$b$a;->a:Z

    .line 4
    .line 5
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$n;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public getItemOffsets(Landroid/graphics/Rect;Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$a0;)V
    .locals 0
    .param p1    # Landroid/graphics/Rect;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Landroidx/recyclerview/widget/RecyclerView;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p4    # Landroidx/recyclerview/widget/RecyclerView$a0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p3, p2}, Landroidx/recyclerview/widget/RecyclerView;->getChildAdapterPosition(Landroid/view/View;)I

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    div-int/lit8 p3, p2, 0x3

    .line 6
    .line 7
    rem-int/lit8 p2, p2, 0x3

    .line 8
    .line 9
    iget-boolean p0, p0, Ll/fnp0$b$a;->a:Z

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/high16 p0, 0x40400000    # 3.0f

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/high16 p0, 0x40800000    # 4.0f

    .line 17
    .line 18
    :goto_0
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    neg-int p0, p0

    .line 23
    mul-int/2addr p0, p2

    .line 24
    iput p0, p1, Landroid/graphics/Rect;->top:I

    .line 25
    .line 26
    if-lez p3, :cond_1

    .line 27
    .line 28
    const/high16 p0, 0x3f800000    # 1.0f

    .line 29
    .line 30
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    goto :goto_1

    .line 35
    :cond_1
    const/4 p0, 0x0

    .line 36
    :goto_1
    iput p0, p1, Landroid/graphics/Rect;->left:I

    .line 37
    .line 38
    return-void
.end method
