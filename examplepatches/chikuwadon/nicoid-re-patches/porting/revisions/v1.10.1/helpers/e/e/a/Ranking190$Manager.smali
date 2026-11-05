.class final Le/e/a/Ranking190$Manager;
.super Ljava/lang/Object;
.source "Ranking190.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/Ranking190;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Manager"
.end annotation


# instance fields
.field scroll:I

.field final selected:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field selecting:Z


# direct methods
.method constructor <init>()V
    .registers 2

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    iput-object v0, p0, Le/e/a/Ranking190$Manager;->selected:Ljava/util/Set;

    return-void
.end method
