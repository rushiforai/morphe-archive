.class public final synthetic Lhw7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lile;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lhw7;->a:B

    iput-object p1, p0, Lhw7;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Landroidx/core/widget/NestedScrollView;IIII)V
    .registers 13

    iget-byte v0, p0, Lhw7;->a:B

    iget-object p0, p0, Lhw7;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_50

    check-cast p0, Lkok;

    if-ne p2, p4, :cond_d

    if-eq p3, p5, :cond_18

    :cond_d
    iget-boolean p1, p0, Lkok;->q:Z

    if-eqz p1, :cond_18

    iget-object p1, p0, Lkok;->s:Leok;

    iget-object p0, p0, Lkok;->a:Lcom/opera/android/custom_views/FadingRecyclerView;

    invoke-virtual {p1, p0}, Lh6e;->d(Landroidx/recyclerview/widget/RecyclerView;)V

    :cond_18
    return-void

    :pswitch_19
    check-cast p0, Lnoc;

    iget-object p0, p0, Lnoc;->b:Lcan;

    invoke-virtual {p0}, Lcan;->d()V

    return-void

    :pswitch_21
    check-cast p0, Lcom/opera/android/feed/FeedScrollView;

    sget v0, Lcom/opera/android/feed/FeedScrollView;->T:I

    iget-object p0, p0, Lcom/opera/android/feed/FeedScrollView;->D:Li7f;

    invoke-static {p0, p0}, Lu35;->c(Li7f;Li7f;)Lg7f;

    move-result-object p0

    :goto_2b
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_41

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    move-object v1, v0

    check-cast v1, Lile;

    move-object v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    invoke-interface/range {v1 .. v6}, Lile;->a(Landroidx/core/widget/NestedScrollView;IIII)V

    goto :goto_2b

    :cond_41
    return-void

    :pswitch_42
    check-cast p0, Low7;

    iget-boolean p1, p0, Low7;->j:Z

    if-eqz p1, :cond_4f

    iget-object p1, p0, Low7;->g:Ljr8;

    iget-object p0, p0, Low7;->c:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p1, p0}, Lh6e;->d(Landroidx/recyclerview/widget/RecyclerView;)V

    :cond_4f
    return-void

    :pswitch_data_50
    .packed-switch 0x0
        :pswitch_42
        :pswitch_21
        :pswitch_19
    .end packed-switch
.end method
