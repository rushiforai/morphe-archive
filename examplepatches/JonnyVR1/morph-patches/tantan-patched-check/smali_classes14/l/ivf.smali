.class public final synthetic Ll/ivf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/facebook/GraphRequest$b;


# instance fields
.field public final synthetic a:Lcom/tantanapp/common/data/JsonAdapter;

.field public final synthetic b:Ll/y20;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Landroid/os/Bundle;

.field public final synthetic e:Ll/y20;


# direct methods
.method public synthetic constructor <init>(Lcom/tantanapp/common/data/JsonAdapter;Ll/y20;Ljava/lang/String;Landroid/os/Bundle;Ll/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ivf;->a:Lcom/tantanapp/common/data/JsonAdapter;

    iput-object p2, p0, Ll/ivf;->b:Ll/y20;

    iput-object p3, p0, Ll/ivf;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/ivf;->d:Landroid/os/Bundle;

    iput-object p5, p0, Ll/ivf;->e:Ll/y20;

    return-void
.end method


# virtual methods
.method public final a(Lcom/facebook/GraphResponse;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/ivf;->a:Lcom/tantanapp/common/data/JsonAdapter;

    iget-object v1, p0, Ll/ivf;->b:Ll/y20;

    iget-object v2, p0, Ll/ivf;->c:Ljava/lang/String;

    iget-object v3, p0, Ll/ivf;->d:Landroid/os/Bundle;

    iget-object v4, p0, Ll/ivf;->e:Ll/y20;

    move-object v5, p1

    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/api/api/FacebookApi;->b(Lcom/tantanapp/common/data/JsonAdapter;Ll/y20;Ljava/lang/String;Landroid/os/Bundle;Ll/y20;Lcom/facebook/GraphResponse;)V

    return-void
.end method
