.class public final synthetic Ll/rjz;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/clz;

.field public final synthetic b:Landroid/content/Intent;


# direct methods
.method public synthetic constructor <init>(Ll/clz;Landroid/content/Intent;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rjz;->a:Ll/clz;

    iput-object p2, p0, Ll/rjz;->b:Landroid/content/Intent;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/rjz;->a:Ll/clz;

    iget-object p0, p0, Ll/rjz;->b:Landroid/content/Intent;

    invoke-static {v0, p0}, Ll/clz;->F0(Ll/clz;Landroid/content/Intent;)V

    return-void
.end method
