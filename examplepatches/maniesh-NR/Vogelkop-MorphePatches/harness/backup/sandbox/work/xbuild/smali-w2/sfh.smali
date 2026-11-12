.class public final enum Lsfh;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lsfh;

.field public static final enum b:Lsfh;

.field public static final enum c:Lsfh;

.field public static final enum d:Lsfh;

.field public static final synthetic e:[Lsfh;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    new-instance v0, Lsfh;

    const-string v1, "UNDETERMINED"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lsfh;->a:Lsfh;

    new-instance v1, Lsfh;

    const-string v2, "SLOW"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lsfh;->b:Lsfh;

    new-instance v2, Lsfh;

    const-string v3, "MEDIUM"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lsfh;->c:Lsfh;

    new-instance v3, Lsfh;

    const-string v4, "FAST"

    const/4 v5, 0x3

    invoke-direct {v3, v4, v5}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lsfh;->d:Lsfh;

    filled-new-array {v0, v1, v2, v3}, [Lsfh;

    move-result-object v0

    sput-object v0, Lsfh;->e:[Lsfh;

    return-void
.end method

.method public static d()Lsfh;
    .registers 3

    invoke-static {}, Lsle;->c()I

    move-result v0

    const/4 v1, 0x3

    const/4 v2, 0x1

    if-eq v0, v1, :cond_1c

    const/4 v1, 0x4

    if-eq v0, v1, :cond_1c

    const/4 v1, 0x5

    if-eq v0, v1, :cond_1c

    const/16 v1, 0x8

    if-eq v0, v1, :cond_1c

    invoke-static {}, Lsle;->c()I

    move-result v0

    if-eq v0, v2, :cond_2d

    const/4 v1, 0x2

    if-eq v0, v1, :cond_2d

    goto :goto_2a

    :cond_1c
    invoke-static {}, Lsle;->b()V

    invoke-static {}, Lorg/chromium/net/NetworkChangeNotifier;->getInstance()Lorg/chromium/net/NetworkChangeNotifier;

    move-result-object v0

    invoke-virtual {v0, v2}, Lorg/chromium/net/NetworkChangeNotifier;->getCurrentConnectionSubtype(Z)I

    move-result v0

    packed-switch v0, :pswitch_data_36

    :goto_2a
    sget-object v0, Lsfh;->a:Lsfh;

    return-object v0

    :cond_2d
    :pswitch_2d
    sget-object v0, Lsfh;->d:Lsfh;

    return-object v0

    :pswitch_30
    sget-object v0, Lsfh;->c:Lsfh;

    return-object v0

    :pswitch_33
    sget-object v0, Lsfh;->b:Lsfh;

    return-object v0

    :pswitch_data_36
    .packed-switch 0x3
        :pswitch_33
        :pswitch_33
        :pswitch_33
        :pswitch_33
        :pswitch_33
        :pswitch_33
        :pswitch_30
        :pswitch_30
        :pswitch_30
        :pswitch_30
        :pswitch_2d
        :pswitch_2d
        :pswitch_2d
        :pswitch_30
        :pswitch_2d
        :pswitch_2d
        :pswitch_2d
    .end packed-switch
.end method

.method public static valueOf(Ljava/lang/String;)Lsfh;
    .registers 2

    const-class v0, Lsfh;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lsfh;

    return-object p0
.end method

.method public static values()[Lsfh;
    .registers 1

    sget-object v0, Lsfh;->e:[Lsfh;

    invoke-virtual {v0}, [Lsfh;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lsfh;

    return-object v0
.end method
