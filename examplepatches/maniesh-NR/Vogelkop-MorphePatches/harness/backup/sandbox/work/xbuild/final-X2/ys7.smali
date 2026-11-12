.class public final synthetic Lys7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/widget/TextView$OnEditorActionListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lys7;->a:B

    iput-object p1, p0, Lys7;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onEditorAction(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .registers 9

    iget-byte v0, p0, Lys7;->a:B

    const/4 v1, 0x6

    const/4 v2, 0x3

    const/4 v3, 0x1

    const/4 v4, 0x0

    iget-object p0, p0, Lys7;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_90

    check-cast p0, Lr9l;

    if-eq p2, v2, :cond_17

    invoke-static {p3}, Loup;->g0(Landroid/view/KeyEvent;)Z

    move-result p1

    if-nez p1, :cond_17

    move v3, v4

    goto :goto_1a

    :cond_17
    invoke-virtual {p0}, Lr9l;->u()V

    :goto_1a
    return v3

    :pswitch_1b
    check-cast p0, Lc9j;

    sget-object p1, Lc9j;->w:[Lxtb;

    if-ne p2, v2, :cond_25

    invoke-virtual {p0, v4}, Lc9j;->I0(Z)V

    goto :goto_26

    :cond_25
    move v3, v4

    :goto_26
    return v3

    :pswitch_27
    check-cast p0, Lawi;

    if-ne p2, v1, :cond_38

    iget-object p1, p0, Lawi;->u:Lei;

    iget-object p1, p1, Lei;->d:Landroid/view/View;

    check-cast p1, Lcom/opera/android/custom_views/OperaTextInputEditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p0, p1}, Lawi;->I0(Ljava/lang/CharSequence;)V

    :cond_38
    return v4

    :pswitch_39
    check-cast p0, Ljava/lang/Runnable;

    const/4 v0, 0x4

    if-ne p2, v0, :cond_45

    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    invoke-static {p1}, Lq9n;->u(Landroid/view/View;)Z

    goto :goto_50

    :cond_45
    invoke-static {p3}, Loup;->g0(Landroid/view/KeyEvent;)Z

    move-result p1

    if-eqz p1, :cond_4f

    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    goto :goto_50

    :cond_4f
    move v3, v4

    :goto_50
    return v3

    :pswitch_51
    check-cast p0, Lcom/opera/hype/image/editor/EditImage;

    sget-object p1, Lcom/opera/hype/image/editor/EditImage;->s:[Lxtb;

    if-ne p2, v1, :cond_59

    move p1, v3

    goto :goto_5a

    :cond_59
    move p1, v4

    :goto_5a
    const/4 p3, 0x5

    if-ne p2, p3, :cond_5f

    move p2, v3

    goto :goto_60

    :cond_5f
    move p2, v4

    :goto_60
    if-nez p1, :cond_66

    if-nez p2, :cond_66

    move v3, v4

    goto :goto_8e

    :cond_66
    iget-object p1, p0, Lcom/opera/hype/image/editor/EditImage;->j:Lbfl;

    invoke-virtual {p0, v3, v4}, Lcom/opera/hype/image/editor/EditImage;->c(ZZ)Z

    if-eqz p2, :cond_8e

    if-eqz p1, :cond_8e

    invoke-virtual {p0}, Lcom/opera/hype/image/editor/EditImage;->f()Lv39;

    move-result-object p2

    invoke-static {p2}, Ly1j;->g(Lkotlin/sequences/Sequence;)Ljava/util/List;

    move-result-object p2

    invoke-interface {p2, p1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result p1

    if-ltz p1, :cond_8e

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result p3

    sub-int/2addr p3, v3

    if-ge p1, p3, :cond_8e

    add-int/2addr p1, v3

    invoke-interface {p2, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lbfl;

    invoke-virtual {p0, p1, v3}, Lcom/opera/hype/image/editor/EditImage;->a(Lbfl;Z)V

    :cond_8e
    :goto_8e
    return v3

    nop

    :pswitch_data_90
    .packed-switch 0x0
        :pswitch_51
        :pswitch_39
        :pswitch_27
        :pswitch_1b
    .end packed-switch
.end method
