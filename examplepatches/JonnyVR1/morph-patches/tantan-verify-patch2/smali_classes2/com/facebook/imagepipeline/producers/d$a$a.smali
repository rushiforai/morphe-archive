.class public Lcom/facebook/imagepipeline/producers/d$a$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/facebook/imagepipeline/producers/JobScheduler$d;


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

.field public final synthetic b:Lcom/facebook/imagepipeline/producers/d$a;


# direct methods
.method public constructor <init>(Lcom/facebook/imagepipeline/producers/d$a;Lcom/facebook/imagepipeline/producers/d;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/facebook/imagepipeline/producers/d$a$a;->b:Lcom/facebook/imagepipeline/producers/d$a;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/facebook/imagepipeline/producers/d$a$a;->a:Lcom/facebook/imagepipeline/producers/d;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(Ll/n0f;I)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/d$a$a;->b:Lcom/facebook/imagepipeline/producers/d$a;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-static {v0}, Lcom/facebook/imagepipeline/producers/d$a;->p(Lcom/facebook/imagepipeline/producers/d$a;)Ll/xkm;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {p1}, Ll/n0f;->F()Ll/him;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    iget-object p0, p0, Lcom/facebook/imagepipeline/producers/d$a$a;->b:Lcom/facebook/imagepipeline/producers/d$a;

    .line 14
    .line 15
    invoke-static {p0}, Lcom/facebook/imagepipeline/producers/d$a;->q(Lcom/facebook/imagepipeline/producers/d$a;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    invoke-interface {v1, v2, p0}, Ll/xkm;->createImageTranscoder(Ll/him;Z)Ll/wkm;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-static {p0}, Ll/wn80;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    check-cast p0, Ll/wkm;

    .line 28
    .line 29
    invoke-static {v0, p1, p2, p0}, Lcom/facebook/imagepipeline/producers/d$a;->u(Lcom/facebook/imagepipeline/producers/d$a;Ll/n0f;ILl/wkm;)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    invoke-virtual {v0}, Ll/pud;->o()Ll/z06;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    const/4 p1, 0x0

    .line 38
    invoke-interface {p0, p1, p2}, Ll/z06;->b(Ljava/lang/Object;I)V

    .line 39
    .line 40
    .line 41
    return-void
.end method
