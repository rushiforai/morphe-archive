.class public Lrx/internal/schedulers/SchedulerWhen$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lrx/internal/schedulers/SchedulerWhen;->createWorker()Ll/f2e0$a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/qcj<",
        "Lrx/internal/schedulers/SchedulerWhen$ScheduledAction;",
        "Lrx/b;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic a:Ll/f2e0$a;

.field public final synthetic b:Lrx/internal/schedulers/SchedulerWhen;


# direct methods
.method public constructor <init>(Lrx/internal/schedulers/SchedulerWhen;Ll/f2e0$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lrx/internal/schedulers/SchedulerWhen$a;->b:Lrx/internal/schedulers/SchedulerWhen;

    .line 2
    .line 3
    iput-object p2, p0, Lrx/internal/schedulers/SchedulerWhen$a;->a:Ll/f2e0$a;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(Lrx/internal/schedulers/SchedulerWhen$ScheduledAction;)Lrx/b;
    .locals 1

    .line 1
    new-instance v0, Lrx/internal/schedulers/SchedulerWhen$a$a;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lrx/internal/schedulers/SchedulerWhen$a$a;-><init>(Lrx/internal/schedulers/SchedulerWhen$a;Lrx/internal/schedulers/SchedulerWhen$ScheduledAction;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Lrx/b;->c(Lrx/b$h;)Lrx/b;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public bridge synthetic call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lrx/internal/schedulers/SchedulerWhen$ScheduledAction;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lrx/internal/schedulers/SchedulerWhen$a;->a(Lrx/internal/schedulers/SchedulerWhen$ScheduledAction;)Lrx/b;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
