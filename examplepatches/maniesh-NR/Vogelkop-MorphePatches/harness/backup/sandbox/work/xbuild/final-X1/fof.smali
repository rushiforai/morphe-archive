.class public final synthetic Lfof;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Landroid/content/Context;

.field public final synthetic c:Ltcl;

.field public final synthetic d:Lcom/leanplum/ActionContext;


# direct methods
.method public synthetic constructor <init>(Landroid/content/Context;Ltcl;Lcom/leanplum/ActionContext;B)V
    .registers 5

    iput-byte p4, p0, Lfof;->a:B

    iput-object p1, p0, Lfof;->b:Landroid/content/Context;

    iput-object p2, p0, Lfof;->c:Ltcl;

    iput-object p3, p0, Lfof;->d:Lcom/leanplum/ActionContext;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 4

    iget-byte v0, p0, Lfof;->a:B

    packed-switch v0, :pswitch_data_1e

    iget-object v0, p0, Lfof;->d:Lcom/leanplum/ActionContext;

    check-cast p1, Ltw7;

    iget-object v1, p0, Lfof;->b:Landroid/content/Context;

    iget-object p0, p0, Lfof;->c:Ltcl;

    invoke-static {v1, p0, v0, p1}, Lcom/leanplum/messagetemplates/OperaSubscriptionSheet;->i(Landroid/content/Context;Ltcl;Lcom/leanplum/ActionContext;Ltw7;)V

    return-void

    :pswitch_11
    iget-object v0, p0, Lfof;->d:Lcom/leanplum/ActionContext;

    check-cast p1, Ltw7;

    iget-object v1, p0, Lfof;->b:Landroid/content/Context;

    iget-object p0, p0, Lfof;->c:Ltcl;

    invoke-static {v1, p0, v0, p1}, Lcom/leanplum/messagetemplates/OperaSubscriptionDialog;->f(Landroid/content/Context;Ltcl;Lcom/leanplum/ActionContext;Ltw7;)V

    return-void

    nop

    :pswitch_data_1e
    .packed-switch 0x0
        :pswitch_11
    .end packed-switch
.end method
