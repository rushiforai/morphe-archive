.class public final synthetic Lmrl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Loll;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lmrl;->a:B

    iput-object p1, p0, Lmrl;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 4

    iget-byte v0, p0, Lmrl;->a:B

    iget-object p0, p0, Lmrl;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_22

    check-cast p0, Lro9;

    invoke-virtual {p0}, Lro9;->e()V

    return-void

    :pswitch_d
    check-cast p0, Lnrl;

    iget-object v0, p0, Lnrl;->b:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/mainmenu/ToggleAnimationView;

    iget-boolean p0, p0, Lnrl;->a:Z

    if-eqz p0, :cond_1a

    const/16 p0, 0x12

    goto :goto_1c

    :cond_1a
    const/16 p0, 0x24

    :goto_1c
    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p0, p0, v2}, Lcom/opera/android/widget/LottieAnimationView;->s(IIILjava/lang/Runnable;)V

    return-void

    :pswitch_data_22
    .packed-switch 0x0
        :pswitch_d
    .end packed-switch
.end method
