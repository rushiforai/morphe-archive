.class public final synthetic Ll/f2f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/google/firebase/messaging/EnhancedIntentService;

.field public final synthetic b:Landroid/content/Intent;

.field public final synthetic c:Ll/sni0;


# direct methods
.method public synthetic constructor <init>(Lcom/google/firebase/messaging/EnhancedIntentService;Landroid/content/Intent;Ll/sni0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/f2f;->a:Lcom/google/firebase/messaging/EnhancedIntentService;

    iput-object p2, p0, Ll/f2f;->b:Landroid/content/Intent;

    iput-object p3, p0, Ll/f2f;->c:Ll/sni0;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/f2f;->a:Lcom/google/firebase/messaging/EnhancedIntentService;

    iget-object v1, p0, Ll/f2f;->b:Landroid/content/Intent;

    iget-object p0, p0, Ll/f2f;->c:Ll/sni0;

    invoke-static {v0, v1, p0}, Lcom/google/firebase/messaging/EnhancedIntentService;->a(Lcom/google/firebase/messaging/EnhancedIntentService;Landroid/content/Intent;Ll/sni0;)V

    return-void
.end method
