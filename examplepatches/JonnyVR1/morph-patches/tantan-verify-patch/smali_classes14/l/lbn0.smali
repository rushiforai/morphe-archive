.class public final synthetic Ll/lbn0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/mbn0;

.field public final synthetic b:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/LiveVoiceInternalEntryBean;


# direct methods
.method public synthetic constructor <init>(Ll/mbn0;Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/LiveVoiceInternalEntryBean;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lbn0;->a:Ll/mbn0;

    iput-object p2, p0, Ll/lbn0;->b:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/LiveVoiceInternalEntryBean;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/lbn0;->a:Ll/mbn0;

    iget-object p0, p0, Ll/lbn0;->b:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/LiveVoiceInternalEntryBean;

    check-cast p1, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;

    invoke-static {v0, p0, p1}, Ll/mbn0;->f0(Ll/mbn0;Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/LiveVoiceInternalEntryBean;Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;)V

    return-void
.end method
