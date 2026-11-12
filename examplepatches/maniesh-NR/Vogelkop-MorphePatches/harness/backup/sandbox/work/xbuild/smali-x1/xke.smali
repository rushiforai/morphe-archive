.class public final Lxke;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lw7j;

.field public final b:Lm2k;

.field public final c:Landroidx/recyclerview/widget/d;

.field public final d:Lrma;

.field public e:I


# direct methods
.method public constructor <init>(Landroidx/recyclerview/widget/d;Lrma;Lb3g;Lm2k;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, La83;

    const/16 v1, 0xc

    invoke-direct {v0, p0, v1}, La83;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lxke;->c:Landroidx/recyclerview/widget/d;

    iput-object p2, p0, Lxke;->d:Lrma;

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p2, Lw7j;

    invoke-direct {p2}, Ljava/lang/Object;-><init>()V

    iput-object p3, p2, Lw7j;->d:Ljava/lang/Object;

    new-instance p3, Landroid/util/SparseIntArray;

    const/4 v1, 0x1

    invoke-direct {p3, v1}, Landroid/util/SparseIntArray;-><init>(I)V

    iput-object p3, p2, Lw7j;->a:Ljava/lang/Object;

    new-instance p3, Landroid/util/SparseIntArray;

    invoke-direct {p3, v1}, Landroid/util/SparseIntArray;-><init>(I)V

    iput-object p3, p2, Lw7j;->b:Ljava/lang/Object;

    iput-object p0, p2, Lw7j;->c:Ljava/lang/Object;

    iput-object p2, p0, Lxke;->a:Lw7j;

    iput-object p4, p0, Lxke;->b:Lm2k;

    invoke-virtual {p1}, Landroidx/recyclerview/widget/d;->getItemCount()I

    move-result p2

    iput p2, p0, Lxke;->e:I

    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/d;->registerAdapterDataObserver(Lgph;)V

    return-void
.end method
