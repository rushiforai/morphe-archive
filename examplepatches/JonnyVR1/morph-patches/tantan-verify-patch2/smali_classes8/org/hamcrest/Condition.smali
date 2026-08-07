.class public abstract Lorg/hamcrest/Condition;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/hamcrest/Condition$NotMatched;,
        Lorg/hamcrest/Condition$Matched;,
        Lorg/hamcrest/Condition$Step;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# static fields
.field public static final NOT_MATCHED:Lorg/hamcrest/Condition$NotMatched;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/hamcrest/Condition$NotMatched<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lorg/hamcrest/Condition$NotMatched;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lorg/hamcrest/Condition$NotMatched;-><init>(Lorg/hamcrest/Condition$1;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lorg/hamcrest/Condition;->NOT_MATCHED:Lorg/hamcrest/Condition$NotMatched;

    .line 8
    .line 9
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lorg/hamcrest/Condition$1;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lorg/hamcrest/Condition;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static matched(Ljava/lang/Object;Lorg/hamcrest/Description;)Lorg/hamcrest/Condition;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;",
            "Lorg/hamcrest/Description;",
            ")",
            "Lorg/hamcrest/Condition<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Lorg/hamcrest/Condition$Matched;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p0, p1, v1}, Lorg/hamcrest/Condition$Matched;-><init>(Ljava/lang/Object;Lorg/hamcrest/Description;Lorg/hamcrest/Condition$1;)V

    .line 5
    .line 6
    .line 7
    return-object v0
.end method

.method public static notMatched()Lorg/hamcrest/Condition;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">()",
            "Lorg/hamcrest/Condition<",
            "TT;>;"
        }
    .end annotation

    .line 1
    sget-object v0, Lorg/hamcrest/Condition;->NOT_MATCHED:Lorg/hamcrest/Condition$NotMatched;

    .line 2
    .line 3
    return-object v0
.end method


# virtual methods
.method public abstract and(Lorg/hamcrest/Condition$Step;)Lorg/hamcrest/Condition;
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
.end method

.method public final matching(Lorg/hamcrest/Matcher;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/hamcrest/Matcher<",
            "TT;>;)Z"
        }
    .end annotation

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    invoke-virtual {p0, p1, v0}, Lorg/hamcrest/Condition;->matching(Lorg/hamcrest/Matcher;Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public abstract matching(Lorg/hamcrest/Matcher;Ljava/lang/String;)Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/hamcrest/Matcher<",
            "TT;>;",
            "Ljava/lang/String;",
            ")Z"
        }
    .end annotation
.end method

.method public final then(Lorg/hamcrest/Condition$Step;)Lorg/hamcrest/Condition;
    .locals 0
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
    invoke-virtual {p0, p1}, Lorg/hamcrest/Condition;->and(Lorg/hamcrest/Condition$Step;)Lorg/hamcrest/Condition;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
