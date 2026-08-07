.class public Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareMenuBean;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final BUTTON_CREATE_TYPE:I = 0x0

.field public static final BUTTON_RANDOM_ENTER_TYPE:I = 0x1


# instance fields
.field private buttonIconUrl:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "buttonIconUrl"
    .end annotation
.end field

.field private buttonName:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "buttonName"
    .end annotation
.end field

.field private buttonType:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "buttonType"
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public getButtonIconUrl()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareMenuBean;->buttonIconUrl:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getButtonName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareMenuBean;->buttonName:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getButtonType()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareMenuBean;->buttonType:I

    .line 2
    .line 3
    return p0
.end method

.method public setButtonIconUrl(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareMenuBean;->buttonIconUrl:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setButtonName(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareMenuBean;->buttonName:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setButtonType(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareMenuBean;->buttonType:I

    .line 2
    .line 3
    return-void
.end method
