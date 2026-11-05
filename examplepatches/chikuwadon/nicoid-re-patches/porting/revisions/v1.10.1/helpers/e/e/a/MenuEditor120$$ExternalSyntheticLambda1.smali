.class public final synthetic Le/e/a/MenuEditor120$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Le/e/a/DragRows120$Drop;


# instance fields
.field public final synthetic f$0:Ljava/util/List;

.field public final synthetic f$1:[Z

.field public final synthetic f$2:Landroid/widget/ScrollView;

.field public final synthetic f$3:[Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Ljava/util/List;[ZLandroid/widget/ScrollView;[Ljava/lang/Runnable;)V
    .registers 5

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/MenuEditor120$$ExternalSyntheticLambda1;->f$0:Ljava/util/List;

    iput-object p2, p0, Le/e/a/MenuEditor120$$ExternalSyntheticLambda1;->f$1:[Z

    iput-object p3, p0, Le/e/a/MenuEditor120$$ExternalSyntheticLambda1;->f$2:Landroid/widget/ScrollView;

    iput-object p4, p0, Le/e/a/MenuEditor120$$ExternalSyntheticLambda1;->f$3:[Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final move(IIZ)V
    .registers 11

    .line 0
    iget-object v0, p0, Le/e/a/MenuEditor120$$ExternalSyntheticLambda1;->f$0:Ljava/util/List;

    iget-object v1, p0, Le/e/a/MenuEditor120$$ExternalSyntheticLambda1;->f$1:[Z

    iget-object v2, p0, Le/e/a/MenuEditor120$$ExternalSyntheticLambda1;->f$2:Landroid/widget/ScrollView;

    iget-object v3, p0, Le/e/a/MenuEditor120$$ExternalSyntheticLambda1;->f$3:[Ljava/lang/Runnable;

    move v4, p1

    move v5, p2

    move v6, p3

    invoke-static/range {v0 .. v6}, Le/e/a/MenuEditor120;->lambda$1(Ljava/util/List;[ZLandroid/widget/ScrollView;[Ljava/lang/Runnable;IIZ)V

    return-void
.end method
