.class public final synthetic Ll/i2g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/fake/b;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;

.field public final synthetic c:Landroid/content/Intent;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/fake/b;Lcom/p1/mobile/android/app/Act;Landroid/content/Intent;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/i2g;->a:Lcom/p1/mobile/putong/core/newui/fake/b;

    iput-object p2, p0, Ll/i2g;->b:Lcom/p1/mobile/android/app/Act;

    iput-object p3, p0, Ll/i2g;->c:Landroid/content/Intent;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/i2g;->a:Lcom/p1/mobile/putong/core/newui/fake/b;

    iget-object v1, p0, Ll/i2g;->b:Lcom/p1/mobile/android/app/Act;

    iget-object p0, p0, Ll/i2g;->c:Landroid/content/Intent;

    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/core/newui/fake/b;->a(Lcom/p1/mobile/putong/core/newui/fake/b;Lcom/p1/mobile/android/app/Act;Landroid/content/Intent;)V

    return-void
.end method
