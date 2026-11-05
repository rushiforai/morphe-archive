.class public final synthetic Le/e/a/Ranking190$$ExternalSyntheticLambda10;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# instance fields
.field public final synthetic f$0:Le/e/a/Ranking190$Manager;

.field public final synthetic f$1:Ljava/lang/String;

.field public final synthetic f$2:Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Le/e/a/Ranking190$Manager;Ljava/lang/String;Ljava/lang/Runnable;)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda10;->f$0:Le/e/a/Ranking190$Manager;

    iput-object p2, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda10;->f$1:Ljava/lang/String;

    iput-object p3, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda10;->f$2:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .registers 6

    .line 0
    iget-object v0, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda10;->f$0:Le/e/a/Ranking190$Manager;

    iget-object v1, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda10;->f$1:Ljava/lang/String;

    iget-object v2, p0, Le/e/a/Ranking190$$ExternalSyntheticLambda10;->f$2:Ljava/lang/Runnable;

    invoke-static {v0, v1, v2, p1, p2}, Le/e/a/Ranking190;->lambda$22(Le/e/a/Ranking190$Manager;Ljava/lang/String;Ljava/lang/Runnable;Landroid/widget/CompoundButton;Z)V

    return-void
.end method
