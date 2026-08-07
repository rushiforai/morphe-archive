.class public final synthetic Ll/mvs;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/bws;


# direct methods
.method public synthetic constructor <init>(Ll/bws;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mvs;->a:Ll/bws;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mvs;->a:Ll/bws;

    check-cast p1, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;

    invoke-static {p0, p1}, Ll/bws;->d3(Ll/bws;Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;)Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;

    move-result-object p0

    return-object p0
.end method
