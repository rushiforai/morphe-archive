.class public final synthetic Ll/uv8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/j;

.field public final synthetic b:Lcom/p1/mobile/putong/data/DbLinks;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/j;Lcom/p1/mobile/putong/data/DbLinks;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/uv8;->a:Lcom/p1/mobile/putong/core/api/j;

    iput-object p2, p0, Ll/uv8;->b:Lcom/p1/mobile/putong/data/DbLinks;

    iput-object p3, p0, Ll/uv8;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/uv8;->d:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/uv8;->a:Lcom/p1/mobile/putong/core/api/j;

    iget-object v1, p0, Ll/uv8;->b:Lcom/p1/mobile/putong/data/DbLinks;

    iget-object v2, p0, Ll/uv8;->c:Ljava/lang/String;

    iget-object p0, p0, Ll/uv8;->d:Ljava/lang/String;

    invoke-static {v0, v1, v2, p0}, Lcom/p1/mobile/putong/core/api/j;->x3(Lcom/p1/mobile/putong/core/api/j;Lcom/p1/mobile/putong/data/DbLinks;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
