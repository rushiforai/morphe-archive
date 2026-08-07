.class public final synthetic Ll/xm40;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Landroid/content/Intent;

.field public final synthetic c:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;Landroid/content/Intent;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xm40;->a:Lcom/p1/mobile/android/app/Act;

    iput-object p2, p0, Ll/xm40;->b:Landroid/content/Intent;

    iput-boolean p3, p0, Ll/xm40;->c:Z

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/xm40;->a:Lcom/p1/mobile/android/app/Act;

    iget-object v1, p0, Ll/xm40;->b:Landroid/content/Intent;

    iget-boolean p0, p0, Ll/xm40;->c:Z

    invoke-static {v0, v1, p0}, Ll/cn40;->w(Lcom/p1/mobile/android/app/Act;Landroid/content/Intent;Z)V

    return-void
.end method
