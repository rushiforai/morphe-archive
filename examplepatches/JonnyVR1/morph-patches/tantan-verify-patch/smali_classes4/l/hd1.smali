.class public final synthetic Ll/hd1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/profile/AudioSignatureCardPlayView;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/profile/AudioSignatureCardPlayView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hd1;->a:Lcom/p1/mobile/putong/core/newui/profile/AudioSignatureCardPlayView;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hd1;->a:Lcom/p1/mobile/putong/core/newui/profile/AudioSignatureCardPlayView;

    check-cast p1, Lcom/p1/mobile/android/media/AudioPlayer$State;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/newui/profile/AudioSignatureCardPlayView;->q(Lcom/p1/mobile/putong/core/newui/profile/AudioSignatureCardPlayView;Lcom/p1/mobile/android/media/AudioPlayer$State;)V

    return-void
.end method
