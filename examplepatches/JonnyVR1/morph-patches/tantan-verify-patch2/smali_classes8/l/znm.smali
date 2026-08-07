.class public final synthetic Ll/znm;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/SwipeDirection;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;Lcom/p1/mobile/putong/core/data/SwipeDirection;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/znm;->a:Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;

    iput-object p2, p0, Ll/znm;->b:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/znm;->a:Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;

    iget-object p0, p0, Ll/znm;->b:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    check-cast p1, Ll/uxj0;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;->b(Lcom/p1/mobile/putong/core/ui/impresssignal/ImpressSignalCardNewUIView;Lcom/p1/mobile/putong/core/data/SwipeDirection;Ll/uxj0;)V

    return-void
.end method
