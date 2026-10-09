.class public final synthetic Le/e/a/LoginSupport$3;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/webkit/ValueCallback;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Le/e/a/LoginSupport;"
    method = "lambda$loadLogin$2"
    proto = "(Landroid/webkit/CookieManager;Landroid/content/SharedPreferences;Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/Boolean;)V"
.end annotation


# instance fields
.field public final synthetic f$0:Landroid/webkit/CookieManager;

.field public final synthetic f$1:Landroid/content/SharedPreferences;

.field public final synthetic f$2:Landroid/webkit/WebView;

.field public final synthetic f$3:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Landroid/webkit/CookieManager;Landroid/content/SharedPreferences;Landroid/webkit/WebView;Ljava/lang/String;)V
    .registers 5

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/LoginSupport$3;->f$0:Landroid/webkit/CookieManager;

    iput-object p2, p0, Le/e/a/LoginSupport$3;->f$1:Landroid/content/SharedPreferences;

    iput-object p3, p0, Le/e/a/LoginSupport$3;->f$2:Landroid/webkit/WebView;

    iput-object p4, p0, Le/e/a/LoginSupport$3;->f$3:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final onReceiveValue(Ljava/lang/Object;)V
    .registers 6

    .line 0
    iget-object v0, p0, Le/e/a/LoginSupport$3;->f$0:Landroid/webkit/CookieManager;

    iget-object v1, p0, Le/e/a/LoginSupport$3;->f$1:Landroid/content/SharedPreferences;

    iget-object v2, p0, Le/e/a/LoginSupport$3;->f$2:Landroid/webkit/WebView;

    iget-object v3, p0, Le/e/a/LoginSupport$3;->f$3:Ljava/lang/String;

    check-cast p1, Ljava/lang/Boolean;

    invoke-static {v0, v1, v2, v3, p1}, Le/e/a/LoginSupport;->lambda$loadLogin$2(Landroid/webkit/CookieManager;Landroid/content/SharedPreferences;Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/Boolean;)V

    return-void
.end method
