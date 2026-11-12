.class public final Lthf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lzcf;


# virtual methods
.method public final a(Lcm;)V
    .registers 2

    const/4 p0, 0x1

    sput-boolean p0, Loo8;->r:Z

    sget-object p0, Loo8;->q:Lnrl;

    if-eqz p0, :cond_a

    invoke-virtual {p0}, Lnrl;->K()V

    :cond_a
    return-void
.end method

.method public final onSuccess()V
    .registers 1

    sget-object p0, Loo8;->q:Lnrl;

    if-eqz p0, :cond_7

    invoke-virtual {p0}, Lnrl;->K()V

    :cond_7
    return-void
.end method
