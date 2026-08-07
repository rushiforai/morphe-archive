.class public final synthetic Ll/h3b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/CoreSuggested;

.field public final synthetic b:Ljava/util/List;

.field public final synthetic c:Ljava/util/HashSet;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/CoreSuggested;Ljava/util/List;Ljava/util/HashSet;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/h3b;->a:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    iput-object p2, p0, Ll/h3b;->b:Ljava/util/List;

    iput-object p3, p0, Ll/h3b;->c:Ljava/util/HashSet;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/h3b;->a:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    iget-object v1, p0, Ll/h3b;->b:Ljava/util/List;

    iget-object p0, p0, Ll/h3b;->c:Ljava/util/HashSet;

    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->h5(Lcom/p1/mobile/putong/core/api/CoreSuggested;Ljava/util/List;Ljava/util/HashSet;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
