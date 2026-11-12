.class public final synthetic Loz0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lcom/leanplum/ActionContext;


# direct methods
.method public synthetic constructor <init>(Lcom/leanplum/ActionContext;B)V
    .registers 3

    iput-byte p2, p0, Loz0;->a:B

    iput-object p1, p0, Loz0;->b:Lcom/leanplum/ActionContext;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .registers 4

    iget-byte v0, p0, Loz0;->a:B

    iget-object p0, p0, Loz0;->b:Lcom/leanplum/ActionContext;

    packed-switch v0, :pswitch_data_14

    invoke-static {p0, p1, p2}, Lcom/leanplum/messagetemplates/actions/ConfirmMessage;->a(Lcom/leanplum/ActionContext;Landroid/content/DialogInterface;I)V

    return-void

    :pswitch_b
    invoke-static {p0, p1, p2}, Lcom/leanplum/messagetemplates/actions/ConfirmMessage;->b(Lcom/leanplum/ActionContext;Landroid/content/DialogInterface;I)V

    return-void

    :pswitch_f
    invoke-static {p0, p1, p2}, Lcom/leanplum/messagetemplates/actions/AlertMessage;->a(Lcom/leanplum/ActionContext;Landroid/content/DialogInterface;I)V

    return-void

    nop

    :pswitch_data_14
    .packed-switch 0x0
        :pswitch_f
        :pswitch_b
    .end packed-switch
.end method
