.class public final synthetic Lvzn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lesk;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lcom/opera/android/startup/WelcomeActivity;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/startup/WelcomeActivity;B)V
    .registers 3

    iput-byte p2, p0, Lvzn;->a:B

    iput-object p1, p0, Lvzn;->b:Lcom/opera/android/startup/WelcomeActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .registers 3

    iget-byte v0, p0, Lvzn;->a:B

    iget-object p0, p0, Lvzn;->b:Lcom/opera/android/startup/WelcomeActivity;

    packed-switch v0, :pswitch_data_26

    sget v0, Lcom/opera/android/startup/WelcomeActivity;->w:I

    new-instance v0, Lttn;

    const/4 v1, 0x3

    invoke-direct {v0, p0, v1}, Lttn;-><init>(Ljava/lang/Object;B)V

    return-object v0

    :pswitch_10
    sget v0, Lcom/opera/android/startup/WelcomeActivity;->w:I

    new-instance v0, Lilm;

    const/16 v1, 0x12

    invoke-direct {v0, p0, v1}, Lilm;-><init>(Ljava/lang/Object;B)V

    return-object v0

    :pswitch_1a
    sget v0, Lcom/opera/android/startup/WelcomeActivity;->w:I

    iget-object p0, p0, Lhjf;->a:Ldll;

    return-object p0

    :pswitch_1f
    iget-object p0, p0, Lcom/opera/android/startup/WelcomeActivity;->r:Lmcj;

    if-nez p0, :cond_24

    const/4 p0, 0x0

    :cond_24
    return-object p0

    nop

    :pswitch_data_26
    .packed-switch 0x0
        :pswitch_1f
        :pswitch_1a
        :pswitch_10
    .end packed-switch
.end method
