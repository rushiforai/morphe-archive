.class public final Lk18;
.super Ltim;
.source "SourceFile"


# instance fields
.field public final synthetic b:B

.field public final c:Ljava/lang/Object;

.field public d:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Ll18;Ltu;Ll18;)V
    .registers 5

    const/4 v0, 0x0

    iput-byte v0, p0, Lk18;->b:B

    iput-object p2, p0, Lk18;->c:Ljava/lang/Object;

    iput-object p3, p0, Lk18;->d:Ljava/lang/Object;

    invoke-direct {p0, p1}, Ltim;-><init>(Luim;)V

    return-void
.end method

.method public constructor <init>(Lxzg;Lp0h;Lcbf;)V
    .registers 5

    const/4 v0, 0x1

    iput-byte v0, p0, Lk18;->b:B

    .line 11
    invoke-direct {p0, p1}, Ltim;-><init>(Luim;)V

    .line 12
    iput-object p2, p0, Lk18;->c:Ljava/lang/Object;

    .line 13
    iput-object p3, p0, Lk18;->d:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final onFinished(Lhjm;)V
    .registers 4

    iget-byte v0, p0, Lk18;->b:B

    iget-object v1, p0, Lk18;->c:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_38

    invoke-super {p0, p1}, Ld63;->onFinished(Lhjm;)V

    check-cast v1, Lp0h;

    iget-object p1, v1, Lp0h;->a:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {p1, v1}, Lcom/opera/android/settings/SettingsManager;->T(Lp5j;)V

    sget-object p1, Lhj;->a:Li7f;

    invoke-virtual {p1, v1}, Li7f;->c(Ljava/lang/Object;)Z

    iget-object p1, v1, Lp0h;->b:Ls9g;

    invoke-virtual {p1, v1}, Ls9g;->m(Lq9g;)V

    iget-object p1, p0, Lk18;->d:Ljava/lang/Object;

    check-cast p1, Lcbf;

    if-eqz p1, :cond_27

    invoke-virtual {p1}, Lcbf;->run()V

    const/4 p1, 0x0

    iput-object p1, p0, Lk18;->d:Ljava/lang/Object;

    :cond_27
    return-void

    :pswitch_28
    check-cast v1, Ltu;

    iget-object p0, p0, Lk18;->d:Ljava/lang/Object;

    check-cast p0, Ll18;

    iget-boolean p0, p0, Ll18;->h:Z

    iget-object p1, v1, Ltu;->b:Ljava/lang/Object;

    check-cast p1, Lqwk;

    invoke-virtual {p1, p0}, Lqwk;->D(Z)V

    return-void

    :pswitch_data_38
    .packed-switch 0x0
        :pswitch_28
    .end packed-switch
.end method
