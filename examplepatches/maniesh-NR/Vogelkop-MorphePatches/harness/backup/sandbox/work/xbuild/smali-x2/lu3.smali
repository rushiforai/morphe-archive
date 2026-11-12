.class public final synthetic Llu3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lcom/opera/android/BrowserActivity;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/BrowserActivity;B)V
    .registers 3

    iput-byte p2, p0, Llu3;->a:B

    iput-object p1, p0, Llu3;->b:Lcom/opera/android/BrowserActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 2

    iget-byte v0, p0, Llu3;->a:B

    iget-object p0, p0, Llu3;->b:Lcom/opera/android/BrowserActivity;

    packed-switch v0, :pswitch_data_30

    iget-object p0, p0, Ldx3;->o:Lqim;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p0, p0, Lqim;->g:Loz3;

    return-object p0

    :pswitch_f
    invoke-virtual {p0}, Lcom/opera/android/BrowserActivity;->J0()Lysj;

    move-result-object p0

    return-object p0

    :pswitch_14
    iget-object p0, p0, Lcom/opera/android/BrowserActivity;->y:Ltw3;

    iget-object p0, p0, Ltw3;->a:Lhx3;

    invoke-virtual {p0}, Lhx3;->A()Lcom/opera/android/Lazy;

    move-result-object p0

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lctl;

    return-object p0

    :pswitch_23
    iget-object p0, p0, Lcom/opera/android/BrowserActivity;->y:Ltw3;

    iget-object p0, p0, Ltw3;->r:Lzv3;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljt3;

    iget-object p0, p0, Ljt3;->f:Lfd;

    return-object p0

    :pswitch_data_30
    .packed-switch 0x0
        :pswitch_23
        :pswitch_14
        :pswitch_f
    .end packed-switch
.end method
