.class final Lcom/google/common/collect/UsingToStringOrdering;
.super Lcom/google/common/collect/Ordering;
.source "UsingToStringOrdering.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/common/collect/Ordering<",
        "Ljava/lang/Object;",
        ">;",
        "Ljava/io/Serializable;"
    }
.end annotation


# static fields
.field static final INSTANCE:Lcom/google/common/collect/UsingToStringOrdering;

.field private static final serialVersionUID:J


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 27
    new-instance v0, Lcom/google/common/collect/UsingToStringOrdering;

    invoke-direct {v0}, Lcom/google/common/collect/UsingToStringOrdering;-><init>()V

    sput-object v0, Lcom/google/common/collect/UsingToStringOrdering;->INSTANCE:Lcom/google/common/collect/UsingToStringOrdering;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 44
    invoke-direct {p0}, Lcom/google/common/collect/Ordering;-><init>()V

    return-void
.end method

.method private readResolve()Ljava/lang/Object;
    .registers 1

    .line 36
    sget-object p0, Lcom/google/common/collect/UsingToStringOrdering;->INSTANCE:Lcom/google/common/collect/UsingToStringOrdering;

    return-object p0
.end method


# virtual methods
.method public compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "left",
            "right"
        }
    .end annotation

    .line 31
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result p0

    return p0
.end method

.method public toString()Ljava/lang/String;
    .registers 1

    .line 41
    const-string p0, "Ordering.usingToString()"

    return-object p0
.end method
