.class public final synthetic Ll/zuw;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/fvw;


# direct methods
.method public synthetic constructor <init>(Ll/fvw;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zuw;->a:Ll/fvw;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zuw;->a:Ll/fvw;

    check-cast p1, Landroid/os/Bundle;

    invoke-static {p0, p1}, Ll/fvw;->g0(Ll/fvw;Landroid/os/Bundle;)V

    return-void
.end method
