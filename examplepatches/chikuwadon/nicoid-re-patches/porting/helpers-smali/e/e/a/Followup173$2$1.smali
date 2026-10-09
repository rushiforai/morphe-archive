.class Le/e/a/Followup173$2$1;
.super Ljava/lang/Object;
.source "Followup173.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/Followup173$2;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Le/e/a/Followup173$2;

.field private final synthetic val$app:Landroid/content/Context;

.field private final synthetic val$toast:Ljava/lang/String;


# direct methods
.method constructor <init>(Le/e/a/Followup173$2;Landroid/content/Context;Ljava/lang/String;)V
    .registers 4

    .line 94
    iput-object p1, p0, Le/e/a/Followup173$2$1;->this$1:Le/e/a/Followup173$2;

    iput-object p2, p0, Le/e/a/Followup173$2$1;->val$app:Landroid/content/Context;

    iput-object p3, p0, Le/e/a/Followup173$2$1;->val$toast:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .line 94
    iget-object v0, p0, Le/e/a/Followup173$2$1;->val$app:Landroid/content/Context;

    iget-object v1, p0, Le/e/a/Followup173$2$1;->val$toast:Ljava/lang/String;

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    return-void
.end method
