.class public Lcom/facebook/cache/disk/a$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/facebook/cache/disk/e;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/facebook/cache/disk/a;->get()Lcom/facebook/cache/disk/e;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/facebook/cache/disk/a;


# direct methods
.method public constructor <init>(Lcom/facebook/cache/disk/a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/facebook/cache/disk/a$a;->a:Lcom/facebook/cache/disk/a;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Lcom/facebook/cache/disk/b$a;Lcom/facebook/cache/disk/b$a;)I
    .locals 2

    .line 1
    invoke-interface {p1}, Lcom/facebook/cache/disk/b$a;->getTimestamp()J

    .line 2
    .line 3
    .line 4
    move-result-wide p0

    .line 5
    invoke-interface {p2}, Lcom/facebook/cache/disk/b$a;->getTimestamp()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    cmp-long p2, p0, v0

    .line 10
    .line 11
    if-gez p2, :cond_0

    .line 12
    .line 13
    const/4 p0, -0x1

    .line 14
    return p0

    .line 15
    :cond_0
    cmp-long p0, v0, p0

    .line 16
    .line 17
    if-nez p0, :cond_1

    .line 18
    .line 19
    const/4 p0, 0x0

    .line 20
    return p0

    .line 21
    :cond_1
    const/4 p0, 0x1

    .line 22
    return p0
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    .line 1
    check-cast p1, Lcom/facebook/cache/disk/b$a;

    .line 2
    .line 3
    check-cast p2, Lcom/facebook/cache/disk/b$a;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/facebook/cache/disk/a$a;->a(Lcom/facebook/cache/disk/b$a;Lcom/facebook/cache/disk/b$a;)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method
