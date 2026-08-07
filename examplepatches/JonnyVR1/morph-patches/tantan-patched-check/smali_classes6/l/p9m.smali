.class public final synthetic Ll/p9m;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Landroid/view/View;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Landroid/view/View;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/p9m;->a:Landroid/view/View;

    iput-boolean p2, p0, Ll/p9m;->b:Z

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/p9m;->a:Landroid/view/View;

    iget-boolean p0, p0, Ll/p9m;->b:Z

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->R4(Landroid/view/View;Z)V

    return-void
.end method
