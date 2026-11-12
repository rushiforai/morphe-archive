.class public final synthetic Lwaa;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf7f;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Laba;


# direct methods
.method public synthetic constructor <init>(Laba;B)V
    .registers 3

    iput-byte p2, p0, Lwaa;->a:B

    iput-object p1, p0, Lwaa;->b:Laba;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final d0(Ljava/lang/Object;)V
    .registers 4

    iget-byte v0, p0, Lwaa;->a:B

    const/4 v1, 0x1

    iget-object p0, p0, Lwaa;->b:Laba;

    packed-switch v0, :pswitch_data_4a

    check-cast p1, Llo3;

    invoke-virtual {p0}, Laba;->c()V

    return-void

    :pswitch_e
    check-cast p1, Lmnf;

    invoke-virtual {p0}, Laba;->c()V

    return-void

    :pswitch_14
    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p0}, Laba;->c()V

    return-void

    :pswitch_1d
    check-cast p1, Lb7j;

    invoke-virtual {p0}, Laba;->d()V

    return-void

    :pswitch_23
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p0}, Laba;->d()V

    return-void

    :pswitch_2c
    check-cast p1, Llue;

    iput-boolean v1, p0, Laba;->l:Z

    invoke-virtual {p0}, Laba;->d()V

    return-void

    :pswitch_34
    check-cast p1, Lf8k;

    iget-object p0, p0, Laba;->b:Lcom/opera/android/startpage/layout/feed_specific/HiddenStartPageContentHintView;

    iget-object v0, p0, Lcom/opera/android/startpage/layout/feed_specific/HiddenStartPageContentHintView;->o:Lf8k;

    invoke-static {v0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_49

    iput-object p1, p0, Lcom/opera/android/startpage/layout/feed_specific/HiddenStartPageContentHintView;->o:Lf8k;

    iget-boolean p1, p0, Lcom/opera/android/startpage/layout/feed_specific/HiddenStartPageContentHintView;->f:Z

    if-eqz p1, :cond_49

    invoke-virtual {p0, v1}, Lcom/opera/android/startpage/layout/feed_specific/HiddenStartPageContentHintView;->a(Z)V

    :cond_49
    return-void

    :pswitch_data_4a
    .packed-switch 0x0
        :pswitch_34
        :pswitch_2c
        :pswitch_23
        :pswitch_1d
        :pswitch_14
        :pswitch_e
    .end packed-switch
.end method
