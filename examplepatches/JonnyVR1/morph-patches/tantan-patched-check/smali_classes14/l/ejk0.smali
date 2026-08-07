.class public Ll/ejk0;
.super Ll/wzh0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/wzh0<",
        "Lcom/p1/mobile/putong/data/User;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/h9c;Ljava/lang/String;Ll/vzf0;Ljava/util/List;I)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p5}, Ll/wzh0;-><init>(Ll/h9c;Ljava/lang/String;Ll/vzf0;Ljava/util/List;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final F(Lcom/p1/mobile/putong/data/User;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isRiskAudit()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->clone()Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    const-string v2, "fake_risk_audit_default_"

    .line 14
    .line 15
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    iget-object v2, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    iput-object v1, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->getUserName()Ll/wyd0;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->getUserPicture()Ll/wyd0;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isRiskAuditName()Z

    .line 38
    .line 39
    .line 40
    move-result v3

    .line 41
    if-eqz v3, :cond_0

    .line 42
    .line 43
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    check-cast v1, Ljava/lang/String;

    .line 48
    .line 49
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 50
    .line 51
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isRiskAuditAvatar()Z

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    if-eqz p1, :cond_1

    .line 56
    .line 57
    iget-object p1, v0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 58
    .line 59
    const/4 v1, 0x0

    .line 60
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    check-cast p1, Lcom/p1/mobile/putong/data/Media;

    .line 65
    .line 66
    invoke-virtual {v2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    check-cast v1, Ljava/lang/String;

    .line 71
    .line 72
    iput-object v1, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 73
    .line 74
    :cond_1
    const/4 p1, 0x0

    .line 75
    invoke-super {p0, v0, p1}, Ll/wzh0;->upsert(Lcom/tantanapp/common/data/DbObject;Ll/z20;)Lcom/tantanapp/common/data/DbObject;

    .line 76
    .line 77
    .line 78
    :cond_2
    return-void
.end method

.method public G(Lcom/p1/mobile/putong/data/User;Ll/z20;)Lcom/p1/mobile/putong/data/User;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/User;",
            "Ll/z20<",
            "Lcom/p1/mobile/putong/data/User;",
            "Lcom/p1/mobile/putong/data/User;",
            ">;)",
            "Lcom/p1/mobile/putong/data/User;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Ll/ejk0;->F(Lcom/p1/mobile/putong/data/User;)V

    .line 2
    .line 3
    .line 4
    invoke-super {p0, p1, p2}, Ll/wzh0;->upsert(Lcom/tantanapp/common/data/DbObject;Ll/z20;)Lcom/tantanapp/common/data/DbObject;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    check-cast p0, Lcom/p1/mobile/putong/data/User;

    .line 9
    .line 10
    return-object p0
.end method

.method public bridge synthetic upsert(Lcom/tantanapp/common/data/DbObject;Ll/z20;)Lcom/tantanapp/common/data/DbObject;
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/ejk0;->G(Lcom/p1/mobile/putong/data/User;Ll/z20;)Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
