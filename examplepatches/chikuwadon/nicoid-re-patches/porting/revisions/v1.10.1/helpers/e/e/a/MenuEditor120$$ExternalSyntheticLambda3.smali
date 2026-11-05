.class public final synthetic Le/e/a/MenuEditor120$$ExternalSyntheticLambda3;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field public final synthetic f$0:Landroid/app/Activity;

.field public final synthetic f$1:Ljava/util/List;

.field public final synthetic f$2:Ljava/util/Map;

.field public final synthetic f$3:[Z


# direct methods
.method public synthetic constructor <init>(Landroid/app/Activity;Ljava/util/List;Ljava/util/Map;[Z)V
    .registers 5

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/MenuEditor120$$ExternalSyntheticLambda3;->f$0:Landroid/app/Activity;

    iput-object p2, p0, Le/e/a/MenuEditor120$$ExternalSyntheticLambda3;->f$1:Ljava/util/List;

    iput-object p3, p0, Le/e/a/MenuEditor120$$ExternalSyntheticLambda3;->f$2:Ljava/util/Map;

    iput-object p4, p0, Le/e/a/MenuEditor120$$ExternalSyntheticLambda3;->f$3:[Z

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .registers 9

    .line 0
    iget-object v0, p0, Le/e/a/MenuEditor120$$ExternalSyntheticLambda3;->f$0:Landroid/app/Activity;

    iget-object v1, p0, Le/e/a/MenuEditor120$$ExternalSyntheticLambda3;->f$1:Ljava/util/List;

    iget-object v2, p0, Le/e/a/MenuEditor120$$ExternalSyntheticLambda3;->f$2:Ljava/util/Map;

    iget-object v3, p0, Le/e/a/MenuEditor120$$ExternalSyntheticLambda3;->f$3:[Z

    move-object v4, p1

    move v5, p2

    invoke-static/range {v0 .. v5}, Le/e/a/MenuEditor120;->lambda$5(Landroid/app/Activity;Ljava/util/List;Ljava/util/Map;[ZLandroid/content/DialogInterface;I)V

    return-void
.end method
