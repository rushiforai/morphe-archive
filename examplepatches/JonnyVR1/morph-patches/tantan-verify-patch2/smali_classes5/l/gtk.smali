.class public final synthetic Ll/gtk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Ljava/lang/Runnable;

.field public final synthetic c:[Ll/jl80;


# direct methods
.method public synthetic constructor <init>(ZLjava/lang/Runnable;[Ll/jl80;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Ll/gtk;->a:Z

    iput-object p2, p0, Ll/gtk;->b:Ljava/lang/Runnable;

    iput-object p3, p0, Ll/gtk;->c:[Ll/jl80;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/gtk;->a:Z

    iget-object v1, p0, Ll/gtk;->b:Ljava/lang/Runnable;

    iget-object p0, p0, Ll/gtk;->c:[Ll/jl80;

    invoke-static {v0, v1, p0}, Ll/qtk;->I(ZLjava/lang/Runnable;[Ll/jl80;)V

    return-void
.end method
