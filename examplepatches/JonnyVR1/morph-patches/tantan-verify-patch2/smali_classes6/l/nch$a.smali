.class public Ll/nch$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/epr;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/nch;-><init>(Landroidx/recyclerview/widget/RecyclerView$Adapter;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Landroidx/recyclerview/widget/RecyclerView$Adapter;

.field public final synthetic b:I

.field public final synthetic c:Ll/nch;


# direct methods
.method public constructor <init>(Ll/nch;Landroidx/recyclerview/widget/RecyclerView$Adapter;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/nch$a;->c:Ll/nch;

    .line 2
    .line 3
    iput-object p2, p0, Ll/nch$a;->a:Landroidx/recyclerview/widget/RecyclerView$Adapter;

    .line 4
    .line 5
    iput p3, p0, Ll/nch$a;->b:I

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a(IILjava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/nch$a;->a:Landroidx/recyclerview/widget/RecyclerView$Adapter;

    .line 2
    .line 3
    iget p0, p0, Ll/nch$a;->b:I

    .line 4
    .line 5
    add-int/2addr p1, p0

    .line 6
    invoke-virtual {v0, p1, p2, p3}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemRangeChanged(IILjava/lang/Object;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public b(II)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/nch$a;->a:Landroidx/recyclerview/widget/RecyclerView$Adapter;

    .line 2
    .line 3
    iget p0, p0, Ll/nch$a;->b:I

    .line 4
    .line 5
    add-int/2addr p1, p0

    .line 6
    invoke-virtual {v0, p1, p2}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemRangeInserted(II)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public c(II)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/nch$a;->a:Landroidx/recyclerview/widget/RecyclerView$Adapter;

    .line 2
    .line 3
    iget p0, p0, Ll/nch$a;->b:I

    .line 4
    .line 5
    add-int/2addr p1, p0

    .line 6
    invoke-virtual {v0, p1, p2}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemRangeRemoved(II)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public d(II)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/nch$a;->a:Landroidx/recyclerview/widget/RecyclerView$Adapter;

    .line 2
    .line 3
    iget p0, p0, Ll/nch$a;->b:I

    .line 4
    .line 5
    add-int/2addr p1, p0

    .line 6
    add-int/2addr p2, p0

    .line 7
    invoke-virtual {v0, p1, p2}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemMoved(II)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
