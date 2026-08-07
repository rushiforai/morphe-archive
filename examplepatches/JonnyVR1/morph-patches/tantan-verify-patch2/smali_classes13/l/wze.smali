.class public Ll/wze;
.super Ll/hn2;
.source "SourceFile"

# interfaces
.implements Ll/usl;


# instance fields
.field d:Ll/vze;


# direct methods
.method public constructor <init>(Ll/uow;Lcom/momo/pipline/MomoInterface/MomoPipeline;)V
    .locals 0
    .param p1    # Ll/uow;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/momo/pipline/MomoInterface/MomoPipeline;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ll/hn2;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/vze;

    .line 5
    .line 6
    invoke-direct {p1}, Ll/vze;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/wze;->d:Ll/vze;

    .line 10
    .line 11
    iput-object p1, p0, Ll/hn2;->c:Ll/z5m;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public G()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Ll/wze;->d:Ll/vze;

    .line 3
    .line 4
    invoke-super {p0}, Ll/hn2;->G()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public a()Ll/z5m;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wze;->d:Ll/vze;

    .line 2
    .line 3
    return-object p0
.end method
