.class public final Ll/xtx0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ll/b7h0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/b7h0<",
            "Lcom/google/common/collect/ImmutableSetMultimap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/ftx0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/ftx0;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Lcom/google/common/base/Suppliers;->a(Ll/b7h0;)Ll/b7h0;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    sput-object v0, Ll/xtx0;->a:Ll/b7h0;

    .line 11
    .line 12
    return-void
.end method

.method public static synthetic a()Lcom/google/common/collect/ImmutableSetMultimap;
    .locals 1

    .line 1
    new-instance v0, Lcom/google/common/collect/ImmutableSetMultimap$a;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/google/common/collect/ImmutableSetMultimap$a;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableSetMultimap$a;->f()Lcom/google/common/collect/ImmutableSetMultimap;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    return-object v0
.end method
