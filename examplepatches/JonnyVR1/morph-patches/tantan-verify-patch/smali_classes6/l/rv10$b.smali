.class public Ll/rv10$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/epr;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/rv10;->P(Ljava/util/List;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/rv10;


# direct methods
.method public constructor <init>(Ll/rv10;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/rv10$b;->a:Ll/rv10;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(IILjava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rv10$b;->a:Ll/rv10;

    .line 2
    .line 3
    add-int/lit8 p1, p1, 0x1

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2, p3}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemRangeChanged(IILjava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public b(II)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rv10$b;->a:Ll/rv10;

    .line 2
    .line 3
    add-int/lit8 p1, p1, 0x1

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemRangeInserted(II)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public c(II)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rv10$b;->a:Ll/rv10;

    .line 2
    .line 3
    add-int/lit8 p1, p1, 0x1

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemRangeRemoved(II)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public d(II)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rv10$b;->a:Ll/rv10;

    .line 2
    .line 3
    add-int/lit8 p1, p1, 0x1

    .line 4
    .line 5
    add-int/lit8 p2, p2, 0x1

    .line 6
    .line 7
    invoke-virtual {p0, p1, p2}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemMoved(II)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
