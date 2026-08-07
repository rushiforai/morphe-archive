.class public Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/RoomTopEffectView$a;
.super Lcom/tantan/library/svga/AnimListener;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/RoomTopEffectView;->h(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;Ll/x20;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/x20;

.field public final synthetic b:Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/RoomTopEffectView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/RoomTopEffectView;Ll/x20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/RoomTopEffectView$a;->b:Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/RoomTopEffectView;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/RoomTopEffectView$a;->a:Ll/x20;

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/tantan/library/svga/AnimListener;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onFinished()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/tantan/library/svga/AnimListener;->onFinished()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/RoomTopEffectView$a;->b:Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/RoomTopEffectView;

    .line 5
    .line 6
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/RoomTopEffectView;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/RoomTopEffectView;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/RoomTopEffectView$a;->a:Ll/x20;

    .line 13
    .line 14
    if-eqz p0, :cond_0

    .line 15
    .line 16
    invoke-interface {p0}, Ll/x20;->call()V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public onStart()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/tantan/library/svga/AnimListener;->onStart()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/RoomTopEffectView$a;->b:Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/RoomTopEffectView;

    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/RoomTopEffectView;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/RoomTopEffectView;

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
