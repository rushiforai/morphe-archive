.class public final Ll/i0t0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field public final synthetic a:Ll/j0t0;


# direct methods
.method public constructor <init>(Ll/j0t0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/i0t0;->a:Ll/j0t0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/i0t0;->a:Ll/j0t0;

    .line 2
    .line 3
    const-string p1, "Operation denied by user."

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/s0t0;->c(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
