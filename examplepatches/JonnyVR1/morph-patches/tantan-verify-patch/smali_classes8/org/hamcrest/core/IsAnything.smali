.class public Lorg/hamcrest/core/IsAnything;
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


# instance fields
.field private final message:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    const-string v0, "ANYTHING"

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lorg/hamcrest/core/IsAnything;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 7
    invoke-direct {p0}, Lorg/hamcrest/BaseMatcher;-><init>()V

    .line 8
    iput-object p1, p0, Lorg/hamcrest/core/IsAnything;->message:Ljava/lang/String;

    return-void
.end method

.method public static anything()Lorg/hamcrest/Matcher;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lorg/hamcrest/Matcher<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .annotation runtime Lorg/hamcrest/Factory;
    .end annotation

    .line 1
    new-instance v0, Lorg/hamcrest/core/IsAnything;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/hamcrest/core/IsAnything;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static anything(Ljava/lang/String;)Lorg/hamcrest/Matcher;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lorg/hamcrest/Matcher<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .annotation runtime Lorg/hamcrest/Factory;
    .end annotation

    .line 7
    new-instance v0, Lorg/hamcrest/core/IsAnything;

    invoke-direct {v0, p0}, Lorg/hamcrest/core/IsAnything;-><init>(Ljava/lang/String;)V

    return-object v0
.end method


# virtual methods
.method public describeTo(Lorg/hamcrest/Description;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/hamcrest/core/IsAnything;->message:Ljava/lang/String;

    .line 2
    .line 3
    invoke-interface {p1, p0}, Lorg/hamcrest/Description;->appendText(Ljava/lang/String;)Lorg/hamcrest/Description;

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public matches(Ljava/lang/Object;)Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method
