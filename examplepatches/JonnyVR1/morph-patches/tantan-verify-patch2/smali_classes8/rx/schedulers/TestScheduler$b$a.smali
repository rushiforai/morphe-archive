.class public Lrx/schedulers/TestScheduler$b$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lrx/schedulers/TestScheduler$b;->c(Ll/x20;JLjava/util/concurrent/TimeUnit;)Ll/kcg0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lrx/schedulers/TestScheduler$c;

.field public final synthetic b:Lrx/schedulers/TestScheduler$b;


# direct methods
.method public constructor <init>(Lrx/schedulers/TestScheduler$b;Lrx/schedulers/TestScheduler$c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lrx/schedulers/TestScheduler$b$a;->b:Lrx/schedulers/TestScheduler$b;

    .line 2
    .line 3
    iput-object p2, p0, Lrx/schedulers/TestScheduler$b$a;->a:Lrx/schedulers/TestScheduler$c;

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
    iget-object v0, p0, Lrx/schedulers/TestScheduler$b$a;->b:Lrx/schedulers/TestScheduler$b;

    .line 2
    .line 3
    iget-object v0, v0, Lrx/schedulers/TestScheduler$b;->b:Lrx/schedulers/TestScheduler;

    .line 4
    .line 5
    iget-object v0, v0, Lrx/schedulers/TestScheduler;->b:Ljava/util/Queue;

    .line 6
    .line 7
    iget-object p0, p0, Lrx/schedulers/TestScheduler$b$a;->a:Lrx/schedulers/TestScheduler$c;

    .line 8
    .line 9
    invoke-interface {v0, p0}, Ljava/util/Collection;->remove(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    return-void
.end method
