.class public Ll/ile;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private final a:Ll/rdl0;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field private final b:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/kt2;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 2

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
    iput-object v0, p0, Ll/ile;->b:Ljava/util/List;

    .line 10
    .line 11
    new-instance v1, Ll/rdl0;

    .line 12
    .line 13
    invoke-direct {v1, v0}, Ll/rdl0;-><init>(Ljava/util/List;)V

    .line 14
    .line 15
    .line 16
    iput-object v1, p0, Ll/ile;->a:Ll/rdl0;

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public a(Ll/kt2;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ile;->a:Ll/rdl0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/kqf0;->Z()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-lez v1, :cond_0

    .line 14
    .line 15
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    add-int/lit8 v1, v1, -0x1

    .line 20
    .line 21
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Ll/kt2;

    .line 26
    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_0

    .line 34
    .line 35
    return-void

    .line 36
    :cond_0
    iget-object p0, p0, Ll/ile;->a:Ll/rdl0;

    .line 37
    .line 38
    invoke-virtual {p0, p1}, Ll/kqf0;->W(Ll/kt2;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public b(Ll/kt2;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ile;->a:Ll/rdl0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/kqf0;->Z()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-lez v1, :cond_0

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Ll/kt2;

    .line 21
    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_0

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    if-eqz p1, :cond_1

    .line 32
    .line 33
    iget-object p0, p0, Ll/ile;->a:Ll/rdl0;

    .line 34
    .line 35
    invoke-virtual {p0, p1}, Ll/kqf0;->X(Ll/kt2;)V

    .line 36
    .line 37
    .line 38
    :cond_1
    :goto_0
    return-void
.end method

.method public c()Ll/rdl0;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ile;->a:Ll/rdl0;

    .line 2
    .line 3
    return-object p0
.end method
