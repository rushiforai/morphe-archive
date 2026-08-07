.class public final synthetic Ll/o40;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/q40;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/apibean/LiveSquareActiveGiftBean;


# direct methods
.method public synthetic constructor <init>(Ll/q40;Lcom/p1/mobile/putong/live/base/apibean/LiveSquareActiveGiftBean;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/o40;->a:Ll/q40;

    iput-object p2, p0, Ll/o40;->b:Lcom/p1/mobile/putong/live/base/apibean/LiveSquareActiveGiftBean;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/o40;->a:Ll/q40;

    iget-object p0, p0, Ll/o40;->b:Lcom/p1/mobile/putong/live/base/apibean/LiveSquareActiveGiftBean;

    invoke-static {v0, p0}, Ll/q40;->V2(Ll/q40;Lcom/p1/mobile/putong/live/base/apibean/LiveSquareActiveGiftBean;)V

    return-void
.end method
