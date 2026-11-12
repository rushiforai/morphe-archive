.class public final synthetic Lwnf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lorm;

.field public final synthetic c:Lskm;

.field public final synthetic d:Lcom/leanplum/ActionContext;


# direct methods
.method public synthetic constructor <init>(Lcom/leanplum/ActionContext;Lorm;Lskm;)V
    .registers 5

    const/4 v0, 0x2

    iput-byte v0, p0, Lwnf;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lwnf;->d:Lcom/leanplum/ActionContext;

    iput-object p2, p0, Lwnf;->b:Lorm;

    iput-object p3, p0, Lwnf;->c:Lskm;

    return-void
.end method

.method public synthetic constructor <init>(Lorm;Lskm;Lcom/leanplum/ActionContext;B)V
    .registers 5

    .line 13
    iput-byte p4, p0, Lwnf;->a:B

    iput-object p1, p0, Lwnf;->b:Lorm;

    iput-object p2, p0, Lwnf;->c:Lskm;

    iput-object p3, p0, Lwnf;->d:Lcom/leanplum/ActionContext;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 4

    iget-byte v0, p0, Lwnf;->a:B

    packed-switch v0, :pswitch_data_2a

    iget-object v0, p0, Lwnf;->c:Lskm;

    check-cast p1, Lcom/leanplum/messagetemplates/ResourceWrapper;

    iget-object v1, p0, Lwnf;->d:Lcom/leanplum/ActionContext;

    iget-object p0, p0, Lwnf;->b:Lorm;

    invoke-static {v1, p0, v0, p1}, Lcom/leanplum/messagetemplates/OperaSubscriptionSheet;->h(Lcom/leanplum/ActionContext;Lorm;Lskm;Lcom/leanplum/messagetemplates/ResourceWrapper;)V

    return-void

    :pswitch_11
    iget-object v0, p0, Lwnf;->d:Lcom/leanplum/ActionContext;

    check-cast p1, Ltw7;

    iget-object v1, p0, Lwnf;->b:Lorm;

    iget-object p0, p0, Lwnf;->c:Lskm;

    invoke-static {v1, p0, v0, p1}, Lcom/leanplum/messagetemplates/OperaSubscriptionSheet;->c(Lorm;Lskm;Lcom/leanplum/ActionContext;Ltw7;)V

    return-void

    :pswitch_1d
    iget-object v0, p0, Lwnf;->d:Lcom/leanplum/ActionContext;

    check-cast p1, Ltw7;

    iget-object v1, p0, Lwnf;->b:Lorm;

    iget-object p0, p0, Lwnf;->c:Lskm;

    invoke-static {v1, p0, v0, p1}, Lcom/leanplum/messagetemplates/OperaSheet;->d(Lorm;Lskm;Lcom/leanplum/ActionContext;Ltw7;)V

    return-void

    nop

    :pswitch_data_2a
    .packed-switch 0x0
        :pswitch_1d
        :pswitch_11
    .end packed-switch
.end method
