.class public Landroidx/loader/app/LoaderManagerImpl$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/cb50;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/loader/app/LoaderManagerImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<D:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ll/cb50<",
        "TD;>;"
    }
.end annotation


# instance fields
.field public final a:Ll/utv;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/utv<",
            "TD;>;"
        }
    .end annotation
.end field

.field public final b:Landroidx/loader/app/a$a;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/loader/app/a$a<",
            "TD;>;"
        }
    .end annotation
.end field

.field public c:Z


# direct methods
.method public constructor <init>(Ll/utv;Landroidx/loader/app/a$a;)V
    .locals 1
    .param p1    # Ll/utv;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroidx/loader/app/a$a;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/utv<",
            "TD;>;",
            "Landroidx/loader/app/a$a<",
            "TD;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Landroidx/loader/app/LoaderManagerImpl$b;->c:Z

    .line 6
    .line 7
    iput-object p1, p0, Landroidx/loader/app/LoaderManagerImpl$b;->a:Ll/utv;

    .line 8
    .line 9
    iput-object p2, p0, Landroidx/loader/app/LoaderManagerImpl$b;->b:Landroidx/loader/app/a$a;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;Ljava/io/PrintWriter;)V
    .locals 0

    .line 1
    invoke-virtual {p2, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    const-string p1, "mDeliveredData="

    .line 5
    .line 6
    invoke-virtual {p2, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    iget-boolean p0, p0, Landroidx/loader/app/LoaderManagerImpl$b;->c:Z

    .line 10
    .line 11
    invoke-virtual {p2, p0}, Ljava/io/PrintWriter;->println(Z)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public b()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Landroidx/loader/app/LoaderManagerImpl$b;->c:Z

    .line 2
    .line 3
    return p0
.end method

.method public c()V
    .locals 1
    .annotation build Landroidx/annotation/MainThread;
    .end annotation

    .line 1
    iget-boolean v0, p0, Landroidx/loader/app/LoaderManagerImpl$b;->c:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    sget-boolean v0, Landroidx/loader/app/LoaderManagerImpl;->c:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Landroidx/loader/app/LoaderManagerImpl$b;->a:Ll/utv;

    .line 10
    .line 11
    invoke-static {v0}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Landroidx/loader/app/LoaderManagerImpl$b;->b:Landroidx/loader/app/a$a;

    .line 15
    .line 16
    iget-object p0, p0, Landroidx/loader/app/LoaderManagerImpl$b;->a:Ll/utv;

    .line 17
    .line 18
    invoke-interface {v0, p0}, Landroidx/loader/app/a$a;->c(Ll/utv;)V

    .line 19
    .line 20
    .line 21
    :cond_1
    return-void
.end method

.method public onChanged(Ljava/lang/Object;)V
    .locals 2
    .param p1    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TD;)V"
        }
    .end annotation

    .line 1
    sget-boolean v0, Landroidx/loader/app/LoaderManagerImpl;->c:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Landroidx/loader/app/LoaderManagerImpl$b;->a:Ll/utv;

    .line 6
    .line 7
    invoke-static {v0}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Landroidx/loader/app/LoaderManagerImpl$b;->a:Ll/utv;

    .line 11
    .line 12
    invoke-virtual {v0, p1}, Ll/utv;->d(Ljava/lang/Object;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    :cond_0
    iget-object v0, p0, Landroidx/loader/app/LoaderManagerImpl$b;->b:Landroidx/loader/app/a$a;

    .line 16
    .line 17
    iget-object v1, p0, Landroidx/loader/app/LoaderManagerImpl$b;->a:Ll/utv;

    .line 18
    .line 19
    invoke-interface {v0, v1, p1}, Landroidx/loader/app/a$a;->b(Ll/utv;Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    const/4 p1, 0x1

    .line 23
    iput-boolean p1, p0, Landroidx/loader/app/LoaderManagerImpl$b;->c:Z

    .line 24
    .line 25
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/loader/app/LoaderManagerImpl$b;->b:Landroidx/loader/app/a$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
