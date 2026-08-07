.class public Lcom/p1/mobile/android/media/a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/android/media/a$b;,
        Lcom/p1/mobile/android/media/a$a;
    }
.end annotation


# instance fields
.field public a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/android/media/a$a;",
            ">;"
        }
    .end annotation
.end field

.field public b:Lcom/p1/mobile/android/media/AudioPlayer$State;

.field public c:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/android/media/a;->a:Ljava/util/List;

    .line 10
    .line 11
    sget-object v0, Lcom/p1/mobile/android/media/AudioPlayer$State;->unknown:Lcom/p1/mobile/android/media/AudioPlayer$State;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/android/media/a;->b:Lcom/p1/mobile/android/media/AudioPlayer$State;

    .line 14
    .line 15
    const/4 v0, -0x1

    .line 16
    iput v0, p0, Lcom/p1/mobile/android/media/a;->c:I

    .line 17
    .line 18
    return-void
.end method

.method public synthetic constructor <init>(Ll/ja1;)V
    .locals 0

    .line 19
    invoke-direct {p0}, Lcom/p1/mobile/android/media/a;-><init>()V

    return-void
.end method

.method public static a()Lcom/p1/mobile/android/media/a;
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/android/media/a$b;->a()Lcom/p1/mobile/android/media/a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method


# virtual methods
.method public b()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/media/a;->b:Lcom/p1/mobile/android/media/AudioPlayer$State;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/android/media/AudioPlayer$State;->playing:Lcom/p1/mobile/android/media/AudioPlayer$State;

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

.method public c()Z
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/android/media/a;->c:I

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public d(Lcom/p1/mobile/android/media/AudioPlayer$State;Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/media/a;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Lcom/p1/mobile/android/media/a$a;

    .line 18
    .line 19
    invoke-interface {v1, p1}, Lcom/p1/mobile/android/media/a$a;->c(Lcom/p1/mobile/android/media/AudioPlayer$State;)V

    .line 20
    .line 21
    .line 22
    invoke-interface {v1, p1, p2}, Lcom/p1/mobile/android/media/a$a;->a(Lcom/p1/mobile/android/media/AudioPlayer$State;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/android/media/a;->b:Lcom/p1/mobile/android/media/AudioPlayer$State;

    .line 27
    .line 28
    return-void
.end method

.method public e(ILandroid/os/Bundle;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/media/a;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Lcom/p1/mobile/android/media/a$a;

    .line 18
    .line 19
    invoke-interface {v1, p1, p2}, Lcom/p1/mobile/android/media/a$a;->b(ILandroid/os/Bundle;)V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    iput p1, p0, Lcom/p1/mobile/android/media/a;->c:I

    .line 24
    .line 25
    return-void
.end method

.method public f(Lcom/p1/mobile/android/media/a$a;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/media/a;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public g(Lcom/p1/mobile/android/media/a$a;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/media/a;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method
