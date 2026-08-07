.class Lcom/immomo/momomediaext/MMLiveEngine$w;
.super Ljava/util/TimerTask;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/immomo/momomediaext/MMLiveEngine;-><init>(Lcom/immomo/momomediaext/utils/MMLiveUserConfig;Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/immomo/momomediaext/MMLiveEngine;


# direct methods
.method public constructor <init>(Lcom/immomo/momomediaext/MMLiveEngine;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/momomediaext/MMLiveEngine$w;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    const-string v0, "MMLiveEngine"

    .line 2
    .line 3
    const-string v1, "traceLogTimer start."

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/esx;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine$w;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 9
    .line 10
    invoke-static {p0}, Lcom/immomo/momomediaext/MMLiveEngine;->j(Lcom/immomo/momomediaext/MMLiveEngine;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method
