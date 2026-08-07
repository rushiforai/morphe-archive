.class public final synthetic Ll/hr20;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# instance fields
.field public final synthetic a:Ll/jr20$a;


# direct methods
.method public synthetic constructor <init>(Ll/jr20$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hr20;->a:Ll/jr20$a;

    return-void
.end method


# virtual methods
.method public final onDismiss(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hr20;->a:Ll/jr20$a;

    invoke-static {p0, p1}, Ll/jr20$a;->c(Ll/jr20$a;Landroid/content/DialogInterface;)V

    return-void
.end method
