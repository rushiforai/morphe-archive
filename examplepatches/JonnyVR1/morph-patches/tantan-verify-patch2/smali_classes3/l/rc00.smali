.class public final synthetic Ll/rc00;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/hellogroup/mk/business/base/ui/MKWebView;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ll/y20;


# direct methods
.method public synthetic constructor <init>(Lcom/hellogroup/mk/business/base/ui/MKWebView;Ljava/lang/String;Ll/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rc00;->a:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    iput-object p2, p0, Ll/rc00;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/rc00;->c:Ll/y20;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/rc00;->a:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    iget-object v1, p0, Ll/rc00;->b:Ljava/lang/String;

    iget-object p0, p0, Ll/rc00;->c:Ll/y20;

    invoke-static {v0, v1, p0}, Ll/tc00;->c(Lcom/hellogroup/mk/business/base/ui/MKWebView;Ljava/lang/String;Ll/y20;)V

    return-void
.end method
