.class public final synthetic Ll/t4c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/z4c;


# direct methods
.method public synthetic constructor <init>(Ll/z4c;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/t4c;->a:Ll/z4c;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/t4c;->a:Ll/z4c;

    check-cast p1, Landroid/os/Bundle;

    invoke-static {p0, p1}, Ll/z4c;->g0(Ll/z4c;Landroid/os/Bundle;)V

    return-void
.end method
