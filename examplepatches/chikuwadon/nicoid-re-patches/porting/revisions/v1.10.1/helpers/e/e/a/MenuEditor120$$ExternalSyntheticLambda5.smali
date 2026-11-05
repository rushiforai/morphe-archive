.class public final synthetic Le/e/a/MenuEditor120$$ExternalSyntheticLambda5;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# instance fields
.field public final synthetic f$0:Ljava/util/Map;

.field public final synthetic f$1:I


# direct methods
.method public synthetic constructor <init>(Ljava/util/Map;I)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/MenuEditor120$$ExternalSyntheticLambda5;->f$0:Ljava/util/Map;

    iput p2, p0, Le/e/a/MenuEditor120$$ExternalSyntheticLambda5;->f$1:I

    return-void
.end method


# virtual methods
.method public final onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .registers 5

    .line 0
    iget-object v0, p0, Le/e/a/MenuEditor120$$ExternalSyntheticLambda5;->f$0:Ljava/util/Map;

    iget v1, p0, Le/e/a/MenuEditor120$$ExternalSyntheticLambda5;->f$1:I

    invoke-static {v0, v1, p1, p2}, Le/e/a/MenuEditor120;->lambda$3(Ljava/util/Map;ILandroid/widget/CompoundButton;Z)V

    return-void
.end method
