.class public final synthetic Ll/vaw;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/LoveBuzzNotifyUserPop;

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/LoveBuzzNotifyUserPop;Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vaw;->a:Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/LoveBuzzNotifyUserPop;

    iput-object p2, p0, Ll/vaw;->b:Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/vaw;->a:Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/LoveBuzzNotifyUserPop;

    iget-object p0, p0, Ll/vaw;->b:Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/LoveBuzzNotifyUserPop;->c(Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/LoveBuzzNotifyUserPop;Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;)V

    return-void
.end method
