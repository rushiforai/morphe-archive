.class public final synthetic Ll/zxz;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/qzz;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/Message;

.field public final synthetic c:Z

.field public final synthetic d:Lcom/p1/mobile/putong/core/data/Sticker;


# direct methods
.method public synthetic constructor <init>(Ll/qzz;Lcom/p1/mobile/putong/core/data/Message;ZLcom/p1/mobile/putong/core/data/Sticker;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zxz;->a:Ll/qzz;

    iput-object p2, p0, Ll/zxz;->b:Lcom/p1/mobile/putong/core/data/Message;

    iput-boolean p3, p0, Ll/zxz;->c:Z

    iput-object p4, p0, Ll/zxz;->d:Lcom/p1/mobile/putong/core/data/Sticker;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/zxz;->a:Ll/qzz;

    iget-object v1, p0, Ll/zxz;->b:Lcom/p1/mobile/putong/core/data/Message;

    iget-boolean v2, p0, Ll/zxz;->c:Z

    iget-object p0, p0, Ll/zxz;->d:Lcom/p1/mobile/putong/core/data/Sticker;

    invoke-static {v0, v1, v2, p0}, Ll/qzz;->U(Ll/qzz;Lcom/p1/mobile/putong/core/data/Message;ZLcom/p1/mobile/putong/core/data/Sticker;)V

    return-void
.end method
