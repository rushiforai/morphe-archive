.class public Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a$c;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;->m()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView$a;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;Lcom/momo/xeengine/script/ScriptBridge$Callback;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView$a;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;->b(Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;)Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView$c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView$a;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;

    .line 10
    .line 11
    invoke-static {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;->b(Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;)Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView$c;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-interface {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView$c;->a(Ljava/lang/String;Lcom/momo/xeengine/script/ScriptBridge$Callback;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public b(Ljava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "\u6e38\u620f\u5f00\u542f\u9519\u8bef\uff0c\u9519\u8bef\u539f\u56e0\uff1a"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Ll/clj;->o(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView$a;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;

    .line 19
    .line 20
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;->c(Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;)Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-static {p1, v0}, Ll/clj;->k(Ljava/lang/String;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView$a;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;

    .line 28
    .line 29
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;->b(Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;)Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView$c;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    if-eqz v0, :cond_0

    .line 34
    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView$a;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;

    .line 36
    .line 37
    invoke-static {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;->b(Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;)Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView$c;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-interface {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView$c;->b(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    :cond_0
    return-void
.end method

.method public c()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView$a;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;->c(Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;)Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Ll/clj;->j(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView$a;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;

    .line 11
    .line 12
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;->b(Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;)Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView$c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView$a;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;

    .line 19
    .line 20
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;->b(Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;)Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView$c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-interface {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView$c;->d()V

    .line 25
    .line 26
    .line 27
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView$a;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;

    .line 28
    .line 29
    const-string v0, "onRemoveGame"

    .line 30
    .line 31
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;->j(Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public d(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView$a;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;

    .line 2
    .line 3
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;->f(Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public e()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView$a;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;->b(Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;)Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView$c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView$a;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;

    .line 10
    .line 11
    invoke-static {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;->b(Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView;)Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView$c;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-interface {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/GameEffectView$c;->c()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method
