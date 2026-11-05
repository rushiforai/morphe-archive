.class final Le/e/a/Refresh192$Session;
.super Ljava/lang/Object;
.source "Refresh192.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/Refresh192;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Session"
.end annotation


# instance fields
.field anchor:Ljava/lang/String;

.field list:Landroid/widget/ListView;

.field loader:Ljava/lang/Object;

.field metadata:Z

.field old:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field paging:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field position:I

.field replaced:Z

.field final swipe:Ljava/lang/Object;

.field tasks:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Le/e/a/NetworkTask;",
            ">;"
        }
    .end annotation
.end field

.field top:I


# direct methods
.method constructor <init>(Ljava/lang/Object;)V
    .registers 3

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    const-string v0, ""

    iput-object v0, p0, Le/e/a/Refresh192$Session;->anchor:Ljava/lang/String;

    .line 12
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Le/e/a/Refresh192$Session;->paging:Ljava/util/Map;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Le/e/a/Refresh192$Session;->tasks:Ljava/util/List;

    .line 13
    iput-object p1, p0, Le/e/a/Refresh192$Session;->swipe:Ljava/lang/Object;

    return-void
.end method
