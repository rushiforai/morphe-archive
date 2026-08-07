.class public final Ll/x4t0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/util/WeakHashMap;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/WeakHashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/x4t0;->a:Ljava/util/WeakHashMap;

    .line 10
    .line 11
    return-void
.end method

.method public static bridge synthetic a(Ll/x4t0;)Ljava/util/WeakHashMap;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/x4t0;->a:Ljava/util/WeakHashMap;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public final b(Landroid/content/Context;)Ljava/util/concurrent/Future;
    .locals 2

    .line 1
    sget-object v0, Ll/oct0;->a:Ll/xvw0;

    .line 2
    .line 3
    new-instance v1, Ll/v4t0;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Ll/v4t0;-><init>(Ll/x4t0;Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    invoke-interface {v0, v1}, Ll/xvw0;->R(Ljava/util/concurrent/Callable;)Ll/hpr;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method
