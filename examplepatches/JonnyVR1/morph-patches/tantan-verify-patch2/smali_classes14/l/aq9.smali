.class public final synthetic Ll/aq9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ljava/lang/StringBuilder;

.field public final synthetic b:Lcom/p1/mobile/putong/core/api/s;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/StringBuilder;Lcom/p1/mobile/putong/core/api/s;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/aq9;->a:Ljava/lang/StringBuilder;

    iput-object p2, p0, Ll/aq9;->b:Lcom/p1/mobile/putong/core/api/s;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/aq9;->a:Ljava/lang/StringBuilder;

    iget-object p0, p0, Ll/aq9;->b:Lcom/p1/mobile/putong/core/api/s;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/api/s;->l3(Ljava/lang/StringBuilder;Lcom/p1/mobile/putong/core/api/s;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
