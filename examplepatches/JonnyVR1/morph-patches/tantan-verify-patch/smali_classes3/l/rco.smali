.class public final synthetic Ll/rco;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/xco;


# direct methods
.method public synthetic constructor <init>(Ll/xco;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rco;->a:Ll/xco;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rco;->a:Ll/xco;

    check-cast p1, Landroid/location/Address;

    invoke-static {p0, p1}, Ll/xco;->h0(Ll/xco;Landroid/location/Address;)V

    return-void
.end method
