.class public final synthetic Lut5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lwt5;


# direct methods
.method public synthetic constructor <init>(Lwt5;B)V
    .registers 3

    iput-byte p2, p0, Lut5;->a:B

    iput-object p1, p0, Lut5;->b:Lwt5;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 3

    iget-byte p1, p0, Lut5;->a:B

    iget-object p0, p0, Lut5;->b:Lwt5;

    packed-switch p1, :pswitch_data_2a

    iget-object p0, p0, Lwt5;->e:Lpjn;

    iget-object p0, p0, Lpjn;->b:Ljava/lang/Object;

    check-cast p0, Ltt5;

    iget-object p0, p0, Ltt5;->h:Lyu8;

    iget-object p0, p0, Lyu8;->b:Lcv8;

    iget-object p0, p0, Lcv8;->a:Lcom/opera/android/settings/SettingsManager;

    const-string p1, "enable_continue_booking"

    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    return-void

    :pswitch_1a
    iget-object p1, p0, Lwt5;->e:Lpjn;

    iget-object p0, p0, Lwt5;->d:Lj8f;

    iget-object p1, p1, Lpjn;->b:Ljava/lang/Object;

    check-cast p1, Ltt5;

    iget-object p1, p1, Ltt5;->i:Ls6h;

    const/4 v0, 0x1

    invoke-virtual {p1, p0, v0}, Ls6h;->N(Lj8f;Z)V

    return-void

    nop

    :pswitch_data_2a
    .packed-switch 0x0
        :pswitch_1a
    .end packed-switch
.end method
