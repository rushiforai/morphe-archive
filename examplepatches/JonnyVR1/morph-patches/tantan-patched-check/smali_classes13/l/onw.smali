.class public final synthetic Ll/onw;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/momo/momortc/MMRtcHttpUtils;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Lcom/momo/momortc/MMRtcHttpUtils$MMRtcHttpCallback;


# direct methods
.method public synthetic constructor <init>(Lcom/momo/momortc/MMRtcHttpUtils;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/momo/momortc/MMRtcHttpUtils$MMRtcHttpCallback;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/onw;->a:Lcom/momo/momortc/MMRtcHttpUtils;

    iput-object p2, p0, Ll/onw;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/onw;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/onw;->d:Ljava/lang/String;

    iput-object p5, p0, Ll/onw;->e:Lcom/momo/momortc/MMRtcHttpUtils$MMRtcHttpCallback;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/onw;->a:Lcom/momo/momortc/MMRtcHttpUtils;

    iget-object v1, p0, Ll/onw;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/onw;->c:Ljava/lang/String;

    iget-object v3, p0, Ll/onw;->d:Ljava/lang/String;

    iget-object p0, p0, Ll/onw;->e:Lcom/momo/momortc/MMRtcHttpUtils$MMRtcHttpCallback;

    invoke-static {v0, v1, v2, v3, p0}, Lcom/momo/momortc/MMRtcHttpUtils;->a(Lcom/momo/momortc/MMRtcHttpUtils;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/momo/momortc/MMRtcHttpUtils$MMRtcHttpCallback;)V

    return-void
.end method
