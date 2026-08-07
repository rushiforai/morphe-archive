.class public Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView$c;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;->z(Lcom/p1/mobile/putong/live/base/data/BLiveEffect;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

.field public final synthetic b:Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView$b;->b:Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView$b;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView$b;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView$b;->f(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V

    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;Lcom/momo/xeengine/script/ScriptBridge$Callback;)V
    .locals 1

    .line 1
    invoke-static {p1}, Ll/clj;->l(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView$b;->b:Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;->d(Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;)Ll/fgs;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView$b;->b:Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;

    .line 13
    .line 14
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;->d(Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;)Ll/fgs;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView$b;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 19
    .line 20
    invoke-virtual {v0, p0, p1, p2}, Ll/fgs;->V3(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;Ljava/lang/String;Lcom/momo/xeengine/script/ScriptBridge$Callback;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public b(Ljava/lang/String;)V
    .locals 4

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView$b;->b:Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;->setGameEffectStatusShow(Z)V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView$b;->b:Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;

    .line 8
    .line 9
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;->d(Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;)Ll/fgs;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView$b;->b:Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;->e(Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;)Ljava/lang/Runnable;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {p1, v0}, Ll/i6t;->E3(Ljava/lang/Runnable;)V

    .line 20
    .line 21
    .line 22
    invoke-static {}, Ll/hlj;->d()Z

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView$b;->b:Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;

    .line 27
    .line 28
    if-eqz p1, :cond_0

    .line 29
    .line 30
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;->d(Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;)Ll/fgs;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    if-eqz p1, :cond_1

    .line 35
    .line 36
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView$b;->b:Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;

    .line 37
    .line 38
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;->d(Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;)Ll/fgs;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView$b;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 43
    .line 44
    new-instance v1, Ll/rkj;

    .line 45
    .line 46
    invoke-direct {v1, p0, v0}, Ll/rkj;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView$b;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V

    .line 47
    .line 48
    .line 49
    const-wide/16 v2, 0xfa0

    .line 50
    .line 51
    invoke-virtual {p1, v2, v3, v1}, Ll/i6t;->z3(JLjava/lang/Runnable;)V

    .line 52
    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView$b;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 56
    .line 57
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->y:Ljava/lang/String;

    .line 58
    .line 59
    invoke-static {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;->i(Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    :cond_1
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView$b;->b:Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;

    .line 63
    .line 64
    const-string p1, "onGamePrepareFailed"

    .line 65
    .line 66
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;->A(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public c()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView$b;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 2
    .line 3
    invoke-static {p0}, Ll/clj;->e(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public d()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView$b;->b:Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;->setGameEffectStatusShow(Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView$b;->b:Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;->d(Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;)Ll/fgs;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView$b;->b:Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;

    .line 14
    .line 15
    invoke-static {v1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;->e(Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;)Ljava/lang/Runnable;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v0, v1}, Ll/i6t;->E3(Ljava/lang/Runnable;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView$b;->b:Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;

    .line 23
    .line 24
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView$b;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 25
    .line 26
    iget-object v1, v1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->y:Ljava/lang/String;

    .line 27
    .line 28
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;->i(Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView$b;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 32
    .line 33
    invoke-static {p0}, Ll/clj;->d(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public final synthetic f(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView$b;->b:Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->y:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;->i(Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
