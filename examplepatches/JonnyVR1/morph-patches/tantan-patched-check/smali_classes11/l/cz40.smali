.class public final synthetic Ll/cz40;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# instance fields
.field public final synthetic a:Ll/l4g0;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Ll/l4g0;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/cz40;->a:Ll/l4g0;

    iput-boolean p2, p0, Ll/cz40;->b:Z

    return-void
.end method


# virtual methods
.method public final onDismiss(Landroid/content/DialogInterface;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cz40;->a:Ll/l4g0;

    iget-boolean p0, p0, Ll/cz40;->b:Z

    invoke-static {v0, p0, p1}, Ll/iz40;->m(Ll/l4g0;ZLandroid/content/DialogInterface;)V

    return-void
.end method
