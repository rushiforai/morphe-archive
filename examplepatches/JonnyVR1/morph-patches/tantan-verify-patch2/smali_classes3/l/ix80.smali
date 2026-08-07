.class public final synthetic Ll/ix80;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ljava/lang/Runnable;

.field public final synthetic b:Ljava/lang/Runnable;

.field public final synthetic c:Ll/jl80;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Runnable;Ljava/lang/Runnable;Ll/jl80;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ix80;->a:Ljava/lang/Runnable;

    iput-object p2, p0, Ll/ix80;->b:Ljava/lang/Runnable;

    iput-object p3, p0, Ll/ix80;->c:Ll/jl80;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ix80;->a:Ljava/lang/Runnable;

    iget-object v1, p0, Ll/ix80;->b:Ljava/lang/Runnable;

    iget-object p0, p0, Ll/ix80;->c:Ll/jl80;

    invoke-static {v0, v1, p0, p1}, Ll/kx80;->i(Ljava/lang/Runnable;Ljava/lang/Runnable;Ll/jl80;Landroid/view/View;)V

    return-void
.end method
