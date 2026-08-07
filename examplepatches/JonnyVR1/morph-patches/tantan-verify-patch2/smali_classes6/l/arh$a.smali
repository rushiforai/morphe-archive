.class public Ll/arh$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/arh;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/android/app/Act;

.field public b:Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;

.field public c:Z

.field public d:Ll/uul;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a()Ll/arh;
    .locals 2

    .line 1
    new-instance v0, Ll/arh;

    .line 2
    .line 3
    iget-object v1, p0, Ll/arh$a;->a:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/arh;-><init>(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    iget-boolean v1, p0, Ll/arh$a;->c:Z

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ll/fph;->g0(Z)V

    .line 11
    .line 12
    .line 13
    iget-object v1, p0, Ll/arh$a;->b:Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ll/fph;->h0(Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Ll/arh$a;->d:Ll/uul;

    .line 19
    .line 20
    invoke-virtual {v0, p0}, Ll/fph;->f0(Ll/uul;)V

    .line 21
    .line 22
    .line 23
    return-object v0
.end method

.method public b(Lcom/p1/mobile/android/app/Act;)Ll/arh$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/arh$a;->a:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    return-object p0
.end method

.method public c(Ll/uul;)Ll/arh$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/arh$a;->d:Ll/uul;

    .line 2
    .line 3
    return-object p0
.end method

.method public d(Z)Ll/arh$a;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/arh$a;->c:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public e(Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;)Ll/arh$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/arh$a;->b:Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;

    .line 2
    .line 3
    return-object p0
.end method
