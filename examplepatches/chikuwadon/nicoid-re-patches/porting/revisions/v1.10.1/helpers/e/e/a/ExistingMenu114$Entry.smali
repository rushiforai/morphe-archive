.class final Le/e/a/ExistingMenu114$Entry;
.super Ljava/lang/Object;
.source "ExistingMenu114.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/ExistingMenu114;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Entry"
.end annotation


# instance fields
.field final list:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field final original:Ljava/lang/Object;

.field final proxy:Ljava/lang/Object;

.field final replacement:Ljava/lang/Object;


# direct methods
.method constructor <init>(Ljava/util/List;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 5

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/ExistingMenu114$Entry;->list:Ljava/util/List;

    iput-object p2, p0, Le/e/a/ExistingMenu114$Entry;->original:Ljava/lang/Object;

    iput-object p3, p0, Le/e/a/ExistingMenu114$Entry;->replacement:Ljava/lang/Object;

    iput-object p4, p0, Le/e/a/ExistingMenu114$Entry;->proxy:Ljava/lang/Object;

    return-void
.end method
