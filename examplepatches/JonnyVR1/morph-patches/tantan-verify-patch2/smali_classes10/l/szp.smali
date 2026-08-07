.class public final synthetic Ll/szp;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/tzp;


# direct methods
.method public synthetic constructor <init>(Ll/tzp;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/szp;->a:Ll/tzp;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/szp;->a:Ll/tzp;

    invoke-static {p0, p1}, Ll/tzp;->a(Ll/tzp;Landroid/view/View;)V

    return-void
.end method
