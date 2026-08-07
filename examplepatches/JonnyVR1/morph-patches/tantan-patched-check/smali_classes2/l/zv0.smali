.class public final synthetic Ll/zv0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Landroid/content/Context;

.field public final synthetic b:Lcom/facebook/appevents/e;


# direct methods
.method public synthetic constructor <init>(Landroid/content/Context;Lcom/facebook/appevents/e;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zv0;->a:Landroid/content/Context;

    iput-object p2, p0, Ll/zv0;->b:Lcom/facebook/appevents/e;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/zv0;->a:Landroid/content/Context;

    iget-object p0, p0, Ll/zv0;->b:Lcom/facebook/appevents/e;

    invoke-static {v0, p0}, Lcom/facebook/appevents/e$a;->b(Landroid/content/Context;Lcom/facebook/appevents/e;)V

    return-void
.end method
