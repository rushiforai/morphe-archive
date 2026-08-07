.class public final synthetic Ll/sni;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrx/c$a;


# instance fields
.field public final synthetic a:Ljava/io/File;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Lcom/p1/mobile/putong/live/base/data/BLiveBeautyFilterConfig;


# direct methods
.method public synthetic constructor <init>(Ljava/io/File;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveBeautyFilterConfig;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/sni;->a:Ljava/io/File;

    iput-object p2, p0, Ll/sni;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/sni;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/sni;->d:Lcom/p1/mobile/putong/live/base/data/BLiveBeautyFilterConfig;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/sni;->a:Ljava/io/File;

    iget-object v1, p0, Ll/sni;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/sni;->c:Ljava/lang/String;

    iget-object p0, p0, Ll/sni;->d:Lcom/p1/mobile/putong/live/base/data/BLiveBeautyFilterConfig;

    check-cast p1, Ll/gcg0;

    invoke-static {v0, v1, v2, p0, p1}, Ll/coi;->h(Ljava/io/File;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveBeautyFilterConfig;Ll/gcg0;)V

    return-void
.end method
