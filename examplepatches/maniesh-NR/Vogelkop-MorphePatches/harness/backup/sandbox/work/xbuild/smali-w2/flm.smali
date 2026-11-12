.class public final synthetic Lflm;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lcom/opera/android/uninstall/UninstallSurveyFragment;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/uninstall/UninstallSurveyFragment;B)V
    .registers 3

    iput-byte p2, p0, Lflm;->a:B

    iput-object p1, p0, Lflm;->b:Lcom/opera/android/uninstall/UninstallSurveyFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 2

    iget-byte p1, p0, Lflm;->a:B

    iget-object p0, p0, Lflm;->b:Lcom/opera/android/uninstall/UninstallSurveyFragment;

    packed-switch p1, :pswitch_data_22

    invoke-virtual {p0}, Lcom/opera/android/uninstall/UninstallSurveyFragment;->J0()V

    invoke-virtual {p0}, Lcom/opera/android/uninstall/UninstallSurveyFragment;->I0()Lrlm;

    move-result-object p0

    sget-object p1, Lqlm;->b:Lplm;

    invoke-virtual {p0, p1}, Lrlm;->i(Lqlm;)V

    return-void

    :pswitch_14
    invoke-virtual {p0}, Lcom/opera/android/uninstall/UninstallSurveyFragment;->J0()V

    invoke-virtual {p0}, Lcom/opera/android/uninstall/UninstallSurveyFragment;->I0()Lrlm;

    move-result-object p0

    sget-object p1, Lqlm;->a:Lolm;

    invoke-virtual {p0, p1}, Lrlm;->i(Lqlm;)V

    return-void

    nop

    :pswitch_data_22
    .packed-switch 0x0
        :pswitch_14
    .end packed-switch
.end method
