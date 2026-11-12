.class public final Ljbf;
.super Lno7;
.source "SourceFile"


# static fields
.field public static final k:Lir5;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lir5;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Ljbf;->k:Lir5;

    return-void
.end method

.method public static t(Landroid/content/Context;)Ljbf;
    .registers 3

    sget-object v0, Lio7;->m:Lio7;

    sget-object v1, Ljbf;->k:Lir5;

    invoke-static {p0, v0, v1}, Lno7;->n(Landroid/content/Context;Lio7;Llo7;)Lno7;

    move-result-object p0

    check-cast p0, Ljbf;

    return-object p0
.end method


# virtual methods
.method public final h()Ljava/lang/Object;
    .registers 1

    new-instance p0, Libf;

    invoke-direct {p0}, Libf;-><init>()V

    return-object p0
.end method

.method public final k(Lizd;)Ljava/lang/Object;
    .registers 2

    new-instance p0, Libf;

    invoke-direct {p0, p1}, Libf;-><init>(Lizd;)V

    return-object p0
.end method

.method public final q([B)Ljava/lang/Object;
    .registers 3

    new-instance p0, Lizd;

    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-direct {p0, v0}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    new-instance p1, Libf;

    invoke-direct {p1, p0}, Libf;-><init>(Lizd;)V

    return-object p1
.end method

.method public final r(Ljava/lang/Object;)V
    .registers 3

    check-cast p1, Libf;

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object p0, p0, Lno7;->a:Landroid/content/Context;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object p0

    invoke-virtual {p0}, Lcom/opera/android/settings/SettingsManager;->J()Z

    move-result v0

    if-nez v0, :cond_17

    return-void

    :cond_17
    const/16 v0, 0x400

    invoke-virtual {p1, v0}, Libf;->a(I)Z

    move-result p1

    const-string v0, "enable_frequently_visited_sites"

    invoke-virtual {p0, p1, v0}, Lcom/opera/android/settings/SettingsManager;->R(ILjava/lang/String;)V

    return-void
.end method
