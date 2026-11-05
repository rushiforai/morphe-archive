.class public final synthetic Le/e/a/LoginSupport$4;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Le/e/a/LoginSupport;"
    method = "lambda$settings$0"
    proto = "(Landroid/preference/PreferenceActivity;Landroid/content/DialogInterface;I)V"
.end annotation


# instance fields
.field public final synthetic f$0:Landroid/preference/PreferenceActivity;


# direct methods
.method public synthetic constructor <init>(Landroid/preference/PreferenceActivity;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/LoginSupport$4;->f$0:Landroid/preference/PreferenceActivity;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .registers 4

    .line 0
    iget-object v0, p0, Le/e/a/LoginSupport$4;->f$0:Landroid/preference/PreferenceActivity;

    invoke-static {v0, p1, p2}, Le/e/a/LoginSupport;->lambda$settings$0(Landroid/preference/PreferenceActivity;Landroid/content/DialogInterface;I)V

    return-void
.end method
