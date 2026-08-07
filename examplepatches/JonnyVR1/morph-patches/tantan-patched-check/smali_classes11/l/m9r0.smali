.class public abstract Ll/m9r0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:Ll/m9r0;
    .annotation build Landroidx/annotation/GuardedBy;
        value = "AppComponent.class"
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Landroid/content/Context;)Ll/m9r0;
    .locals 3

    .line 1
    const-class v0, Ll/m9r0;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-object v1, Ll/m9r0;->a:Ll/m9r0;

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    new-instance v1, Ll/fjr0;

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    invoke-direct {v1, v2}, Ll/fjr0;-><init>(Ll/pmr0;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    check-cast p0, Landroid/app/Application;

    .line 19
    .line 20
    invoke-virtual {v1, p0}, Ll/fjr0;->b(Landroid/app/Application;)Ll/fjr0;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v1}, Ll/fjr0;->a()Ll/m9r0;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    sput-object p0, Ll/m9r0;->a:Ll/m9r0;

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :catchall_0
    move-exception p0

    .line 31
    goto :goto_1

    .line 32
    :cond_0
    :goto_0
    sget-object p0, Ll/m9r0;->a:Ll/m9r0;

    .line 33
    .line 34
    monitor-exit v0

    .line 35
    return-object p0

    .line 36
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 37
    throw p0
.end method


# virtual methods
.method public abstract b()Ll/uyx0;
.end method

.method public abstract c()Ll/ols0;
.end method
