.class public final synthetic Lcom/google/firebase/messaging/i;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Landroid/content/Context;

.field public final synthetic b:Z

.field public final synthetic c:Ll/sni0;


# direct methods
.method public synthetic constructor <init>(Landroid/content/Context;ZLl/sni0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/firebase/messaging/i;->a:Landroid/content/Context;

    iput-boolean p2, p0, Lcom/google/firebase/messaging/i;->b:Z

    iput-object p3, p0, Lcom/google/firebase/messaging/i;->c:Ll/sni0;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/firebase/messaging/i;->a:Landroid/content/Context;

    iget-boolean v1, p0, Lcom/google/firebase/messaging/i;->b:Z

    iget-object p0, p0, Lcom/google/firebase/messaging/i;->c:Ll/sni0;

    invoke-static {v0, v1, p0}, Lcom/google/firebase/messaging/ProxyNotificationInitializer;->a(Landroid/content/Context;ZLl/sni0;)V

    return-void
.end method
