.class public Lcom/p1/mobile/putong/core/data/PartialListOpt;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field public final links:Lcom/p1/mobile/putong/data/DbLinks;

.field public final loaded:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation
.end field

.field private reasonStr:Ljava/lang/String;

.field private refreshReason:Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

.field private refreshRender:Z


# direct methods
.method public constructor <init>(Ljava/util/List;Lcom/p1/mobile/putong/data/DbLinks;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "TT;>;",
            "Lcom/p1/mobile/putong/data/DbLinks;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/PartialListOpt;->refreshRender:Z

    .line 6
    .line 7
    sget-object v0, Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;->INIT:Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/PartialListOpt;->refreshReason:Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/PartialListOpt;->reasonStr:Ljava/lang/String;

    .line 13
    .line 14
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/PartialListOpt;->loaded:Ljava/util/List;

    .line 15
    .line 16
    iput-object p2, p0, Lcom/p1/mobile/putong/core/data/PartialListOpt;->links:Lcom/p1/mobile/putong/data/DbLinks;

    .line 17
    .line 18
    return-void
.end method

.method public static emptyHasMore()Ll/vg60;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">()",
            "Ll/vg60<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/vg60;

    .line 2
    .line 3
    new-instance v1, Ljava/util/ArrayList;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 7
    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-direct {v0, v1, v2}, Ll/vg60;-><init>(Ljava/util/List;Lcom/p1/mobile/putong/data/DbLinks;)V

    .line 11
    .line 12
    .line 13
    return-object v0
.end method

.method public static emptyNoMore()Ll/vg60;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">()",
            "Ll/vg60<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/vg60;

    .line 2
    .line 3
    new-instance v1, Ljava/util/ArrayList;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 7
    .line 8
    .line 9
    invoke-static {}, Lcom/p1/mobile/putong/data/DbLinks;->new_()Lcom/p1/mobile/putong/data/DbLinks;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-direct {v0, v1, v2}, Ll/vg60;-><init>(Ljava/util/List;Lcom/p1/mobile/putong/data/DbLinks;)V

    .line 14
    .line 15
    .line 16
    return-object v0
.end method


# virtual methods
.method public getReasonStr()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/PartialListOpt;->reasonStr:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/PartialListOpt;->refreshReason:Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;->getReason()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/PartialListOpt;->reasonStr:Ljava/lang/String;

    .line 17
    .line 18
    return-object p0
.end method

.method public hasMore()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/PartialListOpt;->links:Lcom/p1/mobile/putong/data/DbLinks;

    .line 2
    .line 3
    if-eqz p0, :cond_1

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/data/DbLinks;->links:Lcom/p1/mobile/putong/data/Links;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return p0

    .line 14
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 15
    return p0
.end method

.method public needRefresh()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/data/PartialListOpt;->refreshRender:Z

    .line 2
    .line 3
    return p0
.end method

.method public resetReason()V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;->RENDER_DONE:Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

    .line 2
    .line 3
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/PartialListOpt;->refreshReason:Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

    .line 4
    .line 5
    return-void
.end method

.method public setReason(Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;)Lcom/p1/mobile/putong/core/data/PartialListOpt;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/PartialListOpt;->refreshReason:Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/PartialListOpt;->reasonStr:Ljava/lang/String;

    .line 5
    .line 6
    return-object p0
.end method

.method public setReasonStr(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/PartialListOpt;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/PartialListOpt;->reasonStr:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public setRefreshValue(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/data/PartialListOpt;->refreshRender:Z

    .line 2
    .line 3
    return-void
.end method

.method public total()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/PartialListOpt;->links:Lcom/p1/mobile/putong/data/DbLinks;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    iget p0, p0, Lcom/p1/mobile/putong/data/DbLinks;->total:I

    .line 8
    .line 9
    return p0
.end method
