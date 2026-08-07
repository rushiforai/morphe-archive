.class public final synthetic Ll/t2g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/fake/b$a;

.field public final synthetic b:Landroid/app/Activity;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/fake/b$a;Landroid/app/Activity;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/t2g;->a:Lcom/p1/mobile/putong/core/newui/fake/b$a;

    iput-object p2, p0, Ll/t2g;->b:Landroid/app/Activity;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/t2g;->a:Lcom/p1/mobile/putong/core/newui/fake/b$a;

    iget-object p0, p0, Ll/t2g;->b:Landroid/app/Activity;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/newui/fake/b$a;->a(Lcom/p1/mobile/putong/core/newui/fake/b$a;Landroid/app/Activity;)V

    return-void
.end method
