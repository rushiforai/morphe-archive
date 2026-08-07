.class public final Ll/vyt0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/r9u0;

.field public final b:Ll/lcu0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/r9u0;Ll/lcu0;)V
    .locals 0
    .param p2    # Ll/lcu0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/vyt0;->a:Ll/r9u0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/vyt0;->b:Ll/lcu0;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final a()Ll/r9u0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vyt0;->a:Ll/r9u0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final b()Ll/lcu0;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/vyt0;->b:Ll/lcu0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final c()Ll/yfu0;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/vyt0;->b:Ll/lcu0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance p0, Ll/yfu0;

    .line 6
    .line 7
    sget-object v1, Ll/oct0;->f:Ll/xvw0;

    .line 8
    .line 9
    invoke-direct {p0, v0, v1}, Ll/yfu0;-><init>(Ljava/lang/Object;Ljava/util/concurrent/Executor;)V

    .line 10
    .line 11
    .line 12
    return-object p0

    .line 13
    :cond_0
    new-instance v0, Ll/yfu0;

    .line 14
    .line 15
    new-instance v1, Ll/uyt0;

    .line 16
    .line 17
    invoke-direct {v1, p0}, Ll/uyt0;-><init>(Ll/vyt0;)V

    .line 18
    .line 19
    .line 20
    sget-object p0, Ll/oct0;->f:Ll/xvw0;

    .line 21
    .line 22
    invoke-direct {v0, v1, p0}, Ll/yfu0;-><init>(Ljava/lang/Object;Ljava/util/concurrent/Executor;)V

    .line 23
    .line 24
    .line 25
    return-object v0
.end method
