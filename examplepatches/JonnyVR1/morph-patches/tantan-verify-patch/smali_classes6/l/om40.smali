.class public final synthetic Ll/om40;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Landroid/content/Intent;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;Landroid/content/Intent;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/om40;->a:Lcom/p1/mobile/android/app/Act;

    iput-object p2, p0, Ll/om40;->b:Landroid/content/Intent;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/om40;->a:Lcom/p1/mobile/android/app/Act;

    iget-object p0, p0, Ll/om40;->b:Landroid/content/Intent;

    invoke-static {v0, p0}, Ll/cn40;->s(Lcom/p1/mobile/android/app/Act;Landroid/content/Intent;)V

    return-void
.end method
