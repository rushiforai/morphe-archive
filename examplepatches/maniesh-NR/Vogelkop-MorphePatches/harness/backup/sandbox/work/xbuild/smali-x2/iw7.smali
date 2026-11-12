.class public final Liw7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lsj7;


# instance fields
.field public final synthetic a:B

.field public b:Z

.field public final synthetic c:Lhzj;


# direct methods
.method public synthetic constructor <init>(Lhzj;B)V
    .registers 3

    iput-byte p2, p0, Liw7;->a:B

    iput-object p1, p0, Liw7;->c:Lhzj;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final c(Landroidx/recyclerview/widget/i;)V
    .registers 5

    iget-byte p1, p0, Liw7;->a:B

    const/4 v0, 0x0

    iget-object v1, p0, Liw7;->c:Lhzj;

    packed-switch p1, :pswitch_data_2a

    check-cast v1, Lkok;

    iget-object p1, v1, Lkok;->b:Lcom/opera/android/feed/FeedScrollView;

    iget-object v2, p1, Landroidx/core/widget/NestedScrollView;->x:Ls14;

    iget-boolean v2, v2, Ls14;->b:Z

    iput-boolean v2, p0, Liw7;->b:Z

    invoke-virtual {p1, v0}, Landroidx/core/widget/NestedScrollView;->setNestedScrollingEnabled(Z)V

    iget-object p0, v1, Lkok;->l:Lvk2;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-void

    :pswitch_1b
    check-cast v1, Low7;

    iget-object p1, v1, Low7;->d:Lcom/opera/android/feed/FeedScrollView;

    iget-object v1, p1, Landroidx/core/widget/NestedScrollView;->x:Ls14;

    iget-boolean v1, v1, Ls14;->b:Z

    iput-boolean v1, p0, Liw7;->b:Z

    invoke-virtual {p1, v0}, Landroidx/core/widget/NestedScrollView;->setNestedScrollingEnabled(Z)V

    return-void

    nop

    :pswitch_data_2a
    .packed-switch 0x0
        :pswitch_1b
    .end packed-switch
.end method

.method public final o(Landroidx/recyclerview/widget/i;)V
    .registers 3

    iget-byte p1, p0, Liw7;->a:B

    iget-object v0, p0, Liw7;->c:Lhzj;

    packed-switch p1, :pswitch_data_20

    check-cast v0, Lkok;

    iget-object p1, v0, Lkok;->l:Lvk2;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object p1, v0, Lkok;->b:Lcom/opera/android/feed/FeedScrollView;

    iget-boolean p0, p0, Liw7;->b:Z

    invoke-virtual {p1, p0}, Landroidx/core/widget/NestedScrollView;->setNestedScrollingEnabled(Z)V

    return-void

    :pswitch_16
    check-cast v0, Low7;

    iget-object p1, v0, Low7;->d:Lcom/opera/android/feed/FeedScrollView;

    iget-boolean p0, p0, Liw7;->b:Z

    invoke-virtual {p1, p0}, Landroidx/core/widget/NestedScrollView;->setNestedScrollingEnabled(Z)V

    return-void

    :pswitch_data_20
    .packed-switch 0x0
        :pswitch_16
    .end packed-switch
.end method
