.class public Ll/aiv$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/aiv;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/aiv$a$a;,
        Ll/aiv$a$b;
    }
.end annotation


# instance fields
.field public a:Ljava/lang/String;

.field public b:Ljava/lang/String;

.field public c:Ll/aiv$a$a;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ll/aiv$a$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/aiv$a;->a:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p2, p0, Ll/aiv$a;->b:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p3, p0, Ll/aiv$a;->c:Ll/aiv$a$a;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/aiv$a;->c:Ll/aiv$a$a;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const-string p0, " \u9001\u793c\u7ed3\u679c\u56de\u8c03\u4e3a\u7a7a\uff0c\u8bf7\u68c0\u67e5\u4e1a\u52a1\u662f\u5426\u9700\u8981"

    .line 6
    .line 7
    invoke-static {p0}, Ll/o1j0;->r(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    instance-of v0, p0, Ll/aiv$a$b;

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    check-cast p0, Ll/aiv$a$b;

    .line 16
    .line 17
    invoke-interface {p0, p1}, Ll/aiv$a$b;->a(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_1
    invoke-interface {p0, p1}, Ll/aiv$a$a;->a(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public b()Z
    .locals 1

    .line 1
    iget-object p0, p0, Ll/aiv$a;->a:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "closeH5Skin"

    .line 4
    .line 5
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public c()Z
    .locals 1

    .line 1
    iget-object p0, p0, Ll/aiv$a;->a:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "refreshCoins"

    .line 4
    .line 5
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public d()Z
    .locals 1

    .line 1
    iget-object p0, p0, Ll/aiv$a;->a:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "sendGift"

    .line 4
    .line 5
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public e()Z
    .locals 1

    .line 1
    iget-object p0, p0, Ll/aiv$a;->a:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "showFastRecharge"

    .line 4
    .line 5
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method
