.class public Ll/clk$a;
.super Landroidx/recyclerview/widget/RecyclerView$n;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/clk;->r()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/clk;


# direct methods
.method public constructor <init>(Ll/clk;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/clk$a;->a:Ll/clk;

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
    .param p1    # Landroid/graphics/Rect;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Landroidx/recyclerview/widget/RecyclerView;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p4    # Landroidx/recyclerview/widget/RecyclerView$a0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroidx/recyclerview/widget/RecyclerView$n;->getItemOffsets(Landroid/graphics/Rect;Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$a0;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p3, p2}, Landroidx/recyclerview/widget/RecyclerView;->getChildAdapterPosition(Landroid/view/View;)I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    const/4 p2, 0x1

    .line 9
    if-ne p0, p2, :cond_0

    .line 10
    .line 11
    const/high16 p0, 0x41000000    # 8.0f

    .line 12
    .line 13
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    iput p0, p1, Landroid/graphics/Rect;->top:I

    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    if-le p0, p2, :cond_1

    .line 21
    .line 22
    const/high16 p0, 0x41c00000    # 24.0f

    .line 23
    .line 24
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    iput p0, p1, Landroid/graphics/Rect;->top:I

    .line 29
    .line 30
    :cond_1
    return-void
.end method
