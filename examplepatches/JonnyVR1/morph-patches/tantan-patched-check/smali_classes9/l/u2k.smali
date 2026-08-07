.class public final synthetic Ll/u2k;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/jl80;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftItem;

.field public final synthetic c:Z

.field public final synthetic d:Z

.field public final synthetic e:Ll/i6t;


# direct methods
.method public synthetic constructor <init>(Ll/jl80;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftItem;ZZLl/i6t;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/u2k;->a:Ll/jl80;

    iput-object p2, p0, Ll/u2k;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftItem;

    iput-boolean p3, p0, Ll/u2k;->c:Z

    iput-boolean p4, p0, Ll/u2k;->d:Z

    iput-object p5, p0, Ll/u2k;->e:Ll/i6t;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/u2k;->a:Ll/jl80;

    iget-object v1, p0, Ll/u2k;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftItem;

    iget-boolean v2, p0, Ll/u2k;->c:Z

    iget-boolean v3, p0, Ll/u2k;->d:Z

    iget-object v4, p0, Ll/u2k;->e:Ll/i6t;

    move-object v5, p1

    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/view/GiftWallSendGiftDialogContentView;->h0(Ll/jl80;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftItem;ZZLl/i6t;Landroid/view/View;)V

    return-void
.end method
