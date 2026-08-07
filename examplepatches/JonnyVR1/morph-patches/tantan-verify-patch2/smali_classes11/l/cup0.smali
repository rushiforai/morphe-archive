.class public final synthetic Ll/cup0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/WebViewFrag;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/WebViewFrag;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/cup0;->a:Lcom/p1/mobile/putong/core/ui/WebViewFrag;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cup0;->a:Lcom/p1/mobile/putong/core/ui/WebViewFrag;

    check-cast p1, Ljava/lang/String;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/WebViewFrag;->O4(Lcom/p1/mobile/putong/core/ui/WebViewFrag;Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
