.class public final synthetic Lre3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lykj;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lcom/opera/android/settings/BigSwitchButton;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/settings/BigSwitchButton;B)V
    .registers 3

    iput-byte p2, p0, Lre3;->a:B

    iput-object p1, p0, Lre3;->b:Lcom/opera/android/settings/BigSwitchButton;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final k(Lg3d;)Ljava/lang/Object;
    .registers 2

    iget-byte p1, p0, Lre3;->a:B

    iget-object p0, p0, Lre3;->b:Lcom/opera/android/settings/BigSwitchButton;

    packed-switch p1, :pswitch_data_2c

    sget-object p1, Lcom/opera/android/settings/BigSwitchButton;->j:Lk2d;

    iget-byte p0, p0, Lcom/opera/android/settings/BigSwitchButton;->g:B

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    :pswitch_10
    sget-object p1, Lcom/opera/android/settings/BigSwitchButton;->j:Lk2d;

    iget-byte p0, p0, Lcom/opera/android/settings/BigSwitchButton;->f:B

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    :pswitch_19
    sget-object p1, Lcom/opera/android/settings/BigSwitchButton;->j:Lk2d;

    iget-byte p0, p0, Lcom/opera/android/settings/BigSwitchButton;->h:B

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    :pswitch_22
    sget-object p1, Lcom/opera/android/settings/BigSwitchButton;->j:Lk2d;

    iget-byte p0, p0, Lcom/opera/android/settings/BigSwitchButton;->h:B

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_2c
    .packed-switch 0x0
        :pswitch_22
        :pswitch_19
        :pswitch_10
    .end packed-switch
.end method
