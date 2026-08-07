.class public final synthetic Ll/q230;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/r230$a;


# direct methods
.method public synthetic constructor <init>(Ll/r230$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/q230;->a:Ll/r230$a;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/q230;->a:Ll/r230$a;

    check-cast p1, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    invoke-static {p0, p1}, Ll/r230$a;->b(Ll/r230$a;Lcom/facebook/imagepipeline/request/ImageRequestBuilder;)V

    return-void
.end method
