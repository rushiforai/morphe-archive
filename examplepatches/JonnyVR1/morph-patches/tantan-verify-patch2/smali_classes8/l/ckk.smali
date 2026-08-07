.class public final synthetic Ll/ckk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/ikk;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/ChatGroup;


# direct methods
.method public synthetic constructor <init>(Ll/ikk;Lcom/p1/mobile/putong/core/data/ChatGroup;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ckk;->a:Ll/ikk;

    iput-object p2, p0, Ll/ckk;->b:Lcom/p1/mobile/putong/core/data/ChatGroup;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ckk;->a:Ll/ikk;

    iget-object p0, p0, Ll/ckk;->b:Lcom/p1/mobile/putong/core/data/ChatGroup;

    check-cast p1, Ll/uxj0;

    invoke-static {v0, p0, p1}, Ll/ikk;->o0(Ll/ikk;Lcom/p1/mobile/putong/core/data/ChatGroup;Ll/uxj0;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method
