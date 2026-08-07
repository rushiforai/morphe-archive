.class public abstract Ll/zh2;
.super Ll/vr4;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/vr4<",
        "Ljava/util/List<",
        "Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;",
        ">;",
        "Ll/bkj0<",
        "Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;",
        "Ljava/util/List<",
        "Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;",
        ">;",
        "Ll/pf60<",
        "Ljava/lang/Integer;",
        "Ljava/lang/Integer;",
        ">;>;>;"
    }
.end annotation


# instance fields
.field public c:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/vr4;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/zh2;->c:Z

    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public bridge synthetic b(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Ll/bkj0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/zh2;->g(Ll/bkj0;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public abstract e(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Ljava/util/List;Ll/pf60;)Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;",
            ">;",
            "Ll/pf60<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;",
            ">;"
        }
    .end annotation
.end method

.method public abstract f()Z
.end method

.method public final g(Ll/bkj0;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/bkj0<",
            "Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;",
            ">;",
            "Ll/pf60<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;>;)",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p1, Ll/bkj0;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 4
    .line 5
    iget-object v1, p1, Ll/bkj0;->b:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v1, Ljava/util/List;

    .line 8
    .line 9
    iget-object p1, p1, Ll/bkj0;->c:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast p1, Ll/pf60;

    .line 12
    .line 13
    invoke-virtual {p0, v0, v1, p1}, Ll/zh2;->e(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Ljava/util/List;Ll/pf60;)Ljava/util/List;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    iget-object v2, p0, Ll/vr4;->a:Ll/vr4;

    .line 18
    .line 19
    if-eqz v2, :cond_0

    .line 20
    .line 21
    new-instance v3, Ll/bkj0;

    .line 22
    .line 23
    invoke-direct {v3, v0, v1, p1}, Ll/bkj0;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v2, v3}, Ll/vr4;->b(Ljava/lang/Object;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    move-object v1, p1

    .line 31
    check-cast v1, Ljava/util/List;

    .line 32
    .line 33
    :cond_0
    invoke-virtual {p0}, Ll/zh2;->f()Z

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    const/4 v2, 0x0

    .line 38
    if-nez p1, :cond_2

    .line 39
    .line 40
    iget-boolean p1, p0, Ll/zh2;->c:Z

    .line 41
    .line 42
    if-eqz p1, :cond_1

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_1
    move p1, v2

    .line 46
    goto :goto_1

    .line 47
    :cond_2
    :goto_0
    const/4 p1, 0x1

    .line 48
    :goto_1
    iget-object v3, p0, Ll/vr4;->b:Ll/vr4;

    .line 49
    .line 50
    if-eqz v3, :cond_3

    .line 51
    .line 52
    if-eqz p1, :cond_3

    .line 53
    .line 54
    check-cast v3, Ll/zh2;

    .line 55
    .line 56
    invoke-virtual {v3, p1}, Ll/zh2;->h(Z)V

    .line 57
    .line 58
    .line 59
    goto :goto_2

    .line 60
    :cond_3
    if-nez v3, :cond_4

    .line 61
    .line 62
    if-nez p1, :cond_4

    .line 63
    .line 64
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    :cond_4
    :goto_2
    iput-boolean v2, p0, Ll/zh2;->c:Z

    .line 68
    .line 69
    return-object v1
.end method

.method public final h(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/zh2;->c:Z

    .line 2
    .line 3
    return-void
.end method
