.class public final synthetic Ll/y730;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/k930;

.field public final synthetic b:Landroid/content/Intent;


# direct methods
.method public synthetic constructor <init>(Ll/k930;Landroid/content/Intent;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/y730;->a:Ll/k930;

    iput-object p2, p0, Ll/y730;->b:Landroid/content/Intent;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/y730;->a:Ll/k930;

    iget-object p0, p0, Ll/y730;->b:Landroid/content/Intent;

    invoke-static {v0, p0}, Ll/k930;->j0(Ll/k930;Landroid/content/Intent;)V

    return-void
.end method
