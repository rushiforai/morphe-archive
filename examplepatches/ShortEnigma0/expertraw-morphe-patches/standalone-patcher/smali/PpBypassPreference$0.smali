.class public final synthetic Lcom/samsung/android/app/galaxyraw/mod/PpBypassPreference$0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Lcom/samsung/android/app/galaxyraw/mod/PpBypassPreference;"
    method = "lambda$showRestartDialog$0"
    proto = "(Landroid/content/Context;Landroid/content/DialogInterface;I)V"
.end annotation


# instance fields
.field public final synthetic f$0:Landroid/content/Context;


# direct methods
.method public synthetic constructor <init>(Landroid/content/Context;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/samsung/android/app/galaxyraw/mod/PpBypassPreference$0;->f$0:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .registers 4

    .line 0
    iget-object v0, p0, Lcom/samsung/android/app/galaxyraw/mod/PpBypassPreference$0;->f$0:Landroid/content/Context;

    invoke-static {v0, p1, p2}, Lcom/samsung/android/app/galaxyraw/mod/PpBypassPreference;->lambda$showRestartDialog$0(Landroid/content/Context;Landroid/content/DialogInterface;I)V

    return-void
.end method
