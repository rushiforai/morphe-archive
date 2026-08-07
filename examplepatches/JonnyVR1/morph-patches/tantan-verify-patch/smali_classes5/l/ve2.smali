.class public final synthetic Ll/ve2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnApplyWindowInsetsListener;


# instance fields
.field public final synthetic a:Lcom/tencent/could/huiyansdk/activitys/BaseActivity;


# direct methods
.method public synthetic constructor <init>(Lcom/tencent/could/huiyansdk/activitys/BaseActivity;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ve2;->a:Lcom/tencent/could/huiyansdk/activitys/BaseActivity;

    return-void
.end method


# virtual methods
.method public final onApplyWindowInsets(Landroid/view/View;Landroid/view/WindowInsets;)Landroid/view/WindowInsets;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ve2;->a:Lcom/tencent/could/huiyansdk/activitys/BaseActivity;

    invoke-static {p0, p1, p2}, Lcom/tencent/could/huiyansdk/activitys/BaseActivity;->H0(Lcom/tencent/could/huiyansdk/activitys/BaseActivity;Landroid/view/View;Landroid/view/WindowInsets;)Landroid/view/WindowInsets;

    move-result-object p0

    return-object p0
.end method
