.class public final Ltkn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnScrollChangeListener;


# instance fields
.field public a:Z

.field public final synthetic b:Landroidx/recyclerview/widget/RecyclerView;

.field public final synthetic c:Lukn;


# direct methods
.method public constructor <init>(Lukn;Landroidx/recyclerview/widget/RecyclerView;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Ltkn;->b:Landroidx/recyclerview/widget/RecyclerView;

    iput-object p1, p0, Ltkn;->c:Lukn;

    return-void
.end method


# virtual methods
.method public final onScrollChange(Landroid/view/View;IIII)V
    .registers 6

    iget-object p1, p0, Ltkn;->b:Landroidx/recyclerview/widget/RecyclerView;

    iget-byte p1, p1, Landroidx/recyclerview/widget/RecyclerView;->N:B

    const/4 p2, 0x1

    if-ne p1, p2, :cond_a

    iput-boolean p2, p0, Ltkn;->a:Z

    return-void

    :cond_a
    iget-boolean p1, p0, Ltkn;->a:Z

    if-eqz p1, :cond_20

    iget-object p1, p0, Ltkn;->c:Lukn;

    iget-object p1, p1, Lukn;->t:Lonn;

    iget-object p1, p1, Lonn;->g:Lmnn;

    if-eqz p1, :cond_1d

    iget-wide p2, p1, Lmnn;->b:J

    const-wide/16 p4, 0x1

    add-long/2addr p2, p4

    iput-wide p2, p1, Lmnn;->b:J

    :cond_1d
    const/4 p1, 0x0

    iput-boolean p1, p0, Ltkn;->a:Z

    :cond_20
    return-void
.end method
