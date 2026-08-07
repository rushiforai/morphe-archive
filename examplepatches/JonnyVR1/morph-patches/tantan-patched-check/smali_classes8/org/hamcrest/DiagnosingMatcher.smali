.class public abstract Lorg/hamcrest/DiagnosingMatcher;
.super Lorg/hamcrest/BaseMatcher;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lorg/hamcrest/BaseMatcher<",
        "TT;>;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lorg/hamcrest/BaseMatcher;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final describeMismatch(Ljava/lang/Object;Lorg/hamcrest/Description;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lorg/hamcrest/DiagnosingMatcher;->matches(Ljava/lang/Object;Lorg/hamcrest/Description;)Z

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final matches(Ljava/lang/Object;)Z
    .locals 1

    .line 1
    sget-object v0, Lorg/hamcrest/Description;->NONE:Lorg/hamcrest/Description;

    .line 2
    .line 3
    invoke-virtual {p0, p1, v0}, Lorg/hamcrest/DiagnosingMatcher;->matches(Ljava/lang/Object;Lorg/hamcrest/Description;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public abstract matches(Ljava/lang/Object;Lorg/hamcrest/Description;)Z
.end method
