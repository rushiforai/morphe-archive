.class public final synthetic Ll/zp9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ljava/lang/StringBuilder;

.field public final synthetic b:Lcom/p1/mobile/putong/core/api/s;

.field public final synthetic c:Lcom/p1/mobile/putong/data/DbLinks;

.field public final synthetic d:Z


# direct methods
.method public synthetic constructor <init>(Ljava/lang/StringBuilder;Lcom/p1/mobile/putong/core/api/s;Lcom/p1/mobile/putong/data/DbLinks;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zp9;->a:Ljava/lang/StringBuilder;

    iput-object p2, p0, Ll/zp9;->b:Lcom/p1/mobile/putong/core/api/s;

    iput-object p3, p0, Ll/zp9;->c:Lcom/p1/mobile/putong/data/DbLinks;

    iput-boolean p4, p0, Ll/zp9;->d:Z

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/zp9;->a:Ljava/lang/StringBuilder;

    iget-object v1, p0, Ll/zp9;->b:Lcom/p1/mobile/putong/core/api/s;

    iget-object v2, p0, Ll/zp9;->c:Lcom/p1/mobile/putong/data/DbLinks;

    iget-boolean p0, p0, Ll/zp9;->d:Z

    invoke-static {v0, v1, v2, p0}, Lcom/p1/mobile/putong/core/api/s;->f3(Ljava/lang/StringBuilder;Lcom/p1/mobile/putong/core/api/s;Lcom/p1/mobile/putong/data/DbLinks;Z)Lrx/c;

    move-result-object p0

    return-object p0
.end method
