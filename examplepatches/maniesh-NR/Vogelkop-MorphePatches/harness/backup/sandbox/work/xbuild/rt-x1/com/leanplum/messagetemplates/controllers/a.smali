.class public final synthetic Lcom/leanplum/messagetemplates/controllers/a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lcom/leanplum/messagetemplates/controllers/BaseController;


# direct methods
.method public synthetic constructor <init>(Lcom/leanplum/messagetemplates/controllers/BaseController;B)V
    .registers 3

    iput-byte p2, p0, Lcom/leanplum/messagetemplates/controllers/a;->a:B

    iput-object p1, p0, Lcom/leanplum/messagetemplates/controllers/a;->b:Lcom/leanplum/messagetemplates/controllers/BaseController;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 3

    iget-byte v0, p0, Lcom/leanplum/messagetemplates/controllers/a;->a:B

    iget-object p0, p0, Lcom/leanplum/messagetemplates/controllers/a;->b:Lcom/leanplum/messagetemplates/controllers/BaseController;

    packed-switch v0, :pswitch_data_12

    invoke-static {p0, p1}, Lcom/leanplum/messagetemplates/controllers/BaseController;->a(Lcom/leanplum/messagetemplates/controllers/BaseController;Landroid/view/View;)V

    return-void

    :pswitch_b
    check-cast p0, Lcom/leanplum/messagetemplates/controllers/AbstractPopupController;

    invoke-static {p0, p1}, Lcom/leanplum/messagetemplates/controllers/AbstractPopupController;->b(Lcom/leanplum/messagetemplates/controllers/AbstractPopupController;Landroid/view/View;)V

    return-void

    nop

    :pswitch_data_12
    .packed-switch 0x0
        :pswitch_b
    .end packed-switch
.end method
