.class public abstract Ll/jk2;
.super Ll/mq2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<P::",
        "Lcom/google/protobuf/q;",
        "T:",
        "Ljava/lang/Object;",
        ">",
        "Ll/mq2<",
        "TP;>;"
    }
.end annotation


# instance fields
.field public f:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field public g:Ll/wbg0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/wbg0<",
            "TT;TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/wbg0;Ll/zod;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/wbg0<",
            "TT;TT;>;",
            "Ll/zod;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p2}, Ll/mq2;-><init>(Ll/zod;)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/jk2;->g:Ll/wbg0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/mq2;->c:Ll/zod;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public A(Ljava/lang/String;Lcom/google/protobuf/q;Ljava/lang/String;)Ll/jk2;
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/mq2;->y(Ljava/lang/String;Lcom/google/protobuf/q;Ljava/lang/String;)Ll/mq2;

    .line 2
    .line 3
    .line 4
    iget-object p3, p0, Ll/mq2;->b:Ljava/lang/Boolean;

    .line 5
    .line 6
    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 7
    .line 8
    .line 9
    move-result p3

    .line 10
    if-eqz p3, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0, p1, p2}, Ll/jk2;->z(Ljava/lang/String;Lcom/google/protobuf/q;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    iput-object p1, p0, Ll/jk2;->f:Ljava/lang/Object;

    .line 17
    .line 18
    :cond_0
    return-object p0
.end method

.method public v()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/mq2;->v()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/mq2;->b:Ljava/lang/Boolean;

    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Ll/jk2;->f:Ljava/lang/Object;

    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iget-object v1, p0, Ll/jk2;->g:Ll/wbg0;

    .line 17
    .line 18
    if-eqz v1, :cond_0

    .line 19
    .line 20
    invoke-interface {v1, v0}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    const/4 v0, 0x0

    .line 24
    iput-object v0, p0, Ll/jk2;->f:Ljava/lang/Object;

    .line 25
    .line 26
    return-void
.end method

.method public bridge synthetic y(Ljava/lang/String;Lcom/google/protobuf/q;Ljava/lang/String;)Ll/mq2;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/jk2;->A(Ljava/lang/String;Lcom/google/protobuf/q;Ljava/lang/String;)Ll/jk2;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public abstract z(Ljava/lang/String;Lcom/google/protobuf/q;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "TP;)TT;"
        }
    .end annotation
.end method
