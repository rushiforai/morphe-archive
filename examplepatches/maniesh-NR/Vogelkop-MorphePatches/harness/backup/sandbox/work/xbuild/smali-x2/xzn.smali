.class public final Lxzn;
.super Lozb;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic i:B

.field public final synthetic j:Lcom/opera/android/startup/WelcomeActivity;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/startup/WelcomeActivity;B)V
    .registers 3

    iput-byte p2, p0, Lxzn;->i:B

    iput-object p1, p0, Lxzn;->j:Lcom/opera/android/startup/WelcomeActivity;

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lozb;-><init>(I)V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 2

    iget-byte v0, p0, Lxzn;->i:B

    iget-object p0, p0, Lxzn;->j:Lcom/opera/android/startup/WelcomeActivity;

    packed-switch v0, :pswitch_data_12

    invoke-virtual {p0}, Lxd5;->getDefaultViewModelCreationExtras()Lg06;

    move-result-object p0

    return-object p0

    :pswitch_c
    invoke-virtual {p0}, Lxd5;->getViewModelStore()Lv7n;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_12
    .packed-switch 0x0
        :pswitch_c
    .end packed-switch
.end method
