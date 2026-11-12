.class public final Ll9c;
.super Lcom/leanplum/callbacks/StartCallback;
.source "SourceFile"


# instance fields
.field public final synthetic a:Lm9c;


# direct methods
.method public constructor <init>(Lm9c;)V
    .registers 2

    iput-object p1, p0, Ll9c;->a:Lm9c;

    invoke-direct {p0}, Lcom/leanplum/callbacks/StartCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public final onResponse(Z)V
    .registers 2

    if-nez p1, :cond_3

    return-void

    :cond_3
    iget-object p0, p0, Ll9c;->a:Lm9c;

    iget-object p0, p0, Lm9c;->b:Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string p1, "last_launch"

    invoke-static {p0, p1}, Lam2;->x(Landroid/content/SharedPreferences$Editor;Ljava/lang/String;)V

    return-void
.end method
