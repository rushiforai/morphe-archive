.class public final synthetic Ls6n;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lcom/opera/android/settings/SettingsManager;

.field public final synthetic c:Lezg;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/settings/SettingsManager;Lezg;B)V
    .registers 4

    iput-byte p3, p0, Ls6n;->a:B

    iput-object p1, p0, Ls6n;->b:Lcom/opera/android/settings/SettingsManager;

    iput-object p2, p0, Ls6n;->c:Lezg;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 3

    iget-byte v0, p0, Ls6n;->a:B

    iget-object v1, p0, Ls6n;->c:Lezg;

    iget-object p0, p0, Ls6n;->b:Lcom/opera/android/settings/SettingsManager;

    packed-switch v0, :pswitch_data_12

    invoke-virtual {p0, v1}, Lcom/opera/android/settings/SettingsManager;->T(Lp5j;)V

    return-void

    :pswitch_d
    invoke-virtual {p0, v1}, Lcom/opera/android/settings/SettingsManager;->a(Lp5j;)V

    return-void

    nop

    :pswitch_data_12
    .packed-switch 0x0
        :pswitch_d
    .end packed-switch
.end method
