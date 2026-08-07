.class Ll/zz10$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$OnPlayPositionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/zz10;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/zz10;


# direct methods
.method public constructor <init>(Ll/zz10;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/zz10$b;->a:Ll/zz10;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onPlayPositionListener(Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/zz10$b;->a:Ll/zz10;

    .line 2
    .line 3
    invoke-static {v0, p2}, Ll/zz10;->d(Ll/zz10;I)I

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/zz10$b;->a:Ll/zz10;

    .line 7
    .line 8
    invoke-static {v0}, Ll/zz10;->e(Ll/zz10;)Ljava/util/List;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    iget-object v0, p0, Ll/zz10$b;->a:Ll/zz10;

    .line 15
    .line 16
    invoke-static {v0}, Ll/zz10;->e(Ll/zz10;)Ljava/util/List;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-nez v0, :cond_1

    .line 25
    .line 26
    iget-object p0, p0, Ll/zz10$b;->a:Ll/zz10;

    .line 27
    .line 28
    invoke-static {p0}, Ll/zz10;->e(Ll/zz10;)Ljava/util/List;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_1

    .line 41
    .line 42
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    check-cast v0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$OnPlayPositionListener;

    .line 47
    .line 48
    if-eqz v0, :cond_0

    .line 49
    .line 50
    invoke-interface {v0, p1, p2}, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$OnPlayPositionListener;->onPlayPositionListener(Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;I)V

    .line 51
    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_1
    return-void
.end method
