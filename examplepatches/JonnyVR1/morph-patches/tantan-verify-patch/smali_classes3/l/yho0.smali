.class public final synthetic Ll/yho0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/gio0;


# direct methods
.method public synthetic constructor <init>(Ll/gio0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yho0;->a:Ll/gio0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yho0;->a:Ll/gio0;

    check-cast p1, Landroid/util/Pair;

    invoke-static {p0, p1}, Ll/gio0;->R3(Ll/gio0;Landroid/util/Pair;)V

    return-void
.end method
