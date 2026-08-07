.class public final synthetic Ll/hs90;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ljava/lang/Runnable;

.field public final synthetic b:Ll/jl80;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Runnable;Ll/jl80;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hs90;->a:Ljava/lang/Runnable;

    iput-object p2, p0, Ll/hs90;->b:Ll/jl80;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/hs90;->a:Ljava/lang/Runnable;

    iget-object p0, p0, Ll/hs90;->b:Ll/jl80;

    invoke-static {v0, p0, p1}, Ll/ks90;->b(Ljava/lang/Runnable;Ll/jl80;Landroid/view/View;)V

    return-void
.end method
