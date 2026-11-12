.class public final Lli3;
.super Lz4o;
.source "SourceFile"


# instance fields
.field public final synthetic r:B


# direct methods
.method public synthetic constructor <init>(B)V
    .registers 2

    .line 7
    iput-byte p1, p0, Lli3;->r:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lmi3;)V
    .registers 2

    const/4 p1, 0x0

    iput-byte p1, p0, Lli3;->r:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final L()Ljava/lang/String;
    .registers 1

    iget-byte p0, p0, Lli3;->r:B

    packed-switch p0, :pswitch_data_18

    const-string p0, "DELETE FROM `followed_matches` WHERE `oscoreId` = ? AND `sport` = ?"

    return-object p0

    :pswitch_8
    const-string p0, "DELETE FROM `followed_tournaments` WHERE `oscoreId` = ? AND `sport` = ?"

    return-object p0

    :pswitch_b
    const-string p0, "DELETE FROM `followed_teams` WHERE `oscoreId` = ? AND `sport` = ?"

    return-object p0

    :pswitch_e
    const-string p0, "DELETE FROM `Entry` WHERE `tabId` = ?"

    return-object p0

    :pswitch_11
    const-string p0, "DELETE FROM `Entry` WHERE `pageUrl` = ?"

    return-object p0

    :pswitch_14
    const-string p0, "UPDATE `active_block_lists` SET `name` = ?,`kind` = ?,`checksum` = ?,`addedTimestampMillis` = ?,`ttlMillis` = ?,`version` = ?,`active` = ? WHERE `name` = ? AND `kind` = ?"

    return-object p0

    nop

    :pswitch_data_18
    .packed-switch 0x0
        :pswitch_14
        :pswitch_11
        :pswitch_e
        :pswitch_b
        :pswitch_8
    .end packed-switch
.end method

.method public final p(Lwsk;Ljava/lang/Object;)V
    .registers 7

    iget-byte p0, p0, Lli3;->r:B

    const/4 v0, 0x2

    const/4 v1, 0x1

    packed-switch p0, :pswitch_data_92

    check-cast p2, Lfh9;

    iget-wide v2, p2, Lfh9;->a:J

    invoke-virtual {p1, v1, v2, v3}, Lwsk;->T0(IJ)V

    iget-object p0, p2, Lfh9;->b:Lapc;

    iget-boolean p0, p0, Lapc;->a:Z

    int-to-long v1, p0

    invoke-virtual {p1, v0, v1, v2}, Lwsk;->T0(IJ)V

    return-void

    :pswitch_17
    check-cast p2, Lhh9;

    iget-wide v2, p2, Lhh9;->a:J

    invoke-virtual {p1, v1, v2, v3}, Lwsk;->T0(IJ)V

    iget-object p0, p2, Lhh9;->b:Lapc;

    iget-boolean p0, p0, Lapc;->a:Z

    int-to-long v1, p0

    invoke-virtual {p1, v0, v1, v2}, Lwsk;->T0(IJ)V

    return-void

    :pswitch_27
    check-cast p2, Lgh9;

    iget-wide v2, p2, Lgh9;->a:J

    invoke-virtual {p1, v1, v2, v3}, Lwsk;->T0(IJ)V

    iget-object p0, p2, Lgh9;->b:Lapc;

    iget-boolean p0, p0, Lapc;->a:Z

    int-to-long v1, p0

    invoke-virtual {p1, v0, v1, v2}, Lwsk;->T0(IJ)V

    return-void

    :pswitch_37
    check-cast p2, Lm7l;

    iget p0, p2, Lm7l;->a:I

    int-to-long v2, p0

    invoke-virtual {p1, v1, v2, v3}, Lwsk;->T0(IJ)V

    return-void

    :pswitch_40
    check-cast p2, Lx4l;

    iget-object p0, p2, Lx4l;->a:Ljava/lang/String;

    invoke-virtual {p1, v1, p0}, Lwsk;->h(ILjava/lang/String;)V

    return-void

    :pswitch_48
    check-cast p2, Ldj3;

    iget-object p0, p2, Ldj3;->a:Ljava/lang/String;

    invoke-virtual {p1, v1, p0}, Lwsk;->h(ILjava/lang/String;)V

    iget-object p0, p2, Ldj3;->b:Lsj3;

    invoke-static {p0}, Lmi3;->a(Lsj3;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lwsk;->h(ILjava/lang/String;)V

    iget-object v0, p2, Ldj3;->c:Ljava/lang/String;

    if-eqz v0, :cond_8b

    const/4 v1, 0x3

    invoke-virtual {p1, v1, v0}, Lwsk;->h(ILjava/lang/String;)V

    const/4 v0, 0x4

    iget-wide v1, p2, Ldj3;->d:J

    invoke-virtual {p1, v0, v1, v2}, Lwsk;->T0(IJ)V

    const/4 v0, 0x5

    iget-wide v1, p2, Ldj3;->e:J

    invoke-virtual {p1, v0, v1, v2}, Lwsk;->T0(IJ)V

    iget v0, p2, Ldj3;->f:I

    int-to-long v0, v0

    const/4 v2, 0x6

    invoke-virtual {p1, v2, v0, v1}, Lwsk;->T0(IJ)V

    iget-boolean v0, p2, Ldj3;->g:Z

    const/4 v1, 0x7

    int-to-long v2, v0

    invoke-virtual {p1, v1, v2, v3}, Lwsk;->T0(IJ)V

    const/16 v0, 0x8

    iget-object p2, p2, Ldj3;->a:Ljava/lang/String;

    invoke-virtual {p1, v0, p2}, Lwsk;->h(ILjava/lang/String;)V

    const/16 p2, 0x9

    invoke-static {p0}, Lmi3;->a(Lsj3;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p2, p0}, Lwsk;->h(ILjava/lang/String;)V

    goto :goto_90

    :cond_8b
    const-string p0, "Cannot bind NULLABLE value \'raw\' of inline class \'SHA256HexLowercase\' to a NOT NULL column."

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    :goto_90
    return-void

    nop

    :pswitch_data_92
    .packed-switch 0x0
        :pswitch_48
        :pswitch_40
        :pswitch_37
        :pswitch_27
        :pswitch_17
    .end packed-switch
.end method
