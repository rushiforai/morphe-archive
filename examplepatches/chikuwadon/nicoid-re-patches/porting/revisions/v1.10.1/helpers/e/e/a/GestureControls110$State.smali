.class final Le/e/a/GestureControls110$State;
.super Ljava/lang/Object;
.source "GestureControls110.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/GestureControls110;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "State"
.end annotation


# instance fields
.field candidate:Z

.field claimed:Z

.field final deferred:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/view/MotionEvent;",
            ">;"
        }
    .end annotation
.end field

.field display:Z

.field first:I

.field lastAction:Ljava/lang/String;

.field lastLabel:Ljava/lang/String;

.field lastPattern:Ljava/lang/String;

.field list:Landroid/widget/ListView;

.field final origin:[I

.field path:Landroid/graphics/Path;

.field replay:Ljava/lang/Runnable;

.field rules:Le/e/a/GestureRules110;

.field top:I

.field trace:Le/e/a/GestureControls110$Trace;


# direct methods
.method constructor <init>()V
    .registers 2

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Le/e/a/GestureRules110;

    invoke-direct {v0}, Le/e/a/GestureRules110;-><init>()V

    iput-object v0, p0, Le/e/a/GestureControls110$State;->rules:Le/e/a/GestureRules110;

    const-string v0, ""

    iput-object v0, p0, Le/e/a/GestureControls110$State;->lastPattern:Ljava/lang/String;

    iput-object v0, p0, Le/e/a/GestureControls110$State;->lastAction:Ljava/lang/String;

    iput-object v0, p0, Le/e/a/GestureControls110$State;->lastLabel:Ljava/lang/String;

    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Le/e/a/GestureControls110$State;->path:Landroid/graphics/Path;

    const/4 v0, 0x2

    new-array v0, v0, [I

    iput-object v0, p0, Le/e/a/GestureControls110$State;->origin:[I

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Le/e/a/GestureControls110$State;->deferred:Ljava/util/ArrayList;

    return-void
.end method
