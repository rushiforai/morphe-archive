.class public final enum Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "KeyboardModel"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;

.field public static final enum EMOJI:Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;

.field public static final enum INPUT:Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;

.field public static final enum NONE:Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;


# direct methods
.method private static synthetic $values()[Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;->NONE:Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;->INPUT:Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;

    .line 4
    .line 5
    sget-object v2, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;->EMOJI:Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;

    .line 6
    .line 7
    filled-new-array {v0, v1, v2}, [Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;

    .line 2
    .line 3
    const-string v1, "NONE"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2}, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;-><init>(Ljava/lang/String;I)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;->NONE:Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;

    .line 10
    .line 11
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;

    .line 12
    .line 13
    const-string v1, "INPUT"

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    invoke-direct {v0, v1, v2}, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;-><init>(Ljava/lang/String;I)V

    .line 17
    .line 18
    .line 19
    sput-object v0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;->INPUT:Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;

    .line 20
    .line 21
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;

    .line 22
    .line 23
    const-string v1, "EMOJI"

    .line 24
    .line 25
    const/4 v2, 0x2

    .line 26
    invoke-direct {v0, v1, v2}, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;-><init>(Ljava/lang/String;I)V

    .line 27
    .line 28
    .line 29
    sput-object v0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;->EMOJI:Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;

    .line 30
    .line 31
    invoke-static {}, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;->$values()[Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    sput-object v0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;->$VALUES:[Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;

    .line 36
    .line 37
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;
    .locals 1

    .line 1
    const-class v0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;->$VALUES:[Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;

    .line 8
    .line 9
    return-object v0
.end method
