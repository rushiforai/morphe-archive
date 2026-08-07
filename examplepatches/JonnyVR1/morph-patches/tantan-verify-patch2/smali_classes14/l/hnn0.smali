.class public Ll/hnn0;
.super Ll/d3q;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/d3q<",
        "Lcom/p1/mobile/putong/live/external/internal/virtualVoice/favoritevoice/VoiceInternalFavoriteItemView;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;

.field public final b:I


# direct methods
.method public constructor <init>(ILcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/d3q;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/hnn0;->b:I

    .line 5
    .line 6
    iput-object p2, p0, Ll/hnn0;->a:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public H()Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hnn0;->a:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;

    .line 2
    .line 3
    return-object p0
.end method

.method public I()I
    .locals 0

    .line 1
    iget p0, p0, Ll/hnn0;->b:I

    .line 2
    .line 3
    return p0
.end method

.method public J(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/favoritevoice/VoiceInternalFavoriteItemView;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->u(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/hnn0;->b:I

    .line 5
    .line 6
    iget-object p0, p0, Ll/hnn0;->a:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;

    .line 7
    .line 8
    invoke-virtual {p1, v0, p0}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/favoritevoice/VoiceInternalFavoriteItemView;->l0(ILcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/xec0;->X1:I

    .line 2
    .line 3
    return p0
.end method

.method public bridge synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/favoritevoice/VoiceInternalFavoriteItemView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/hnn0;->J(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/favoritevoice/VoiceInternalFavoriteItemView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
