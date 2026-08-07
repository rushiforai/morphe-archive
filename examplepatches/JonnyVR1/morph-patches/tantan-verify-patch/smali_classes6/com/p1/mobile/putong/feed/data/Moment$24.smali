.class Lcom/p1/mobile/putong/feed/data/Moment$24;
.super Lcom/tantanapp/common/data/orm/BooleanColumn;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/feed/data/Moment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/orm/BooleanColumn<",
        "Lcom/p1/mobile/putong/feed/data/Moment;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/tantanapp/common/data/orm/BooleanColumn;-><init>(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public get(Lcom/p1/mobile/putong/feed/data/Moment;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->settings:Lcom/p1/mobile/putong/feed/data/MomentSettings;

    .line 2
    .line 3
    iget-boolean p0, p0, Lcom/p1/mobile/putong/feed/data/MomentSettings;->muted:Z

    .line 4
    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public bridge synthetic get(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 10
    check-cast p1, Lcom/p1/mobile/putong/feed/data/Moment;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/data/Moment$24;->get(Lcom/p1/mobile/putong/feed/data/Moment;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public set(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->settings:Lcom/p1/mobile/putong/feed/data/MomentSettings;

    .line 2
    .line 3
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/data/MomentSettings;->muted:Z

    .line 8
    .line 9
    return-void
.end method

.method public bridge synthetic set(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 10
    check-cast p1, Lcom/p1/mobile/putong/feed/data/Moment;

    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/data/Moment$24;->set(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/Boolean;)V

    return-void
.end method
