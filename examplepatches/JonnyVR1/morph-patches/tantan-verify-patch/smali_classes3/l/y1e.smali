.class public final synthetic Ll/y1e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# instance fields
.field public final synthetic a:Ll/w1e$b;


# direct methods
.method public synthetic constructor <init>(Ll/w1e$b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/y1e;->a:Ll/w1e$b;

    return-void
.end method


# virtual methods
.method public final onDismiss(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/y1e;->a:Ll/w1e$b;

    invoke-static {p0, p1}, Ll/w1e$b;->b(Ll/w1e$b;Landroid/content/DialogInterface;)V

    return-void
.end method
