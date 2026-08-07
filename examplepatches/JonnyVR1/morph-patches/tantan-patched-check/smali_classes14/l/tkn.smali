.class public final synthetic Ll/tkn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tkn;->a:Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tkn;->a:Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveGameOperationConfig;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;->a(Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationView;Lcom/p1/mobile/putong/live/base/data/BLiveGameOperationConfig;)V

    return-void
.end method
