.class public final synthetic Laqh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnDrawListener;


# instance fields
.field public final synthetic a:Lh6e;

.field public final synthetic b:Landroidx/recyclerview/widget/RecyclerView;


# direct methods
.method public synthetic constructor <init>(Lh6e;Landroidx/recyclerview/widget/RecyclerView;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Laqh;->a:Lh6e;

    iput-object p2, p0, Laqh;->b:Landroidx/recyclerview/widget/RecyclerView;

    return-void
.end method


# virtual methods
.method public final onDraw()V
    .registers 2

    iget-object v0, p0, Laqh;->a:Lh6e;

    iget-object p0, p0, Laqh;->b:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0, p0}, Lh6e;->a(Landroidx/recyclerview/widget/RecyclerView;)V

    return-void
.end method
