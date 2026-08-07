.class public Ll/dr00;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/dr00$a;
    }
.end annotation


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

.method public static final a(Ljava/lang/String;)Ll/dr00$a;
    .locals 1

    .line 1
    new-instance v0, Ll/dr00$a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/dr00$a;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static final b(Ljava/lang/String;FLjava/util/List;)Lcom/immomo/moment/mediautils/cmds/EffectModel;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "F",
            "Ljava/util/List<",
            "Lcom/immomo/moment/mediautils/cmds/VideoCut;",
            ">;)",
            "Lcom/immomo/moment/mediautils/cmds/EffectModel;"
        }
    .end annotation

    .line 1
    invoke-static {p0}, Ll/dr00;->a(Ljava/lang/String;)Ll/dr00$a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p2}, Ll/dr00$a;->c(Ljava/util/Collection;)Ll/dr00$a;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const/4 p2, 0x1

    .line 10
    invoke-virtual {p0, p1, p2}, Ll/dr00$a;->e(FZ)Ll/dr00$a;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p0}, Ll/dr00$a;->d()Lcom/immomo/moment/mediautils/cmds/EffectModel;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public static final c(Ljava/lang/String;FLjava/lang/String;FIILjava/util/List;)Lcom/immomo/moment/mediautils/cmds/EffectModel;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "F",
            "Ljava/lang/String;",
            "FII",
            "Ljava/util/List<",
            "Lcom/immomo/moment/mediautils/cmds/VideoCut;",
            ">;)",
            "Lcom/immomo/moment/mediautils/cmds/EffectModel;"
        }
    .end annotation

    .line 1
    invoke-static {p0}, Ll/dr00;->a(Ljava/lang/String;)Ll/dr00$a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p0, p1, v0}, Ll/dr00$a;->e(FZ)Ll/dr00$a;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0, p6}, Ll/dr00$a;->c(Ljava/util/Collection;)Ll/dr00$a;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    const/4 p6, 0x1

    .line 15
    invoke-virtual/range {p1 .. p6}, Ll/dr00$a;->b(Ljava/lang/String;FIIZ)Ll/dr00$a;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Ll/dr00$a;->d()Lcom/immomo/moment/mediautils/cmds/EffectModel;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method
