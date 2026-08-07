.class public Ll/spf$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/e2m;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/spf;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/android/app/Act;

.field public b:Landroid/view/View;

.field public c:Lcom/p1/mobile/putong/data/User;

.field public d:Lcom/p1/mobile/putong/core/newui/explore/data/ExploreDialogData;

.field public e:Z

.field public f:Z

.field public g:Ljava/lang/String;

.field public h:Z

.field public i:Lcom/p1/mobile/putong/core/data/SwipeDirection;

.field public j:Z

.field public k:Ll/btl;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/newui/explore/data/ExploreDialogData;ZZLjava/lang/String;ZLandroid/view/View;Lcom/p1/mobile/putong/core/data/SwipeDirection;ZLl/btl;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/spf$a;->a:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    iput-object p2, p0, Ll/spf$a;->c:Lcom/p1/mobile/putong/data/User;

    .line 7
    .line 8
    iput-object p3, p0, Ll/spf$a;->d:Lcom/p1/mobile/putong/core/newui/explore/data/ExploreDialogData;

    .line 9
    .line 10
    iput-boolean p4, p0, Ll/spf$a;->e:Z

    .line 11
    .line 12
    iput-boolean p5, p0, Ll/spf$a;->f:Z

    .line 13
    .line 14
    iput-object p6, p0, Ll/spf$a;->g:Ljava/lang/String;

    .line 15
    .line 16
    iput-boolean p7, p0, Ll/spf$a;->h:Z

    .line 17
    .line 18
    iput-object p8, p0, Ll/spf$a;->b:Landroid/view/View;

    .line 19
    .line 20
    iput-object p9, p0, Ll/spf$a;->i:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 21
    .line 22
    iput-boolean p10, p0, Ll/spf$a;->j:Z

    .line 23
    .line 24
    iput-object p11, p0, Ll/spf$a;->k:Ll/btl;

    .line 25
    .line 26
    return-void
.end method


# virtual methods
.method public a()Z
    .locals 1

    .line 1
    iget-object p0, p0, Ll/spf$a;->i:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 4
    .line 5
    if-ne p0, v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method
