.class public Ll/zj;
.super Ll/h9c;
.source "SourceFile"

# interfaces
.implements Ll/gq2;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/h9c;",
        "Ll/gq2<",
        "Lcom/p1/mobile/putong/account/data/AccountCommonData;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/h9c;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public bridge synthetic a(Lcom/p1/mobile/putong/data/Envelope;Lcom/tantanapp/common/data/BaseData;ZZZ)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/account/data/AccountCommonData;

    .line 2
    .line 3
    invoke-virtual/range {p0 .. p5}, Ll/zj;->k(Lcom/p1/mobile/putong/data/Envelope;Lcom/p1/mobile/putong/account/data/AccountCommonData;ZZZ)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public b(Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    return-void
.end method

.method public c()I
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public d()I
    .locals 0

    .line 1
    const/4 p0, 0x3

    .line 2
    return p0
.end method

.method public e()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "account"

    .line 2
    .line 3
    return-object p0
.end method

.method public f()Ljava/util/ArrayList;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ll/wzh0;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-super {p0}, Ll/h9c;->f()Ljava/util/ArrayList;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public g()V
    .locals 2

    .line 1
    invoke-static {}, Ll/rrq;->b()Ll/rrq;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/p1/mobile/putong/account/data/AccountCommonData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 6
    .line 7
    invoke-virtual {v0, v1, p0}, Ll/rrq;->e(Lcom/tantanapp/common/data/JsonAdapter;Ll/gq2;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public h()V
    .locals 0

    .line 1
    return-void
.end method

.method public i()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/h9c;->i()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/rrq;->b()Ll/rrq;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    sget-object v1, Lcom/p1/mobile/putong/account/data/AccountCommonData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 9
    .line 10
    invoke-virtual {v0, p0, v1}, Ll/rrq;->i(Ll/gq2;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public j(Lio/requery/android/database/sqlite/SQLiteDatabase;II)V
    .locals 0

    .line 1
    return-void
.end method

.method public k(Lcom/p1/mobile/putong/data/Envelope;Lcom/p1/mobile/putong/account/data/AccountCommonData;ZZZ)V
    .locals 0

    .line 1
    return-void
.end method
