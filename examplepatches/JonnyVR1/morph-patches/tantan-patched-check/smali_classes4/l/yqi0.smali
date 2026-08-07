.class public final synthetic Ll/yqi0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Landroid/view/View;

.field public final synthetic b:Ll/x20;


# direct methods
.method public synthetic constructor <init>(Landroid/view/View;Ll/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yqi0;->a:Landroid/view/View;

    iput-object p2, p0, Ll/yqi0;->b:Ll/x20;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/yqi0;->a:Landroid/view/View;

    iget-object p0, p0, Ll/yqi0;->b:Ll/x20;

    invoke-static {v0, p0}, Ll/cri0;->b(Landroid/view/View;Ll/x20;)V

    return-void
.end method
