.class public final synthetic Ll/vwi;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/dxi;


# direct methods
.method public synthetic constructor <init>(Ll/dxi;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vwi;->a:Ll/dxi;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vwi;->a:Ll/dxi;

    check-cast p1, Lcom/p1/mobile/putong/data/Followship;

    invoke-static {p0, p1}, Ll/dxi;->L3(Ll/dxi;Lcom/p1/mobile/putong/data/Followship;)V

    return-void
.end method
