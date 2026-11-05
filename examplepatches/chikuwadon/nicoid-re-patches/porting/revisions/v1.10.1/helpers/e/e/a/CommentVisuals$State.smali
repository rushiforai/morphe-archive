.class Le/e/a/CommentVisuals$State;
.super Ljava/lang/Object;
.source "CommentVisuals.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/CommentVisuals;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "State"
.end annotation


# instance fields
.field active:Ljava/util/IdentityHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/IdentityHashMap<",
            "Ljava/lang/Object;",
            "Le/e/a/CommentVisuals$Entry;",
            ">;"
        }
    .end annotation
.end field

.field fixed:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field height:I

.field last:F

.field paint:Landroid/graphics/Paint;

.field rows:I

.field size:I

.field width:I


# direct methods
.method private constructor <init>()V
    .registers 3

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/IdentityHashMap;

    invoke-direct {v0}, Ljava/util/IdentityHashMap;-><init>()V

    iput-object v0, p0, Le/e/a/CommentVisuals$State;->active:Ljava/util/IdentityHashMap;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Le/e/a/CommentVisuals$State;->fixed:Ljava/util/ArrayList;

    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Le/e/a/CommentVisuals$State;->paint:Landroid/graphics/Paint;

    const/high16 v0, -0x40800000    # -1.0f

    iput v0, p0, Le/e/a/CommentVisuals$State;->last:F

    return-void
.end method

.method synthetic constructor <init>(Le/e/a/CommentVisuals$1;)V
    .registers 2

    .line 15
    invoke-direct {p0}, Le/e/a/CommentVisuals$State;-><init>()V

    return-void
.end method
