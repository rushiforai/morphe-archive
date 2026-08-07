.class public Ll/y460$c$a;
.super Ll/gcg0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/y460$c;->g(J)V
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
.field public final synthetic e:Ll/y460$c;


# direct methods
.method public constructor <init>(Ll/y460$c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/y460$c$a;->e:Ll/y460$c;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/gcg0;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public f(Ll/vk90;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/y460$c$a;->e:Ll/y460$c;

    .line 2
    .line 3
    iget-object p0, p0, Ll/y460$c;->j:Ll/xk90;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/xk90;->c(Ll/vk90;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public onCompleted()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/y460$c$a;->e:Ll/y460$c;

    .line 2
    .line 3
    iget-object p0, p0, Ll/y460$c;->f:Ll/are0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/are0;->onCompleted()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/y460$c$a;->e:Ll/y460$c;

    .line 2
    .line 3
    iget-object p0, p0, Ll/y460$c;->f:Ll/are0;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/are0;->onError(Ljava/lang/Throwable;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/y460$c$a;->e:Ll/y460$c;

    .line 2
    .line 3
    iget-object p0, p0, Ll/y460$c;->f:Ll/are0;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/are0;->onNext(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
