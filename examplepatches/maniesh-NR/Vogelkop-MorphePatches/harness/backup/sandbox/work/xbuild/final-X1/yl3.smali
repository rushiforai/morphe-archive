.class public final Lyl3;
.super Lxz7;
.source "SourceFile"


# instance fields
.field public final b:Lwl3;


# direct methods
.method public constructor <init>(Lwl3;)V
    .registers 2

    invoke-direct {p0, p1}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    iput-object p1, p0, Lyl3;->b:Lwl3;

    return-void
.end method


# virtual methods
.method public final U(I)V
    .registers 2

    iget-object p0, p0, Lyl3;->b:Lwl3;

    iget-object p0, p0, Lwl3;->a:Lpt1;

    iget-object p0, p0, Lpt1;->e:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/custom_views/AnimationEmptyListView;

    invoke-virtual {p0, p1}, Lcom/opera/android/custom_views/AnimationEmptyListView;->b(I)V

    return-void
.end method

.method public final V(I)V
    .registers 2

    iget-object p0, p0, Lyl3;->b:Lwl3;

    iget-object p0, p0, Lwl3;->a:Lpt1;

    iget-object p0, p0, Lpt1;->e:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/custom_views/AnimationEmptyListView;

    invoke-virtual {p0, p1}, Lcom/opera/android/custom_views/AnimationEmptyListView;->c(I)V

    return-void
.end method
