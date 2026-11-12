.class public final Lmi3;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ly5i;

.field public final b:Lesg;


# direct methods
.method public constructor <init>(Ly5i;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lmi3;->a:Ly5i;

    new-instance p1, Lesg;

    new-instance v0, Lnb2;

    const/4 v1, 0x2

    invoke-direct {v0, p0, v1}, Lnb2;-><init>(Ljava/lang/Object;B)V

    new-instance v1, Lli3;

    invoke-direct {v1, p0}, Lli3;-><init>(Lmi3;)V

    const/16 v2, 0xf

    const/4 v3, 0x0

    invoke-direct {p1, v2, v0, v1, v3}, Lesg;-><init>(BLjava/lang/Object;Ljava/lang/Object;Z)V

    iput-object p1, p0, Lmi3;->b:Lesg;

    return-void
.end method

.method public static a(Lsj3;)Ljava/lang/String;
    .registers 2

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    if-eqz p0, :cond_1d

    const/4 v0, 0x1

    if-eq p0, v0, :cond_1a

    const/4 v0, 0x2

    if-eq p0, v0, :cond_17

    const/4 v0, 0x3

    if-ne p0, v0, :cond_12

    const-string p0, "ADBLOCK_CSS"

    return-object p0

    :cond_12
    invoke-static {}, Lh9o;->p()V

    const/4 p0, 0x0

    return-object p0

    :cond_17
    const-string p0, "TRACKER_URL"

    return-object p0

    :cond_1a
    const-string p0, "CDB_URL"

    return-object p0

    :cond_1d
    const-string p0, "ADBLOCK_URL"

    return-object p0
.end method

.method public static b(Ljava/lang/String;)Lsj3;
    .registers 2

    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result v0

    sparse-switch v0, :sswitch_data_40

    goto :goto_34

    :sswitch_8
    const-string v0, "CDB_URL"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_34

    sget-object p0, Lsj3;->b:Lsj3;

    return-object p0

    :sswitch_13
    const-string v0, "TRACKER_URL"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_34

    sget-object p0, Lsj3;->c:Lsj3;

    return-object p0

    :sswitch_1e
    const-string v0, "ADBLOCK_URL"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_34

    sget-object p0, Lsj3;->a:Lsj3;

    return-object p0

    :sswitch_29
    const-string v0, "ADBLOCK_CSS"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_34

    sget-object p0, Lsj3;->d:Lsj3;

    return-object p0

    :cond_34
    :goto_34
    const-string v0, "Can\'t convert value to enum, unknown value: "

    invoke-virtual {v0, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    nop

    :sswitch_data_40
    .sparse-switch
        -0x74408db2 -> :sswitch_29
        -0x74404a46 -> :sswitch_1e
        -0x163e7058 -> :sswitch_13
        0x50199411 -> :sswitch_8
    .end sparse-switch
.end method
