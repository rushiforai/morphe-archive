.class public final synthetic Ll/p87;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/scj;


# direct methods
.method public synthetic constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge;

    check-cast p1, Lcom/p1/mobile/putong/app/PutongAct;

    check-cast p2, Ljava/lang/String;

    check-cast p3, Lcom/hellogroup/mk/business/base/ui/MKWebView;

    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge;-><init>(Lcom/p1/mobile/putong/app/PutongAct;Ljava/lang/String;Lcom/hellogroup/mk/business/base/ui/MKWebView;)V

    return-object p0
.end method
