.class public final synthetic Laeh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf7f;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lbeh;


# direct methods
.method public synthetic constructor <init>(Lbeh;B)V
    .registers 3

    iput-byte p2, p0, Laeh;->a:B

    iput-object p1, p0, Laeh;->b:Lbeh;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final d0(Ljava/lang/Object;)V
    .registers 5

    iget-byte v0, p0, Laeh;->a:B

    iget-object p0, p0, Laeh;->b:Lbeh;

    packed-switch v0, :pswitch_data_58

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object p0, p0, Lbeh;->i:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->requestLayout()V

    return-void

    :pswitch_12
    check-cast p1, Ltta;

    iget-object p1, p0, Lbeh;->j:Lcom/opera/android/favorites/FavoriteGridLayoutManager;

    iget-object v0, p0, Lbeh;->h:Lpde;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ltta;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget v1, p1, Landroidx/recyclerview/widget/CustomGridLayoutManager;->g:I

    const/4 v2, 0x1

    if-eq v1, v2, :cond_2b

    iput v2, p1, Landroidx/recyclerview/widget/CustomGridLayoutManager;->g:I

    invoke-virtual {p1}, Landroidx/recyclerview/widget/f;->requestLayout()V

    :cond_2b
    iget-object p1, p0, Lbeh;->k:Lsdh;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ltta;

    invoke-virtual {p1, v0}, Lns8;->V(Ltta;)V

    iget-object p0, p0, Lbeh;->i:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->m:Landroidx/recyclerview/widget/d;

    if-eqz v0, :cond_3f

    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->y0(Landroidx/recyclerview/widget/d;)V

    :cond_3f
    return-void

    :pswitch_40
    check-cast p1, Lvr8;

    iget-object p0, p0, Lbeh;->k:Lsdh;

    invoke-virtual {p0, p1}, Lns8;->X(Lvr8;)V

    return-void

    :pswitch_48
    check-cast p1, Ljava/util/List;

    iget-object p0, p0, Lbeh;->k:Lsdh;

    iget-object p0, p0, Lns8;->c:Ls9i;

    iget-object p0, p0, Ls9i;->b:Ljava/lang/Object;

    check-cast p0, Ltq8;

    check-cast p0, Lydh;

    invoke-virtual {p0, p1}, Lydh;->E(Ljava/util/List;)V

    return-void

    :pswitch_data_58
    .packed-switch 0x0
        :pswitch_48
        :pswitch_40
        :pswitch_12
    .end packed-switch
.end method
