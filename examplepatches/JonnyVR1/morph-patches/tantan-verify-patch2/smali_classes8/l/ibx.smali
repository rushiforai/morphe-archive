.class public final synthetic Ll/ibx;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/xbx;


# direct methods
.method public synthetic constructor <init>(Ll/xbx;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ibx;->a:Ll/xbx;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ibx;->a:Ll/xbx;

    check-cast p1, Ljava/lang/Boolean;

    invoke-static {p0, p1}, Ll/xbx;->P0(Ll/xbx;Ljava/lang/Boolean;)V

    return-void
.end method
