.class public final synthetic Ll93;
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

    iput-byte p2, p0, Ll93;->a:B

    iput-object p1, p0, Ll93;->b:Lf9c;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 3

    iget-byte p1, p0, Ll93;->a:B

    iget-object p0, p0, Ll93;->b:Lf9c;

    packed-switch p1, :pswitch_data_32

    invoke-virtual {p0}, Lryl;->g0()V

    return-void

    :pswitch_b
    iget-object p1, p0, Lf9c;->s:Ljava/lang/Object;

    check-cast p1, Lzu;

    iget-object p1, p1, Lzu;->c:Lcom/opera/android/custom_views/OperaTextInputEditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lwqm;->q(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_31

    iget-object v0, p0, Lf9c;->v:Ljava/lang/Object;

    check-cast v0, Lva2;

    iget-object v0, v0, Lva2;->b:Ljava/lang/Object;

    check-cast v0, Lm93;

    invoke-virtual {v0, p1}, Lm93;->G0(Ljava/lang/String;)V

    invoke-virtual {p0}, Lryl;->g0()V

    :cond_31
    return-void

    :pswitch_data_32
    .packed-switch 0x0
        :pswitch_b
    .end packed-switch
.end method
