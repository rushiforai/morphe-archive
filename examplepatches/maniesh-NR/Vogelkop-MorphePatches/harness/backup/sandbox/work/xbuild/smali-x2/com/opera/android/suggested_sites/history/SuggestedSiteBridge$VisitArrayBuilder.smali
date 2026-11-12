.class public final Lcom/opera/android/suggested_sites/history/SuggestedSiteBridge$VisitArrayBuilder;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/opera/android/suggested_sites/history/SuggestedSiteBridge;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "VisitArrayBuilder"
.end annotation


# instance fields
.field public final a:Ljava/util/ArrayList;


# direct methods
.method public constructor <init>(I)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/opera/android/suggested_sites/history/SuggestedSiteBridge$VisitArrayBuilder;->a:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public final appendVisitData(JJJJI)V
    .registers 10

    new-instance p1, Lwan;

    move-wide p2, p3

    move-wide p4, p5

    move p6, p9

    invoke-direct/range {p1 .. p6}, Lwan;-><init>(JJI)V

    iget-object p0, p0, Lcom/opera/android/suggested_sites/history/SuggestedSiteBridge$VisitArrayBuilder;->a:Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public final result()Ljava/util/List;
    .registers 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lwan;",
            ">;"
        }
    .end annotation

    iget-object p0, p0, Lcom/opera/android/suggested_sites/history/SuggestedSiteBridge$VisitArrayBuilder;->a:Ljava/util/ArrayList;

    return-object p0
.end method
