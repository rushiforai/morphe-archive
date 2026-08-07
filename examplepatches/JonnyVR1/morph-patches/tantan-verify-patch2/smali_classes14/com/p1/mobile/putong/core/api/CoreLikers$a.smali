.class public Lcom/p1/mobile/putong/core/api/CoreLikers$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/api/CoreLikers;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/core/api/CoreLikers$LikersTriggerBy;

.field public b:I

.field public c:I

.field public d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public e:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public f:Ljava/lang/String;

.field public g:Lcom/p1/mobile/putong/core/data/Figure;

.field public h:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public i:Lcom/p1/mobile/putong/core/data/ShowOnlineForWhoIMeet;


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

.method public static a(Lcom/p1/mobile/putong/core/api/CoreLikers$LikersTriggerBy;IILjava/util/List;Ljava/util/List;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Figure;)Lcom/p1/mobile/putong/core/api/CoreLikers$a;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/api/CoreLikers$LikersTriggerBy;",
            "II",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/core/data/Figure;",
            ")",
            "Lcom/p1/mobile/putong/core/api/CoreLikers$a;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/api/CoreLikers$a;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/api/CoreLikers$a;-><init>()V

    .line 4
    .line 5
    .line 6
    if-nez p0, :cond_0

    .line 7
    .line 8
    sget-object p0, Lcom/p1/mobile/putong/core/api/CoreLikers$LikersTriggerBy;->normal:Lcom/p1/mobile/putong/core/api/CoreLikers$LikersTriggerBy;

    .line 9
    .line 10
    :cond_0
    iput-object p0, v0, Lcom/p1/mobile/putong/core/api/CoreLikers$a;->a:Lcom/p1/mobile/putong/core/api/CoreLikers$LikersTriggerBy;

    .line 11
    .line 12
    iput p1, v0, Lcom/p1/mobile/putong/core/api/CoreLikers$a;->b:I

    .line 13
    .line 14
    iput p2, v0, Lcom/p1/mobile/putong/core/api/CoreLikers$a;->c:I

    .line 15
    .line 16
    iput-object p3, v0, Lcom/p1/mobile/putong/core/api/CoreLikers$a;->d:Ljava/util/List;

    .line 17
    .line 18
    iput-object p4, v0, Lcom/p1/mobile/putong/core/api/CoreLikers$a;->e:Ljava/util/List;

    .line 19
    .line 20
    iput-object p5, v0, Lcom/p1/mobile/putong/core/api/CoreLikers$a;->f:Ljava/lang/String;

    .line 21
    .line 22
    iput-object p6, v0, Lcom/p1/mobile/putong/core/api/CoreLikers$a;->g:Lcom/p1/mobile/putong/core/data/Figure;

    .line 23
    .line 24
    return-object v0
.end method

.method public static b(Lcom/p1/mobile/putong/core/api/CoreLikers$LikersTriggerBy;IILjava/util/List;Ljava/util/List;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Figure;Ljava/util/List;)Lcom/p1/mobile/putong/core/api/CoreLikers$a;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/api/CoreLikers$LikersTriggerBy;",
            "II",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/core/data/Figure;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;)",
            "Lcom/p1/mobile/putong/core/api/CoreLikers$a;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/api/CoreLikers$a;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/api/CoreLikers$a;-><init>()V

    .line 4
    .line 5
    .line 6
    if-nez p0, :cond_0

    .line 7
    .line 8
    sget-object p0, Lcom/p1/mobile/putong/core/api/CoreLikers$LikersTriggerBy;->normal:Lcom/p1/mobile/putong/core/api/CoreLikers$LikersTriggerBy;

    .line 9
    .line 10
    :cond_0
    iput-object p0, v0, Lcom/p1/mobile/putong/core/api/CoreLikers$a;->a:Lcom/p1/mobile/putong/core/api/CoreLikers$LikersTriggerBy;

    .line 11
    .line 12
    iput p1, v0, Lcom/p1/mobile/putong/core/api/CoreLikers$a;->b:I

    .line 13
    .line 14
    iput p2, v0, Lcom/p1/mobile/putong/core/api/CoreLikers$a;->c:I

    .line 15
    .line 16
    iput-object p3, v0, Lcom/p1/mobile/putong/core/api/CoreLikers$a;->d:Ljava/util/List;

    .line 17
    .line 18
    iput-object p4, v0, Lcom/p1/mobile/putong/core/api/CoreLikers$a;->e:Ljava/util/List;

    .line 19
    .line 20
    iput-object p5, v0, Lcom/p1/mobile/putong/core/api/CoreLikers$a;->f:Ljava/lang/String;

    .line 21
    .line 22
    iput-object p6, v0, Lcom/p1/mobile/putong/core/api/CoreLikers$a;->g:Lcom/p1/mobile/putong/core/data/Figure;

    .line 23
    .line 24
    iput-object p7, v0, Lcom/p1/mobile/putong/core/api/CoreLikers$a;->h:Ljava/util/List;

    .line 25
    .line 26
    return-object v0
.end method

.method public static c(Lcom/p1/mobile/putong/core/api/CoreLikers$LikersTriggerBy;IILjava/util/List;Ljava/util/List;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Figure;Ljava/util/List;Lcom/p1/mobile/putong/core/data/ShowOnlineForWhoIMeet;)Lcom/p1/mobile/putong/core/api/CoreLikers$a;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/api/CoreLikers$LikersTriggerBy;",
            "II",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/core/data/Figure;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;",
            "Lcom/p1/mobile/putong/core/data/ShowOnlineForWhoIMeet;",
            ")",
            "Lcom/p1/mobile/putong/core/api/CoreLikers$a;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/api/CoreLikers$a;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/api/CoreLikers$a;-><init>()V

    .line 4
    .line 5
    .line 6
    if-nez p0, :cond_0

    .line 7
    .line 8
    sget-object p0, Lcom/p1/mobile/putong/core/api/CoreLikers$LikersTriggerBy;->normal:Lcom/p1/mobile/putong/core/api/CoreLikers$LikersTriggerBy;

    .line 9
    .line 10
    :cond_0
    iput-object p0, v0, Lcom/p1/mobile/putong/core/api/CoreLikers$a;->a:Lcom/p1/mobile/putong/core/api/CoreLikers$LikersTriggerBy;

    .line 11
    .line 12
    iput p1, v0, Lcom/p1/mobile/putong/core/api/CoreLikers$a;->b:I

    .line 13
    .line 14
    iput p2, v0, Lcom/p1/mobile/putong/core/api/CoreLikers$a;->c:I

    .line 15
    .line 16
    iput-object p3, v0, Lcom/p1/mobile/putong/core/api/CoreLikers$a;->d:Ljava/util/List;

    .line 17
    .line 18
    iput-object p4, v0, Lcom/p1/mobile/putong/core/api/CoreLikers$a;->e:Ljava/util/List;

    .line 19
    .line 20
    iput-object p5, v0, Lcom/p1/mobile/putong/core/api/CoreLikers$a;->f:Ljava/lang/String;

    .line 21
    .line 22
    iput-object p6, v0, Lcom/p1/mobile/putong/core/api/CoreLikers$a;->g:Lcom/p1/mobile/putong/core/data/Figure;

    .line 23
    .line 24
    iput-object p7, v0, Lcom/p1/mobile/putong/core/api/CoreLikers$a;->h:Ljava/util/List;

    .line 25
    .line 26
    iput-object p8, v0, Lcom/p1/mobile/putong/core/api/CoreLikers$a;->i:Lcom/p1/mobile/putong/core/data/ShowOnlineForWhoIMeet;

    .line 27
    .line 28
    return-object v0
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
