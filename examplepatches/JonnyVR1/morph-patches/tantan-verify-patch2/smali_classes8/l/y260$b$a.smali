.class public Ll/y260$b$a;
.super Ll/gcg0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/y260$b;->h(Ljava/lang/Object;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/gcg0<",
        "TTClosing;>;"
    }
.end annotation


# instance fields
.field public final synthetic e:Ljava/util/List;

.field public final synthetic f:Ll/y260$b;


# direct methods
.method public constructor <init>(Ll/y260$b;Ljava/util/List;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/y260$b$a;->f:Ll/y260$b;

    .line 2
    .line 3
    iput-object p2, p0, Ll/y260$b$a;->e:Ljava/util/List;

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
    iget-object v0, p0, Ll/y260$b$a;->f:Ll/y260$b;

    .line 2
    .line 3
    iget-object v0, v0, Ll/y260$b;->h:Ll/ft5;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ll/ft5;->d(Ll/kcg0;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/y260$b$a;->f:Ll/y260$b;

    .line 9
    .line 10
    iget-object p0, p0, Ll/y260$b$a;->e:Ljava/util/List;

    .line 11
    .line 12
    invoke-virtual {v0, p0}, Ll/y260$b;->g(Ljava/util/List;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/y260$b$a;->f:Ll/y260$b;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/y260$b;->onError(Ljava/lang/Throwable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TTClosing;)V"
        }
    .end annotation

    .line 1
    iget-object p1, p0, Ll/y260$b$a;->f:Ll/y260$b;

    .line 2
    .line 3
    iget-object p1, p1, Ll/y260$b;->h:Ll/ft5;

    .line 4
    .line 5
    invoke-virtual {p1, p0}, Ll/ft5;->d(Ll/kcg0;)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Ll/y260$b$a;->f:Ll/y260$b;

    .line 9
    .line 10
    iget-object p0, p0, Ll/y260$b$a;->e:Ljava/util/List;

    .line 11
    .line 12
    invoke-virtual {p1, p0}, Ll/y260$b;->g(Ljava/util/List;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method
