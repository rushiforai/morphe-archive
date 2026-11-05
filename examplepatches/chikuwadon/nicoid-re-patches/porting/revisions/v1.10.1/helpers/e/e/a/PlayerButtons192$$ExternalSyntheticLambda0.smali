.class public final synthetic Le/e/a/PlayerButtons192$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# instance fields
.field public final synthetic f$0:Ljava/util/Set;

.field public final synthetic f$1:Ljava/lang/String;

.field public final synthetic f$2:Landroid/content/SharedPreferences;

.field public final synthetic f$3:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Ljava/util/Set;Ljava/lang/String;Landroid/content/SharedPreferences;Ljava/util/List;)V
    .registers 5

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/PlayerButtons192$$ExternalSyntheticLambda0;->f$0:Ljava/util/Set;

    iput-object p2, p0, Le/e/a/PlayerButtons192$$ExternalSyntheticLambda0;->f$1:Ljava/lang/String;

    iput-object p3, p0, Le/e/a/PlayerButtons192$$ExternalSyntheticLambda0;->f$2:Landroid/content/SharedPreferences;

    iput-object p4, p0, Le/e/a/PlayerButtons192$$ExternalSyntheticLambda0;->f$3:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .registers 9

    .line 0
    iget-object v0, p0, Le/e/a/PlayerButtons192$$ExternalSyntheticLambda0;->f$0:Ljava/util/Set;

    iget-object v1, p0, Le/e/a/PlayerButtons192$$ExternalSyntheticLambda0;->f$1:Ljava/lang/String;

    iget-object v2, p0, Le/e/a/PlayerButtons192$$ExternalSyntheticLambda0;->f$2:Landroid/content/SharedPreferences;

    iget-object v3, p0, Le/e/a/PlayerButtons192$$ExternalSyntheticLambda0;->f$3:Ljava/util/List;

    move-object v4, p1

    move v5, p2

    invoke-static/range {v0 .. v5}, Le/e/a/PlayerButtons192;->lambda$2(Ljava/util/Set;Ljava/lang/String;Landroid/content/SharedPreferences;Ljava/util/List;Landroid/widget/CompoundButton;Z)V

    return-void
.end method
