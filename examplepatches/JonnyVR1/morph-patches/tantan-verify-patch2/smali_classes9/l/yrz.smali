.class public final synthetic Ll/yrz;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/tvz;

.field public final synthetic b:[Z

.field public final synthetic c:Ll/jl80;


# direct methods
.method public synthetic constructor <init>(Ll/tvz;[ZLl/jl80;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yrz;->a:Ll/tvz;

    iput-object p2, p0, Ll/yrz;->b:[Z

    iput-object p3, p0, Ll/yrz;->c:Ll/jl80;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/yrz;->a:Ll/tvz;

    iget-object v1, p0, Ll/yrz;->b:[Z

    iget-object p0, p0, Ll/yrz;->c:Ll/jl80;

    check-cast p1, Ljava/lang/Boolean;

    invoke-static {v0, v1, p0, p1}, Ll/tvz;->Yb(Ll/tvz;[ZLl/jl80;Ljava/lang/Boolean;)V

    return-void
.end method
