.class public final synthetic Ll/vva0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/ewa0;


# direct methods
.method public synthetic constructor <init>(Ll/ewa0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vva0;->a:Ll/ewa0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vva0;->a:Ll/ewa0;

    check-cast p1, Landroid/os/Bundle;

    invoke-static {p0, p1}, Ll/ewa0;->Z(Ll/ewa0;Landroid/os/Bundle;)V

    return-void
.end method
