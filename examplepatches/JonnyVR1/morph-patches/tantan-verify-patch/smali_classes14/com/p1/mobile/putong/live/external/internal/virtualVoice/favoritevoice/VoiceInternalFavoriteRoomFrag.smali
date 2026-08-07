.class public Lcom/p1/mobile/putong/live/external/internal/virtualVoice/favoritevoice/VoiceInternalFavoriteRoomFrag;
.super Lcom/p1/mobile/putong/live/external/module/arch/LiveBaseFrag;
.source "SourceFile"


# instance fields
.field public A:Ll/lnn0;

.field public z:Ll/onn0;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/module/arch/LiveBaseFrag;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static M4()Lcom/p1/mobile/putong/live/external/internal/virtualVoice/favoritevoice/VoiceInternalFavoriteRoomFrag;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/favoritevoice/VoiceInternalFavoriteRoomFrag;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/favoritevoice/VoiceInternalFavoriteRoomFrag;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public d4()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->d4()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/onn0;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/onn0;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/favoritevoice/VoiceInternalFavoriteRoomFrag;->z:Ll/onn0;

    .line 10
    .line 11
    new-instance v0, Ll/lnn0;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-direct {v0, v1}, Ll/lnn0;-><init>(Ll/ner;)V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/favoritevoice/VoiceInternalFavoriteRoomFrag;->A:Ll/lnn0;

    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/favoritevoice/VoiceInternalFavoriteRoomFrag;->z:Ll/onn0;

    .line 23
    .line 24
    invoke-virtual {v0, p0}, Ll/ar2;->C(Ll/iam;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public disableAutoPV()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public f4()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->f4()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/favoritevoice/VoiceInternalFavoriteRoomFrag;->A:Ll/lnn0;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/ar2;->a0()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public g4(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/android/app/Frag;->g4(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/favoritevoice/VoiceInternalFavoriteRoomFrag;->z:Ll/onn0;

    .line 5
    .line 6
    invoke-virtual {p1}, Ll/onn0;->f()V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/favoritevoice/VoiceInternalFavoriteRoomFrag;->A:Ll/lnn0;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/lnn0;->h0()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/favoritevoice/VoiceInternalFavoriteRoomFrag;->z:Ll/onn0;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/onn0;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    sget-object p0, Ll/zeu;->g:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
