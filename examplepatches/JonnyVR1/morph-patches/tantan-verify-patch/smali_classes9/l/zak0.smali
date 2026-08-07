.class public final synthetic Ll/zak0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/gbk0;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Z


# direct methods
.method public synthetic constructor <init>(Ll/gbk0;Ljava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zak0;->a:Ll/gbk0;

    iput-object p2, p0, Ll/zak0;->b:Ljava/lang/String;

    iput-boolean p3, p0, Ll/zak0;->c:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/zak0;->a:Ll/gbk0;

    iget-object v1, p0, Ll/zak0;->b:Ljava/lang/String;

    iget-boolean p0, p0, Ll/zak0;->c:Z

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;

    invoke-static {v0, v1, p0, p1}, Ll/gbk0;->c(Ll/gbk0;Ljava/lang/String;ZLcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Ll/vak0;

    move-result-object p0

    return-object p0
.end method
