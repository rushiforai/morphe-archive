.class public final synthetic Ll/g030;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/l030;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;


# direct methods
.method public synthetic constructor <init>(Ll/l030;Lcom/p1/mobile/putong/core/data/CoreGiftInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/g030;->a:Ll/l030;

    iput-object p2, p0, Ll/g030;->b:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/g030;->a:Ll/l030;

    iget-object p0, p0, Ll/g030;->b:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    invoke-static {v0, p0}, Ll/l030;->e(Ll/l030;Lcom/p1/mobile/putong/core/data/CoreGiftInfo;)V

    return-void
.end method
