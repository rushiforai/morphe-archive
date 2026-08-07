.class public Ll/xe60;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public brands:Ljava/util/List;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "brands"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public density:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "density"
    .end annotation
.end field

.field public fragSts:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "fragSts"
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/xe60;->brands:Ljava/util/List;

    .line 10
    .line 11
    const/16 v0, 0xa

    .line 12
    .line 13
    iput v0, p0, Ll/xe60;->density:I

    .line 14
    .line 15
    const/4 v0, 0x1

    .line 16
    iput-boolean v0, p0, Ll/xe60;->fragSts:Z

    .line 17
    .line 18
    return-void
.end method
