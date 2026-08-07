.class public final synthetic Ll/l1z;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Landroid/net/Uri;


# direct methods
.method public synthetic constructor <init>(Landroid/net/Uri;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/l1z;->a:Landroid/net/Uri;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/l1z;->a:Landroid/net/Uri;

    check-cast p1, Ljava/io/File;

    invoke-static {p0, p1}, Ll/u1z;->u0(Landroid/net/Uri;Ljava/io/File;)Ll/pf60;

    move-result-object p0

    return-object p0
.end method
