.class public final synthetic Lsw3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lesk;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ltw3;


# direct methods
.method public synthetic constructor <init>(Ltw3;B)V
    .registers 3

    iput-byte p2, p0, Lsw3;->a:B

    iput-object p1, p0, Lsw3;->b:Ltw3;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .registers 3

    iget-byte v0, p0, Lsw3;->a:B

    iget-object p0, p0, Lsw3;->b:Ltw3;

    packed-switch v0, :pswitch_data_2a

    iget-object p0, p0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    const-class v0, Lkxk;

    iget-object p0, p0, Lcom/opera/android/BrowserActivity;->g0:Lwub;

    invoke-virtual {p0, v0}, Lwub;->E(Ljava/lang/Class;)Ljnf;

    move-result-object p0

    check-cast p0, Lhxk;

    return-object p0

    :pswitch_14
    iget-object p0, p0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    invoke-virtual {p0}, Lcom/opera/android/BrowserActivity;->J0()Lysj;

    move-result-object p0

    return-object p0

    :pswitch_1b
    new-instance v0, Lpjn;

    const/16 v1, 0x13

    invoke-direct {v0, p0, v1}, Lpjn;-><init>(Ljava/lang/Object;B)V

    return-object v0

    :pswitch_23
    iget-object p0, p0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    invoke-static {p0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object p0

    return-object p0

    :pswitch_data_2a
    .packed-switch 0x0
        :pswitch_23
        :pswitch_1b
        :pswitch_14
    .end packed-switch
.end method
