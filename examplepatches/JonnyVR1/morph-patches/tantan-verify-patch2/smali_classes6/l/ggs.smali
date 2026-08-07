.class public Ll/ggs;
.super Ll/a4s;
.source "SourceFile"


# instance fields
.field private gameCards:Ljava/util/List;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "gameCards"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/ags;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/a4s;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/ags;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ggs;->gameCards:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method
