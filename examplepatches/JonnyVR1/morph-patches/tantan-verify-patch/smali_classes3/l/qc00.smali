.class public final synthetic Ll/qc00;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/hellogroup/mk/business/base/ui/MKWebView;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/hellogroup/mk/business/base/ui/MKWebView;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qc00;->a:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    iput-object p2, p0, Ll/qc00;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/qc00;->a:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    iget-object p0, p0, Ll/qc00;->b:Ljava/lang/String;

    invoke-static {v0, p0}, Ll/tc00;->a(Lcom/hellogroup/mk/business/base/ui/MKWebView;Ljava/lang/String;)V

    return-void
.end method
