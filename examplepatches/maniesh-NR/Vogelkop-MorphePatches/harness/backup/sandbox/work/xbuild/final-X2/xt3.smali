.class public final synthetic Lxt3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lcom/opera/android/BrowserActivity;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/BrowserActivity;B)V
    .registers 3

    iput-byte p2, p0, Lxt3;->a:B

    iput-object p1, p0, Lxt3;->b:Lcom/opera/android/BrowserActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 6

    iget-byte v0, p0, Lxt3;->a:B

    const/4 v1, 0x1

    iget-object p0, p0, Lxt3;->b:Lcom/opera/android/BrowserActivity;

    packed-switch v0, :pswitch_data_7a

    check-cast p1, Ljava/lang/String;

    iget-object p0, p0, Lcom/opera/android/BrowserActivity;->V:Lk6l;

    const/4 v0, 0x0

    if-nez p0, :cond_10

    move-object p0, v0

    :cond_10
    iget-object p0, p0, Lk6l;->o:Lb2l;

    if-eqz p0, :cond_22

    check-cast p0, Ld7l;

    sget-object v1, Llqm;->d:Llqm;

    invoke-static {p1, v0, v1}, Lwqm;->f(Ljava/lang/String;Lsqh;Llqm;)Llsc;

    move-result-object p1

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p0, p1}, Ld7l;->Z(Llsc;)V

    :cond_22
    return-void

    :pswitch_23
    check-cast p1, Ljava/lang/String;

    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-static {p0, p1, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    return-void

    :pswitch_2f
    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object p0, p0, Lcom/opera/android/BrowserActivity;->m1:Lpde;

    invoke-static {p0, p1}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    return-void

    :pswitch_3a
    check-cast p1, Ljava/lang/Runnable;

    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {p0}, Ldx3;->P()Lcom/opera/android/browser/BrowserFragment;

    move-result-object p0

    iget-object p0, p0, Lcom/opera/android/browser/BrowserFragment;->e:Lvp5;

    if-eqz p0, :cond_79

    new-instance v0, Ln9k;

    invoke-direct {v0, p1}, Ln9k;-><init>(Ljava/lang/Object;)V

    new-instance p1, Lqlk;

    const/16 v2, 0xa

    invoke-direct {p1, v0, v2}, Lqlk;-><init>(Ljava/lang/Object;B)V

    iget-object v2, p0, Lvp5;->f:Lcom/opera/android/browser/chromium/ChromiumContainerView;

    iget-object v2, v2, Lcom/opera/android/browser/chromium/ChromiumContainerView;->a:Lckf;

    iget-object v2, v2, Lckf;->k:Ljava/util/ArrayList;

    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance p1, Lvr9;

    const/16 v2, 0x14

    const/4 v3, 0x0

    invoke-direct {p1, v2, v0, p0, v3}, Lvr9;-><init>(BLjava/lang/Object;Ljava/lang/Object;Z)V

    iget-object p0, p0, Lvp5;->f:Lcom/opera/android/browser/chromium/ChromiumContainerView;

    iget-object p0, p0, Lcom/opera/android/browser/chromium/ChromiumContainerView;->a:Lckf;

    iget-object v0, p0, Lckf;->l:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_74

    iget-wide v2, p0, Lorg/chromium/components/embedder_support/view/ContentViewRenderView;->a:J

    invoke-static {v2, v3, v1}, LJ/N;->MTRhfnYH(JZ)V

    :cond_74
    iget-object p0, p0, Lckf;->l:Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_79
    return-void

    :pswitch_data_7a
    .packed-switch 0x0
        :pswitch_3a
        :pswitch_2f
        :pswitch_23
    .end packed-switch
.end method
