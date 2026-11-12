.class public final Lg2f;
.super Lsgb;
.source "SourceFile"


# instance fields
.field public final k:Landroid/os/ConditionVariable;

.field public l:Landroid/graphics/Bitmap;

.field public final m:J

.field public final n:Landroid/net/Uri;


# direct methods
.method public constructor <init>(Landroid/net/Uri;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/os/ConditionVariable;

    invoke-direct {v0}, Landroid/os/ConditionVariable;-><init>()V

    iput-object v0, p0, Lg2f;->k:Landroid/os/ConditionVariable;

    invoke-static {}, Lorg/chromium/net/NetworkChangeNotifier;->isInitialized()Z

    move-result v0

    if-eqz v0, :cond_19

    invoke-static {}, Lorg/chromium/net/NetworkChangeNotifier;->getInstance()Lorg/chromium/net/NetworkChangeNotifier;

    move-result-object v0

    invoke-virtual {v0}, Lorg/chromium/net/NetworkChangeNotifier;->getCurrentConnectionType()I

    move-result v0

    goto :goto_1a

    :cond_19
    const/4 v0, 0x0

    :goto_1a
    const/4 v1, 0x3

    const-wide/16 v2, 0x7530

    if-eq v0, v1, :cond_27

    const/4 v1, 0x4

    if-eq v0, v1, :cond_25

    const-wide/16 v0, 0x3a98

    goto :goto_2a

    :cond_25
    move-wide v0, v2

    goto :goto_2a

    :cond_27
    const-wide/32 v0, 0xea60

    :goto_2a
    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    iput-wide v0, p0, Lg2f;->m:J

    iput-object p1, p0, Lg2f;->n:Landroid/net/Uri;

    return-void
.end method


# virtual methods
.method public final U(Landroid/graphics/Bitmap;Z)V
    .registers 3

    iput-object p1, p0, Lg2f;->l:Landroid/graphics/Bitmap;

    iget-object p0, p0, Lg2f;->k:Landroid/os/ConditionVariable;

    invoke-virtual {p0}, Landroid/os/ConditionVariable;->open()V

    return-void
.end method

.method public final u(I)V
    .registers 6

    const/4 v0, 0x1

    const/4 v1, 0x3

    if-eq p1, v0, :cond_11

    const/4 v0, 0x2

    if-eq p1, v0, :cond_e

    if-ne p1, v1, :cond_c

    const-string v0, "RESPONSE_ERROR"

    goto :goto_13

    :cond_c
    const/4 p0, 0x0

    throw p0

    :cond_e
    const-string v0, "NETWORK_ERROR"

    goto :goto_13

    :cond_11
    const-string v0, "UNKNOWN"

    :goto_13
    if-ne p1, v1, :cond_18

    const-string v1, ":0"

    goto :goto_1a

    :cond_18
    const-string v1, ""

    :goto_1a
    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v2, "ICON_URL: %s [%s]"

    iget-object v3, p0, Lg2f;->n:Landroid/net/Uri;

    filled-new-array {v3, v0}, [Ljava/lang/Object;

    move-result-object v0

    invoke-static {v1, v2, v0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    invoke-super {p0, p1}, Lsgb;->u(I)V

    return-void
.end method
