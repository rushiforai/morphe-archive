.class public final synthetic Ll/k6g0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/p6g0;

.field public final synthetic b:Lv/VCheckBox;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Lcom/p1/mobile/putong/live/base/data/BLiveStormDanmakuResource;


# direct methods
.method public synthetic constructor <init>(Ll/p6g0;Lv/VCheckBox;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveStormDanmakuResource;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/k6g0;->a:Ll/p6g0;

    iput-object p2, p0, Ll/k6g0;->b:Lv/VCheckBox;

    iput-object p3, p0, Ll/k6g0;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/k6g0;->d:Ljava/lang/String;

    iput-object p5, p0, Ll/k6g0;->e:Lcom/p1/mobile/putong/live/base/data/BLiveStormDanmakuResource;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/k6g0;->a:Ll/p6g0;

    iget-object v1, p0, Ll/k6g0;->b:Lv/VCheckBox;

    iget-object v2, p0, Ll/k6g0;->c:Ljava/lang/String;

    iget-object v3, p0, Ll/k6g0;->d:Ljava/lang/String;

    iget-object p0, p0, Ll/k6g0;->e:Lcom/p1/mobile/putong/live/base/data/BLiveStormDanmakuResource;

    invoke-static {v0, v1, v2, v3, p0}, Ll/p6g0;->M3(Ll/p6g0;Lv/VCheckBox;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveStormDanmakuResource;)V

    return-void
.end method
