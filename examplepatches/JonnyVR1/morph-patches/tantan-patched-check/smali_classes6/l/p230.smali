.class public final synthetic Ll/p230;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/r230;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Landroid/view/View;

.field public final synthetic d:Lcom/facebook/imagepipeline/request/ImageRequest;


# direct methods
.method public synthetic constructor <init>(Ll/r230;Ljava/lang/String;Landroid/view/View;Lcom/facebook/imagepipeline/request/ImageRequest;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/p230;->a:Ll/r230;

    iput-object p2, p0, Ll/p230;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/p230;->c:Landroid/view/View;

    iput-object p4, p0, Ll/p230;->d:Lcom/facebook/imagepipeline/request/ImageRequest;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/p230;->a:Ll/r230;

    iget-object v1, p0, Ll/p230;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/p230;->c:Landroid/view/View;

    iget-object p0, p0, Ll/p230;->d:Lcom/facebook/imagepipeline/request/ImageRequest;

    invoke-static {v0, v1, v2, p0}, Ll/r230;->c(Ll/r230;Ljava/lang/String;Landroid/view/View;Lcom/facebook/imagepipeline/request/ImageRequest;)V

    return-void
.end method
