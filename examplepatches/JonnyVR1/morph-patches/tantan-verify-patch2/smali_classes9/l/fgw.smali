.class public final synthetic Ll/fgw;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# instance fields
.field public final synthetic a:Ll/jgw;


# direct methods
.method public synthetic constructor <init>(Ll/jgw;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fgw;->a:Ll/jgw;

    return-void
.end method


# virtual methods
.method public final onDismiss(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fgw;->a:Ll/jgw;

    invoke-static {p0, p1}, Ll/jgw;->x(Ll/jgw;Landroid/content/DialogInterface;)V

    return-void
.end method
