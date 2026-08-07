.class Lcom/immomo/moment/mediautils/a$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/immomo/moment/mediautils/h$d;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/immomo/moment/mediautils/a;->e(Ljava/lang/String;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/immomo/moment/mediautils/a;


# direct methods
.method public constructor <init>(Lcom/immomo/moment/mediautils/a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/moment/mediautils/a$b;->a:Lcom/immomo/moment/mediautils/a;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onComplete()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/immomo/moment/mediautils/a$b;->a:Lcom/immomo/moment/mediautils/a;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    iput-boolean v1, v0, Lcom/immomo/moment/mediautils/b;->r:Z

    .line 5
    .line 6
    iget-boolean v1, v0, Lcom/immomo/moment/mediautils/b;->k:Z

    .line 7
    .line 8
    if-nez v1, :cond_0

    .line 9
    .line 10
    iget-object v0, v0, Lcom/immomo/moment/mediautils/b;->a:Lcom/immomo/moment/mediautils/b$b;

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    invoke-interface {v0}, Lcom/immomo/moment/mediautils/b$b;->onFinished()V

    .line 15
    .line 16
    .line 17
    :cond_0
    iget-object p0, p0, Lcom/immomo/moment/mediautils/a$b;->a:Lcom/immomo/moment/mediautils/a;

    .line 18
    .line 19
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 20
    .line 21
    .line 22
    return-void
.end method
