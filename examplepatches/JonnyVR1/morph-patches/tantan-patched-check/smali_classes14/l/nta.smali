.class public final synthetic Ll/nta;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/x20;

.field public final synthetic b:Ll/jl80;


# direct methods
.method public synthetic constructor <init>(Ll/x20;Ll/jl80;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nta;->a:Ll/x20;

    iput-object p2, p0, Ll/nta;->b:Ll/jl80;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/nta;->a:Ll/x20;

    iget-object p0, p0, Ll/nta;->b:Ll/jl80;

    invoke-static {v0, p0}, Ll/pta;->f(Ll/x20;Ll/jl80;)V

    return-void
.end method
