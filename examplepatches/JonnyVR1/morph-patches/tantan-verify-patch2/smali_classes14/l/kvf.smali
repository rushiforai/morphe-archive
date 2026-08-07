.class public final synthetic Ll/kvf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/facebook/GraphRequest$b;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/api/api/FacebookApi;

.field public final synthetic b:Lcom/tantanapp/common/data/JsonAdapter;

.field public final synthetic c:Lrx/subjects/a;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Landroid/os/Bundle;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/api/api/FacebookApi;Lcom/tantanapp/common/data/JsonAdapter;Lrx/subjects/a;Ljava/lang/String;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kvf;->a:Lcom/p1/mobile/putong/api/api/FacebookApi;

    iput-object p2, p0, Ll/kvf;->b:Lcom/tantanapp/common/data/JsonAdapter;

    iput-object p3, p0, Ll/kvf;->c:Lrx/subjects/a;

    iput-object p4, p0, Ll/kvf;->d:Ljava/lang/String;

    iput-object p5, p0, Ll/kvf;->e:Landroid/os/Bundle;

    return-void
.end method


# virtual methods
.method public final a(Lcom/facebook/GraphResponse;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/kvf;->a:Lcom/p1/mobile/putong/api/api/FacebookApi;

    iget-object v1, p0, Ll/kvf;->b:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v2, p0, Ll/kvf;->c:Lrx/subjects/a;

    iget-object v3, p0, Ll/kvf;->d:Ljava/lang/String;

    iget-object v4, p0, Ll/kvf;->e:Landroid/os/Bundle;

    move-object v5, p1

    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/api/api/FacebookApi;->c(Lcom/p1/mobile/putong/api/api/FacebookApi;Lcom/tantanapp/common/data/JsonAdapter;Lrx/subjects/a;Ljava/lang/String;Landroid/os/Bundle;Lcom/facebook/GraphResponse;)V

    return-void
.end method
