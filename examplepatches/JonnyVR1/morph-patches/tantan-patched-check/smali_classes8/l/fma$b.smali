.class public Ll/fma$b;
.super Landroidx/recyclerview/widget/GridLayoutManager$c;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/fma;->r()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Landroidx/recyclerview/widget/GridLayoutManager;

.field public final synthetic b:Ll/fma;


# direct methods
.method public constructor <init>(Ll/fma;Landroidx/recyclerview/widget/GridLayoutManager;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/fma$b;->b:Ll/fma;

    .line 2
    .line 3
    iput-object p2, p0, Ll/fma$b;->a:Landroidx/recyclerview/widget/GridLayoutManager;

    .line 4
    .line 5
    invoke-direct {p0}, Landroidx/recyclerview/widget/GridLayoutManager$c;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public f(I)I
    .locals 1

    .line 1
    iget-object v0, p0, Ll/fma$b;->b:Ll/fma;

    .line 2
    .line 3
    iget-object v0, v0, Ll/fma;->j:Ll/fma$d;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ll/fma$d;->getItemViewType(I)I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_1

    .line 10
    .line 11
    const/4 v0, -0x1

    .line 12
    if-ne p1, v0, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_1
    :goto_0
    iget-object p0, p0, Ll/fma$b;->a:Landroidx/recyclerview/widget/GridLayoutManager;

    .line 18
    .line 19
    invoke-virtual {p0}, Landroidx/recyclerview/widget/GridLayoutManager;->m()I

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    return p0
.end method
