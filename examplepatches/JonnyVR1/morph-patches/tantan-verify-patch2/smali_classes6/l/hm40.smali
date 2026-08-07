.class public final synthetic Ll/hm40;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Landroid/content/Intent;

.field public final synthetic c:Ll/y20;

.field public final synthetic d:Ll/x20;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;Landroid/content/Intent;Ll/y20;Ll/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hm40;->a:Lcom/p1/mobile/android/app/Act;

    iput-object p2, p0, Ll/hm40;->b:Landroid/content/Intent;

    iput-object p3, p0, Ll/hm40;->c:Ll/y20;

    iput-object p4, p0, Ll/hm40;->d:Ll/x20;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/hm40;->a:Lcom/p1/mobile/android/app/Act;

    iget-object v1, p0, Ll/hm40;->b:Landroid/content/Intent;

    iget-object v2, p0, Ll/hm40;->c:Ll/y20;

    iget-object p0, p0, Ll/hm40;->d:Ll/x20;

    invoke-static {v0, v1, v2, p0}, Ll/cn40;->q(Lcom/p1/mobile/android/app/Act;Landroid/content/Intent;Ll/y20;Ll/x20;)V

    return-void
.end method
