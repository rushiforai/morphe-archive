.class public final synthetic Ll/inn0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/favoritevoice/VoiceInternalFavoriteItemView;

.field public final synthetic b:I

.field public final synthetic c:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/favoritevoice/VoiceInternalFavoriteItemView;ILcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/inn0;->a:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/favoritevoice/VoiceInternalFavoriteItemView;

    iput p2, p0, Ll/inn0;->b:I

    iput-object p3, p0, Ll/inn0;->c:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/inn0;->a:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/favoritevoice/VoiceInternalFavoriteItemView;

    iget v1, p0, Ll/inn0;->b:I

    iget-object p0, p0, Ll/inn0;->c:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/favoritevoice/VoiceInternalFavoriteItemView;->h0(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/favoritevoice/VoiceInternalFavoriteItemView;ILcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;Landroid/view/View;)V

    return-void
.end method
