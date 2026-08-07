.class public final synthetic Ll/acx;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/xcx;


# direct methods
.method public synthetic constructor <init>(Ll/xcx;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/acx;->a:Ll/xcx;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/acx;->a:Ll/xcx;

    check-cast p1, [I

    invoke-static {p0, p1}, Ll/xcx;->x(Ll/xcx;[I)V

    return-void
.end method
