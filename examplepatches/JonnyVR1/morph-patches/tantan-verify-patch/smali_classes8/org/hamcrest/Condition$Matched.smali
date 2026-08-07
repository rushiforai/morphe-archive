.class final Lorg/hamcrest/Condition$Matched;
.super Lorg/hamcrest/Condition;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/hamcrest/Condition;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Matched"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lorg/hamcrest/Condition<",
        "TT;>;"
    }
.end annotation


# instance fields
.field private final mismatch:Lorg/hamcrest/Description;

.field private final theValue:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(Ljava/lang/Object;Lorg/hamcrest/Description;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Lorg/hamcrest/Description;",
            ")V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, v0}, Lorg/hamcrest/Condition;-><init>(Lorg/hamcrest/Condition$1;)V

    .line 3
    .line 4
    .line 5
    iput-object p1, p0, Lorg/hamcrest/Condition$Matched;->theValue:Ljava/lang/Object;

    .line 6
    .line 7
    iput-object p2, p0, Lorg/hamcrest/Condition$Matched;->mismatch:Lorg/hamcrest/Description;

    .line 8
    .line 9
    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Lorg/hamcrest/Description;Lorg/hamcrest/Condition$1;)V
    .locals 0

    .line 10
    invoke-direct {p0, p1, p2}, Lorg/hamcrest/Condition$Matched;-><init>(Ljava/lang/Object;Lorg/hamcrest/Description;)V

    return-void
.end method


# virtual methods
.method public and(Lorg/hamcrest/Condition$Step;)Lorg/hamcrest/Condition;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<U:",
            "Ljava/lang/Object;",
            ">(",
            "Lorg/hamcrest/Condition$Step<",
            "-TT;TU;>;)",
            "Lorg/hamcrest/Condition<",
            "TU;>;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/hamcrest/Condition$Matched;->theValue:Ljava/lang/Object;

    .line 2
    .line 3
    iget-object p0, p0, Lorg/hamcrest/Condition$Matched;->mismatch:Lorg/hamcrest/Description;

    .line 4
    .line 5
    invoke-interface {p1, v0, p0}, Lorg/hamcrest/Condition$Step;->apply(Ljava/lang/Object;Lorg/hamcrest/Description;)Lorg/hamcrest/Condition;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public matching(Lorg/hamcrest/Matcher;Ljava/lang/String;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/hamcrest/Matcher<",
            "TT;>;",
            "Ljava/lang/String;",
            ")Z"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/hamcrest/Condition$Matched;->theValue:Ljava/lang/Object;

    .line 2
    .line 3
    invoke-interface {p1, v0}, Lorg/hamcrest/Matcher;->matches(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    iget-object v0, p0, Lorg/hamcrest/Condition$Matched;->mismatch:Lorg/hamcrest/Description;

    .line 12
    .line 13
    invoke-interface {v0, p2}, Lorg/hamcrest/Description;->appendText(Ljava/lang/String;)Lorg/hamcrest/Description;

    .line 14
    .line 15
    .line 16
    iget-object p2, p0, Lorg/hamcrest/Condition$Matched;->theValue:Ljava/lang/Object;

    .line 17
    .line 18
    iget-object p0, p0, Lorg/hamcrest/Condition$Matched;->mismatch:Lorg/hamcrest/Description;

    .line 19
    .line 20
    invoke-interface {p1, p2, p0}, Lorg/hamcrest/Matcher;->describeMismatch(Ljava/lang/Object;Lorg/hamcrest/Description;)V

    .line 21
    .line 22
    .line 23
    const/4 p0, 0x0

    .line 24
    return p0
.end method
