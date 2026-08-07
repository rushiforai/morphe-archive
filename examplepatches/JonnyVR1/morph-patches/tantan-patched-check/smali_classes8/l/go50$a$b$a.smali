.class public final Ll/go50$a$b$a;
.super Ll/gcg0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/go50$a$b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/gcg0<",
        "TTRightDuration;>;"
    }
.end annotation


# instance fields
.field public final e:I

.field public f:Z

.field public final synthetic g:Ll/go50$a$b;


# direct methods
.method public constructor <init>(Ll/go50$a$b;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/go50$a$b$a;->g:Ll/go50$a$b;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/gcg0;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x1

    .line 7
    iput-boolean p1, p0, Ll/go50$a$b$a;->f:Z

    .line 8
    .line 9
    iput p2, p0, Ll/go50$a$b$a;->e:I

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public onCompleted()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/go50$a$b$a;->f:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput-boolean v0, p0, Ll/go50$a$b$a;->f:Z

    .line 7
    .line 8
    iget-object v0, p0, Ll/go50$a$b$a;->g:Ll/go50$a$b;

    .line 9
    .line 10
    iget v1, p0, Ll/go50$a$b$a;->e:I

    .line 11
    .line 12
    invoke-virtual {v0, v1, p0}, Ll/go50$a$b;->g(ILl/kcg0;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/go50$a$b$a;->g:Ll/go50$a$b;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/go50$a$b;->onError(Ljava/lang/Throwable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TTRightDuration;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/go50$a$b$a;->onCompleted()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
