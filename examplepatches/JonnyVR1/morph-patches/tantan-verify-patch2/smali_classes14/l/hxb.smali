.class public final synthetic Ll/hxb;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/pxb;


# direct methods
.method public synthetic constructor <init>(Ll/pxb;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hxb;->a:Ll/pxb;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hxb;->a:Ll/pxb;

    check-cast p1, [I

    invoke-static {p0, p1}, Ll/pxb;->b(Ll/pxb;[I)V

    return-void
.end method
