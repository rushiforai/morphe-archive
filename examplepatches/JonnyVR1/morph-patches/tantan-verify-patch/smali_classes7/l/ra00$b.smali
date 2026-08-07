.class final Ll/ra00$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/ra00;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "b"
.end annotation


# instance fields
.field private a:Landroid/content/Intent;


# direct methods
.method private constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/content/IntentFilter;

    .line 5
    .line 6
    const-string v1, "android.intent.action.BATTERY_CHANGED"

    .line 7
    .line 8
    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-static {p1, v1, v0}, Ll/jj5;->l(Landroid/content/Context;Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    iput-object p1, p0, Ll/ra00$b;->a:Landroid/content/Intent;

    .line 17
    .line 18
    return-void
.end method

.method public synthetic constructor <init>(Landroid/content/Context;Ll/ra00$a;)V
    .locals 0

    .line 19
    invoke-direct {p0, p1}, Ll/ra00$b;-><init>(Landroid/content/Context;)V

    return-void
.end method

.method public static synthetic a(Ll/ra00$b;)I
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ra00$b;->h()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic b(Ll/ra00$b;)I
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ra00$b;->g()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic c(Ll/ra00$b;)I
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ra00$b;->e()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic d(Ll/ra00$b;)I
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ra00$b;->f()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method private e()I
    .locals 2

    .line 1
    iget-object p0, p0, Ll/ra00$b;->a:Landroid/content/Intent;

    .line 2
    .line 3
    const-string v0, "level"

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {p0, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
.end method

.method private f()I
    .locals 2

    .line 1
    iget-object p0, p0, Ll/ra00$b;->a:Landroid/content/Intent;

    .line 2
    .line 3
    const-string v0, "scale"

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {p0, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
.end method

.method private g()I
    .locals 2

    .line 1
    iget-object p0, p0, Ll/ra00$b;->a:Landroid/content/Intent;

    .line 2
    .line 3
    const-string v0, "temperature"

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {p0, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
.end method

.method private h()I
    .locals 2

    .line 1
    iget-object p0, p0, Ll/ra00$b;->a:Landroid/content/Intent;

    .line 2
    .line 3
    const-string v0, "voltage"

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {p0, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
.end method
