.class final Le/e/a/ModernShorts$Feed;
.super Ljava/lang/Object;
.source "ModernShorts.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/ModernShorts;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Feed"
.end annotation


# instance fields
.field final items:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Le/e/a/ModernShorts$Item;",
            ">;"
        }
    .end annotation
.end field

.field final key:Ljava/lang/String;


# direct methods
.method private constructor <init>()V
    .registers 2

    .line 89
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 90
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Le/e/a/ModernShorts$Feed;->key:Ljava/lang/String;

    .line 91
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Le/e/a/ModernShorts$Feed;->items:Ljava/util/ArrayList;

    return-void
.end method

.method synthetic constructor <init>(Le/e/a/ModernShorts$1;)V
    .registers 2
    .param p1, "x0"    # Le/e/a/ModernShorts$1;

    .line 89
    invoke-direct {p0}, Le/e/a/ModernShorts$Feed;-><init>()V

    return-void
.end method
