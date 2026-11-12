.class public final synthetic Lmdn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf7f;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lndn;


# direct methods
.method public synthetic constructor <init>(Lndn;B)V
    .registers 3

    iput-byte p2, p0, Lmdn;->a:B

    iput-object p1, p0, Lmdn;->b:Lndn;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final d0(Ljava/lang/Object;)V
    .registers 4

    iget-byte v0, p0, Lmdn;->a:B

    iget-object p0, p0, Lmdn;->b:Lndn;

    packed-switch v0, :pswitch_data_2e

    check-cast p1, Luvg;

    invoke-virtual {p0}, Lndn;->b()V

    return-void

    :pswitch_d
    check-cast p1, Ljava/util/List;

    iget-object v0, p0, Lndn;->g:Lgdn;

    if-nez p1, :cond_15

    sget-object p1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    :cond_15
    iput-object p1, v0, Lgdn;->p:Ljava/util/List;

    iget-boolean p1, v0, Lgdn;->q:Z

    if-eqz p1, :cond_28

    iget-object p1, v0, Lha2;->a:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    iget-object v1, v0, Lgdn;->p:Ljava/util/List;

    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    invoke-virtual {v0}, Landroidx/recyclerview/widget/d;->notifyDataSetChanged()V

    :cond_28
    iget-object p0, p0, Lndn;->h:Lcom/opera/android/widget/RecyclerViewEmptyViewSwitcher;

    invoke-virtual {p0}, Lcom/opera/android/widget/RecyclerViewEmptyViewSwitcher;->b()V

    return-void

    :pswitch_data_2e
    .packed-switch 0x0
        :pswitch_d
    .end packed-switch
.end method
