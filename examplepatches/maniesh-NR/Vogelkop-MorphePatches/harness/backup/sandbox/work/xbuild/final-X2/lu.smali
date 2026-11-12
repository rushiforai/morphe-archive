.class public final synthetic Llu;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lru;


# direct methods
.method public synthetic constructor <init>(Lru;B)V
    .registers 3

    iput-byte p2, p0, Llu;->a:B

    iput-object p1, p0, Llu;->b:Lru;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 12

    iget-byte v0, p0, Llu;->a:B

    iget-object p0, p0, Llu;->b:Lru;

    packed-switch v0, :pswitch_data_a6

    invoke-virtual {p0}, Lru;->I0()Lhm9;

    move-result-object p1

    iget-object p1, p1, Lhm9;->f:Lcom/opera/android/custom_views/OperaTextInputEditText;

    invoke-virtual {p0}, Lru;->J0()Lxu;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Lfsp;->v()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p0}, Lru;->I0()Lhm9;

    move-result-object p1

    iget-object p1, p1, Lhm9;->f:Lcom/opera/android/custom_views/OperaTextInputEditText;

    invoke-virtual {p0}, Lru;->I0()Lhm9;

    move-result-object p0

    iget-object p0, p0, Lhm9;->f:Lcom/opera/android/custom_views/OperaTextInputEditText;

    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p0

    if-eqz p0, :cond_32

    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result p0

    goto :goto_33

    :cond_32
    const/4 p0, 0x0

    :goto_33
    invoke-virtual {p1, p0}, Landroid/widget/EditText;->setSelection(I)V

    return-void

    :pswitch_37
    invoke-virtual {p0}, Lru;->J0()Lxu;

    move-result-object v0

    invoke-virtual {p0}, Lru;->I0()Lhm9;

    move-result-object v1

    iget-object v1, v1, Lhm9;->i:Lcom/opera/android/custom_views/OperaTextInputEditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    const/4 v2, 0x0

    if-eqz v1, :cond_4d

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_4e

    :cond_4d
    move-object v1, v2

    :goto_4e
    const-string v3, ""

    if-nez v1, :cond_54

    move-object v6, v3

    goto :goto_55

    :cond_54
    move-object v6, v1

    :goto_55
    invoke-virtual {p0}, Lru;->I0()Lhm9;

    move-result-object v1

    iget-object v1, v1, Lhm9;->f:Lcom/opera/android/custom_views/OperaTextInputEditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    if-eqz v1, :cond_65

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    :cond_65
    if-nez v2, :cond_69

    move-object v7, v3

    goto :goto_6a

    :cond_69
    move-object v7, v2

    :goto_6a
    new-instance v1, Lq3;

    const/4 v2, 0x4

    invoke-direct {v1, p1, p0, v2}, Lq3;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object p1, v0, Lxu;->e:Lode;

    invoke-virtual {p1}, Lekc;->g()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lwu;

    if-eqz p1, :cond_96

    iget-object p1, p1, Lwu;->a:Lzt1;

    if-eqz p1, :cond_96

    invoke-interface {p1}, Lzt1;->o()Ljava/lang/String;

    move-result-object v4

    invoke-interface {p1}, Lzt1;->o()Ljava/lang/String;

    move-result-object v5

    new-instance v2, Lsu;

    invoke-direct {v2, v0, v1, p1, v6}, Lsu;-><init>(Lxu;Lq3;Lzt1;Ljava/lang/String;)V

    new-instance v9, Lo8f;

    const/16 p1, 0xa

    invoke-direct {v9, v2, p1}, Lo8f;-><init>(Ljava/lang/Object;B)V

    const/4 v8, 0x1

    invoke-static/range {v4 .. v9}, LJ/N;->MLjUywYX(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;ZLjava/lang/Object;)V

    :cond_96
    sget-object p1, Lvb0;->b:Lvb0;

    invoke-virtual {p0, p1}, Lru;->K0(Lvb0;)V

    return-void

    :pswitch_9c
    invoke-virtual {p0}, Lryl;->g0()V

    sget-object p1, Lvb0;->c:Lvb0;

    invoke-virtual {p0, p1}, Lru;->K0(Lvb0;)V

    return-void

    nop

    :pswitch_data_a6
    .packed-switch 0x0
        :pswitch_9c
        :pswitch_37
    .end packed-switch
.end method
