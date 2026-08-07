.class public final synthetic Ll/tzn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/c0o;


# direct methods
.method public synthetic constructor <init>(Ll/c0o;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tzn;->a:Ll/c0o;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tzn;->a:Ll/c0o;

    check-cast p1, Landroid/net/NetworkInfo;

    invoke-static {p0, p1}, Ll/c0o;->R2(Ll/c0o;Landroid/net/NetworkInfo;)V

    return-void
.end method
