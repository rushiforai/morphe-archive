.class public final synthetic Ll/cuq0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/tencent/could/huiyansdk/helper/b;

.field public final synthetic b:Landroid/content/Context;


# direct methods
.method public synthetic constructor <init>(Lcom/tencent/could/huiyansdk/helper/b;Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/cuq0;->a:Lcom/tencent/could/huiyansdk/helper/b;

    iput-object p2, p0, Ll/cuq0;->b:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cuq0;->a:Lcom/tencent/could/huiyansdk/helper/b;

    iget-object p0, p0, Ll/cuq0;->b:Landroid/content/Context;

    invoke-static {v0, p0}, Lcom/tencent/could/huiyansdk/helper/b;->a(Lcom/tencent/could/huiyansdk/helper/b;Landroid/content/Context;)V

    return-void
.end method
