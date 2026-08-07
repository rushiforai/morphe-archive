.class public final synthetic Ll/nd1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/profile/AudioSignatureView;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/profile/AudioSignatureView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nd1;->a:Lcom/p1/mobile/putong/core/newui/profile/AudioSignatureView;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nd1;->a:Lcom/p1/mobile/putong/core/newui/profile/AudioSignatureView;

    check-cast p1, Lcom/p1/mobile/android/media/AudioPlayer$State;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/newui/profile/AudioSignatureView;->a(Lcom/p1/mobile/putong/core/newui/profile/AudioSignatureView;Lcom/p1/mobile/android/media/AudioPlayer$State;)V

    return-void
.end method
