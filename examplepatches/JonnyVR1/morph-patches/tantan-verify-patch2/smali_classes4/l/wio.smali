.class public final synthetic Ll/wio;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/xio;


# direct methods
.method public synthetic constructor <init>(Ll/xio;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wio;->a:Ll/xio;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wio;->a:Ll/xio;

    check-cast p1, Lkotlin/Pair;

    invoke-static {p0, p1}, Ll/xio;->h0(Ll/xio;Lkotlin/Pair;)V

    return-void
.end method
