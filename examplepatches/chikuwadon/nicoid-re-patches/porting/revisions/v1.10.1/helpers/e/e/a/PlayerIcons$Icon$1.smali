.class Le/e/a/PlayerIcons$Icon$1;
.super Landroid/graphics/drawable/Drawable$ConstantState;
.source "PlayerIcons.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/PlayerIcons$Icon;->getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Le/e/a/PlayerIcons$Icon;

.field private final synthetic val$color:I

.field private final synthetic val$n:Ljava/lang/String;

.field private final synthetic val$s:Z

.field private final synthetic val$value:I


# direct methods
.method constructor <init>(Le/e/a/PlayerIcons$Icon;Ljava/lang/String;ZII)V
    .registers 6

    .line 62
    iput-object p1, p0, Le/e/a/PlayerIcons$Icon$1;->this$1:Le/e/a/PlayerIcons$Icon;

    iput-object p2, p0, Le/e/a/PlayerIcons$Icon$1;->val$n:Ljava/lang/String;

    iput-boolean p3, p0, Le/e/a/PlayerIcons$Icon$1;->val$s:Z

    iput p4, p0, Le/e/a/PlayerIcons$Icon$1;->val$color:I

    iput p5, p0, Le/e/a/PlayerIcons$Icon$1;->val$value:I

    invoke-direct {p0}, Landroid/graphics/drawable/Drawable$ConstantState;-><init>()V

    return-void
.end method


# virtual methods
.method public getChangingConfigurations()I
    .registers 2

    .line 62
    const/4 v0, 0x0

    return v0
.end method

.method public newDrawable()Landroid/graphics/drawable/Drawable;
    .registers 4

    .line 62
    new-instance v0, Le/e/a/PlayerIcons$Icon;

    iget-object v1, p0, Le/e/a/PlayerIcons$Icon$1;->val$n:Ljava/lang/String;

    iget-boolean v2, p0, Le/e/a/PlayerIcons$Icon$1;->val$s:Z

    invoke-direct {v0, v1, v2}, Le/e/a/PlayerIcons$Icon;-><init>(Ljava/lang/String;Z)V

    iget v1, p0, Le/e/a/PlayerIcons$Icon$1;->val$color:I

    iput v1, v0, Le/e/a/PlayerIcons$Icon;->ink:I

    iget v1, p0, Le/e/a/PlayerIcons$Icon$1;->val$value:I

    iput v1, v0, Le/e/a/PlayerIcons$Icon;->alpha:I

    iget-object v1, p0, Le/e/a/PlayerIcons$Icon$1;->this$1:Le/e/a/PlayerIcons$Icon;

    iget-object v1, v1, Le/e/a/PlayerIcons$Icon;->owner:Ljava/lang/ref/WeakReference;

    iput-object v1, v0, Le/e/a/PlayerIcons$Icon;->owner:Ljava/lang/ref/WeakReference;

    return-object v0
.end method
