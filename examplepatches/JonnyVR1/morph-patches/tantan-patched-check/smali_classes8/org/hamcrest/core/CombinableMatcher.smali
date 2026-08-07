.class public Lorg/hamcrest/core/CombinableMatcher;
.super Lorg/hamcrest/TypeSafeDiagnosingMatcher;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/hamcrest/core/CombinableMatcher$CombinableEitherMatcher;,
        Lorg/hamcrest/core/CombinableMatcher$CombinableBothMatcher;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lorg/hamcrest/TypeSafeDiagnosingMatcher<",
        "TT;>;"
    }
.end annotation


# instance fields
.field private final matcher:Lorg/hamcrest/Matcher;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/hamcrest/Matcher<",
            "-TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lorg/hamcrest/Matcher;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/hamcrest/Matcher<",
            "-TT;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lorg/hamcrest/TypeSafeDiagnosingMatcher;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/hamcrest/core/CombinableMatcher;->matcher:Lorg/hamcrest/Matcher;

    .line 5
    .line 6
    return-void
.end method

.method public static both(Lorg/hamcrest/Matcher;)Lorg/hamcrest/core/CombinableMatcher$CombinableBothMatcher;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<",
            "LHS:Ljava/lang/Object;",
            ">(",
            "Lorg/hamcrest/Matcher<",
            "-T",
            "LHS;",
            ">;)",
            "Lorg/hamcrest/core/CombinableMatcher$CombinableBothMatcher<",
            "T",
            "LHS;",
            ">;"
        }
    .end annotation

    .annotation runtime Lorg/hamcrest/Factory;
    .end annotation

    .line 1
    new-instance v0, Lorg/hamcrest/core/CombinableMatcher$CombinableBothMatcher;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lorg/hamcrest/core/CombinableMatcher$CombinableBothMatcher;-><init>(Lorg/hamcrest/Matcher;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static either(Lorg/hamcrest/Matcher;)Lorg/hamcrest/core/CombinableMatcher$CombinableEitherMatcher;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<",
            "LHS:Ljava/lang/Object;",
            ">(",
            "Lorg/hamcrest/Matcher<",
            "-T",
            "LHS;",
            ">;)",
            "Lorg/hamcrest/core/CombinableMatcher$CombinableEitherMatcher<",
            "T",
            "LHS;",
            ">;"
        }
    .end annotation

    .annotation runtime Lorg/hamcrest/Factory;
    .end annotation

    .line 1
    new-instance v0, Lorg/hamcrest/core/CombinableMatcher$CombinableEitherMatcher;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lorg/hamcrest/core/CombinableMatcher$CombinableEitherMatcher;-><init>(Lorg/hamcrest/Matcher;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method private templatedListWith(Lorg/hamcrest/Matcher;)Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/hamcrest/Matcher<",
            "-TT;>;)",
            "Ljava/util/ArrayList<",
            "Lorg/hamcrest/Matcher<",
            "-TT;>;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lorg/hamcrest/core/CombinableMatcher;->matcher:Lorg/hamcrest/Matcher;

    .line 7
    .line 8
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    return-object v0
.end method


# virtual methods
.method public and(Lorg/hamcrest/Matcher;)Lorg/hamcrest/core/CombinableMatcher;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/hamcrest/Matcher<",
            "-TT;>;)",
            "Lorg/hamcrest/core/CombinableMatcher<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Lorg/hamcrest/core/CombinableMatcher;

    .line 2
    .line 3
    new-instance v1, Lorg/hamcrest/core/AllOf;

    .line 4
    .line 5
    invoke-direct {p0, p1}, Lorg/hamcrest/core/CombinableMatcher;->templatedListWith(Lorg/hamcrest/Matcher;)Ljava/util/ArrayList;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-direct {v1, p0}, Lorg/hamcrest/core/AllOf;-><init>(Ljava/lang/Iterable;)V

    .line 10
    .line 11
    .line 12
    invoke-direct {v0, v1}, Lorg/hamcrest/core/CombinableMatcher;-><init>(Lorg/hamcrest/Matcher;)V

    .line 13
    .line 14
    .line 15
    return-object v0
.end method

.method public describeTo(Lorg/hamcrest/Description;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/hamcrest/core/CombinableMatcher;->matcher:Lorg/hamcrest/Matcher;

    .line 2
    .line 3
    invoke-interface {p1, p0}, Lorg/hamcrest/Description;->appendDescriptionOf(Lorg/hamcrest/SelfDescribing;)Lorg/hamcrest/Description;

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public matchesSafely(Ljava/lang/Object;Lorg/hamcrest/Description;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Lorg/hamcrest/Description;",
            ")Z"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/hamcrest/core/CombinableMatcher;->matcher:Lorg/hamcrest/Matcher;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Lorg/hamcrest/Matcher;->matches(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lorg/hamcrest/core/CombinableMatcher;->matcher:Lorg/hamcrest/Matcher;

    .line 10
    .line 11
    invoke-interface {p0, p1, p2}, Lorg/hamcrest/Matcher;->describeMismatch(Ljava/lang/Object;Lorg/hamcrest/Description;)V

    .line 12
    .line 13
    .line 14
    const/4 p0, 0x0

    .line 15
    return p0

    .line 16
    :cond_0
    const/4 p0, 0x1

    .line 17
    return p0
.end method

.method public or(Lorg/hamcrest/Matcher;)Lorg/hamcrest/core/CombinableMatcher;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/hamcrest/Matcher<",
            "-TT;>;)",
            "Lorg/hamcrest/core/CombinableMatcher<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Lorg/hamcrest/core/CombinableMatcher;

    .line 2
    .line 3
    new-instance v1, Lorg/hamcrest/core/AnyOf;

    .line 4
    .line 5
    invoke-direct {p0, p1}, Lorg/hamcrest/core/CombinableMatcher;->templatedListWith(Lorg/hamcrest/Matcher;)Ljava/util/ArrayList;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-direct {v1, p0}, Lorg/hamcrest/core/AnyOf;-><init>(Ljava/lang/Iterable;)V

    .line 10
    .line 11
    .line 12
    invoke-direct {v0, v1}, Lorg/hamcrest/core/CombinableMatcher;-><init>(Lorg/hamcrest/Matcher;)V

    .line 13
    .line 14
    .line 15
    return-object v0
.end method
