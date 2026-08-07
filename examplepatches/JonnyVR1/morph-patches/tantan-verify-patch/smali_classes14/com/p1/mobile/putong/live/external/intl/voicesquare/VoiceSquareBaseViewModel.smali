.class public abstract Lcom/p1/mobile/putong/live/external/intl/voicesquare/VoiceSquareBaseViewModel;
.super Lcom/p1/mobile/putong/live/external/intl/voicesquare/base/LiveBaseQuickChatPageView;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000*\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\t\u0008&\u0018\u00002\u00020\u0001B!\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\u0008\u0008\u0002\u0010\u0007\u001a\u00020\u0006\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\u0015\u0010\r\u001a\u00020\u000c2\u0006\u0010\u000b\u001a\u00020\n\u00a2\u0006\u0004\u0008\r\u0010\u000eR\"\u0010\u0007\u001a\u00020\u00068\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008\u000f\u0010\u0010\u001a\u0004\u0008\u0011\u0010\u0012\"\u0004\u0008\u0013\u0010\u0014\u00a8\u0006\u0015"
    }
    d2 = {
        "Lcom/p1/mobile/putong/live/external/intl/voicesquare/VoiceSquareBaseViewModel;",
        "Lcom/p1/mobile/putong/live/external/intl/voicesquare/base/LiveBaseQuickChatPageView;",
        "Landroid/content/Context;",
        "context",
        "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTab;",
        "voiceTab",
        "",
        "isWhiteTheme",
        "<init>",
        "(Landroid/content/Context;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTab;Z)V",
        "Lcom/p1/mobile/putong/live/base/view/EmptyView;",
        "emptyView",
        "",
        "a",
        "(Lcom/p1/mobile/putong/live/base/view/EmptyView;)V",
        "g",
        "Z",
        "b",
        "()Z",
        "setWhiteTheme",
        "(Z)V",
        "external_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public g:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTab;Z)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTab;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/live/external/intl/voicesquare/base/LiveBaseQuickChatPageView;-><init>(Landroid/content/Context;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTab;)V

    .line 8
    .line 9
    .line 10
    iput-boolean p3, p0, Lcom/p1/mobile/putong/live/external/intl/voicesquare/VoiceSquareBaseViewModel;->g:Z

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final a(Lcom/p1/mobile/putong/live/base/view/EmptyView;)V
    .locals 2
    .param p1    # Lcom/p1/mobile/putong/live/base/view/EmptyView;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    sget v0, Lcom/p1/mobile/putong/live/external/R$string;->C0:I

    .line 5
    .line 6
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/base/view/EmptyView;->e(I)Lcom/p1/mobile/putong/live/base/view/EmptyView;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/external/intl/voicesquare/VoiceSquareBaseViewModel;->g:Z

    .line 11
    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    sget v1, Ll/nbc0;->Q0:I

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    sget v1, Ll/nbc0;->P0:I

    .line 18
    .line 19
    :goto_0
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/base/view/EmptyView;->b(I)Lcom/p1/mobile/putong/live/base/view/EmptyView;

    .line 20
    .line 21
    .line 22
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/view/EmptyView;->b:Landroid/widget/TextView;

    .line 23
    .line 24
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/external/intl/voicesquare/VoiceSquareBaseViewModel;->g:Z

    .line 25
    .line 26
    if-eqz p0, :cond_1

    .line 27
    .line 28
    sget p0, Ll/m9c0;->g:I

    .line 29
    .line 30
    goto :goto_1

    .line 31
    :cond_1
    sget p0, Ll/m9c0;->A:I

    .line 32
    .line 33
    :goto_1
    invoke-static {p0}, Ll/n3d0;->a(I)I

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 38
    .line 39
    .line 40
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/view/EmptyView;->a:Landroid/widget/ImageView;

    .line 41
    .line 42
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    const/16 v0, 0xdc

    .line 47
    .line 48
    invoke-static {v0}, Ll/txq;->c(I)I

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    iput v0, p0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 53
    .line 54
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/view/EmptyView;->a:Landroid/widget/ImageView;

    .line 55
    .line 56
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    const/16 p1, 0x96

    .line 61
    .line 62
    invoke-static {p1}, Ll/txq;->c(I)I

    .line 63
    .line 64
    .line 65
    move-result p1

    .line 66
    iput p1, p0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 67
    .line 68
    return-void
.end method

.method public final b()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/external/intl/voicesquare/VoiceSquareBaseViewModel;->g:Z

    .line 2
    .line 3
    return p0
.end method

.method public final setWhiteTheme(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/external/intl/voicesquare/VoiceSquareBaseViewModel;->g:Z

    .line 2
    .line 3
    return-void
.end method
