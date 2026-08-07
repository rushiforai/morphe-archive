.class public final synthetic Ll/tao;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveTemplatesCdnData;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveTemplatesCdnData;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tao;->a:Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveTemplatesCdnData;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tao;->a:Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveTemplatesCdnData;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveIntlTemplateData;

    invoke-static {p0, p1}, Ll/uao;->c(Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveTemplatesCdnData;Lcom/p1/mobile/putong/live/base/data/BLiveIntlTemplateData;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
