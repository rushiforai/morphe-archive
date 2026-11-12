.class public final synthetic Lfpk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/chromium/net/NetworkChangeNotifier$ConnectionTypeObserver;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lfpk;->a:B

    iput-object p1, p0, Lfpk;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onConnectionTypeChanged(I)V
    .registers 4

    iget-byte v0, p0, Lfpk;->a:B

    iget-object p0, p0, Lfpk;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_52

    check-cast p0, Lydn;

    iget-object v0, p0, Lydn;->c:Lgfn;

    iget v1, p0, Lydn;->S:I

    if-eq v1, p1, :cond_35

    iput p1, p0, Lydn;->S:I

    invoke-virtual {p0}, Lydn;->O()V

    const/4 v1, 0x6

    if-eq p1, v1, :cond_35

    iget-object p1, p0, Lydn;->d:Lvdn;

    iget-boolean p1, p1, Lvdn;->a:Z

    if-eqz p1, :cond_35

    invoke-interface {v0}, Lgfn;->isEnabled()Z

    move-result p1

    if-eqz p1, :cond_35

    iget p1, p0, Lydn;->G:I

    const/4 v1, 0x3

    if-ne p1, v1, :cond_35

    iget-object p1, p0, Lydn;->I:Lefn;

    if-nez p1, :cond_35

    new-instance p1, Lsdn;

    const/4 v1, 0x1

    invoke-direct {p1, p0, v1}, Lsdn;-><init>(Lydn;B)V

    invoke-interface {v0, p1}, Lgfn;->g(Lcom/opera/api/Callback;)V

    :cond_35
    return-void

    :pswitch_36
    check-cast p0, Lcdn;

    invoke-static {}, Lsle;->d()Z

    move-result p1

    iput-boolean p1, p0, Lcdn;->i:Z

    invoke-virtual {p0}, Lcdn;->S()V

    return-void

    :pswitch_42
    check-cast p0, Lipk;

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lipk;->R(Z)Z

    move-result p1

    if-eqz p1, :cond_50

    iget-object p0, p0, Lipk;->b:Ljs6;

    invoke-virtual {p0}, Ljs6;->a()V

    :cond_50
    return-void

    nop

    :pswitch_data_52
    .packed-switch 0x0
        :pswitch_42
        :pswitch_36
    .end packed-switch
.end method
