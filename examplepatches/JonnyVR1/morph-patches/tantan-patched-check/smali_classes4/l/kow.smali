.class public final synthetic Ll/kow;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/pow;

.field public final synthetic b:Ll/jl80;


# direct methods
.method public synthetic constructor <init>(Ll/pow;Ll/jl80;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kow;->a:Ll/pow;

    iput-object p2, p0, Ll/kow;->b:Ll/jl80;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/kow;->a:Ll/pow;

    iget-object p0, p0, Ll/kow;->b:Ll/jl80;

    invoke-static {v0, p0, p1}, Ll/pow;->i(Ll/pow;Ll/jl80;Landroid/view/View;)V

    return-void
.end method
