.class public final synthetic Ll/pr40;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:Ll/jl80;


# direct methods
.method public synthetic constructor <init>(Ll/jl80;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pr40;->a:Ll/jl80;

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pr40;->a:Ll/jl80;

    invoke-static {p0}, Ll/ur40;->e(Ll/jl80;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
