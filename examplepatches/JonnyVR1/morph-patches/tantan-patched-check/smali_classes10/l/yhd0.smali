.class public final synthetic Ll/yhd0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/qid0;

.field public final synthetic b:Z

.field public final synthetic c:Lcom/p1/mobile/putong/live/base/data/BLive;


# direct methods
.method public synthetic constructor <init>(Ll/qid0;ZLcom/p1/mobile/putong/live/base/data/BLive;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yhd0;->a:Ll/qid0;

    iput-boolean p2, p0, Ll/yhd0;->b:Z

    iput-object p3, p0, Ll/yhd0;->c:Lcom/p1/mobile/putong/live/base/data/BLive;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/yhd0;->a:Ll/qid0;

    iget-boolean v1, p0, Ll/yhd0;->b:Z

    iget-object p0, p0, Ll/yhd0;->c:Lcom/p1/mobile/putong/live/base/data/BLive;

    check-cast p1, Ll/ugd0;

    invoke-static {v0, v1, p0, p1}, Ll/qid0;->m(Ll/qid0;ZLcom/p1/mobile/putong/live/base/data/BLive;Ll/ugd0;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
