.class final Lcom/hellogroup/mk/business/webmonitor/MKWebMonitorManager$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/MessageQueue$IdleHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hellogroup/mk/business/webmonitor/MKWebMonitorManager;->j()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    bv = {
        0x1,
        0x0,
        0x3
    }
    d1 = {
        "\u0000\u0008\n\u0000\n\u0002\u0010\u000b\n\u0000\u0010\u0000\u001a\u00020\u0001H\n\u00a2\u0006\u0002\u0008\u0002"
    }
    d2 = {
        "<anonymous>",
        "",
        "queueIdle"
    }
    k = 0x3
    mv = {
        0x1,
        0x1,
        0x10
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/hellogroup/mk/business/webmonitor/MKWebMonitorManager$a;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/hellogroup/mk/business/webmonitor/MKWebMonitorManager$a;

    invoke-direct {v0}, Lcom/hellogroup/mk/business/webmonitor/MKWebMonitorManager$a;-><init>()V

    sput-object v0, Lcom/hellogroup/mk/business/webmonitor/MKWebMonitorManager$a;->INSTANCE:Lcom/hellogroup/mk/business/webmonitor/MKWebMonitorManager$a;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final queueIdle()Z
    .locals 0

    .line 1
    sget-object p0, Lcom/hellogroup/mk/business/webmonitor/MKWebMonitorManager;->INSTANCE:Lcom/hellogroup/mk/business/webmonitor/MKWebMonitorManager;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/hellogroup/mk/business/webmonitor/MKWebMonitorManager;->d(Lcom/hellogroup/mk/business/webmonitor/MKWebMonitorManager;)V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x0

    .line 7
    return p0
.end method
