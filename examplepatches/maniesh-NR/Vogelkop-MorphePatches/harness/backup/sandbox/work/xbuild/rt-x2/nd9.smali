.class public final synthetic Lnd9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lod9;


# direct methods
.method public synthetic constructor <init>(Lod9;B)V
    .registers 3

    iput-byte p2, p0, Lnd9;->a:B

    iput-object p1, p0, Lnd9;->b:Lod9;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 3

    iget-byte p1, p0, Lnd9;->a:B

    const/4 v0, 0x0

    iget-object p0, p0, Lnd9;->b:Lod9;

    packed-switch p1, :pswitch_data_4a

    iget-object p1, p0, Lod9;->o:Lode;

    if-eqz p1, :cond_28

    invoke-virtual {p1}, Lekc;->g()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Boolean;

    if-eqz p1, :cond_28

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_28

    invoke-virtual {p0}, Lod9;->A0()V

    iget-object p1, p0, Lod9;->p:Lcom/opera/api/Callback;

    if-eqz p1, :cond_28

    iput-object v0, p0, Lod9;->p:Lcom/opera/api/Callback;

    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-interface {p1, p0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    :cond_28
    return-void

    :pswitch_29
    iget-object p1, p0, Lod9;->o:Lode;

    if-eqz p1, :cond_49

    invoke-virtual {p1}, Lekc;->g()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Boolean;

    if-eqz p1, :cond_49

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_49

    invoke-virtual {p0}, Lod9;->A0()V

    iget-object p1, p0, Lod9;->p:Lcom/opera/api/Callback;

    if-eqz p1, :cond_49

    iput-object v0, p0, Lod9;->p:Lcom/opera/api/Callback;

    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-interface {p1, p0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    :cond_49
    return-void

    :pswitch_data_4a
    .packed-switch 0x0
        :pswitch_29
    .end packed-switch
.end method
