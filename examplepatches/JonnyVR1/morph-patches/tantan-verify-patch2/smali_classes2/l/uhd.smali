.class public final synthetic Ll/uhd;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/facebook/imagepipeline/producers/JobScheduler$d;


# instance fields
.field public final synthetic a:Lcom/facebook/imagepipeline/producers/a$d;

.field public final synthetic b:Lcom/facebook/imagepipeline/producers/a;

.field public final synthetic c:I


# direct methods
.method public synthetic constructor <init>(Lcom/facebook/imagepipeline/producers/a$d;Lcom/facebook/imagepipeline/producers/a;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/uhd;->a:Lcom/facebook/imagepipeline/producers/a$d;

    iput-object p2, p0, Ll/uhd;->b:Lcom/facebook/imagepipeline/producers/a;

    iput p3, p0, Ll/uhd;->c:I

    return-void
.end method


# virtual methods
.method public final a(Ll/n0f;I)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/uhd;->a:Lcom/facebook/imagepipeline/producers/a$d;

    iget-object v1, p0, Ll/uhd;->b:Lcom/facebook/imagepipeline/producers/a;

    iget p0, p0, Ll/uhd;->c:I

    invoke-static {v0, v1, p0, p1, p2}, Lcom/facebook/imagepipeline/producers/a$d;->p(Lcom/facebook/imagepipeline/producers/a$d;Lcom/facebook/imagepipeline/producers/a;ILl/n0f;I)V

    return-void
.end method
