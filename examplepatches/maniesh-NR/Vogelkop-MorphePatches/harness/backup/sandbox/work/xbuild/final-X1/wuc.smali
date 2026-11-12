.class public final synthetic Lwuc;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lr1o;


# instance fields
.field public final synthetic a:Lcom/opera/api/Callback;

.field public final synthetic b:Lorg/chromium/ui/base/WindowAndroid;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/api/Callback;Lorg/chromium/ui/base/WindowAndroid;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lwuc;->a:Lcom/opera/api/Callback;

    iput-object p2, p0, Lwuc;->b:Lorg/chromium/ui/base/WindowAndroid;

    return-void
.end method


# virtual methods
.method public final a(ILandroid/content/Intent;)V
    .registers 3

    iget-object p1, p0, Lwuc;->b:Lorg/chromium/ui/base/WindowAndroid;

    const-string p2, "android.permission.ACCESS_LOCAL_NETWORK"

    invoke-virtual {p1, p2}, Lorg/chromium/ui/base/WindowAndroid;->hasPermission(Ljava/lang/String;)Z

    move-result p1

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    iget-object p0, p0, Lwuc;->a:Lcom/opera/api/Callback;

    invoke-interface {p0, p1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void
.end method
