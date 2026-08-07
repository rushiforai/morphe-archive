.class public Ll/oiq$a;
.super Landroid/text/style/ClickableSpan;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/oiq;->b(Ljava/net/URI;ZLjava/lang/String;Ljava/lang/String;)Landroid/text/style/ClickableSpan;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ljava/net/URI;

.field public final synthetic e:Ll/oiq;


# direct methods
.method public constructor <init>(Ll/oiq;ZLjava/lang/String;Ljava/lang/String;Ljava/net/URI;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/oiq$a;->e:Ll/oiq;

    .line 2
    .line 3
    iput-boolean p2, p0, Ll/oiq$a;->a:Z

    .line 4
    .line 5
    iput-object p3, p0, Ll/oiq$a;->b:Ljava/lang/String;

    .line 6
    .line 7
    iput-object p4, p0, Ll/oiq$a;->c:Ljava/lang/String;

    .line 8
    .line 9
    iput-object p5, p0, Ll/oiq$a;->d:Ljava/net/URI;

    .line 10
    .line 11
    invoke-direct {p0}, Landroid/text/style/ClickableSpan;-><init>()V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4

    .line 1
    iget-boolean v0, p0, Ll/oiq$a;->a:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/oiq$a;->b:Ljava/lang/String;

    .line 6
    .line 7
    new-instance v1, Ll/pf60;

    .line 8
    .line 9
    const-string v2, "ext_data"

    .line 10
    .line 11
    iget-object v3, p0, Ll/oiq$a;->c:Ljava/lang/String;

    .line 12
    .line 13
    invoke-direct {v1, v2, v3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    filled-new-array {v1}, [Ll/pf60;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    const-string v2, "e_official_pic_video_handle"

    .line 21
    .line 22
    invoke-static {v2, v0, v1}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-static {p1}, Ll/bnl0;->D(Landroid/content/Context;)Landroid/app/Activity;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    iget-object p0, p0, Ll/oiq$a;->d:Ljava/net/URI;

    .line 34
    .line 35
    invoke-virtual {p0}, Ljava/net/URI;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-static {p1, p0}, Ll/nae0;->m(Landroid/app/Activity;Landroid/net/Uri;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method
