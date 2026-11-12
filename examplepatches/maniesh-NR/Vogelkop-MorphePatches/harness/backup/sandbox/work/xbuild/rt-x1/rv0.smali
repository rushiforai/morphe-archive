.class public final Lrv0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ly5i;


# direct methods
.method public constructor <init>(Ly5i;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lrv0;->a:Ly5i;

    return-void
.end method

.method public static a(Ljava/lang/String;)Llu4;
    .registers 2

    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result v0

    sparse-switch v0, :sswitch_data_40

    goto :goto_34

    :sswitch_8
    const-string v0, "USER"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_34

    sget-object p0, Llu4;->c:Llu4;

    return-object p0

    :sswitch_13
    const-string v0, "ASSISTANT"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_34

    sget-object p0, Llu4;->d:Llu4;

    return-object p0

    :sswitch_1e
    const-string v0, "APP_RESPONSE"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_34

    sget-object p0, Llu4;->b:Llu4;

    return-object p0

    :sswitch_29
    const-string v0, "APP_DISCLAMER"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_34

    sget-object p0, Llu4;->a:Llu4;

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
        -0x3bd3f50e -> :sswitch_29
        -0xdb79741 -> :sswitch_1e
        -0x4ae7d42 -> :sswitch_13
        0x27e3cb -> :sswitch_8
    .end sparse-switch
.end method
