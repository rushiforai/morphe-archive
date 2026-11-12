.class public final synthetic Lvaa;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Laba;


# direct methods
.method public synthetic constructor <init>(Laba;B)V
    .registers 3

    iput-byte p2, p0, Lvaa;->a:B

    iput-object p1, p0, Lvaa;->b:Laba;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 3

    iget-byte v0, p0, Lvaa;->a:B

    iget-object p0, p0, Lvaa;->b:Laba;

    packed-switch v0, :pswitch_data_1e

    iget-object v0, p0, Laba;->b:Lcom/opera/android/startpage/layout/feed_specific/HiddenStartPageContentHintView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Laba;->i:Lpde;

    invoke-virtual {p0}, Laba;->a()Lzaa;

    move-result-object p0

    invoke-static {v0, p0}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    return-void

    :pswitch_18
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Laba;->b(Z)V

    return-void

    nop

    :pswitch_data_1e
    .packed-switch 0x0
        :pswitch_18
    .end packed-switch
.end method
