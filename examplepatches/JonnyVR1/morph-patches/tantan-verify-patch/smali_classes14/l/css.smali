.class public final synthetic Ll/css;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/css;->a:Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/css;->a:Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;

    check-cast p1, Ll/mwl;

    invoke-static {p0, p1}, Ll/fss;->c(Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;Ll/mwl;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
