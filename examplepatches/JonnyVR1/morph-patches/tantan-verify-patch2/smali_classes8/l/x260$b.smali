.class public Ll/x260$b;
.super Ll/gcg0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/x260;->a(Ll/gcg0;)Ll/gcg0;
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
.field public final synthetic e:Ll/x260$c;

.field public final synthetic f:Ll/x260;


# direct methods
.method public constructor <init>(Ll/x260;Ll/x260$c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/x260$b;->f:Ll/x260;

    .line 2
    .line 3
    iput-object p2, p0, Ll/x260$b;->e:Ll/x260$c;

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
    iget-object p0, p0, Ll/x260$b;->e:Ll/x260$c;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/x260$c;->onCompleted()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/x260$b;->e:Ll/x260$c;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/x260$c;->onError(Ljava/lang/Throwable;)V

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
    iget-object p0, p0, Ll/x260$b;->e:Ll/x260$c;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/x260$c;->g()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
