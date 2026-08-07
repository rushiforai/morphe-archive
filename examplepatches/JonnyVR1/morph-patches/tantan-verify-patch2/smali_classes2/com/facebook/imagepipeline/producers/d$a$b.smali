.class public Lcom/facebook/imagepipeline/producers/d$a$b;
.super Ll/er2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/facebook/imagepipeline/producers/d$a;-><init>(Lcom/facebook/imagepipeline/producers/d;Ll/z06;Ll/yk90;ZLl/xkm;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/facebook/imagepipeline/producers/d;

.field public final synthetic b:Ll/z06;

.field public final synthetic c:Lcom/facebook/imagepipeline/producers/d$a;


# direct methods
.method public constructor <init>(Lcom/facebook/imagepipeline/producers/d$a;Lcom/facebook/imagepipeline/producers/d;Ll/z06;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/facebook/imagepipeline/producers/d$a$b;->c:Lcom/facebook/imagepipeline/producers/d$a;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/facebook/imagepipeline/producers/d$a$b;->a:Lcom/facebook/imagepipeline/producers/d;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/facebook/imagepipeline/producers/d$a$b;->b:Ll/z06;

    .line 6
    .line 7
    invoke-direct {p0}, Ll/er2;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/d$a$b;->c:Lcom/facebook/imagepipeline/producers/d$a;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/facebook/imagepipeline/producers/d$a;->s(Lcom/facebook/imagepipeline/producers/d$a;)Ll/yk90;

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
    iget-object p0, p0, Lcom/facebook/imagepipeline/producers/d$a$b;->c:Lcom/facebook/imagepipeline/producers/d$a;

    .line 14
    .line 15
    invoke-static {p0}, Lcom/facebook/imagepipeline/producers/d$a;->r(Lcom/facebook/imagepipeline/producers/d$a;)Lcom/facebook/imagepipeline/producers/JobScheduler;

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
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/d$a$b;->c:Lcom/facebook/imagepipeline/producers/d$a;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/facebook/imagepipeline/producers/d$a;->r(Lcom/facebook/imagepipeline/producers/d$a;)Lcom/facebook/imagepipeline/producers/JobScheduler;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/facebook/imagepipeline/producers/JobScheduler;->c()V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/d$a$b;->c:Lcom/facebook/imagepipeline/producers/d$a;

    .line 11
    .line 12
    const/4 v1, 0x1

    .line 13
    invoke-static {v0, v1}, Lcom/facebook/imagepipeline/producers/d$a;->t(Lcom/facebook/imagepipeline/producers/d$a;Z)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Lcom/facebook/imagepipeline/producers/d$a$b;->b:Ll/z06;

    .line 17
    .line 18
    invoke-interface {p0}, Ll/z06;->a()V

    .line 19
    .line 20
    .line 21
    return-void
.end method
