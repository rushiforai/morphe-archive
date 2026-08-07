.class public Ll/pd00$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/tm80;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/pd00;->E()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/pd00;


# direct methods
.method public constructor <init>(Ll/pd00;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/pd00$a;->a:Ll/pd00;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;)Z
    .locals 2

    .line 1
    sget-object v0, Ll/zxp;->INSTANCE:Ll/zxp;

    .line 2
    .line 3
    iget-object p0, p0, Ll/pd00$a;->a:Ll/pd00;

    .line 4
    .line 5
    iget-object v1, p0, Ll/pd00;->g:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 6
    .line 7
    invoke-static {p0}, Ll/pd00;->f(Ll/pd00;)Lcom/p1/mobile/putong/app/PutongAct;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {v0, v1, p1, p0}, Ll/zxp;->b(Landroid/webkit/WebView;Ljava/lang/String;Landroid/content/Context;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method public b(Ljava/lang/String;)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method
