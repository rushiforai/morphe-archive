.class public final synthetic Ll/fs50;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# instance fields
.field public final synthetic a:Ll/gs50;

.field public final synthetic b:Ll/l4g0;


# direct methods
.method public synthetic constructor <init>(Ll/gs50;Ll/l4g0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fs50;->a:Ll/gs50;

    iput-object p2, p0, Ll/fs50;->b:Ll/l4g0;

    return-void
.end method


# virtual methods
.method public final onDismiss(Landroid/content/DialogInterface;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/fs50;->a:Ll/gs50;

    iget-object p0, p0, Ll/fs50;->b:Ll/l4g0;

    invoke-static {v0, p0, p1}, Ll/gs50;->k(Ll/gs50;Ll/l4g0;Landroid/content/DialogInterface;)V

    return-void
.end method
