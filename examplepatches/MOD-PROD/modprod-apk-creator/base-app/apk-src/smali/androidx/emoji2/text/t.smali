.class public final Landroidx/emoji2/text/t;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroid/util/SparseArray;

.field public b:Landroidx/emoji2/text/w;


# direct methods
.method public constructor <init>(I)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0, p1}, Landroid/util/SparseArray;-><init>(I)V

    iput-object v0, p0, Landroidx/emoji2/text/t;->a:Landroid/util/SparseArray;

    return-void
.end method


# virtual methods
.method public final a(Landroidx/emoji2/text/w;II)V
    .locals 4

    invoke-virtual {p1, p2}, Landroidx/emoji2/text/w;->a(I)I

    move-result v0

    iget-object v1, p0, Landroidx/emoji2/text/t;->a:Landroid/util/SparseArray;

    if-nez v1, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {v1, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/emoji2/text/t;

    :goto_0
    const/4 v2, 0x1

    if-nez v0, :cond_1

    new-instance v0, Landroidx/emoji2/text/t;

    invoke-direct {v0, v2}, Landroidx/emoji2/text/t;-><init>(I)V

    invoke-virtual {p1, p2}, Landroidx/emoji2/text/w;->a(I)I

    move-result v3

    invoke-virtual {v1, v3, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    :cond_1
    if-le p3, p2, :cond_2

    add-int/2addr p2, v2

    invoke-virtual {v0, p1, p2, p3}, Landroidx/emoji2/text/t;->a(Landroidx/emoji2/text/w;II)V

    return-void

    :cond_2
    iput-object p1, v0, Landroidx/emoji2/text/t;->b:Landroidx/emoji2/text/w;

    return-void
.end method
