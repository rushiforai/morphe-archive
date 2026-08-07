.class public Ll/pus$a;
.super Landroidx/recyclerview/widget/RecyclerView$n;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/pus;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public final a:I

.field public final b:I

.field public final c:I


# direct methods
.method public constructor <init>(III)V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$n;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/pus$a;->a:I

    .line 5
    .line 6
    iput p2, p0, Ll/pus$a;->b:I

    .line 7
    .line 8
    iput p3, p0, Ll/pus$a;->c:I

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public getItemOffsets(Landroid/graphics/Rect;Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$a0;)V
    .locals 0

    .line 1
    invoke-virtual {p3, p2}, Landroidx/recyclerview/widget/RecyclerView;->getChildViewHolder(Landroid/view/View;)Landroidx/recyclerview/widget/RecyclerView$e0;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p2}, Landroidx/recyclerview/widget/RecyclerView$e0;->getAdapterPosition()I

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    iget p3, p0, Ll/pus$a;->b:I

    .line 10
    .line 11
    iput p3, p1, Landroid/graphics/Rect;->top:I

    .line 12
    .line 13
    iget p3, p0, Ll/pus$a;->c:I

    .line 14
    .line 15
    rem-int/2addr p2, p3

    .line 16
    if-eqz p2, :cond_0

    .line 17
    .line 18
    iget p0, p0, Ll/pus$a;->a:I

    .line 19
    .line 20
    iput p0, p1, Landroid/graphics/Rect;->left:I

    .line 21
    .line 22
    :cond_0
    return-void
.end method
