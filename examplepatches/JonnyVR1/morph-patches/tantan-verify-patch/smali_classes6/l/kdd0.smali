.class public final synthetic Ll/kdd0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/base/view/RollAnimView;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/view/RollItemView;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/base/view/RollAnimView;Lcom/p1/mobile/putong/live/base/view/RollItemView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kdd0;->a:Lcom/p1/mobile/putong/live/base/view/RollAnimView;

    iput-object p2, p0, Ll/kdd0;->b:Lcom/p1/mobile/putong/live/base/view/RollItemView;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/kdd0;->a:Lcom/p1/mobile/putong/live/base/view/RollAnimView;

    iget-object p0, p0, Ll/kdd0;->b:Lcom/p1/mobile/putong/live/base/view/RollItemView;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->p(Lcom/p1/mobile/putong/live/base/view/RollAnimView;Lcom/p1/mobile/putong/live/base/view/RollItemView;)V

    return-void
.end method
