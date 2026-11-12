.class public final Lfse;
.super Lcom/opera/android/Lazy;
.source "SourceFile"


# instance fields
.field public final synthetic e:B

.field public final synthetic f:Lhd;


# direct methods
.method public synthetic constructor <init>(Lhd;B)V
    .registers 3

    iput-byte p2, p0, Lfse;->e:B

    iput-object p1, p0, Lfse;->f:Lhd;

    invoke-direct {p0}, Lcom/opera/android/Lazy;-><init>()V

    return-void
.end method


# virtual methods
.method public final d()Ljava/lang/Object;
    .registers 5

    iget-byte v0, p0, Lfse;->e:B

    iget-object p0, p0, Lfse;->f:Lhd;

    packed-switch v0, :pswitch_data_2e

    new-instance v0, Lise;

    iget-object p0, p0, Lhd;->f:Ljava/lang/Object;

    check-cast p0, Landroid/content/Context;

    invoke-static {p0}, Lhd;->j(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    const/16 v1, 0xa

    sget-object v2, Lhse;->d:Lix5;

    const-string v3, "npt_unsent_push_track_events"

    invoke-direct {v0, p0, v3, v1, v2}, Lmse;-><init>(Landroid/content/SharedPreferences;Ljava/lang/String;ILlse;)V

    return-object v0

    :pswitch_1b
    new-instance v0, Lmse;

    iget-object p0, p0, Lhd;->f:Ljava/lang/Object;

    check-cast p0, Landroid/content/Context;

    invoke-static {p0}, Lhd;->j(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    const/4 v1, 0x1

    sget-object v2, Ljse;->m:Li06;

    const-string v3, "npt_unsent_token_track_events"

    invoke-direct {v0, p0, v3, v1, v2}, Lmse;-><init>(Landroid/content/SharedPreferences;Ljava/lang/String;ILlse;)V

    return-object v0

    :pswitch_data_2e
    .packed-switch 0x0
        :pswitch_1b
    .end packed-switch
.end method
