.class public final synthetic Ll/e1y;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/g1y;


# direct methods
.method public synthetic constructor <init>(Ll/g1y;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/e1y;->a:Ll/g1y;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/e1y;->a:Ll/g1y;

    check-cast p1, Landroid/net/NetworkInfo;

    invoke-static {p0, p1}, Ll/g1y;->c(Ll/g1y;Landroid/net/NetworkInfo;)V

    return-void
.end method
