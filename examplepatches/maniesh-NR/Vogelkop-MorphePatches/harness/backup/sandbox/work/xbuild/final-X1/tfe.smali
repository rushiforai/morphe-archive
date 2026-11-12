.class public final synthetic Ltfe;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lfge;


# direct methods
.method public synthetic constructor <init>(Lfge;B)V
    .registers 3

    iput-byte p2, p0, Ltfe;->a:B

    iput-object p1, p0, Ltfe;->b:Lfge;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 5

    iget-byte v0, p0, Ltfe;->a:B

    iget-object p0, p0, Ltfe;->b:Lfge;

    check-cast p1, Ljava/lang/Boolean;

    packed-switch v0, :pswitch_data_44

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_2a

    iget-object p1, p0, Lfge;->L:Landroid/net/Uri;

    const/4 v0, 0x0

    if-eqz p1, :cond_1d

    iget-object v1, p0, Lfge;->M:Ljava/lang/String;

    iput-object v0, p0, Lfge;->L:Landroid/net/Uri;

    iput-object v0, p0, Lfge;->M:Ljava/lang/String;

    invoke-virtual {p0, p1, v1}, Lfge;->H0(Landroid/net/Uri;Ljava/lang/String;)V

    :cond_1d
    iget-object p1, p0, Lfge;->N:Ljava/lang/Long;

    if-eqz p1, :cond_2a

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    iput-object v0, p0, Lfge;->N:Ljava/lang/Long;

    invoke-virtual {p0, v1, v2}, Lfge;->J0(J)V

    :cond_2a
    return-void

    :pswitch_2b
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-nez p1, :cond_43

    new-instance p1, Lrxh;

    const v0, 0x7f140803

    invoke-direct {p1, v0}, Lrxh;-><init>(I)V

    new-instance v0, Lglj;

    const/16 v1, 0x1388

    invoke-direct {v0, p1, v1}, Lglj;-><init>(Lpxh;I)V

    invoke-virtual {p0, v0}, Lfge;->I0(Lo93;)V

    :cond_43
    return-void

    :pswitch_data_44
    .packed-switch 0x0
        :pswitch_2b
    .end packed-switch
.end method
