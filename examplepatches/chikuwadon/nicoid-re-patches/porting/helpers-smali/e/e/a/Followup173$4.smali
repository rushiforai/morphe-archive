.class public final synthetic Le/e/a/Followup173$4;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Le/e/a/Followup173;"
    method = "lambda$saveLog$2"
    proto = "(Landroid/content/Context;Ljava/lang/String;Landroid/content/DialogInterface;I)V"
.end annotation


# instance fields
.field public final synthetic f$0:Landroid/content/Context;

.field public final synthetic f$1:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/Followup173$4;->f$0:Landroid/content/Context;

    iput-object p2, p0, Le/e/a/Followup173$4;->f$1:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .registers 5

    .line 0
    iget-object v0, p0, Le/e/a/Followup173$4;->f$0:Landroid/content/Context;

    iget-object v1, p0, Le/e/a/Followup173$4;->f$1:Ljava/lang/String;

    invoke-static {v0, v1, p1, p2}, Le/e/a/Followup173;->lambda$saveLog$2(Landroid/content/Context;Ljava/lang/String;Landroid/content/DialogInterface;I)V

    return-void
.end method
