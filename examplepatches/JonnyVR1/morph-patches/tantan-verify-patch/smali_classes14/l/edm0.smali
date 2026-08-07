.class public final synthetic Ll/edm0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/external/view/widgets/VirtualVoiceSquareTopBtnView;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSquareButton;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/external/view/widgets/VirtualVoiceSquareTopBtnView;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSquareButton;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/edm0;->a:Lcom/p1/mobile/putong/live/external/view/widgets/VirtualVoiceSquareTopBtnView;

    iput-object p2, p0, Ll/edm0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSquareButton;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/edm0;->a:Lcom/p1/mobile/putong/live/external/view/widgets/VirtualVoiceSquareTopBtnView;

    iget-object p0, p0, Ll/edm0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSquareButton;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/live/external/view/widgets/VirtualVoiceSquareTopBtnView;->a(Lcom/p1/mobile/putong/live/external/view/widgets/VirtualVoiceSquareTopBtnView;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSquareButton;Landroid/view/View;)V

    return-void
.end method
