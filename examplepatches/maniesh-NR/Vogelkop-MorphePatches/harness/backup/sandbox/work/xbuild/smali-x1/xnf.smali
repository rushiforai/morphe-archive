.class public final synthetic Lxnf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lcom/leanplum/messagetemplates/OperaSheetRequest;

.field public final synthetic c:Loqh;


# direct methods
.method public synthetic constructor <init>(Lcom/leanplum/messagetemplates/OperaSheetRequest;Loqh;B)V
    .registers 4

    iput-byte p3, p0, Lxnf;->a:B

    iput-object p1, p0, Lxnf;->b:Lcom/leanplum/messagetemplates/OperaSheetRequest;

    iput-object p2, p0, Lxnf;->c:Loqh;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 4

    iget-byte v0, p0, Lxnf;->a:B

    iget-object v1, p0, Lxnf;->c:Loqh;

    iget-object p0, p0, Lxnf;->b:Lcom/leanplum/messagetemplates/OperaSheetRequest;

    check-cast p1, Lk9c;

    packed-switch v0, :pswitch_data_18

    invoke-static {p0, v1, p1}, Lcom/leanplum/messagetemplates/OperaSheetRequest;->b(Lcom/leanplum/messagetemplates/OperaSheetRequest;Loqh;Lk9c;)V

    return-void

    :pswitch_f
    invoke-static {p0, v1, p1}, Lcom/leanplum/messagetemplates/OperaSheetRequest;->d(Lcom/leanplum/messagetemplates/OperaSheetRequest;Loqh;Lk9c;)V

    return-void

    :pswitch_13
    invoke-static {p0, v1, p1}, Lcom/leanplum/messagetemplates/OperaSheetRequest;->f(Lcom/leanplum/messagetemplates/OperaSheetRequest;Loqh;Lk9c;)V

    return-void

    nop

    :pswitch_data_18
    .packed-switch 0x0
        :pswitch_13
        :pswitch_f
    .end packed-switch
.end method
