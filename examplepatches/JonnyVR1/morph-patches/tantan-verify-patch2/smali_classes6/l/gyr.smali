.class public final synthetic Ll/gyr;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/hyr;

.field public final synthetic b:Landroid/net/Uri;


# direct methods
.method public synthetic constructor <init>(Ll/hyr;Landroid/net/Uri;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gyr;->a:Ll/hyr;

    iput-object p2, p0, Ll/gyr;->b:Landroid/net/Uri;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/gyr;->a:Ll/hyr;

    iget-object p0, p0, Ll/gyr;->b:Landroid/net/Uri;

    check-cast p1, Ljava/lang/String;

    invoke-static {v0, p0, p1}, Ll/hyr;->a(Ll/hyr;Landroid/net/Uri;Ljava/lang/String;)V

    return-void
.end method
