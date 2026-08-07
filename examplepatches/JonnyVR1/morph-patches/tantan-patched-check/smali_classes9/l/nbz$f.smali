.class public Ll/nbz$f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/nbz;->r2(Ljava/util/ArrayList;Ll/clz;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/clz;


# direct methods
.method public constructor <init>(Ll/clz;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/nbz$f;->a:Ll/clz;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public call()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/nbz$f;->a:Ll/clz;

    .line 2
    .line 3
    iget-object v0, v0, Ll/clz;->r:Ll/vg60;

    .line 4
    .line 5
    iget-object v0, v0, Ll/vg60;->a:Ljava/util/List;

    .line 6
    .line 7
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    add-int/lit8 v1, v1, -0x1

    .line 12
    .line 13
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lcom/p1/mobile/putong/core/data/Message;

    .line 18
    .line 19
    iget-object p0, p0, Ll/nbz$f;->a:Ll/clz;

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/clz;->r3()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/Message;->clone()Lcom/p1/mobile/putong/core/data/Message;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    const/4 v1, 0x0

    .line 30
    invoke-static {v1, p0, v0}, Ll/nbz;->j2(ZLjava/lang/String;Lcom/p1/mobile/putong/core/data/Message;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method
