.class public final Lcom/facebook/imagepipeline/producers/a$d$a;
.super Ll/er2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/facebook/imagepipeline/producers/a$d;-><init>(Lcom/facebook/imagepipeline/producers/a;Ll/z06;Ll/yk90;ZI)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0011\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0004*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u000f\u0010\u0003\u001a\u00020\u0002H\u0016\u00a2\u0006\u0004\u0008\u0003\u0010\u0004J\u000f\u0010\u0005\u001a\u00020\u0002H\u0016\u00a2\u0006\u0004\u0008\u0005\u0010\u0004\u00a8\u0006\u0006"
    }
    d2 = {
        "com/facebook/imagepipeline/producers/a$d$a",
        "Ll/er2;",
        "",
        "a",
        "()V",
        "b",
        "imagepipeline_release"
    }
    k = 0x1
    mv = {
        0x2,
        0x0,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public final synthetic a:Lcom/facebook/imagepipeline/producers/a$d;

.field public final synthetic b:Z


# direct methods
.method public constructor <init>(Lcom/facebook/imagepipeline/producers/a$d;Z)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/facebook/imagepipeline/producers/a$d$a;->a:Lcom/facebook/imagepipeline/producers/a$d;

    .line 2
    .line 3
    iput-boolean p2, p0, Lcom/facebook/imagepipeline/producers/a$d$a;->b:Z

    .line 4
    .line 5
    invoke-direct {p0}, Ll/er2;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/a$d$a;->a:Lcom/facebook/imagepipeline/producers/a$d;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/facebook/imagepipeline/producers/a$d;->r(Lcom/facebook/imagepipeline/producers/a$d;)Ll/yk90;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Ll/yk90;->F()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Lcom/facebook/imagepipeline/producers/a$d$a;->a:Lcom/facebook/imagepipeline/producers/a$d;

    .line 14
    .line 15
    invoke-static {p0}, Lcom/facebook/imagepipeline/producers/a$d;->q(Lcom/facebook/imagepipeline/producers/a$d;)Lcom/facebook/imagepipeline/producers/JobScheduler;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/producers/JobScheduler;->h()Z

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public b()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/facebook/imagepipeline/producers/a$d$a;->b:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/facebook/imagepipeline/producers/a$d$a;->a:Lcom/facebook/imagepipeline/producers/a$d;

    .line 6
    .line 7
    invoke-static {p0}, Lcom/facebook/imagepipeline/producers/a$d;->s(Lcom/facebook/imagepipeline/producers/a$d;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method
