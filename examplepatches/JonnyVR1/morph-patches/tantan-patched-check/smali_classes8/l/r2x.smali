.class public final synthetic Ll/r2x;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/s2x;


# direct methods
.method public synthetic constructor <init>(Ll/s2x;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/r2x;->a:Ll/s2x;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/r2x;->a:Ll/s2x;

    check-cast p1, Lcom/p1/mobile/putong/core/data/HometownSuggest;

    invoke-static {p0, p1}, Ll/s2x;->j0(Ll/s2x;Lcom/p1/mobile/putong/core/data/HometownSuggest;)V

    return-void
.end method
