.class public final Lorg/hamcrest/core/CombinableMatcher$CombinableEitherMatcher;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/hamcrest/core/CombinableMatcher;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "CombinableEitherMatcher"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<X:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private final first:Lorg/hamcrest/Matcher;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/hamcrest/Matcher<",
            "-TX;>;"
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
            "-TX;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/hamcrest/core/CombinableMatcher$CombinableEitherMatcher;->first:Lorg/hamcrest/Matcher;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public or(Lorg/hamcrest/Matcher;)Lorg/hamcrest/core/CombinableMatcher;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/hamcrest/Matcher<",
            "-TX;>;)",
            "Lorg/hamcrest/core/CombinableMatcher<",
            "TX;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Lorg/hamcrest/core/CombinableMatcher;

    .line 2
    .line 3
    iget-object p0, p0, Lorg/hamcrest/core/CombinableMatcher$CombinableEitherMatcher;->first:Lorg/hamcrest/Matcher;

    .line 4
    .line 5
    invoke-direct {v0, p0}, Lorg/hamcrest/core/CombinableMatcher;-><init>(Lorg/hamcrest/Matcher;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Lorg/hamcrest/core/CombinableMatcher;->or(Lorg/hamcrest/Matcher;)Lorg/hamcrest/core/CombinableMatcher;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method
