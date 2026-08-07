.class public Ll/sni0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<TResult:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field public final a:Ll/m1z0;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ll/m1z0;

    invoke-direct {v0}, Ll/m1z0;-><init>()V

    iput-object v0, p0, Ll/sni0;->a:Ll/m1z0;

    return-void
.end method

.method public constructor <init>(Ll/gg4;)V
    .locals 1
    .param p1    # Ll/gg4;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

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
    iput-object v0, p0, Ll/sni0;->a:Ll/m1z0;

    .line 10
    .line 11
    new-instance v0, Ll/muy0;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Ll/muy0;-><init>(Ll/sni0;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1, v0}, Ll/gg4;->b(Ll/yo50;)Ll/gg4;

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public static bridge synthetic f(Ll/sni0;)Ll/m1z0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sni0;->a:Ll/m1z0;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public a()Lcom/google/android/gms/tasks/Task;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/android/gms/tasks/Task<",
            "TTResult;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/sni0;->a:Ll/m1z0;

    .line 2
    .line 3
    return-object p0
.end method

.method public b(Ljava/lang/Exception;)V
    .locals 0
    .param p1    # Ljava/lang/Exception;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Ll/sni0;->a:Ll/m1z0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/m1z0;->s(Ljava/lang/Exception;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public c(Ljava/lang/Object;)V
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TTResult;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/sni0;->a:Ll/m1z0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/m1z0;->t(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public d(Ljava/lang/Exception;)Z
    .locals 0
    .param p1    # Ljava/lang/Exception;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Ll/sni0;->a:Ll/m1z0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/m1z0;->v(Ljava/lang/Exception;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public e(Ljava/lang/Object;)Z
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TTResult;)Z"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/sni0;->a:Ll/m1z0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/m1z0;->w(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
