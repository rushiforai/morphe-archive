.class public final synthetic Ltk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lsni;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Ltk;->a:B

    iput-object p1, p0, Ltk;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final Y(Z)V
    .registers 4

    iget-byte v0, p0, Ltk;->a:B

    iget-object p0, p0, Ltk;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_46

    check-cast p0, Lwyl;

    invoke-virtual {p0}, Lwyl;->H0()V

    return-void

    :pswitch_d
    check-cast p0, Lvcj;

    invoke-virtual {p0, p1}, Lvcj;->Y(Z)V

    return-void

    :pswitch_13
    check-cast p0, Lha2;

    iget-object p1, p0, Lha2;->d:Lf1p;

    iget-object p1, p1, Lf1p;->a:Ljava/lang/Object;

    check-cast p1, Li7f;

    const-class v0, Lbu8;

    invoke-static {p1, v0}, Lsfe;->R(Ljava/lang/Iterable;Ljava/lang/Class;)Lzlb;

    move-result-object p1

    invoke-virtual {p1}, Lzlb;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_25
    :goto_25
    move-object v0, p1

    check-cast v0, Lbmb;

    invoke-virtual {v0}, Lbmb;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3f

    invoke-virtual {v0}, Lbmb;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lab2;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/i;->getAdapterPosition()I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_25

    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/d;->notifyItemChanged(I)V

    goto :goto_25

    :cond_3f
    return-void

    :pswitch_40
    check-cast p0, Lwk;

    invoke-virtual {p0}, Lwk;->H0()V

    return-void

    :pswitch_data_46
    .packed-switch 0x0
        :pswitch_40
        :pswitch_13
        :pswitch_d
    .end packed-switch
.end method
