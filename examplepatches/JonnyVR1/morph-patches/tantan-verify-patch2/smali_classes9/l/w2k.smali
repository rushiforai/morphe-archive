.class public final synthetic Ll/w2k;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/jl80;

.field public final synthetic b:Ll/y20;

.field public final synthetic c:Lcom/p1/mobile/putong/live/base/data/BLiveUserDressUp;


# direct methods
.method public synthetic constructor <init>(Ll/jl80;Ll/y20;Lcom/p1/mobile/putong/live/base/data/BLiveUserDressUp;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/w2k;->a:Ll/jl80;

    iput-object p2, p0, Ll/w2k;->b:Ll/y20;

    iput-object p3, p0, Ll/w2k;->c:Lcom/p1/mobile/putong/live/base/data/BLiveUserDressUp;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/w2k;->a:Ll/jl80;

    iget-object v1, p0, Ll/w2k;->b:Ll/y20;

    iget-object p0, p0, Ll/w2k;->c:Lcom/p1/mobile/putong/live/base/data/BLiveUserDressUp;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/view/GiftWallSendGiftDialogContentView;->k0(Ll/jl80;Ll/y20;Lcom/p1/mobile/putong/live/base/data/BLiveUserDressUp;Landroid/view/View;)V

    return-void
.end method
