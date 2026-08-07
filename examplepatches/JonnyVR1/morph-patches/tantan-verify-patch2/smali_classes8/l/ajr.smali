.class public final synthetic Ll/ajr;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/fjr;


# direct methods
.method public synthetic constructor <init>(Ll/fjr;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ajr;->a:Ll/fjr;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ajr;->a:Ll/fjr;

    check-cast p1, Landroid/net/NetworkInfo;

    invoke-static {p0, p1}, Ll/fjr;->t0(Ll/fjr;Landroid/net/NetworkInfo;)V

    return-void
.end method
