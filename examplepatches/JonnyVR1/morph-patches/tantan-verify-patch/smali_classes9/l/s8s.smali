.class public final synthetic Ll/s8s;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# instance fields
.field public final synthetic a:Ll/t8s;

.field public final synthetic b:Ll/jwl;


# direct methods
.method public synthetic constructor <init>(Ll/t8s;Ll/jwl;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/s8s;->a:Ll/t8s;

    iput-object p2, p0, Ll/s8s;->b:Ll/jwl;

    return-void
.end method


# virtual methods
.method public final onDismiss(Landroid/content/DialogInterface;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/s8s;->a:Ll/t8s;

    iget-object p0, p0, Ll/s8s;->b:Ll/jwl;

    invoke-static {v0, p0, p1}, Ll/t8s;->a(Ll/t8s;Ll/jwl;Landroid/content/DialogInterface;)V

    return-void
.end method
