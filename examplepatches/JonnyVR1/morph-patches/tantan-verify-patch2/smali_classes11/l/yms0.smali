.class public final Ll/yms0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/vhu0;


# instance fields
.field public final a:Ll/bou0;


# direct methods
.method public constructor <init>(Ll/bou0;Ll/bou0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/yms0;->a:Ll/bou0;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final bridge synthetic zza()Ljava/lang/Object;
    .locals 2

    .line 1
    invoke-static {}, Ll/nxr0;->a()Ljava/util/concurrent/Executor;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ljava/util/concurrent/Executor;

    .line 6
    .line 7
    new-instance v1, Ll/ols0;

    .line 8
    .line 9
    iget-object p0, p0, Ll/yms0;->a:Ll/bou0;

    .line 10
    .line 11
    invoke-direct {v1, p0, v0}, Ll/ols0;-><init>(Ll/bou0;Ljava/util/concurrent/Executor;)V

    .line 12
    .line 13
    .line 14
    return-object v1
.end method
