.class public final synthetic Ll/zkn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# instance fields
.field public final synthetic a:Ll/aln;


# direct methods
.method public synthetic constructor <init>(Ll/aln;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zkn;->a:Ll/aln;

    return-void
.end method


# virtual methods
.method public final onDismiss(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zkn;->a:Ll/aln;

    invoke-static {p0, p1}, Ll/aln;->g0(Ll/aln;Landroid/content/DialogInterface;)V

    return-void
.end method
