.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/b$a;
    }
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

.field public final b:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/c$b;

.field public final c:Z

.field public final d:I


# direct methods
.method public constructor <init>(Ljava/util/List;Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/c$b;ZI)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;",
            "Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/c$b;",
            "ZI)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/b;->a:Ljava/util/List;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/b;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/c$b;

    .line 7
    .line 8
    iput-boolean p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/b;->c:Z

    .line 9
    .line 10
    iput p4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/b;->d:I

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public a()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/b;->d:I

    .line 2
    .line 3
    return p0
.end method

.method public b()Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/c$b;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/b;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/c$b;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/b;->a:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public d()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/b;->c:Z

    .line 2
    .line 3
    return p0
.end method
