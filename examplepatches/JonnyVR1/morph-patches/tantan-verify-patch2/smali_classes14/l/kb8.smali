.class public final synthetic Ll/kb8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/g;

.field public final synthetic b:Lcom/tencent/mm/opensdk/openapi/IWXAPI;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Z

.field public final synthetic e:Ljava/lang/String;

.field public final synthetic f:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/g;Lcom/tencent/mm/opensdk/openapi/IWXAPI;Ljava/lang/String;ZLjava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kb8;->a:Lcom/p1/mobile/putong/core/api/g;

    iput-object p2, p0, Ll/kb8;->b:Lcom/tencent/mm/opensdk/openapi/IWXAPI;

    iput-object p3, p0, Ll/kb8;->c:Ljava/lang/String;

    iput-boolean p4, p0, Ll/kb8;->d:Z

    iput-object p5, p0, Ll/kb8;->e:Ljava/lang/String;

    iput-boolean p6, p0, Ll/kb8;->f:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/kb8;->a:Lcom/p1/mobile/putong/core/api/g;

    iget-object v1, p0, Ll/kb8;->b:Lcom/tencent/mm/opensdk/openapi/IWXAPI;

    iget-object v2, p0, Ll/kb8;->c:Ljava/lang/String;

    iget-boolean v3, p0, Ll/kb8;->d:Z

    iget-object v4, p0, Ll/kb8;->e:Ljava/lang/String;

    iget-boolean v5, p0, Ll/kb8;->f:Z

    move-object v6, p1

    check-cast v6, Ljava/lang/String;

    invoke-static/range {v0 .. v6}, Lcom/p1/mobile/putong/core/api/g;->S4(Lcom/p1/mobile/putong/core/api/g;Lcom/tencent/mm/opensdk/openapi/IWXAPI;Ljava/lang/String;ZLjava/lang/String;ZLjava/lang/String;)V

    return-void
.end method
