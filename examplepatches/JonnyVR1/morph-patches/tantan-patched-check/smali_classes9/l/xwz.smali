.class public final synthetic Ll/xwz;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/yxz;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

.field public final synthetic c:Ll/x20;

.field public final synthetic d:Z

.field public final synthetic e:Ljava/lang/String;

.field public final synthetic f:Z

.field public final synthetic g:Lcom/p1/mobile/putong/core/data/Message;


# direct methods
.method public synthetic constructor <init>(Ll/yxz;Lcom/p1/mobile/putong/core/data/CoreGiftInfo;Ll/x20;ZLjava/lang/String;ZLcom/p1/mobile/putong/core/data/Message;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xwz;->a:Ll/yxz;

    iput-object p2, p0, Ll/xwz;->b:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    iput-object p3, p0, Ll/xwz;->c:Ll/x20;

    iput-boolean p4, p0, Ll/xwz;->d:Z

    iput-object p5, p0, Ll/xwz;->e:Ljava/lang/String;

    iput-boolean p6, p0, Ll/xwz;->f:Z

    iput-object p7, p0, Ll/xwz;->g:Lcom/p1/mobile/putong/core/data/Message;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/xwz;->a:Ll/yxz;

    iget-object v1, p0, Ll/xwz;->b:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    iget-object v2, p0, Ll/xwz;->c:Ll/x20;

    iget-boolean v3, p0, Ll/xwz;->d:Z

    iget-object v4, p0, Ll/xwz;->e:Ljava/lang/String;

    iget-boolean v5, p0, Ll/xwz;->f:Z

    iget-object v6, p0, Ll/xwz;->g:Lcom/p1/mobile/putong/core/data/Message;

    invoke-static/range {v0 .. v6}, Ll/yxz;->p2(Ll/yxz;Lcom/p1/mobile/putong/core/data/CoreGiftInfo;Ll/x20;ZLjava/lang/String;ZLcom/p1/mobile/putong/core/data/Message;)V

    return-void
.end method
