.class public final synthetic Ll/xu20;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/y20;

.field public final synthetic b:Ll/jl80;


# direct methods
.method public synthetic constructor <init>(Ll/y20;Ll/jl80;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xu20;->a:Ll/y20;

    iput-object p2, p0, Ll/xu20;->b:Ll/jl80;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/xu20;->a:Ll/y20;

    iget-object p0, p0, Ll/xu20;->b:Ll/jl80;

    invoke-static {v0, p0, p1}, Ll/gv20;->c(Ll/y20;Ll/jl80;Landroid/view/View;)V

    return-void
.end method
