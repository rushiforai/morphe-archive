.class public final synthetic Ll/t15;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/w15;


# direct methods
.method public synthetic constructor <init>(Ll/w15;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/t15;->a:Ll/w15;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/t15;->a:Ll/w15;

    check-cast p1, Landroid/os/Bundle;

    invoke-static {p0, p1}, Ll/w15;->g0(Ll/w15;Landroid/os/Bundle;)V

    return-void
.end method
