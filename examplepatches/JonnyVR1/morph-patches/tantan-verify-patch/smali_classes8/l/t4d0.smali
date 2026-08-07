.class public Ll/t4d0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/t4d0$a;
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/core/data/CoreGiftPriority;

.field public b:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ll/t4d0$a;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "LOW"

    .line 5
    .line 6
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/CoreGiftPriority;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/CoreGiftPriority;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iput-object v0, p0, Ll/t4d0;->a:Lcom/p1/mobile/putong/core/data/CoreGiftPriority;

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    iput-object v0, p0, Ll/t4d0;->b:Ljava/util/ArrayList;

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public a(Ll/t4d0$a;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/t4d0;->b:Ljava/util/ArrayList;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/t4d0;->b:Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-nez v0, :cond_1

    .line 21
    .line 22
    iget-object p0, p0, Ll/t4d0;->b:Ljava/util/ArrayList;

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    :cond_1
    return-void
.end method

.method public b()Ljava/util/ArrayList;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ll/t4d0$a;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/t4d0;->b:Ljava/util/ArrayList;

    .line 2
    .line 3
    return-object p0
.end method

.method public c(Lcom/p1/mobile/putong/core/data/CoreGiftPriority;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/t4d0;->a:Lcom/p1/mobile/putong/core/data/CoreGiftPriority;

    .line 2
    .line 3
    return-void
.end method
