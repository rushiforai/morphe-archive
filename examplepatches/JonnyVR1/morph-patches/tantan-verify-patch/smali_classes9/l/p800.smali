.class public final synthetic Ll/p800;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/q800;


# direct methods
.method public synthetic constructor <init>(Ll/q800;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/p800;->a:Ll/q800;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p800;->a:Ll/q800;

    invoke-static {p0, p1}, Ll/q800;->m(Ll/q800;Landroid/view/View;)V

    return-void
.end method
