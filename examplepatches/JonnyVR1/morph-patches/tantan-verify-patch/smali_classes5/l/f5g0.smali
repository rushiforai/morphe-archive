.class public final synthetic Ll/f5g0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/data/EmojiCacheData;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/data/EmojiCacheData;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/f5g0;->a:Lcom/p1/mobile/putong/core/data/EmojiCacheData;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/f5g0;->a:Lcom/p1/mobile/putong/core/data/EmojiCacheData;

    invoke-static {p0}, Ll/g5g0;->a(Lcom/p1/mobile/putong/core/data/EmojiCacheData;)V

    return-void
.end method
