.class public final synthetic Ll/phy;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;


# instance fields
.field public final synthetic a:Ll/x20;

.field public final synthetic b:Ll/l4g0;


# direct methods
.method public synthetic constructor <init>(Ll/x20;Ll/l4g0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/phy;->a:Ll/x20;

    iput-object p2, p0, Ll/phy;->b:Ll/l4g0;

    return-void
.end method


# virtual methods
.method public final onCancel(Landroid/content/DialogInterface;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/phy;->a:Ll/x20;

    iget-object p0, p0, Ll/phy;->b:Ll/l4g0;

    invoke-static {v0, p0, p1}, Ll/why;->a(Ll/x20;Ll/l4g0;Landroid/content/DialogInterface;)V

    return-void
.end method
