.class public final synthetic Ll/pgr;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;


# instance fields
.field public final synthetic a:Ll/rgr$a;


# direct methods
.method public synthetic constructor <init>(Ll/rgr$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pgr;->a:Ll/rgr$a;

    return-void
.end method


# virtual methods
.method public final onCancel(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pgr;->a:Ll/rgr$a;

    invoke-static {p0, p1}, Ll/rgr$a;->b(Ll/rgr$a;Landroid/content/DialogInterface;)V

    return-void
.end method
