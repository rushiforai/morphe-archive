.class public final synthetic Ll/bl50;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/dxv$b;


# instance fields
.field public final synthetic a:Ll/cl50;


# direct methods
.method public synthetic constructor <init>(Ll/cl50;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bl50;->a:Ll/cl50;

    return-void
.end method


# virtual methods
.method public final execute()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bl50;->a:Ll/cl50;

    invoke-static {p0}, Ll/cl50;->f(Ll/cl50;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
