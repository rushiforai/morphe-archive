.class public final Ldqh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnLayoutChangeListener;


# instance fields
.field public final synthetic a:Landroidx/recyclerview/widget/RecyclerView;

.field public final synthetic b:I

.field public final synthetic c:I

.field public final synthetic d:I

.field public final synthetic e:I

.field public final synthetic f:Lu5l;


# direct methods
.method public constructor <init>(Landroidx/recyclerview/widget/RecyclerView;IIIILu5l;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ldqh;->a:Landroidx/recyclerview/widget/RecyclerView;

    iput p2, p0, Ldqh;->b:I

    iput p3, p0, Ldqh;->c:I

    iput p4, p0, Ldqh;->d:I

    iput p5, p0, Ldqh;->e:I

    iput-object p6, p0, Ldqh;->f:Lu5l;

    return-void
.end method


# virtual methods
.method public final onLayoutChange(Landroid/view/View;IIIIIIII)V
    .registers 10

    iget-object p1, p0, Ldqh;->a:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p1, p0}, Landroid/view/View;->removeOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    new-instance p2, Lcqh;

    iget-object p3, p0, Ldqh;->a:Landroidx/recyclerview/widget/RecyclerView;

    iget p4, p0, Ldqh;->b:I

    iget p5, p0, Ldqh;->c:I

    iget p6, p0, Ldqh;->d:I

    iget p7, p0, Ldqh;->e:I

    iget-object p8, p0, Ldqh;->f:Lu5l;

    invoke-direct/range {p2 .. p8}, Lcqh;-><init>(Landroidx/recyclerview/widget/RecyclerView;IIIILu5l;)V

    invoke-virtual {p3, p2}, Landroid/view/View;->postOnAnimation(Ljava/lang/Runnable;)V

    return-void
.end method
