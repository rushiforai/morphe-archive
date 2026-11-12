.class public final synthetic Liwf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 4

    iput-byte p3, p0, Liwf;->a:B

    iput-object p1, p0, Liwf;->b:Ljava/lang/Object;

    iput-object p2, p0, Liwf;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .registers 6

    iget-byte v0, p0, Liwf;->a:B

    iget-object v1, p0, Liwf;->c:Ljava/lang/Object;

    iget-object p0, p0, Liwf;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_84

    check-cast p0, Ljl6;

    check-cast v1, Lg7j;

    iget-object p0, p0, Ljl6;->g:Ljava/lang/Object;

    check-cast p0, Ljmn;

    iget-object p1, p0, Ljmn;->F:Lcom/opera/android/settings/SettingsManager;

    const/4 v0, 0x0

    if-eqz p2, :cond_1a

    invoke-virtual {p1, v1, v0}, Lcom/opera/android/settings/SettingsManager;->U(Lg7j;Z)V

    goto :goto_1f

    :cond_1a
    iget-object p0, p0, Ljmn;->J:Lg7j;

    invoke-virtual {p1, p0, v0}, Lcom/opera/android/settings/SettingsManager;->U(Lg7j;Z)V

    :goto_1f
    return-void

    :pswitch_20
    check-cast p0, Lr3i;

    check-cast v1, Lr9i;

    invoke-virtual {p1}, Landroid/view/View;->isEnabled()Z

    move-result p1

    if-eqz p1, :cond_44

    iput-boolean p2, p0, Lr3i;->k:Z

    iget-object p0, p0, Lr3i;->j:Lqfl;

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {p0, p1}, Lqfl;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p0, v1, Lr9i;->d:Ljava/lang/Object;

    check-cast p0, Lo66;

    invoke-virtual {p0}, Lo66;->j()Z

    move-result p1

    if-eqz p1, :cond_44

    iget-object p0, p0, Lo66;->f:Ll56;

    invoke-virtual {p0}, Landroidx/appcompat/widget/ListPopupWindow;->dismiss()V

    :cond_44
    return-void

    :pswitch_45
    check-cast p0, Lkwf;

    check-cast v1, Landroid/view/MenuItem;

    invoke-virtual {p1}, Landroid/view/View;->isEnabled()Z

    move-result p1

    if-eqz p1, :cond_83

    iget-object p0, p0, Lkwf;->p:Lisd;

    iget-object p0, p0, Lisd;->b:Ljava/lang/Object;

    check-cast p0, Lkwf;

    iget-object p1, p0, Lkwf;->l:Lnwf;

    invoke-interface {v1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v2, 0x7f0a07e4

    if-ne v0, v2, :cond_6d

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lmwf;

    const/4 v1, 0x1

    invoke-direct {v0, p1, p2, v1}, Lmwf;-><init>(Lnwf;ZB)V

    invoke-virtual {p0}, Lo73;->b()Z

    goto :goto_83

    :cond_6d
    invoke-interface {v1}, Landroid/view/MenuItem;->getItemId()I

    move-result p2

    const v0, 0x7f0a07ed

    if-ne p2, v0, :cond_83

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p2, Llwf;

    const/16 v0, 0x10

    invoke-direct {p2, p1, v0}, Llwf;-><init>(Lnwf;B)V

    invoke-virtual {p0}, Lo73;->b()Z

    :cond_83
    :goto_83
    return-void

    :pswitch_data_84
    .packed-switch 0x0
        :pswitch_45
        :pswitch_20
    .end packed-switch
.end method
