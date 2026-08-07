.class public Ll/nbz$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/nbz;->u2(Ll/clz;)Ljava/util/ArrayList;
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
    iput-object p1, p0, Ll/nbz$b;->a:Ll/clz;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/clz;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/clz;->c:Ljava/lang/String;

    .line 2
    .line 3
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 4
    .line 5
    const-string p0, "\u54c8\u54c8\u54c8\u54c8\u54c8\u554a\u54c8\u54c8\u54c8\u54c8\u54c8\u54c8\u54c8\u554a"

    .line 6
    .line 7
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 8
    .line 9
    return-void
.end method

.method public static synthetic b(Ll/clz;)V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    iget-object v1, p0, Ll/clz;->c:Ljava/lang/String;

    .line 6
    .line 7
    const-string v2, "hide_for_fake_user"

    .line 8
    .line 9
    invoke-static {v2}, Lcom/p1/mobile/putong/core/data/MessageType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MessageType;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    new-instance v3, Ll/pbz;

    .line 14
    .line 15
    invoke-direct {v3, p0}, Ll/pbz;-><init>(Ll/clz;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1, v2, v3}, Lcom/p1/mobile/putong/core/api/g;->ch(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/MessageType;Ll/y20;)Lrx/c;

    .line 19
    .line 20
    .line 21
    return-void
.end method


# virtual methods
.method public call()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/nbz$b;->a:Ll/clz;

    .line 2
    .line 3
    new-instance v0, Ll/obz;

    .line 4
    .line 5
    invoke-direct {v0, p0}, Ll/obz;-><init>(Ll/clz;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
