.class public final synthetic Ltwf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lq2f;


# direct methods
.method public synthetic constructor <init>(Lq2f;B)V
    .registers 3

    iput-byte p2, p0, Ltwf;->a:B

    iput-object p1, p0, Ltwf;->b:Lq2f;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 2

    iget-byte v0, p0, Ltwf;->a:B

    iget-object p0, p0, Ltwf;->b:Lq2f;

    packed-switch v0, :pswitch_data_14

    sget-object v0, Lhjm;->b:Lhjm;

    invoke-virtual {p0, v0}, Lq2f;->f(Lhjm;)V

    return-void

    :pswitch_d
    iget-object p0, p0, Lq2f;->j:Lcom/opera/android/widget/LottieAnimationView;

    invoke-virtual {p0}, Lcom/opera/android/widget/LottieAnimationView;->h()V

    return-void

    nop

    :pswitch_data_14
    .packed-switch 0x0
        :pswitch_d
    .end packed-switch
.end method
