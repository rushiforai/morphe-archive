.class public Ll/ib1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/epl;


# instance fields
.field private a:Lcom/momo/pipline/MomoInterface/MomoPipeline;

.field private b:Ll/dpl;


# direct methods
.method public constructor <init>(Lcom/momo/pipline/MomoInterface/MomoPipeline;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/ib1;->a:Lcom/momo/pipline/MomoInterface/MomoPipeline;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ib1;->b:Ll/dpl;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v1, p0, Ll/ib1;->a:Lcom/momo/pipline/MomoInterface/MomoPipeline;

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    invoke-interface {v1, v0}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->C0(Ll/dpl;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Ll/ib1;->b:Ll/dpl;

    .line 13
    .line 14
    invoke-interface {p0}, Ll/dpl;->I1()V

    .line 15
    .line 16
    .line 17
    :cond_1
    return-void
.end method

.method public b()Ll/dpl;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ib1;->b:Ll/dpl;

    .line 2
    .line 3
    return-object p0
.end method

.method public c(Ll/dpl;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ib1;->b:Ll/dpl;

    .line 2
    .line 3
    return-void
.end method

.method public stopAudio()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ib1;->b:Ll/dpl;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Ll/ib1;->a:Lcom/momo/pipline/MomoInterface/MomoPipeline;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-interface {v0, v1}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->C0(Ll/dpl;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    iget-object p0, p0, Ll/ib1;->b:Ll/dpl;

    .line 14
    .line 15
    invoke-interface {p0}, Ll/dpl;->X()V

    .line 16
    .line 17
    .line 18
    :cond_1
    return-void
.end method
