.class public final synthetic Lklh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lf9c;


# direct methods
.method public synthetic constructor <init>(Lf9c;B)V
    .registers 3

    iput-byte p2, p0, Lklh;->a:B

    iput-object p1, p0, Lklh;->b:Lf9c;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 3

    iget-byte p1, p0, Lklh;->a:B

    iget-object p0, p0, Lklh;->b:Lf9c;

    packed-switch p1, :pswitch_data_32

    invoke-virtual {p0}, Lryl;->g0()V

    return-void

    :pswitch_b
    iget-object p1, p0, Lf9c;->s:Ljava/lang/Object;

    check-cast p1, Lor2;

    iget-object p1, p1, Lor2;->f:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/custom_views/OperaTextInputEditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    iget-object v0, p0, Lf9c;->u:Ljava/lang/Object;

    check-cast v0, Lilh;

    iget-object v0, v0, Lilh;->c:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2e

    iget-object v0, p0, Lf9c;->v:Ljava/lang/Object;

    check-cast v0, Leof;

    invoke-virtual {v0, p1}, Leof;->run(Ljava/lang/Object;)V

    :cond_2e
    invoke-virtual {p0}, Lryl;->g0()V

    return-void

    :pswitch_data_32
    .packed-switch 0x0
        :pswitch_b
    .end packed-switch
.end method
