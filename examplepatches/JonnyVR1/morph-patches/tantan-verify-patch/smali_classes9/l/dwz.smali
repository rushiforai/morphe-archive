.class public final synthetic Ll/dwz;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/yxz;

.field public final synthetic b:Ll/jl80;


# direct methods
.method public synthetic constructor <init>(Ll/yxz;Ll/jl80;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dwz;->a:Ll/yxz;

    iput-object p2, p0, Ll/dwz;->b:Ll/jl80;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/dwz;->a:Ll/yxz;

    iget-object p0, p0, Ll/dwz;->b:Ll/jl80;

    invoke-static {v0, p0}, Ll/yxz;->w2(Ll/yxz;Ll/jl80;)V

    return-void
.end method
