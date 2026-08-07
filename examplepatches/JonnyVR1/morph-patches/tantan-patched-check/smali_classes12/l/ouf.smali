.class public final Ll/ouf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/gtl;


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0010\u0007\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\r\n\u0002\u0010\u0008\n\u0002\u0008\u0006\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J+\u0010\u000c\u001a\u00020\u000b2\u0008\u0010\u0007\u001a\u0004\u0018\u00010\u00062\u0008\u0010\u0008\u001a\u0004\u0018\u00010\u00062\u0006\u0010\n\u001a\u00020\tH\u0016\u00a2\u0006\u0004\u0008\u000c\u0010\rJ+\u0010\u000e\u001a\u00020\u000b2\u0008\u0010\u0007\u001a\u0004\u0018\u00010\u00062\u0008\u0010\u0008\u001a\u0004\u0018\u00010\u00062\u0006\u0010\n\u001a\u00020\tH\u0016\u00a2\u0006\u0004\u0008\u000e\u0010\rJ#\u0010\u0011\u001a\u00020\u000b2\u0008\u0010\u000f\u001a\u0004\u0018\u00010\u00062\u0008\u0010\u0010\u001a\u0004\u0018\u00010\u0006H\u0016\u00a2\u0006\u0004\u0008\u0011\u0010\u0012J\u0019\u0010\u0014\u001a\u00020\u000b2\u0008\u0010\u0013\u001a\u0004\u0018\u00010\u0006H\u0016\u00a2\u0006\u0004\u0008\u0014\u0010\u0015J\u0017\u0010\u0017\u001a\u00020\u000b2\u0006\u0010\u0016\u001a\u00020\tH\u0016\u00a2\u0006\u0004\u0008\u0017\u0010\u0018J\u0017\u0010\u001b\u001a\u00020\u000b2\u0006\u0010\u001a\u001a\u00020\u0019H\u0016\u00a2\u0006\u0004\u0008\u001b\u0010\u001cR\u0014\u0010\u0003\u001a\u00020\u00028\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u001d\u0010\u001e\u00a8\u0006\u001f"
    }
    d2 = {
        "Ll/ouf;",
        "Ll/gtl;",
        "Ll/voq;",
        "filter",
        "<init>",
        "(Ll/voq;)V",
        "",
        "id",
        "key",
        "",
        "value",
        "",
        "g",
        "(Ljava/lang/String;Ljava/lang/String;F)V",
        "updateMakeupStyleValue",
        "makeupKey",
        "filterKey",
        "removeMakeupStyle",
        "(Ljava/lang/String;Ljava/lang/String;)V",
        "path",
        "k",
        "(Ljava/lang/String;)V",
        "intensity",
        "h",
        "(F)V",
        "",
        "type",
        "r",
        "(I)V",
        "a",
        "Ll/voq;",
        "momomediaext_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field private final a:Ll/voq;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/voq;)V
    .locals 0
    .param p1    # Ll/voq;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Ll/ouf;->a:Ll/voq;

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public g(Ljava/lang/String;Ljava/lang/String;F)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Ll/ouf;->a:Ll/voq;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Ll/voq;->updateByteDanceFaceBeautyValue(Ljava/lang/String;Ljava/lang/String;F)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public h(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ouf;->a:Ll/voq;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/voq;->setLookupIntensity(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public k(Ljava/lang/String;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Ll/ouf;->a:Ll/voq;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/voq;->o2(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public r(I)V
    .locals 3

    .line 1
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v2, "switchBeautyType type === "

    .line 8
    .line 9
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v0, v1}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Ll/ouf;->a:Ll/voq;

    .line 27
    .line 28
    invoke-virtual {p0, p1}, Ll/voq;->v2(I)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public removeMakeupStyle(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Ll/ouf;->a:Ll/voq;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/voq;->removeMakeupStyle(Ljava/lang/String;Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public updateMakeupStyleValue(Ljava/lang/String;Ljava/lang/String;F)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Ll/ouf;->a:Ll/voq;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Ll/voq;->updateMakeupStyleValue(Ljava/lang/String;Ljava/lang/String;F)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method
