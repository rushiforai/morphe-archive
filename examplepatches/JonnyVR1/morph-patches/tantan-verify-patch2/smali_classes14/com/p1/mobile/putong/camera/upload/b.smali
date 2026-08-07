.class public Lcom/p1/mobile/putong/camera/upload/b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/camera/upload/b$b;,
        Lcom/p1/mobile/putong/camera/upload/b$a;
    }
.end annotation


# instance fields
.field public a:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Lcom/p1/mobile/putong/camera/upload/b$b;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Lcom/p1/mobile/putong/camera/upload/b;->a:Lrx/subjects/b;

    .line 9
    .line 10
    return-void
.end method

.method public static a()Lcom/p1/mobile/putong/camera/upload/b;
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/camera/upload/b$a;->a()Lcom/p1/mobile/putong/camera/upload/b;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method


# virtual methods
.method public b()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/camera/upload/b$b;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/camera/upload/b;->a:Lrx/subjects/b;

    .line 2
    .line 3
    invoke-virtual {p0}, Lrx/c;->asObservable()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public c(Lcom/p1/mobile/putong/camera/upload/b$b;)V
    .locals 2

    .line 1
    const-string v0, "[TTCamera]"

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/camera/upload/b$b;->toString()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-static {v0, v1}, Ll/du2;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/camera/upload/b;->a:Lrx/subjects/b;

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method
