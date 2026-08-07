.class public Ll/mr2;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/data/User;

.field public b:Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;

.field public c:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

.field public d:Lcom/p1/mobile/putong/data/Followship;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;Lcom/p1/mobile/putong/data/Followship;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/mr2;->a:Lcom/p1/mobile/putong/data/User;

    .line 5
    .line 6
    iput-object p2, p0, Ll/mr2;->b:Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;

    .line 7
    .line 8
    iput-object p3, p0, Ll/mr2;->c:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 9
    .line 10
    iput-object p4, p0, Ll/mr2;->d:Lcom/p1/mobile/putong/data/Followship;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 6

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Ll/mr2;

    .line 3
    .line 4
    iget-object v1, v0, Ll/mr2;->b:Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;

    .line 5
    .line 6
    const/4 v2, 0x0

    .line 7
    const/4 v3, 0x1

    .line 8
    if-eqz v1, :cond_1

    .line 9
    .line 10
    iget-object v4, v0, Ll/mr2;->c:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 11
    .line 12
    if-eqz v4, :cond_1

    .line 13
    .line 14
    iget-object v4, p0, Ll/mr2;->b:Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;

    .line 15
    .line 16
    if-eqz v4, :cond_1

    .line 17
    .line 18
    iget-object v5, p0, Ll/mr2;->c:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 19
    .line 20
    if-eqz v5, :cond_1

    .line 21
    .line 22
    iget-object p1, v4, Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;->id:Ljava/lang/String;

    .line 23
    .line 24
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;->id:Ljava/lang/String;

    .line 25
    .line 26
    invoke-static {p1, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    if-eqz p1, :cond_0

    .line 31
    .line 32
    iget-object p0, p0, Ll/mr2;->c:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 33
    .line 34
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 35
    .line 36
    iget-object p1, v0, Ll/mr2;->c:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 37
    .line 38
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 39
    .line 40
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    if-eqz p0, :cond_0

    .line 45
    .line 46
    return v3

    .line 47
    :cond_0
    return v2

    .line 48
    :cond_1
    if-eq p0, p1, :cond_2

    .line 49
    .line 50
    return v2

    .line 51
    :cond_2
    return v3
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "BaseRoomInfo{user="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Ll/mr2;->a:Lcom/p1/mobile/putong/data/User;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, ", room="

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Ll/mr2;->b:Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, ", live="

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget-object v1, p0, Ll/mr2;->c:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v1, ", followship="

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Ll/mr2;->d:Lcom/p1/mobile/putong/data/Followship;

    .line 39
    .line 40
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const/16 p0, 0x7d

    .line 44
    .line 45
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    return-object p0
.end method
