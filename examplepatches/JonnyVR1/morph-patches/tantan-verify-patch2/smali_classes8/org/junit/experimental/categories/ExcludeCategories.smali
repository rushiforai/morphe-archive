.class public final Lorg/junit/experimental/categories/ExcludeCategories;
.super Lorg/junit/experimental/categories/CategoryFilterFactory;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/junit/experimental/categories/ExcludeCategories$ExcludesAny;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lorg/junit/experimental/categories/CategoryFilterFactory;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public createFilter(Ljava/util/List;)Lorg/junit/runner/manipulation/Filter;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Class<",
            "*>;>;)",
            "Lorg/junit/runner/manipulation/Filter;"
        }
    .end annotation

    .line 1
    new-instance p0, Lorg/junit/experimental/categories/ExcludeCategories$ExcludesAny;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Lorg/junit/experimental/categories/ExcludeCategories$ExcludesAny;-><init>(Ljava/util/List;)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method
