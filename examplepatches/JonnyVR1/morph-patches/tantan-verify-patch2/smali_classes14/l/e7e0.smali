.class public final synthetic Ll/e7e0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/abe0;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ll/jl80;


# direct methods
.method public synthetic constructor <init>(Ll/abe0;Ljava/lang/String;Ll/jl80;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/e7e0;->a:Ll/abe0;

    iput-object p2, p0, Ll/e7e0;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/e7e0;->c:Ll/jl80;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/e7e0;->a:Ll/abe0;

    iget-object v1, p0, Ll/e7e0;->b:Ljava/lang/String;

    iget-object p0, p0, Ll/e7e0;->c:Ll/jl80;

    invoke-static {v0, v1, p0}, Ll/i7e0;->j(Ll/abe0;Ljava/lang/String;Ll/jl80;)V

    return-void
.end method
