.class public final synthetic Le/e/a/AccountLists$$ExternalSyntheticLambda2;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Le/e/a/AccountLists$Created;


# instance fields
.field public final synthetic f$0:Ljava/util/ArrayList;

.field public final synthetic f$1:Landroid/widget/ArrayAdapter;

.field public final synthetic f$2:Landroid/widget/Spinner;


# direct methods
.method public synthetic constructor <init>(Ljava/util/ArrayList;Landroid/widget/ArrayAdapter;Landroid/widget/Spinner;)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/AccountLists$$ExternalSyntheticLambda2;->f$0:Ljava/util/ArrayList;

    iput-object p2, p0, Le/e/a/AccountLists$$ExternalSyntheticLambda2;->f$1:Landroid/widget/ArrayAdapter;

    iput-object p3, p0, Le/e/a/AccountLists$$ExternalSyntheticLambda2;->f$2:Landroid/widget/Spinner;

    return-void
.end method


# virtual methods
.method public final done(Ljava/lang/String;Ljava/lang/String;)V
    .registers 6

    .line 0
    iget-object v0, p0, Le/e/a/AccountLists$$ExternalSyntheticLambda2;->f$0:Ljava/util/ArrayList;

    iget-object v1, p0, Le/e/a/AccountLists$$ExternalSyntheticLambda2;->f$1:Landroid/widget/ArrayAdapter;

    iget-object v2, p0, Le/e/a/AccountLists$$ExternalSyntheticLambda2;->f$2:Landroid/widget/Spinner;

    invoke-static {v0, v1, v2, p1, p2}, Le/e/a/AccountLists;->lambda$3(Ljava/util/ArrayList;Landroid/widget/ArrayAdapter;Landroid/widget/Spinner;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
