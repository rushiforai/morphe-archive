.class public final synthetic Ll/cx80;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:[Ll/jl80;

.field public final synthetic b:Ll/x20;


# direct methods
.method public synthetic constructor <init>([Ll/jl80;Ll/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/cx80;->a:[Ll/jl80;

    iput-object p2, p0, Ll/cx80;->b:Ll/x20;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cx80;->a:[Ll/jl80;

    iget-object p0, p0, Ll/cx80;->b:Ll/x20;

    invoke-static {v0, p0}, Ll/kx80;->f([Ll/jl80;Ll/x20;)V

    return-void
.end method
