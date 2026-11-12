.class public final synthetic Lvnf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lcom/leanplum/ActionContext;


# direct methods
.method public synthetic constructor <init>(Lcom/leanplum/ActionContext;B)V
    .registers 3

    iput-byte p2, p0, Lvnf;->a:B

    iput-object p1, p0, Lvnf;->b:Lcom/leanplum/ActionContext;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 2

    iget-byte v0, p0, Lvnf;->a:B

    iget-object p0, p0, Lvnf;->b:Lcom/leanplum/ActionContext;

    packed-switch v0, :pswitch_data_20

    invoke-static {p0}, Lcom/leanplum/messagetemplates/OperaSubscriptionSheet;->d(Lcom/leanplum/ActionContext;)V

    return-void

    :pswitch_b
    invoke-static {p0}, Lcom/leanplum/messagetemplates/OperaSubscriptionSheet;->a(Lcom/leanplum/ActionContext;)V

    return-void

    :pswitch_f
    invoke-static {p0}, Lcom/leanplum/messagetemplates/OperaSubscriptionSheet;->b(Lcom/leanplum/ActionContext;)V

    return-void

    :pswitch_13
    invoke-static {p0}, Lcom/leanplum/messagetemplates/OperaSheet;->b(Lcom/leanplum/ActionContext;)V

    return-void

    :pswitch_17
    invoke-static {p0}, Lcom/leanplum/messagetemplates/OperaSheet;->f(Lcom/leanplum/ActionContext;)V

    return-void

    :pswitch_1b
    invoke-static {p0}, Lcom/leanplum/messagetemplates/OperaSheet;->g(Lcom/leanplum/ActionContext;)V

    return-void

    nop

    :pswitch_data_20
    .packed-switch 0x0
        :pswitch_1b
        :pswitch_17
        :pswitch_13
        :pswitch_f
        :pswitch_b
    .end packed-switch
.end method
