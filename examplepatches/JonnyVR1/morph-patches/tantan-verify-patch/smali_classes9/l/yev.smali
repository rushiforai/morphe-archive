.class public final synthetic Ll/yev;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/cfv;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;

.field public final synthetic d:Z

.field public final synthetic e:Z

.field public final synthetic f:Ll/x20;


# direct methods
.method public synthetic constructor <init>(Ll/cfv;Ljava/lang/String;Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;ZZLl/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yev;->a:Ll/cfv;

    iput-object p2, p0, Ll/yev;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/yev;->c:Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;

    iput-boolean p4, p0, Ll/yev;->d:Z

    iput-boolean p5, p0, Ll/yev;->e:Z

    iput-object p6, p0, Ll/yev;->f:Ll/x20;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/yev;->a:Ll/cfv;

    iget-object v1, p0, Ll/yev;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/yev;->c:Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;

    iget-boolean v3, p0, Ll/yev;->d:Z

    iget-boolean v4, p0, Ll/yev;->e:Z

    iget-object v5, p0, Ll/yev;->f:Ll/x20;

    invoke-static/range {v0 .. v5}, Ll/cfv;->a4(Ll/cfv;Ljava/lang/String;Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;ZZLl/x20;)V

    return-void
.end method
