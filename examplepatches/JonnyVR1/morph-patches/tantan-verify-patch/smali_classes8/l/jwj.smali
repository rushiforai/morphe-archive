.class public final synthetic Ll/jwj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/owj;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;


# direct methods
.method public synthetic constructor <init>(Ll/owj;Lcom/p1/mobile/putong/core/data/CoreGiftInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jwj;->a:Ll/owj;

    iput-object p2, p0, Ll/jwj;->b:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jwj;->a:Ll/owj;

    iget-object p0, p0, Ll/jwj;->b:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    invoke-static {v0, p0}, Ll/owj;->e(Ll/owj;Lcom/p1/mobile/putong/core/data/CoreGiftInfo;)V

    return-void
.end method
