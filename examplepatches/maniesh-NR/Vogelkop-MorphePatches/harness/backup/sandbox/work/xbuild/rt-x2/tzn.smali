.class public final synthetic Ltzn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lcom/opera/android/startup/WelcomeActivity;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/startup/WelcomeActivity;B)V
    .registers 3

    iput-byte p2, p0, Ltzn;->a:B

    iput-object p1, p0, Ltzn;->b:Lcom/opera/android/startup/WelcomeActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 5

    iget-byte v0, p0, Ltzn;->a:B

    iget-object p0, p0, Ltzn;->b:Lcom/opera/android/startup/WelcomeActivity;

    packed-switch v0, :pswitch_data_66

    iget-object p0, p0, Lcom/opera/android/startup/WelcomeActivity;->q:Lwzn;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lu9k;

    iget-object p0, p0, Lu9k;->a:Lpde;

    return-object p0

    :pswitch_12
    sget v0, Lcom/opera/android/startup/WelcomeActivity;->w:I

    invoke-virtual {p0}, Lcom/opera/android/startup/WelcomeActivity;->W()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_1a
    iget-object p0, p0, Lcom/opera/android/startup/WelcomeActivity;->p:Lwzn;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lm9k;

    iget-object p0, p0, Lm9k;->e:Ljze;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-object p0

    :pswitch_2e
    sget v0, Lcom/opera/android/startup/WelcomeActivity;->w:I

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    iget-object v0, v0, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object v0, v0, Lxv1;->o:Lj4c;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lsi3;

    iget-object v0, v0, Lsi3;->o:Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcj3;

    iget-object v0, v0, Lcj3;->d:Ljze;

    new-instance v1, Lq0n;

    const/16 v2, 0xb

    invoke-direct {v1, v2}, Lq0n;-><init>(B)V

    new-instance v2, Lglm;

    const/4 v3, 0x5

    invoke-direct {v2, v1, v3}, Lglm;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, p0, v2}, Lekc;->j(Lndc;Lf7f;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_5f
    sget v0, Lcom/opera/android/startup/WelcomeActivity;->w:I

    invoke-virtual {p0}, Lcom/opera/android/startup/WelcomeActivity;->j()Lr7n;

    move-result-object p0

    return-object p0

    :pswitch_data_66
    .packed-switch 0x0
        :pswitch_5f
        :pswitch_2e
        :pswitch_1a
        :pswitch_12
    .end packed-switch
.end method
