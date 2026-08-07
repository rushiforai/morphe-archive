.class public final synthetic Ll/aep;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# instance fields
.field public final synthetic a:Ll/l4g0;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/l4g0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/aep;->a:Ll/l4g0;

    iput-object p2, p0, Ll/aep;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final onDismiss(Landroid/content/DialogInterface;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/aep;->a:Ll/l4g0;

    iget-object p0, p0, Ll/aep;->b:Ljava/lang/String;

    invoke-static {v0, p0, p1}, Ll/bep;->f(Ll/l4g0;Ljava/lang/String;Landroid/content/DialogInterface;)V

    return-void
.end method
