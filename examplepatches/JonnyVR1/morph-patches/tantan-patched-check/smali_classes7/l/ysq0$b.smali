.class Ll/ysq0$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/ServiceConnection;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/ysq0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "b"
.end annotation


# instance fields
.field final synthetic a:Ll/ysq0;


# direct methods
.method private constructor <init>(Ll/ysq0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ysq0$b;->a:Ll/ysq0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public synthetic constructor <init>(Ll/ysq0;Ll/ysq0$a;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1}, Ll/ysq0$b;-><init>(Ll/ysq0;)V

    return-void
.end method


# virtual methods
.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 1

    .line 1
    new-instance p1, Ljava/lang/Thread;

    .line 2
    .line 3
    new-instance v0, Ll/ysq0$b$a;

    .line 4
    .line 5
    invoke-direct {v0, p0, p2}, Ll/ysq0$b$a;-><init>(Ll/ysq0$b;Landroid/os/IBinder;)V

    .line 6
    .line 7
    .line 8
    invoke-direct {p1, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 0

    .line 1
    return-void
.end method
