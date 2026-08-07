.class public final synthetic Ll/ax80;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Landroid/app/Activity;

.field public final synthetic b:[Ll/jl80;

.field public final synthetic c:Ll/l4g0;


# direct methods
.method public synthetic constructor <init>(Landroid/app/Activity;[Ll/jl80;Ll/l4g0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ax80;->a:Landroid/app/Activity;

    iput-object p2, p0, Ll/ax80;->b:[Ll/jl80;

    iput-object p3, p0, Ll/ax80;->c:Ll/l4g0;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ax80;->a:Landroid/app/Activity;

    iget-object v1, p0, Ll/ax80;->b:[Ll/jl80;

    iget-object p0, p0, Ll/ax80;->c:Ll/l4g0;

    invoke-static {v0, v1, p0}, Ll/kx80;->c(Landroid/app/Activity;[Ll/jl80;Ll/l4g0;)V

    return-void
.end method
