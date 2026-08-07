.class public final synthetic Ll/id1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/profile/AudioSignatureCardPlayView;

.field public final synthetic b:Ljava/util/Random;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/profile/AudioSignatureCardPlayView;Ljava/util/Random;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/id1;->a:Lcom/p1/mobile/putong/core/newui/profile/AudioSignatureCardPlayView;

    iput-object p2, p0, Ll/id1;->b:Ljava/util/Random;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/id1;->a:Lcom/p1/mobile/putong/core/newui/profile/AudioSignatureCardPlayView;

    iget-object p0, p0, Ll/id1;->b:Ljava/util/Random;

    check-cast p1, Ljava/lang/Long;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/newui/profile/AudioSignatureCardPlayView;->p(Lcom/p1/mobile/putong/core/newui/profile/AudioSignatureCardPlayView;Ljava/util/Random;Ljava/lang/Long;)V

    return-void
.end method
