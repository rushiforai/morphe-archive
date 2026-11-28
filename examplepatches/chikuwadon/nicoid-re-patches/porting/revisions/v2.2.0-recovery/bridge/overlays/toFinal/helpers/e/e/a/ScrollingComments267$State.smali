.class final Le/e/a/ScrollingComments267$State;
.super Ljava/lang/Object;
.source "ScrollingComments267.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/ScrollingComments267;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "State"
.end annotation


# instance fields
.field final channels:[Le/e/a/ScrollingComments267$Channel;

.field final context:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/content/Context;",
            ">;"
        }
    .end annotation
.end field

.field final fill:Landroid/graphics/Paint;

.field final frameBudget:Le/e/a/ScrollingTimeline267$FrameBudget;

.field generation:J

.field final keys:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Le/e/a/q;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field lengthIncludeFixed:Z

.field lengthLimit:I

.field lengthRejected:I

.field final metrics:Landroid/graphics/Paint$FontMetrics;

.field final nativeOpacity:Ljava/lang/reflect/Field;

.field final outline:Landroid/graphics/Paint;

.field previousShown:J

.field previousSkipped:J

.field final timeline:Le/e/a/ScrollingTimeline267;

.field final waiting:Ljava/util/ArrayDeque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayDeque<",
            "Le/e/a/ScrollingTimeline267$Entry;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/lang/Object;)V
    .registers 6

    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Le/e/a/ScrollingTimeline267$FrameBudget;

    invoke-direct {v0}, Le/e/a/ScrollingTimeline267$FrameBudget;-><init>()V

    iput-object v0, p0, Le/e/a/ScrollingComments267$State;->frameBudget:Le/e/a/ScrollingTimeline267$FrameBudget;

    .line 43
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Le/e/a/ScrollingComments267$State;->fill:Landroid/graphics/Paint;

    .line 44
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Le/e/a/ScrollingComments267$State;->outline:Landroid/graphics/Paint;

    .line 45
    new-instance v0, Landroid/graphics/Paint$FontMetrics;

    invoke-direct {v0}, Landroid/graphics/Paint$FontMetrics;-><init>()V

    iput-object v0, p0, Le/e/a/ScrollingComments267$State;->metrics:Landroid/graphics/Paint$FontMetrics;

    .line 46
    new-instance v0, Le/e/a/ScrollingTimeline267;

    invoke-direct {v0}, Le/e/a/ScrollingTimeline267;-><init>()V

    iput-object v0, p0, Le/e/a/ScrollingComments267$State;->timeline:Le/e/a/ScrollingTimeline267;

    .line 47
    const/4 v0, 0x2

    new-array v0, v0, [Le/e/a/ScrollingComments267$Channel;

    new-instance v2, Le/e/a/ScrollingComments267$Channel;

    invoke-direct {v2}, Le/e/a/ScrollingComments267$Channel;-><init>()V

    const/4 v3, 0x0

    aput-object v2, v0, v3

    new-instance v2, Le/e/a/ScrollingComments267$Channel;

    invoke-direct {v2}, Le/e/a/ScrollingComments267$Channel;-><init>()V

    aput-object v2, v0, v1

    iput-object v0, p0, Le/e/a/ScrollingComments267$State;->channels:[Le/e/a/ScrollingComments267$Channel;

    .line 48
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    iput-object v0, p0, Le/e/a/ScrollingComments267$State;->keys:Ljava/util/WeakHashMap;

    .line 49
    new-instance v0, Ljava/util/ArrayDeque;

    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    iput-object v0, p0, Le/e/a/ScrollingComments267$State;->waiting:Ljava/util/ArrayDeque;

    .line 52
    const-wide/high16 v0, -0x8000000000000000L

    iput-wide v0, p0, Le/e/a/ScrollingComments267$State;->generation:J

    .line 56
    new-instance v0, Ljava/lang/ref/WeakReference;

    move-object v1, p1

    check-cast v1, Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Le/e/a/ScrollingComments267$State;->context:Ljava/lang/ref/WeakReference;

    .line 59
    :try_start_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    # invokes: Le/e/a/ScrollingComments267;->isPopup(Ljava/lang/Object;)Z
    invoke-static {p1}, Le/e/a/ScrollingComments267;->access$000(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const-string p1, "W"

    goto :goto_0

    :cond_0
    const-string p1, "a0"

    :goto_0
    invoke-virtual {v0, p1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldException; {:try_start_0 .. :try_end_0} :catch_0

    .line 62
    goto :goto_1

    .line 60
    :catch_0
    move-exception p1

    .line 61
    const/4 p1, 0x0

    .line 63
    :goto_1
    iput-object p1, p0, Le/e/a/ScrollingComments267$State;->nativeOpacity:Ljava/lang/reflect/Field;

    .line 64
    return-void
.end method
