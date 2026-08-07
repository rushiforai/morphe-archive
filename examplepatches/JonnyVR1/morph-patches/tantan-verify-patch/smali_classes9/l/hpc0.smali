.class public final synthetic Ll/hpc0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/jl80;

.field public final synthetic b:Ll/i6t;


# direct methods
.method public synthetic constructor <init>(Ll/jl80;Ll/i6t;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hpc0;->a:Ll/jl80;

    iput-object p2, p0, Ll/hpc0;->b:Ll/i6t;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/hpc0;->a:Ll/jl80;

    iget-object p0, p0, Ll/hpc0;->b:Ll/i6t;

    invoke-static {v0, p0}, Ll/lpc0;->b(Ll/jl80;Ll/i6t;)V

    return-void
.end method
