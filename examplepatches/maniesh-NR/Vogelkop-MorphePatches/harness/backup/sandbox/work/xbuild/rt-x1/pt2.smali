.class public final synthetic Lpt2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lqt2;


# direct methods
.method public synthetic constructor <init>(Lqt2;B)V
    .registers 3

    iput-byte p2, p0, Lpt2;->a:B

    iput-object p1, p0, Lpt2;->b:Lqt2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 10

    iget-byte p1, p0, Lpt2;->a:B

    iget-object p0, p0, Lpt2;->b:Lqt2;

    packed-switch p1, :pswitch_data_4a

    invoke-virtual {p0}, Lryl;->g0()V

    return-void

    :pswitch_b
    iget-object p1, p0, Lqt2;->w:Lzyk;

    invoke-virtual {p1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lst2;

    iget-object v0, p0, Lqt2;->z:Lw3g;

    if-nez v0, :cond_18

    const/4 v0, 0x0

    :cond_18
    invoke-virtual {p0}, Lqt2;->H0()Lnl9;

    move-result-object v1

    iget-object v1, v1, Lnl9;->g:Lcom/opera/android/custom_views/OperaTextInputEditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0}, Lqt2;->H0()Lnl9;

    move-result-object p0

    iget-object p0, p0, Lnl9;->c:Lcom/opera/android/custom_views/OperaTextInputEditText;

    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    iget-object p0, p1, Lst2;->e:La4g;

    if-eqz p0, :cond_48

    new-instance v7, Lrt2;

    invoke-direct {v7, p1, v0}, Lrt2;-><init>(Lst2;Lw3g;)V

    iget-object p1, p0, La4g;->a:Ljava/util/List;

    invoke-static {p1, v0}, Lw3g;->a(Ljava/util/List;Lw3g;)I

    move-result v4

    iget-wide v2, p0, La4g;->b:J

    invoke-static/range {v2 .. v7}, LJ/N;->MjE4dyB7(JILjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_48
    return-void

    nop

    :pswitch_data_4a
    .packed-switch 0x0
        :pswitch_b
    .end packed-switch
.end method
