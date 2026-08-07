.class public final synthetic Ll/igp0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/virtual/preview/VoiceVirtualPreviewPresenter;

.field public final synthetic b:Ll/dum;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/virtual/preview/VoiceVirtualPreviewPresenter;Ll/dum;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/igp0;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/preview/VoiceVirtualPreviewPresenter;

    iput-object p2, p0, Ll/igp0;->b:Ll/dum;

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/igp0;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/preview/VoiceVirtualPreviewPresenter;

    iget-object p0, p0, Ll/igp0;->b:Ll/dum;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/preview/VoiceVirtualPreviewPresenter;->U3(Lcom/p1/mobile/putong/live/livingroom/virtual/preview/VoiceVirtualPreviewPresenter;Ll/dum;)Ll/acp0;

    move-result-object p0

    return-object p0
.end method
