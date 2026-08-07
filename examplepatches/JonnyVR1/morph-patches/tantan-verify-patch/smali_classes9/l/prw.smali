.class public final synthetic Ll/prw;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrx/c$a;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffect;

.field public final synthetic b:Ljava/io/File;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffect;Ljava/io/File;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/prw;->a:Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffect;

    iput-object p2, p0, Ll/prw;->b:Ljava/io/File;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/prw;->a:Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffect;

    iget-object p0, p0, Ll/prw;->b:Ljava/io/File;

    check-cast p1, Ll/gcg0;

    invoke-static {v0, p0, p1}, Ll/zrw;->c(Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffect;Ljava/io/File;Ll/gcg0;)V

    return-void
.end method
