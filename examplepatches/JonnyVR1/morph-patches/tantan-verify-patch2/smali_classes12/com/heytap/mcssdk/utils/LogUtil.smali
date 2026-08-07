.class public Lcom/heytap/mcssdk/utils/LogUtil;
.super Ljava/lang/Object;


# static fields
.field public static final TAG:Ljava/lang/String; = "mcssdk---"

.field private static sD:Z = true

.field private static sE:Z = true

.field private static sI:Z = false

.field private static sIsDebug:Z = true

.field private static sSeparator:Ljava/lang/String; = "-->"

.field private static sV:Z = false

.field private static sW:Z = true

.field private static special:Ljava/lang/String; = "MCS"


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static d(Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static d(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 2
    return-void
.end method

.method public static e(Ljava/lang/Exception;)V
    .locals 1

    .line 2
    sget-boolean v0, Lcom/heytap/mcssdk/utils/LogUtil;->sE:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    :cond_0
    return-void
.end method

.method public static e(Ljava/lang/String;)V
    .locals 2

    .line 1
    sget-boolean v0, Lcom/heytap/mcssdk/utils/LogUtil;->sE:Z

    if-eqz v0, :cond_0

    sget-boolean v0, Lcom/heytap/mcssdk/utils/LogUtil;->sIsDebug:Z

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/heytap/mcssdk/utils/LogUtil;->special:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Lcom/heytap/mcssdk/utils/LogUtil;->sSeparator:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v0, "mcssdk---"

    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    return-void
.end method

.method public static e(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 3
    sget-boolean v0, Lcom/heytap/mcssdk/utils/LogUtil;->sE:Z

    if-eqz v0, :cond_0

    sget-boolean v0, Lcom/heytap/mcssdk/utils/LogUtil;->sIsDebug:Z

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/heytap/mcssdk/utils/LogUtil;->special:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Lcom/heytap/mcssdk/utils/LogUtil;->sSeparator:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    return-void
.end method

.method public static e(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 1

    .line 4
    sget-boolean v0, Lcom/heytap/mcssdk/utils/LogUtil;->sE:Z

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    return-void
.end method

.method public static getSeprateor()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/heytap/mcssdk/utils/LogUtil;->sSeparator:Ljava/lang/String;

    return-object v0
.end method

.method public static getSpecial()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/heytap/mcssdk/utils/LogUtil;->special:Ljava/lang/String;

    return-object v0
.end method

.method public static i(Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static i(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 2
    return-void
.end method

.method public static isD()Z
    .locals 1

    sget-boolean v0, Lcom/heytap/mcssdk/utils/LogUtil;->sD:Z

    return v0
.end method

.method public static isDebugs()Z
    .locals 1

    sget-boolean v0, Lcom/heytap/mcssdk/utils/LogUtil;->sIsDebug:Z

    return v0
.end method

.method public static isE()Z
    .locals 1

    sget-boolean v0, Lcom/heytap/mcssdk/utils/LogUtil;->sE:Z

    return v0
.end method

.method public static isI()Z
    .locals 1

    sget-boolean v0, Lcom/heytap/mcssdk/utils/LogUtil;->sI:Z

    return v0
.end method

.method public static isV()Z
    .locals 1

    sget-boolean v0, Lcom/heytap/mcssdk/utils/LogUtil;->sV:Z

    return v0
.end method

.method public static isW()Z
    .locals 1

    sget-boolean v0, Lcom/heytap/mcssdk/utils/LogUtil;->sW:Z

    return v0
.end method

.method public static setD(Z)V
    .locals 0

    sput-boolean p0, Lcom/heytap/mcssdk/utils/LogUtil;->sD:Z

    return-void
.end method

.method public static setDebugs(Z)V
    .locals 0

    sput-boolean p0, Lcom/heytap/mcssdk/utils/LogUtil;->sIsDebug:Z

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    :goto_0
    sput-boolean p0, Lcom/heytap/mcssdk/utils/LogUtil;->sV:Z

    sput-boolean p0, Lcom/heytap/mcssdk/utils/LogUtil;->sD:Z

    sput-boolean p0, Lcom/heytap/mcssdk/utils/LogUtil;->sI:Z

    sput-boolean p0, Lcom/heytap/mcssdk/utils/LogUtil;->sW:Z

    sput-boolean p0, Lcom/heytap/mcssdk/utils/LogUtil;->sE:Z

    return-void

    :cond_0
    const/4 p0, 0x0

    goto :goto_0
.end method

.method public static setE(Z)V
    .locals 0

    sput-boolean p0, Lcom/heytap/mcssdk/utils/LogUtil;->sE:Z

    return-void
.end method

.method public static setI(Z)V
    .locals 0

    sput-boolean p0, Lcom/heytap/mcssdk/utils/LogUtil;->sI:Z

    return-void
.end method

.method public static setSeprateor(Ljava/lang/String;)V
    .locals 0

    sput-object p0, Lcom/heytap/mcssdk/utils/LogUtil;->sSeparator:Ljava/lang/String;

    return-void
.end method

.method public static setSpecial(Ljava/lang/String;)V
    .locals 0

    sput-object p0, Lcom/heytap/mcssdk/utils/LogUtil;->special:Ljava/lang/String;

    return-void
.end method

.method public static setV(Z)V
    .locals 0

    sput-boolean p0, Lcom/heytap/mcssdk/utils/LogUtil;->sV:Z

    return-void
.end method

.method public static setW(Z)V
    .locals 0

    sput-boolean p0, Lcom/heytap/mcssdk/utils/LogUtil;->sW:Z

    return-void
.end method

.method public static v(Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static v(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 2
    return-void
.end method

.method public static w(Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static w(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 2
    return-void
.end method
