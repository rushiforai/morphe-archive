.class Ll/ftq0$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/ServiceConnection;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/ftq0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "c"
.end annotation


# instance fields
.field final synthetic a:Ll/ftq0;


# direct methods
.method private constructor <init>(Ll/ftq0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ftq0$c;->a:Ll/ftq0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public synthetic constructor <init>(Ll/ftq0;Ll/ftq0$a;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1}, Ll/ftq0$c;-><init>(Ll/ftq0;)V

    return-void
.end method


# virtual methods
.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/ftq0$c;->a:Ll/ftq0;

    .line 2
    .line 3
    invoke-static {p1}, Ll/ftq0;->e(Ll/ftq0;)Ll/ftq0$b;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    new-instance p1, Ljava/lang/Thread;

    .line 11
    .line 12
    new-instance v0, Ll/ftq0$c$a;

    .line 13
    .line 14
    invoke-direct {v0, p0, p2}, Ll/ftq0$c$a;-><init>(Ll/ftq0$c;Landroid/os/IBinder;)V

    .line 15
    .line 16
    .line 17
    invoke-direct {p1, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 0

    .line 1
    return-void
.end method
