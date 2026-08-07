.class public final synthetic Ll/b7d0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/qcj;

.field public final synthetic b:Ll/y20;

.field public final synthetic c:Lcom/p1/mobile/putong/app/PutongAct;

.field public final synthetic d:Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;


# direct methods
.method public synthetic constructor <init>(Ll/qcj;Ll/y20;Lcom/p1/mobile/putong/app/PutongAct;Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/b7d0;->a:Ll/qcj;

    iput-object p2, p0, Ll/b7d0;->b:Ll/y20;

    iput-object p3, p0, Ll/b7d0;->c:Lcom/p1/mobile/putong/app/PutongAct;

    iput-object p4, p0, Ll/b7d0;->d:Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/b7d0;->a:Ll/qcj;

    iget-object v1, p0, Ll/b7d0;->b:Ll/y20;

    iget-object v2, p0, Ll/b7d0;->c:Lcom/p1/mobile/putong/app/PutongAct;

    iget-object p0, p0, Ll/b7d0;->d:Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {v0, v1, v2, p0, p1}, Ll/c7d0;->c0(Ll/qcj;Ll/y20;Lcom/p1/mobile/putong/app/PutongAct;Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;Ljava/lang/Throwable;)V

    return-void
.end method
