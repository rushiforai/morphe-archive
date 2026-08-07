.class public final synthetic Ll/zqi0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/x20;

.field public final synthetic b:Landroid/view/View;


# direct methods
.method public synthetic constructor <init>(Ll/x20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zqi0;->a:Ll/x20;

    iput-object p2, p0, Ll/zqi0;->b:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/zqi0;->a:Ll/x20;

    iget-object p0, p0, Ll/zqi0;->b:Landroid/view/View;

    invoke-static {v0, p0}, Ll/cri0;->d(Ll/x20;Landroid/view/View;)V

    return-void
.end method
