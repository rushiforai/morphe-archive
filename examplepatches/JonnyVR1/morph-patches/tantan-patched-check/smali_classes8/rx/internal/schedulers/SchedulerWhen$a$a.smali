.class public Lrx/internal/schedulers/SchedulerWhen$a$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrx/b$h;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lrx/internal/schedulers/SchedulerWhen$a;->a(Lrx/internal/schedulers/SchedulerWhen$ScheduledAction;)Lrx/b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lrx/internal/schedulers/SchedulerWhen$ScheduledAction;

.field public final synthetic b:Lrx/internal/schedulers/SchedulerWhen$a;


# direct methods
.method public constructor <init>(Lrx/internal/schedulers/SchedulerWhen$a;Lrx/internal/schedulers/SchedulerWhen$ScheduledAction;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lrx/internal/schedulers/SchedulerWhen$a$a;->b:Lrx/internal/schedulers/SchedulerWhen$a;

    .line 2
    .line 3
    iput-object p2, p0, Lrx/internal/schedulers/SchedulerWhen$a$a;->a:Lrx/internal/schedulers/SchedulerWhen$ScheduledAction;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(Lrx/b$j;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lrx/internal/schedulers/SchedulerWhen$a$a;->a:Lrx/internal/schedulers/SchedulerWhen$ScheduledAction;

    .line 2
    .line 3
    invoke-interface {p1, v0}, Lrx/b$j;->onSubscribe(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lrx/internal/schedulers/SchedulerWhen$a$a;->a:Lrx/internal/schedulers/SchedulerWhen$ScheduledAction;

    .line 7
    .line 8
    iget-object p0, p0, Lrx/internal/schedulers/SchedulerWhen$a$a;->b:Lrx/internal/schedulers/SchedulerWhen$a;

    .line 9
    .line 10
    iget-object p0, p0, Lrx/internal/schedulers/SchedulerWhen$a;->a:Ll/f2e0$a;

    .line 11
    .line 12
    invoke-static {v0, p0}, Lrx/internal/schedulers/SchedulerWhen$ScheduledAction;->access$000(Lrx/internal/schedulers/SchedulerWhen$ScheduledAction;Ll/f2e0$a;)V

    .line 13
    .line 14
    .line 15
    invoke-interface {p1}, Lrx/b$j;->onCompleted()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lrx/b$j;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lrx/internal/schedulers/SchedulerWhen$a$a;->a(Lrx/b$j;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
