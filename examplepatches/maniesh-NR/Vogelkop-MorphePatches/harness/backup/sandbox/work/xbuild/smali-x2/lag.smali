.class public final enum Llag;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Llag;

.field public static final enum b:Llag;

.field public static final enum c:Llag;

.field public static final enum d:Llag;

.field public static final enum e:Llag;

.field public static final enum f:Llag;

.field public static final enum g:Llag;

.field public static final enum h:Llag;

.field public static final enum i:Llag;

.field public static final synthetic j:[Llag;


# direct methods
.method static constructor <clinit>()V
    .registers 11

    new-instance v0, Llag;

    const-string v1, "INVALID"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Llag;->a:Llag;

    new-instance v1, Llag;

    const-string v2, "NOTIFICATIONS"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Llag;->b:Llag;

    new-instance v2, Llag;

    const-string v3, "GEOLOCATION"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v2, Llag;->c:Llag;

    new-instance v3, Llag;

    const-string v4, "PROTECTED_MEDIA_IDENTIFIER"

    const/4 v5, 0x3

    invoke-direct {v3, v4, v5}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v3, Llag;->d:Llag;

    new-instance v4, Llag;

    const-string v5, "AUDIO_CAPTURE"

    const/4 v6, 0x4

    invoke-direct {v4, v5, v6}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v4, Llag;->e:Llag;

    new-instance v5, Llag;

    const-string v6, "VIDEO_CAPTURE"

    const/4 v7, 0x5

    invoke-direct {v5, v6, v7}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v5, Llag;->f:Llag;

    new-instance v6, Llag;

    const-string v7, "EXTERNAL_APPS"

    const/4 v8, 0x6

    invoke-direct {v6, v7, v8}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v6, Llag;->g:Llag;

    new-instance v7, Llag;

    const-string v8, "AUTOMATIC_DOWNLOADS"

    const/4 v9, 0x7

    invoke-direct {v7, v8, v9}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v7, Llag;->h:Llag;

    new-instance v8, Llag;

    const-string v9, "LOCAL_NETWORK"

    const/16 v10, 0x8

    invoke-direct {v8, v9, v10}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v8, Llag;->i:Llag;

    filled-new-array/range {v0 .. v8}, [Llag;

    move-result-object v0

    sput-object v0, Llag;->j:[Llag;

    return-void
.end method

.method public static d(I)Llag;
    .registers 2

    const/4 v0, 0x3

    if-eq p0, v0, :cond_35

    const/4 v0, 0x4

    if-eq p0, v0, :cond_32

    const/4 v0, 0x5

    if-eq p0, v0, :cond_2f

    const/16 v0, 0x8

    if-eq p0, v0, :cond_2c

    const/16 v0, 0x9

    if-eq p0, v0, :cond_29

    const/16 v0, 0x2c

    if-eq p0, v0, :cond_26

    const/16 v0, 0x2f

    if-eq p0, v0, :cond_23

    const/16 v0, 0x30

    if-eq p0, v0, :cond_20

    sget-object p0, Llag;->a:Llag;

    return-object p0

    :cond_20
    sget-object p0, Llag;->h:Llag;

    return-object p0

    :cond_23
    sget-object p0, Llag;->g:Llag;

    return-object p0

    :cond_26
    sget-object p0, Llag;->i:Llag;

    return-object p0

    :cond_29
    sget-object p0, Llag;->f:Llag;

    return-object p0

    :cond_2c
    sget-object p0, Llag;->e:Llag;

    return-object p0

    :cond_2f
    sget-object p0, Llag;->d:Llag;

    return-object p0

    :cond_32
    sget-object p0, Llag;->c:Llag;

    return-object p0

    :cond_35
    sget-object p0, Llag;->b:Llag;

    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Llag;
    .registers 2

    const-class v0, Llag;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Llag;

    return-object p0
.end method

.method public static values()[Llag;
    .registers 1

    sget-object v0, Llag;->j:[Llag;

    invoke-virtual {v0}, [Llag;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Llag;

    return-object v0
.end method
