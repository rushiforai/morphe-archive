.class public Ll/agt;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ljava/lang/String;

.field public b:Ljava/lang/String;

.field public c:Ljava/lang/String;

.field public d:Ljava/lang/String;

.field public e:J


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->c:J

    .line 5
    .line 6
    invoke-virtual {p0, v0, v1}, Ll/agt;->e(J)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->y:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ll/agt;->a(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget v0, p1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->e:I

    .line 15
    .line 16
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {p0, v0}, Ll/agt;->b(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->B:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {p0, v0}, Ll/agt;->d(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->C:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {p0, p1}, Ll/agt;->c(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/agt;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public b(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/agt;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public c(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/agt;->d:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public d(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/agt;->c:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public e(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/agt;->e:J

    .line 2
    .line 3
    return-void
.end method
