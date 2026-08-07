.class public final Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/b$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# instance fields
.field public a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;"
        }
    .end annotation
.end field

.field public b:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/c$b;

.field public c:Z

.field public d:I


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
.method public a()Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/b;
    .locals 4

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/b;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/b$a;->a:Ljava/util/List;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/b$a;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/c$b;

    .line 6
    .line 7
    iget-boolean v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/b$a;->c:Z

    .line 8
    .line 9
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/b$a;->d:I

    .line 10
    .line 11
    invoke-direct {v0, v1, v2, v3, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/b;-><init>(Ljava/util/List;Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/c$b;ZI)V

    .line 12
    .line 13
    .line 14
    return-object v0
.end method

.method public b(I)Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/b$a;
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/b$a;->d:I

    .line 2
    .line 3
    return-object p0
.end method

.method public c(Z)Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/b$a;
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/b$a;->c:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public d(Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/c$b;)Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/b$a;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/b$a;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/c$b;

    .line 2
    .line 3
    return-object p0
.end method

.method public e(Ljava/util/List;)Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/b$a;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;)",
            "Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/b$a;"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/b$a;->a:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method
