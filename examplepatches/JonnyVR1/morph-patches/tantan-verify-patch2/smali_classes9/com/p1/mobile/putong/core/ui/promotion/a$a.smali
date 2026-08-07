.class public Lcom/p1/mobile/putong/core/ui/promotion/a$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/ui/promotion/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public a:Ljava/lang/String;

.field public b:I

.field public c:Ljava/lang/String;

.field public d:Ljava/lang/String;

.field public e:Z


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

.method public static a(Ljava/lang/String;Ljava/lang/String;Z)Lcom/p1/mobile/putong/core/ui/promotion/a$a;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/ui/promotion/a$a;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/ui/promotion/a$a;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p0, v0, Lcom/p1/mobile/putong/core/ui/promotion/a$a;->c:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p1, v0, Lcom/p1/mobile/putong/core/ui/promotion/a$a;->d:Ljava/lang/String;

    .line 9
    .line 10
    iput-boolean p2, v0, Lcom/p1/mobile/putong/core/ui/promotion/a$a;->e:Z

    .line 11
    .line 12
    const/4 p0, 0x0

    .line 13
    iput p0, v0, Lcom/p1/mobile/putong/core/ui/promotion/a$a;->b:I

    .line 14
    .line 15
    return-object v0
.end method

.method public static b(Ljava/lang/String;Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/promotion/a$a;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/ui/promotion/a$a;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/ui/promotion/a$a;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p0, v0, Lcom/p1/mobile/putong/core/ui/promotion/a$a;->a:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p1, v0, Lcom/p1/mobile/putong/core/ui/promotion/a$a;->c:Ljava/lang/String;

    .line 9
    .line 10
    const/4 p0, 0x1

    .line 11
    iput p0, v0, Lcom/p1/mobile/putong/core/ui/promotion/a$a;->b:I

    .line 12
    .line 13
    return-object v0
.end method
