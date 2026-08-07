.class public final synthetic Ll/vy40;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;


# instance fields
.field public final synthetic a:[Z

.field public final synthetic b:Ll/x20;


# direct methods
.method public synthetic constructor <init>([ZLl/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vy40;->a:[Z

    iput-object p2, p0, Ll/vy40;->b:Ll/x20;

    return-void
.end method


# virtual methods
.method public final onCancel(Landroid/content/DialogInterface;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/vy40;->a:[Z

    iget-object p0, p0, Ll/vy40;->b:Ll/x20;

    invoke-static {v0, p0, p1}, Ll/iz40;->r([ZLl/x20;Landroid/content/DialogInterface;)V

    return-void
.end method
