.class public final Lco4;
.super Lnmd;
.source "SourceFile"


# instance fields
.field public final synthetic A:Lomd;

.field public final synthetic z:B


# direct methods
.method public synthetic constructor <init>(Lomd;Landroid/content/Context;IB)V
    .registers 5

    iput-byte p4, p0, Lco4;->z:B

    iput-object p1, p0, Lco4;->A:Lomd;

    invoke-direct {p0, p2, p3}, Lnmd;-><init>(Landroid/content/Context;I)V

    return-void
.end method


# virtual methods
.method public final onCreate(Landroid/os/Bundle;)V
    .registers 5

    iget-byte v0, p0, Lco4;->z:B

    const v1, 0x7f0a06f5

    packed-switch v0, :pswitch_data_4e

    invoke-super {p0, p1}, Lnmd;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0, v1}, Lzp1;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ListView;

    if-eqz p1, :cond_34

    iget-object v0, p0, Lco4;->A:Lomd;

    check-cast v0, Lpmd;

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v1, Lou;

    const/4 v2, 0x1

    invoke-direct {v1, v0, v2}, Lou;-><init>(Landroidx/fragment/app/i;B)V

    invoke-virtual {p1, v1}, Landroid/widget/AdapterView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    new-instance p1, Landroid/os/Handler;

    invoke-direct {p1}, Landroid/os/Handler;-><init>()V

    new-instance v0, Lvl9;

    const/16 v1, 0xd

    invoke-direct {v0, p0, v1}, Lvl9;-><init>(Ljava/lang/Object;B)V

    const-wide/16 v1, 0xbb8

    invoke-virtual {p1, v0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_34
    return-void

    :pswitch_35
    invoke-super {p0, p1}, Lnmd;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0, v1}, Lzp1;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ListView;

    if-eqz p1, :cond_4d

    invoke-virtual {p1}, Landroid/widget/AdapterView;->getOnItemClickListener()Landroid/widget/AdapterView$OnItemClickListener;

    move-result-object v0

    new-instance v1, Lbo4;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v0, v2}, Lbo4;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p1, v1}, Landroid/widget/AdapterView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    :cond_4d
    return-void

    :pswitch_data_4e
    .packed-switch 0x0
        :pswitch_35
    .end packed-switch
.end method
