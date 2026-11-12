.class public final synthetic Lrs;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lss;


# direct methods
.method public synthetic constructor <init>(Lss;B)V
    .registers 3

    iput-byte p2, p0, Lrs;->a:B

    iput-object p1, p0, Lrs;->b:Lss;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 2

    iget-byte v0, p0, Lrs;->a:B

    iget-object p0, p0, Lrs;->b:Lss;

    packed-switch v0, :pswitch_data_1c

    invoke-virtual {p0}, Lss;->G0()Lxs;

    move-result-object p0

    iget-object p0, p0, Lxs;->d:Lcom/opera/android/settings/SettingsManager;

    const-string v0, "speed_dial.large_icons"

    invoke-virtual {p0, v0}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_18
    iget-object p0, p0, Lss;->u:Lcom/opera/android/custom_views/FadingRecyclerView;

    return-object p0

    nop

    :pswitch_data_1c
    .packed-switch 0x0
        :pswitch_18
    .end packed-switch
.end method
