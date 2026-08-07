.class public Ll/qxk$a$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/qxk$a;->c(Ll/x20;JLjava/util/concurrent/TimeUnit;)Ll/kcg0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lrx/internal/schedulers/ScheduledAction;

.field public final synthetic b:Ll/qxk$a;


# direct methods
.method public constructor <init>(Ll/qxk$a;Lrx/internal/schedulers/ScheduledAction;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/qxk$a$a;->b:Ll/qxk$a;

    .line 2
    .line 3
    iput-object p2, p0, Ll/qxk$a$a;->a:Lrx/internal/schedulers/ScheduledAction;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/qxk$a$a;->b:Ll/qxk$a;

    .line 2
    .line 3
    invoke-static {v0}, Ll/qxk$a;->e(Ll/qxk$a;)Landroid/os/Handler;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p0, p0, Ll/qxk$a$a;->a:Lrx/internal/schedulers/ScheduledAction;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
