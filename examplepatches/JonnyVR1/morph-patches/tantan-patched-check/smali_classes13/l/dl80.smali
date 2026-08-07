.class public final synthetic Ll/dl80;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/jl80;


# direct methods
.method public synthetic constructor <init>(Ll/jl80;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dl80;->a:Ll/jl80;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dl80;->a:Ll/jl80;

    invoke-static {p0, p1}, Ll/jl80;->I(Ll/jl80;Landroid/view/View;)V

    return-void
.end method
