.class public Ll/bgn0;
.super Ll/a5s;
.source "SourceFile"


# instance fields
.field public h:Ll/agn0;

.field public i:Ljava/lang/String;

.field public j:Ll/yql;

.field public k:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

.field public l:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;Ll/agn0;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, v0}, Ll/a5s;-><init>(Ljava/lang/String;Ll/brl;)V

    .line 3
    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p0, Ll/bgn0;->l:Z

    .line 7
    .line 8
    iput-object p2, p0, Ll/bgn0;->h:Ll/agn0;

    .line 9
    .line 10
    iput-object p1, p0, Ll/bgn0;->i:Ljava/lang/String;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public d(Ll/yql;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/bgn0;->j:Ll/yql;

    .line 2
    .line 3
    iput-object p2, p0, Ll/bgn0;->k:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 4
    .line 5
    return-void
.end method

.method public h(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bgn0;->h:Ll/agn0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/agn0;->h(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public i()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bgn0;->i:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public j(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/bgn0;->l:Z

    .line 2
    .line 3
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/bgn0;->j:Ll/yql;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-boolean v1, p0, Ll/bgn0;->l:Z

    .line 6
    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object v1, p0, Ll/bgn0;->i:Ljava/lang/String;

    .line 11
    .line 12
    iget-object v2, p0, Ll/bgn0;->k:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 13
    .line 14
    invoke-interface {v0, p0, p1, v1, v2}, Ll/yql;->k(Ll/a5s;Landroid/view/View;Ljava/lang/String;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;)V

    .line 15
    .line 16
    .line 17
    :cond_1
    :goto_0
    return-void
.end method
