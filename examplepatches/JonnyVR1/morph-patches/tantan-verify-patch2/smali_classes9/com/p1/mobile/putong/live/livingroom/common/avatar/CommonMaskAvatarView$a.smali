.class public Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public a:Ljava/lang/String;

.field public b:Ljava/lang/String;

.field public c:Ljava/lang/String;

.field public d:Ljava/lang/String;

.field public e:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView$a;->a:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView$a;->b:Ljava/lang/String;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView$a;->c:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView$a;->d:Ljava/lang/String;

    .line 13
    .line 14
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-nez v0, :cond_0

    .line 19
    .line 20
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView$a;->a:Ljava/lang/String;

    .line 21
    .line 22
    :cond_0
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    if-nez p1, :cond_1

    .line 27
    .line 28
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView$a;->c:Ljava/lang/String;

    .line 29
    .line 30
    :cond_1
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    if-nez p1, :cond_2

    .line 35
    .line 36
    iput-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView$a;->b:Ljava/lang/String;

    .line 37
    .line 38
    :cond_2
    return-void
.end method


# virtual methods
.method public a()V
    .locals 1

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView$a;->a:Ljava/lang/String;

    .line 4
    .line 5
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView$a;->b:Ljava/lang/String;

    .line 6
    .line 7
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView$a;->c:Ljava/lang/String;

    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView$a;->d:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method
