.class public final synthetic Ljfn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lpfn;


# direct methods
.method public synthetic constructor <init>(Lpfn;B)V
    .registers 3

    iput-byte p2, p0, Ljfn;->a:B

    iput-object p1, p0, Ljfn;->b:Lpfn;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 4

    iget-byte v0, p0, Ljfn;->a:B

    iget-object p0, p0, Ljfn;->b:Lpfn;

    packed-switch v0, :pswitch_data_36

    check-cast p1, Lyah;

    invoke-virtual {p1, p0}, Lyah;->s0(Labh;)V

    return-void

    :pswitch_d
    check-cast p1, Laxc;

    if-eqz p1, :cond_34

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    add-int/lit8 p1, p1, 0x1

    sget-object v0, Llfn;->a:Lh58;

    invoke-virtual {v0}, La4;->d()I

    move-result v0

    rem-int/2addr p1, v0

    iget-object p0, p0, Lpfn;->a:Landroid/content/Context;

    invoke-static {p0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object p0

    invoke-virtual {p0}, Lru9;->b()Lnv6;

    move-result-object p0

    iget-object v0, p0, Lnv6;->a:Ljava/lang/Object;

    check-cast v0, Landroid/content/SharedPreferences$Editor;

    const-string v1, "vpn.vpnpro.upsell_banner_version"

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {p0}, Lnv6;->w()V

    :cond_34
    return-void

    nop

    :pswitch_data_36
    .packed-switch 0x0
        :pswitch_d
    .end packed-switch
.end method
