.class public Ll/co50$a;
.super Ll/gcg0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/co50;->a(Ll/gcg0;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/gcg0<",
        "TU;>;"
    }
.end annotation


# instance fields
.field public final synthetic e:Ll/gcg0;

.field public final synthetic f:Ll/co50;


# direct methods
.method public constructor <init>(Ll/co50;Ll/gcg0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/co50$a;->f:Ll/co50;

    .line 2
    .line 3
    iput-object p2, p0, Ll/co50$a;->e:Ll/gcg0;

    .line 4
    .line 5
    invoke-direct {p0}, Ll/gcg0;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onCompleted()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/co50$a;->f:Ll/co50;

    .line 2
    .line 3
    iget-object v0, v0, Ll/co50;->a:Lrx/c;

    .line 4
    .line 5
    iget-object p0, p0, Ll/co50$a;->e:Ll/gcg0;

    .line 6
    .line 7
    invoke-static {p0}, Ll/icg0;->c(Ll/gcg0;)Ll/gcg0;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {v0, p0}, Lrx/c;->unsafeSubscribe(Ll/gcg0;)Ll/kcg0;

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/co50$a;->e:Ll/gcg0;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TU;)V"
        }
    .end annotation

    .line 1
    return-void
.end method
