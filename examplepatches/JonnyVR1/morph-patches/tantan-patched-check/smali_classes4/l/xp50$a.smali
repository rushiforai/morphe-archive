.class Ll/xp50$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/xp50;->h(Ll/r1m;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/r1m;


# direct methods
.method public constructor <init>(Ll/r1m;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xp50$a;->a:Ll/r1m;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 1
    invoke-static {}, Ll/xp50;->a()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/xp50$a;->a:Ll/r1m;

    .line 8
    .line 9
    sget-object v0, Ll/xp50;->a:Ljava/lang/String;

    .line 10
    .line 11
    invoke-interface {p0, v0}, Ll/r1m;->onSuccess(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    sget-object v0, Ll/xp50;->c:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 16
    .line 17
    iget-object p0, p0, Ll/xp50$a;->a:Ll/r1m;

    .line 18
    .line 19
    invoke-virtual {v0, p0}, Ljava/util/concurrent/CopyOnWriteArrayList;->add(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    return-void
.end method
