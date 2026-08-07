.class public final synthetic Ll/wz00;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/c010;


# direct methods
.method public synthetic constructor <init>(Ll/c010;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wz00;->a:Ll/c010;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wz00;->a:Ll/c010;

    check-cast p1, Landroid/os/Bundle;

    invoke-static {p0, p1}, Ll/c010;->f0(Ll/c010;Landroid/os/Bundle;)V

    return-void
.end method
