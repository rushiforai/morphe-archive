.class public final synthetic Ll/fdd;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/util/DebugUtil$t;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/util/DebugUtil$t;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fdd;->a:Lcom/p1/mobile/putong/core/util/DebugUtil$t;

    return-void
.end method


# virtual methods
.method public final onCancel(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fdd;->a:Lcom/p1/mobile/putong/core/util/DebugUtil$t;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/util/DebugUtil$t;->a(Lcom/p1/mobile/putong/core/util/DebugUtil$t;Landroid/content/DialogInterface;)V

    return-void
.end method
