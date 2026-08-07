.class public final synthetic Ll/kx8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/j;

.field public final synthetic b:Ljava/util/List;

.field public final synthetic c:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/j;Ljava/util/List;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kx8;->a:Lcom/p1/mobile/putong/core/api/j;

    iput-object p2, p0, Ll/kx8;->b:Ljava/util/List;

    iput-boolean p3, p0, Ll/kx8;->c:Z

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/kx8;->a:Lcom/p1/mobile/putong/core/api/j;

    iget-object v1, p0, Ll/kx8;->b:Ljava/util/List;

    iget-boolean p0, p0, Ll/kx8;->c:Z

    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/core/api/j;->m4(Lcom/p1/mobile/putong/core/api/j;Ljava/util/List;Z)V

    return-void
.end method
