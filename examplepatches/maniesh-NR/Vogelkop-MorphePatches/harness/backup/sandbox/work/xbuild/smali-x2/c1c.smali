.class public final synthetic Lc1c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ld1c;

.field public final synthetic c:Lbz0;


# direct methods
.method public synthetic constructor <init>(Ld1c;Lbz0;B)V
    .registers 4

    iput-byte p3, p0, Lc1c;->a:B

    iput-object p1, p0, Lc1c;->b:Ld1c;

    iput-object p2, p0, Lc1c;->c:Lbz0;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 5

    iget-byte p1, p0, Lc1c;->a:B

    const/4 v0, 0x1

    iget-object v1, p0, Lc1c;->c:Lbz0;

    iget-object p0, p0, Lc1c;->b:Ld1c;

    packed-switch p1, :pswitch_data_4e

    iget-object p1, p0, Ld1c;->e:Lcom/opera/android/custom_views/RadioButton;

    invoke-virtual {p1, v0}, Lcom/opera/android/custom_views/RadioButton;->setChecked(Z)V

    iget-object p0, p0, Ld1c;->c:Lz0c;

    iget-object p1, p0, Lz0c;->b:Ljava/lang/Object;

    check-cast p1, Lf1c;

    iget-object p0, p0, Lz0c;->c:Ljava/lang/Object;

    check-cast p0, Li0c;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget v2, p0, Li0c;->b:I

    if-eq v0, v2, :cond_27

    iget-object p1, p1, Lf1c;->z:Lv3m;

    iget-object p0, p0, Li0c;->a:Lszb;

    invoke-virtual {p1, p0, v0, v0}, Lv3m;->j(Lszb;IZ)V

    :cond_27
    invoke-virtual {v1}, Lzp1;->dismiss()V

    return-void

    :pswitch_2b
    iget-object p1, p0, Ld1c;->d:Lcom/opera/android/custom_views/RadioButton;

    invoke-virtual {p1, v0}, Lcom/opera/android/custom_views/RadioButton;->setChecked(Z)V

    iget-object p0, p0, Ld1c;->c:Lz0c;

    iget-object p1, p0, Lz0c;->b:Ljava/lang/Object;

    check-cast p1, Lf1c;

    iget-object p0, p0, Lz0c;->c:Ljava/lang/Object;

    check-cast p0, Li0c;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget v2, p0, Li0c;->b:I

    if-eqz v2, :cond_49

    iget-object p1, p1, Lf1c;->z:Lv3m;

    iget-object p0, p0, Li0c;->a:Lszb;

    const/4 v2, 0x0

    invoke-virtual {p1, p0, v2, v0}, Lv3m;->j(Lszb;IZ)V

    :cond_49
    invoke-virtual {v1}, Lzp1;->dismiss()V

    return-void

    nop

    :pswitch_data_4e
    .packed-switch 0x0
        :pswitch_2b
    .end packed-switch
.end method
