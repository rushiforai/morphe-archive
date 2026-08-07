.class public Ll/lgo0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/aiv$a$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/lgo0;->p4(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuideV2PopUp;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuideV2PopUp;

.field public final synthetic b:Ll/lgo0;


# direct methods
.method public constructor <init>(Ll/lgo0;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuideV2PopUp;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/lgo0$a;->b:Ll/lgo0;

    .line 2
    .line 3
    iput-object p2, p0, Ll/lgo0$a;->a:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuideV2PopUp;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lgo0$a;->a:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuideV2PopUp;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoicePayGuideV2PopUp;->getRelationshipType()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string p1, "stranger"

    .line 8
    .line 9
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    const-string p0, "\u597d\u53cb\u7533\u8bf7\u5df2\u53d1\u51fa"

    .line 16
    .line 17
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public b()V
    .locals 0

    .line 1
    return-void
.end method

.method public c()V
    .locals 0

    .line 1
    return-void
.end method
