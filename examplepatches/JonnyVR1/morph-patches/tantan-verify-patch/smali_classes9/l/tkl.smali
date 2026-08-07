.class public final synthetic Ll/tkl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# instance fields
.field public final synthetic a:Ll/ukl;


# direct methods
.method public synthetic constructor <init>(Ll/ukl;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tkl;->a:Ll/ukl;

    return-void
.end method


# virtual methods
.method public final onDismiss(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tkl;->a:Ll/ukl;

    invoke-static {p0, p1}, Ll/ukl;->a(Ll/ukl;Landroid/content/DialogInterface;)V

    return-void
.end method
