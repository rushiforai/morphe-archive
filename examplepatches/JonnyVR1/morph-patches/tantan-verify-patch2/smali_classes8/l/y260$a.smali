.class public Ll/y260$a;
.super Ll/gcg0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/y260;->a(Ll/gcg0;)Ll/gcg0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/gcg0<",
        "TTOpening;>;"
    }
.end annotation


# instance fields
.field public final synthetic e:Ll/y260$b;

.field public final synthetic f:Ll/y260;


# direct methods
.method public constructor <init>(Ll/y260;Ll/y260$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/y260$a;->f:Ll/y260;

    .line 2
    .line 3
    iput-object p2, p0, Ll/y260$a;->e:Ll/y260$b;

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
    .locals 0

    .line 1
    iget-object p0, p0, Ll/y260$a;->e:Ll/y260$b;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/y260$b;->onCompleted()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/y260$a;->e:Ll/y260$b;

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
            "(TTOpening;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/y260$a;->e:Ll/y260$b;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/y260$b;->h(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
