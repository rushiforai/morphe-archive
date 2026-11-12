.class public final synthetic Lpb9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lr8n;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lqb9;


# direct methods
.method public synthetic constructor <init>(Lqb9;B)V
    .registers 3

    iput-byte p2, p0, Lpb9;->a:B

    iput-object p1, p0, Lpb9;->b:Lqb9;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .registers 4

    iget-byte v0, p0, Lpb9;->a:B

    iget-object p0, p0, Lpb9;->b:Lqb9;

    packed-switch v0, :pswitch_data_4a

    iget-object p0, p0, Lab2;->b:Lja2;

    instance-of v0, p1, Landroid/widget/TextView;

    if-eqz v0, :cond_32

    instance-of v0, p0, Lib9;

    if-eqz v0, :cond_32

    check-cast p0, Lib9;

    move-object v0, p1

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p0}, Lib9;->e()Z

    move-result p0

    if-eqz p0, :cond_2b

    const p0, 0x7f040316

    const v1, 0x7f060b26

    invoke-static {p0, p1, v1}, Lf03;->u(ILandroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object p0

    goto :goto_2f

    :cond_2b
    invoke-static {p1}, Lf03;->F(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object p0

    :goto_2f
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    :cond_32
    return-void

    :pswitch_33
    iget-object p0, p0, Lab2;->b:Lja2;

    instance-of v0, p1, Landroid/widget/ImageView;

    if-eqz v0, :cond_48

    instance-of v0, p0, Lib9;

    if-eqz v0, :cond_48

    check-cast p0, Lib9;

    check-cast p1, Landroid/widget/ImageView;

    iget-object v0, p0, Lib9;->e:Ljava/lang/String;

    iget-object p0, p0, Lib9;->h:Ljava/lang/String;

    invoke-static {p1, v0, p0}, Lbc9;->u(Landroid/widget/ImageView;Ljava/lang/String;Ljava/lang/String;)V

    :cond_48
    return-void

    nop

    :pswitch_data_4a
    .packed-switch 0x0
        :pswitch_33
    .end packed-switch
.end method
