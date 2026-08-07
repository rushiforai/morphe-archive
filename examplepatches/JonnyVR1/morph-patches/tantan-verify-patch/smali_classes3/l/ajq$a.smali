.class public Ll/ajq$a;
.super Landroid/text/style/ClickableSpan;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/ajq;->b(Ljava/net/URI;ZLjava/lang/String;Ljava/lang/String;)Landroid/text/style/ClickableSpan;
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

.field public final synthetic e:Ll/ajq;


# direct methods
.method public constructor <init>(Ll/ajq;ZLjava/lang/String;Ljava/lang/String;Ljava/net/URI;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ajq$a;->e:Ll/ajq;

    .line 2
    .line 3
    iput-boolean p2, p0, Ll/ajq$a;->a:Z

    .line 4
    .line 5
    iput-object p3, p0, Ll/ajq$a;->b:Ljava/lang/String;

    .line 6
    .line 7
    iput-object p4, p0, Ll/ajq$a;->c:Ljava/lang/String;

    .line 8
    .line 9
    iput-object p5, p0, Ll/ajq$a;->d:Ljava/net/URI;

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
    iget-boolean v0, p0, Ll/ajq$a;->a:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/ajq$a;->b:Ljava/lang/String;

    .line 6
    .line 7
    new-instance v1, Ll/pf60;

    .line 8
    .line 9
    const-string v2, "ext_data"

    .line 10
    .line 11
    iget-object v3, p0, Ll/ajq$a;->c:Ljava/lang/String;

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
    iget-object v0, p0, Ll/ajq$a;->b:Ljava/lang/String;

    .line 26
    .line 27
    sget-object v1, Ll/uqb0;->b0:Ll/sre0;

    .line 28
    .line 29
    iget-object v1, v1, Ll/sre0;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 30
    .line 31
    invoke-interface {v1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->banStatus:Lcom/p1/mobile/putong/data/BanStatus;

    .line 36
    .line 37
    iget v1, v1, Lcom/p1/mobile/putong/data/BanStatus;->code:I

    .line 38
    .line 39
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    const-string v2, "ban_type"

    .line 44
    .line 45
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    filled-new-array {v1}, [Ll/pf60;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    const-string v2, "e_assistant_appeal"

    .line 54
    .line 55
    invoke-static {v2, v0, v1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 56
    .line 57
    .line 58
    iget-object v0, p0, Ll/ajq$a;->d:Ljava/net/URI;

    .line 59
    .line 60
    const/4 v1, 0x0

    .line 61
    invoke-static {v0, v1}, Ll/ajq;->h(Ljava/net/URI;Z)V

    .line 62
    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_0
    iget-object v0, p0, Ll/ajq$a;->c:Ljava/lang/String;

    .line 66
    .line 67
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    if-nez v0, :cond_1

    .line 72
    .line 73
    iget-object v0, p0, Ll/ajq$a;->c:Ljava/lang/String;

    .line 74
    .line 75
    iget-object v1, p0, Ll/ajq$a;->b:Ljava/lang/String;

    .line 76
    .line 77
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    :cond_1
    :goto_0
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    invoke-static {p1}, Ll/bnl0;->D(Landroid/content/Context;)Landroid/app/Activity;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    iget-object p0, p0, Ll/ajq$a;->d:Ljava/net/URI;

    .line 89
    .line 90
    invoke-virtual {p0}, Ljava/net/URI;->toString()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    invoke-static {p1, p0}, Ll/nae0;->m(Landroid/app/Activity;Landroid/net/Uri;)V

    .line 99
    .line 100
    .line 101
    return-void
.end method

.method public updateDrawState(Landroid/text/TextPaint;)V
    .locals 0
    .param p1    # Landroid/text/TextPaint;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Landroid/text/style/ClickableSpan;->updateDrawState(Landroid/text/TextPaint;)V

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x0

    .line 5
    invoke-virtual {p1, p0}, Landroid/graphics/Paint;->setUnderlineText(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
