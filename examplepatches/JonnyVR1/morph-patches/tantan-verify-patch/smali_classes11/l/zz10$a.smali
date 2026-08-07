.class Ll/zz10$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$OnPreparedListener;


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
    iput-object p1, p0, Ll/zz10$a;->a:Ll/zz10;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onPrepared(Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/zz10$a;->a:Ll/zz10;

    .line 2
    .line 3
    invoke-static {p1}, Ll/zz10;->a(Ll/zz10;)I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-ltz p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Ll/zz10$a;->a:Ll/zz10;

    .line 10
    .line 11
    invoke-static {p1}, Ll/zz10;->c(Ll/zz10;)Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iget-object v0, p0, Ll/zz10$a;->a:Ll/zz10;

    .line 16
    .line 17
    invoke-static {v0}, Ll/zz10;->a(Ll/zz10;)I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    invoke-virtual {p1, v0}, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->seekPlayTime(I)Z

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Ll/zz10$a;->a:Ll/zz10;

    .line 25
    .line 26
    const/4 v0, -0x1

    .line 27
    invoke-static {p1, v0}, Ll/zz10;->b(Ll/zz10;I)I

    .line 28
    .line 29
    .line 30
    :cond_0
    iget-object p0, p0, Ll/zz10$a;->a:Ll/zz10;

    .line 31
    .line 32
    invoke-static {p0}, Ll/zz10;->c(Ll/zz10;)Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {p0}, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->start()V

    .line 37
    .line 38
    .line 39
    return-void
.end method
