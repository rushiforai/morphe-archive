.class public final synthetic Ll/xqz;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/tvz;

.field public final synthetic b:Ll/jl80;


# direct methods
.method public synthetic constructor <init>(Ll/tvz;Ll/jl80;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xqz;->a:Ll/tvz;

    iput-object p2, p0, Ll/xqz;->b:Ll/jl80;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/xqz;->a:Ll/tvz;

    iget-object p0, p0, Ll/xqz;->b:Ll/jl80;

    check-cast p1, Ljava/lang/Boolean;

    invoke-static {v0, p0, p1}, Ll/tvz;->na(Ll/tvz;Ll/jl80;Ljava/lang/Boolean;)V

    return-void
.end method
