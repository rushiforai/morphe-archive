.class public Ll/ekj0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/j7m;


# direct methods
.method public constructor <init>(Ll/j7m;)V
    .locals 0
    .param p1    # Ll/j7m;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/ekj0;->a:Ll/j7m;

    .line 5
    .line 6
    return-void
.end method

.method public static a(Landroid/os/IBinder;)Ll/ekj0;
    .locals 1
    .param p0    # Landroid/os/IBinder;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p0, :cond_0

    .line 3
    .line 4
    move-object p0, v0

    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-static {p0}, Ll/j7m$a;->O(Landroid/os/IBinder;)Ll/j7m;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    :goto_0
    if-nez p0, :cond_1

    .line 11
    .line 12
    return-object v0

    .line 13
    :cond_1
    new-instance v0, Ll/ekj0;

    .line 14
    .line 15
    invoke-direct {v0, p0}, Ll/ekj0;-><init>(Ll/j7m;)V

    .line 16
    .line 17
    .line 18
    return-object v0
.end method
