.class public final synthetic Ll/xcg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/ycg;


# direct methods
.method public synthetic constructor <init>(Ll/ycg;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xcg;->a:Ll/ycg;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xcg;->a:Ll/ycg;

    check-cast p1, Ljava/lang/Boolean;

    invoke-static {p0, p1}, Ll/ycg;->i4(Ll/ycg;Ljava/lang/Boolean;)V

    return-void
.end method
