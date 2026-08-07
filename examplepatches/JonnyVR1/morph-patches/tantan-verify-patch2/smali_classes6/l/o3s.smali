.class public Ll/o3s;
.super Ll/a4s;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/o3s$a;
    }
.end annotation


# instance fields
.field public items:Ljava/util/List;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "items"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/o3s$a;",
            ">;"
        }
    .end annotation
.end field

.field public localAutoScroll:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/a4s;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Ll/o3s;->localAutoScroll:Z

    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public a()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/o3s$a;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/o3s;->items:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method
