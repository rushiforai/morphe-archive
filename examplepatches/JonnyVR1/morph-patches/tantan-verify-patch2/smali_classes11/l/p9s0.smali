.class public final Ll/p9s0;
.super Ll/gg4;
.source "SourceFile"


# instance fields
.field public final a:Ll/m1z0;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/gg4;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/m1z0;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/m1z0;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/p9s0;->a:Ll/m1z0;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public final a()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p9s0;->a:Ll/m1z0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/m1z0;->o()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final b(Ll/yo50;)Ll/gg4;
    .locals 2
    .param p1    # Ll/yo50;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    new-instance v0, Ll/aar0;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/aar0;-><init>(Ll/p9s0;Ll/yo50;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Ll/p9s0;->a:Ll/m1z0;

    .line 7
    .line 8
    sget-object v1, Ll/boi0;->a:Ljava/util/concurrent/Executor;

    .line 9
    .line 10
    invoke-virtual {p1, v1, v0}, Ll/m1z0;->e(Ljava/util/concurrent/Executor;Ll/to50;)Lcom/google/android/gms/tasks/Task;

    .line 11
    .line 12
    .line 13
    return-object p0
.end method

.method public final c()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/p9s0;->a:Ll/m1z0;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, v0}, Ll/m1z0;->w(Ljava/lang/Object;)Z

    .line 5
    .line 6
    .line 7
    return-void
.end method
