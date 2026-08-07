.class public Ll/b7f$a$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/b7f$a;->c(Ll/x20;JLjava/util/concurrent/TimeUnit;)Ll/kcg0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/mu10;

.field public final synthetic b:Ll/x20;

.field public final synthetic c:Ll/kcg0;

.field public final synthetic d:Ll/b7f$a;


# direct methods
.method public constructor <init>(Ll/b7f$a;Ll/mu10;Ll/x20;Ll/kcg0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/b7f$a$b;->d:Ll/b7f$a;

    .line 2
    .line 3
    iput-object p2, p0, Ll/b7f$a$b;->a:Ll/mu10;

    .line 4
    .line 5
    iput-object p3, p0, Ll/b7f$a$b;->b:Ll/x20;

    .line 6
    .line 7
    iput-object p4, p0, Ll/b7f$a$b;->c:Ll/kcg0;

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public call()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/b7f$a$b;->a:Ll/mu10;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/mu10;->isUnsubscribed()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object v0, p0, Ll/b7f$a$b;->d:Ll/b7f$a;

    .line 11
    .line 12
    iget-object v1, p0, Ll/b7f$a$b;->b:Ll/x20;

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Ll/b7f$a;->b(Ll/x20;)Ll/kcg0;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iget-object v1, p0, Ll/b7f$a$b;->a:Ll/mu10;

    .line 19
    .line 20
    invoke-virtual {v1, v0}, Ll/mu10;->a(Ll/kcg0;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    const-class v2, Lrx/internal/schedulers/ScheduledAction;

    .line 28
    .line 29
    if-ne v1, v2, :cond_1

    .line 30
    .line 31
    check-cast v0, Lrx/internal/schedulers/ScheduledAction;

    .line 32
    .line 33
    iget-object p0, p0, Ll/b7f$a$b;->c:Ll/kcg0;

    .line 34
    .line 35
    invoke-virtual {v0, p0}, Lrx/internal/schedulers/ScheduledAction;->add(Ll/kcg0;)V

    .line 36
    .line 37
    .line 38
    :cond_1
    :goto_0
    return-void
.end method
