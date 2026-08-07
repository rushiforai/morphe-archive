.class public final synthetic Ll/wqz;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/jl80;


# direct methods
.method public synthetic constructor <init>(Ll/jl80;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wqz;->a:Ll/jl80;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wqz;->a:Ll/jl80;

    invoke-static {p0}, Ll/tvz;->Xb(Ll/jl80;)V

    return-void
.end method
