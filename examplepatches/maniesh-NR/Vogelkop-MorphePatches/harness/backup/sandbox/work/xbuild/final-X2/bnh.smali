.class public final synthetic Lbnh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lcnh;


# direct methods
.method public synthetic constructor <init>(Lcnh;B)V
    .registers 3

    iput-byte p2, p0, Lbnh;->a:B

    iput-object p1, p0, Lbnh;->b:Lcnh;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 5

    iget-byte v0, p0, Lbnh;->a:B

    iget-object p0, p0, Lbnh;->b:Lcnh;

    packed-switch v0, :pswitch_data_32

    iget-object v0, p0, Lcnh;->e:Lzmh;

    if-eqz v0, :cond_1c

    iget-object p0, p0, Lcnh;->c:Lgnh;

    iget-object v0, v0, Lzmh;->a:Lenh;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Lxw;

    const/16 v2, 0x9

    invoke-direct {v1, v0, p0, v2}, Lxw;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v1, p1}, Lo73;->o(Landroid/view/View;)V

    :cond_1c
    return-void

    :pswitch_1d
    iget-object p1, p0, Lcnh;->e:Lzmh;

    if-eqz p1, :cond_30

    iget-object p0, p0, Lcnh;->c:Lgnh;

    iget-object p1, p1, Lzmh;->a:Lenh;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lgnh;->c(Ljava/util/List;Z)V

    :cond_30
    return-void

    nop

    :pswitch_data_32
    .packed-switch 0x0
        :pswitch_1d
    .end packed-switch
.end method
