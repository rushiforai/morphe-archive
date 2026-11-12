.class public final synthetic Lhm3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lhm3;->a:B

    iput-object p1, p0, Lhm3;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .registers 5

    iget-byte v0, p0, Lhm3;->a:B

    iget-object p0, p0, Lhm3;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_60

    check-cast p0, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-object p1, p0, Lcom/opera/android/ui/catalog/widget/OperaListItem;->u:Lvlf;

    if-eqz p1, :cond_10

    invoke-interface {p1, p0, p2}, Lvlf;->u(Lcom/opera/android/ui/catalog/widget/OperaListItem;Z)V

    :cond_10
    invoke-virtual {p0, p2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->I(Z)V

    return-void

    :pswitch_14
    check-cast p0, Lcom/google/android/material/chip/Chip;

    sget-object v0, Lcom/google/android/material/chip/Chip;->x:Landroid/graphics/Rect;

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->j:Ltw2;

    if-eqz v0, :cond_34

    iget-object v0, v0, Ltw2;->b:Ljava/lang/Object;

    check-cast v0, Lev4;

    if-eqz p2, :cond_29

    invoke-virtual {v0, p0}, Lev4;->c(Lcom/google/android/material/chip/Chip;)Z

    move-result v1

    if-eqz v1, :cond_34

    goto :goto_31

    :cond_29
    iget-boolean v1, v0, Lev4;->c:Z

    invoke-virtual {v0, p0, v1}, Lev4;->n(Lcom/google/android/material/chip/Chip;Z)Z

    move-result v1

    if-eqz v1, :cond_34

    :goto_31
    invoke-virtual {v0}, Lev4;->h()V

    :cond_34
    iget-object p0, p0, Lcom/google/android/material/chip/Chip;->i:Landroid/widget/CompoundButton$OnCheckedChangeListener;

    if-eqz p0, :cond_3b

    invoke-interface {p0, p1, p2}, Landroid/widget/CompoundButton$OnCheckedChangeListener;->onCheckedChanged(Landroid/widget/CompoundButton;Z)V

    :cond_3b
    return-void

    :pswitch_3c
    check-cast p0, Lxw;

    iget-object p1, p0, Lxw;->l:Ljava/lang/Object;

    check-cast p1, Lim3;

    iget-object v0, p1, Lim3;->x:Lgn3;

    iget-object v0, v0, Lgn3;->b:Lcom/opera/android/bookmarks/h;

    iget-object v0, v0, Lcom/opera/android/bookmarks/h;->j:Lb59;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/SharedPreferences;

    const-string v1, "show_full_address"

    invoke-static {v0, v1, p2}, Lcom/appsflyer/internal/j;->d(Landroid/content/SharedPreferences;Ljava/lang/String;Z)V

    iget-object p1, p1, Lim3;->x:Lgn3;

    iget-object p1, p1, Lgn3;->s:Lxm3;

    if-eqz p1, :cond_5c

    invoke-virtual {p1}, Landroidx/recyclerview/widget/d;->notifyDataSetChanged()V

    :cond_5c
    invoke-virtual {p0}, Lo73;->b()Z

    return-void

    :pswitch_data_60
    .packed-switch 0x0
        :pswitch_3c
        :pswitch_14
    .end packed-switch
.end method
