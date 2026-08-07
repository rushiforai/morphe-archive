.class Lrx/internal/schedulers/SchedulerWhen$ImmediateAction;
.super Lrx/internal/schedulers/SchedulerWhen$ScheduledAction;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lrx/internal/schedulers/SchedulerWhen;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ImmediateAction"
.end annotation


# instance fields
.field private final action:Ll/x20;


# direct methods
.method public constructor <init>(Ll/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lrx/internal/schedulers/SchedulerWhen$ScheduledAction;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lrx/internal/schedulers/SchedulerWhen$ImmediateAction;->action:Ll/x20;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public callActual(Ll/f2e0$a;)Ll/kcg0;
    .locals 0

    .line 1
    iget-object p0, p0, Lrx/internal/schedulers/SchedulerWhen$ImmediateAction;->action:Ll/x20;

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Ll/f2e0$a;->b(Ll/x20;)Ll/kcg0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
