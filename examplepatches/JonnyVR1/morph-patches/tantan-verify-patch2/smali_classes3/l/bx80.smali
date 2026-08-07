.class public final synthetic Ll/bx80;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:[Ll/jl80;

.field public final synthetic b:Landroid/app/Activity;

.field public final synthetic c:Ll/y20;


# direct methods
.method public synthetic constructor <init>([Ll/jl80;Landroid/app/Activity;Ll/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bx80;->a:[Ll/jl80;

    iput-object p2, p0, Ll/bx80;->b:Landroid/app/Activity;

    iput-object p3, p0, Ll/bx80;->c:Ll/y20;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/bx80;->a:[Ll/jl80;

    iget-object v1, p0, Ll/bx80;->b:Landroid/app/Activity;

    iget-object p0, p0, Ll/bx80;->c:Ll/y20;

    invoke-static {v0, v1, p0}, Ll/kx80;->a([Ll/jl80;Landroid/app/Activity;Ll/y20;)V

    return-void
.end method
