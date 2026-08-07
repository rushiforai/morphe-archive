.class public final Ll/qxk;
.super Ll/f2e0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/qxk$a;
    }
.end annotation


# instance fields
.field public final b:Landroid/os/Handler;


# direct methods
.method public constructor <init>(Landroid/os/Handler;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/f2e0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/qxk;->b:Landroid/os/Handler;

    .line 5
    .line 6
    return-void
.end method

.method public static a(Landroid/os/Handler;)Ll/qxk;
    .locals 1

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    new-instance v0, Ll/qxk;

    .line 4
    .line 5
    invoke-direct {v0, p0}, Ll/qxk;-><init>(Landroid/os/Handler;)V

    .line 6
    .line 7
    .line 8
    return-object v0

    .line 9
    :cond_0
    const-string p0, "handler == null"

    .line 10
    .line 11
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    const/4 p0, 0x0

    .line 15
    return-object p0
.end method


# virtual methods
.method public createWorker()Ll/f2e0$a;
    .locals 1

    .line 1
    new-instance v0, Ll/qxk$a;

    .line 2
    .line 3
    iget-object p0, p0, Ll/qxk;->b:Landroid/os/Handler;

    .line 4
    .line 5
    invoke-direct {v0, p0}, Ll/qxk$a;-><init>(Landroid/os/Handler;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method
