.class public final synthetic Lcqn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lr8n;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Llqn;


# direct methods
.method public synthetic constructor <init>(Llqn;B)V
    .registers 3

    iput-byte p2, p0, Lcqn;->a:B

    iput-object p1, p0, Lcqn;->b:Llqn;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .registers 3

    iget-byte p1, p0, Lcqn;->a:B

    iget-object p0, p0, Lcqn;->b:Llqn;

    packed-switch p1, :pswitch_data_40

    iget-object p1, p0, Llqn;->w:Lvsn;

    iget-object p1, p1, Lvsn;->q:Lwnm;

    invoke-static {p1}, Lxf8;->B(Likc;)Ltsd;

    move-result-object p1

    invoke-virtual {p1}, Lekc;->g()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ltsn;

    iget-object p1, p1, Ltsn;->a:Lzm9;

    invoke-virtual {p0, p1}, Llqn;->M0(Lzm9;)V

    return-void

    :pswitch_1b
    iget-object p0, p0, Llqn;->w:Lvsn;

    iget-object p0, p0, Lvsn;->c:Ls62;

    iget-object p0, p0, Ls62;->y:Leyi;

    iget-object p1, p0, Leyi;->d:Ljava/lang/Object;

    check-cast p1, Lkze;

    iget-object v0, p0, Leyi;->c:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/settings/SettingsManager;

    iget-boolean p0, p0, Leyi;->b:Z

    if-eqz p0, :cond_30

    const-string p0, "ofa-private-mode"

    goto :goto_3c

    :cond_30
    invoke-virtual {v0}, Lcom/opera/android/settings/SettingsManager;->g()Lg7j;

    move-result-object p0

    iget-object p0, p0, Lg7j;->d:Ljava/lang/String;

    const-string v0, "ofa-"

    invoke-virtual {v0, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    :goto_3c
    invoke-static {p1, p0}, Lxf8;->G0(Lkze;Ljava/lang/Object;)Z

    return-void

    :pswitch_data_40
    .packed-switch 0x0
        :pswitch_1b
    .end packed-switch
.end method
