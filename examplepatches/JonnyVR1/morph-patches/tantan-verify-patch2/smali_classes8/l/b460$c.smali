.class public Ll/b460$c;
.super Ll/gcg0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/b460;->a(Ll/gcg0;)Ll/gcg0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/gcg0<",
        "TT;>;"
    }
.end annotation


# instance fields
.field public e:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TR;"
        }
    .end annotation
.end field

.field public final synthetic f:Ljava/lang/Object;

.field public final synthetic g:Ll/b460$d;

.field public final synthetic h:Ll/b460;


# direct methods
.method public constructor <init>(Ll/b460;Ljava/lang/Object;Ll/b460$d;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/b460$c;->h:Ll/b460;

    .line 2
    .line 3
    iput-object p2, p0, Ll/b460$c;->f:Ljava/lang/Object;

    .line 4
    .line 5
    iput-object p3, p0, Ll/b460$c;->g:Ll/b460$d;

    .line 6
    .line 7
    invoke-direct {p0}, Ll/gcg0;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object p2, p0, Ll/b460$c;->e:Ljava/lang/Object;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public f(Ll/vk90;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b460$c;->g:Ll/b460$d;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/b460$d;->d(Ll/vk90;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onCompleted()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b460$c;->g:Ll/b460$d;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/b460$d;->onCompleted()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b460$c;->g:Ll/b460$d;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/b460$d;->onError(Ljava/lang/Throwable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/b460$c;->e:Ljava/lang/Object;

    .line 2
    .line 3
    :try_start_0
    iget-object v1, p0, Ll/b460$c;->h:Ll/b460;

    .line 4
    .line 5
    iget-object v1, v1, Ll/b460;->b:Ll/rcj;

    .line 6
    .line 7
    invoke-interface {v1, v0, p1}, Ll/rcj;->call(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 11
    iput-object p1, p0, Ll/b460$c;->e:Ljava/lang/Object;

    .line 12
    .line 13
    iget-object p0, p0, Ll/b460$c;->g:Ll/b460$d;

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Ll/b460$d;->onNext(Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :catchall_0
    move-exception v0

    .line 20
    invoke-static {v0, p0, p1}, Ll/j6f;->g(Ljava/lang/Throwable;Ll/bb50;Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method
