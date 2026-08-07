.class public Ll/fsb0$f;
.super Ll/am2$b;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/fsb0;->E0(Lcom/facebook/drawee/view/DraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;Ll/fn2;Lv/fresco/subscaleview/SubsamplingScaleImageView;Ljava/lang/String;Landroid/util/Pair;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic c:Lcom/p1/mobile/putong/data/Picture$ImageUri;

.field public final synthetic d:Ll/fsb0;


# direct methods
.method public constructor <init>(Ll/fsb0;Ll/fn2;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/fsb0$f;->d:Ll/fsb0;

    .line 2
    .line 3
    iput-object p3, p0, Ll/fsb0$f;->c:Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 4
    .line 5
    invoke-direct {p0, p2}, Ll/am2$b;-><init>(Ll/fn2;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/am2$b;->a(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/fsb0$f;->c:Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-static {p0}, Lcom/p1/mobile/putong/util/TrackMediaUploadUtil;->Z(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public d(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Ll/am2$b;->d(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/fsb0$f;->c:Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-static {p0}, Lcom/p1/mobile/putong/util/TrackMediaUploadUtil;->Z(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method
