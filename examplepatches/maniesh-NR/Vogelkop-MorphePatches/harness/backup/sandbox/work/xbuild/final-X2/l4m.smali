.class public final synthetic Ll4m;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lala;


# direct methods
.method public synthetic constructor <init>(Lala;B)V
    .registers 3

    iput-byte p2, p0, Ll4m;->a:B

    iput-object p1, p0, Ll4m;->b:Lala;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 6

    iget-byte p1, p0, Ll4m;->a:B

    const/4 v0, 0x0

    const/4 v1, 0x1

    iget-object p0, p0, Ll4m;->b:Lala;

    packed-switch p1, :pswitch_data_90

    iget-object p1, p0, Lala;->e:Ljava/lang/Object;

    check-cast p1, Ly0f;

    sget-object v2, Lrs0;->l:Lrs0;

    invoke-virtual {p1, v2}, Ly0f;->c(Lrs0;)V

    iget-object p1, p0, Lala;->g:Ljava/lang/Object;

    check-cast p1, Lr4m;

    iget-object p1, p1, Lr4m;->e:Ltjm;

    invoke-virtual {p1, v0}, Ltjm;->J0(Z)V

    iget-object p0, p0, Lala;->f:Ljava/lang/Object;

    check-cast p0, La4m;

    iget-object p1, p0, La4m;->c:Lk6l;

    iget-object p1, p1, Lk6l;->o:Lb2l;

    if-eqz p1, :cond_2e

    invoke-virtual {p0, p1, v1}, La4m;->W(Lb2l;Z)Z

    move-result p1

    if-eqz p1, :cond_2e

    invoke-virtual {p0}, La4m;->Z()V

    :cond_2e
    return-void

    :pswitch_2f
    iget-object p1, p0, Lala;->h:Ljava/lang/Object;

    check-cast p1, Lm3m;

    iget-object p0, p0, Lala;->a:Ljava/lang/Object;

    check-cast p0, Lpt1;

    iget-object p0, p0, Lpt1;->e:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/custom_views/StylingImageView;

    invoke-virtual {p1, p0}, Lo73;->p(Landroid/view/View;)V

    return-void

    :pswitch_3f
    iget-object p1, p0, Lala;->e:Ljava/lang/Object;

    check-cast p1, Ly0f;

    sget-object v0, Lrs0;->d:Lrs0;

    invoke-virtual {p1, v0}, Ly0f;->c(Lrs0;)V

    iget-object p0, p0, Lala;->g:Ljava/lang/Object;

    check-cast p0, Lr4m;

    iget-object p1, p0, Lr4m;->f:Lk6l;

    iget-object p1, p1, Lk6l;->o:Lb2l;

    invoke-virtual {p0, p1, v1}, Lr4m;->Z(Lb2l;I)V

    return-void

    :pswitch_54
    iget-object p1, p0, Lala;->e:Ljava/lang/Object;

    check-cast p1, Ly0f;

    sget-object v2, Lrs0;->b:Lrs0;

    invoke-virtual {p1, v2}, Ly0f;->c(Lrs0;)V

    iget-object p1, p0, Lala;->g:Ljava/lang/Object;

    check-cast p1, Lr4m;

    iget-object v2, p1, Lr4m;->c:Lb0c;

    iget-byte v2, v2, Lb0c;->d:B

    const/4 v3, 0x2

    if-ne v2, v3, :cond_8a

    iget-object v2, p0, Lala;->i:Ljava/lang/Object;

    check-cast v2, Lz3m;

    iget-object p0, p0, Lala;->a:Ljava/lang/Object;

    check-cast p0, Lpt1;

    iget-object p0, p0, Lpt1;->c:Landroid/view/View;

    check-cast p0, Lcom/opera/android/custom_views/BottomIndicatorButton;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v3, Lj4m;

    invoke-direct {v3, p1, v1}, Lj4m;-><init>(Lr4m;B)V

    invoke-virtual {p1}, Lr4m;->W()Lszb;

    move-result-object p1

    iput-object v3, v2, Lz3m;->o:Lcom/opera/api/Callback;

    iput-object p1, v2, Lz3m;->p:Lszb;

    iput-boolean v0, v2, Lz3m;->q:Z

    invoke-virtual {v2, p0}, Lo73;->p(Landroid/view/View;)V

    goto :goto_8f

    :cond_8a
    iget-object p0, p1, Lr4m;->d:Lh5m;

    invoke-virtual {p0}, Lh5m;->a()V

    :goto_8f
    return-void

    :pswitch_data_90
    .packed-switch 0x0
        :pswitch_54
        :pswitch_3f
        :pswitch_2f
    .end packed-switch
.end method
