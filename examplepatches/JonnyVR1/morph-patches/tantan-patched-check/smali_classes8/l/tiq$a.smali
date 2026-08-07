.class public Ll/tiq$a;
.super Landroid/text/style/ClickableSpan;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/tiq;->b(Ljava/net/URI;ZLjava/lang/String;Ljava/lang/String;)Landroid/text/style/ClickableSpan;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ll/tiq;


# direct methods
.method public constructor <init>(Ll/tiq;ZLjava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/tiq$a;->d:Ll/tiq;

    .line 2
    .line 3
    iput-boolean p2, p0, Ll/tiq$a;->a:Z

    .line 4
    .line 5
    iput-object p3, p0, Ll/tiq$a;->b:Ljava/lang/String;

    .line 6
    .line 7
    iput-object p4, p0, Ll/tiq$a;->c:Ljava/lang/String;

    .line 8
    .line 9
    invoke-direct {p0}, Landroid/text/style/ClickableSpan;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-boolean v0, p0, Ll/tiq$a;->a:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/tiq$a;->b:Ljava/lang/String;

    .line 6
    .line 7
    new-instance v1, Ll/pf60;

    .line 8
    .line 9
    const-string v2, "ext_data"

    .line 10
    .line 11
    iget-object p0, p0, Ll/tiq$a;->c:Ljava/lang/String;

    .line 12
    .line 13
    invoke-direct {v1, v2, p0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    filled-new-array {v1}, [Ll/pf60;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    const-string v1, "e_official_pic_video_handle"

    .line 21
    .line 22
    invoke-static {v1, v0, p0}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    const-string v0, "Chanel4.SchoolIdentifyPage.Shown"

    .line 38
    .line 39
    const-string v1, ""

    .line 40
    .line 41
    invoke-interface {p0, p1, v0, v1}, Ll/r97;->V1(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method
