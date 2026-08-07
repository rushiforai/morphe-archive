.class public final synthetic Ll/sko;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/ilo;


# direct methods
.method public synthetic constructor <init>(Ll/ilo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/sko;->a:Ll/ilo;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sko;->a:Ll/ilo;

    check-cast p1, Landroid/net/NetworkInfo;

    invoke-static {p0, p1}, Ll/ilo;->x0(Ll/ilo;Landroid/net/NetworkInfo;)V

    return-void
.end method
