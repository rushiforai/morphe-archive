.class public final synthetic Ll/a6r;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;

.field public final synthetic c:Ll/k6r;


# direct methods
.method public synthetic constructor <init>(ILcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;Ll/k6r;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Ll/a6r;->a:I

    iput-object p2, p0, Ll/a6r;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;

    iput-object p3, p0, Ll/a6r;->c:Ll/k6r;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget v0, p0, Ll/a6r;->a:I

    iget-object v1, p0, Ll/a6r;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;

    iget-object p0, p0, Ll/a6r;->c:Ll/k6r;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvStageSuggestItemView;->h0(ILcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;Ll/k6r;Landroid/view/View;)V

    return-void
.end method
