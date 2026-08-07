.class public final synthetic Ll/nrh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;


# instance fields
.field public final synthetic a:Ll/prh$a;


# direct methods
.method public synthetic constructor <init>(Ll/prh$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nrh;->a:Ll/prh$a;

    return-void
.end method


# virtual methods
.method public final onCancel(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nrh;->a:Ll/prh$a;

    invoke-static {p0, p1}, Ll/prh$a;->a(Ll/prh$a;Landroid/content/DialogInterface;)V

    return-void
.end method
