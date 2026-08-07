.class public final synthetic Ll/j4k0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:Ll/m4k0;


# direct methods
.method public synthetic constructor <init>(Ll/m4k0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/j4k0;->a:Ll/m4k0;

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/j4k0;->a:Ll/m4k0;

    invoke-static {p0}, Ll/m4k0;->d(Ll/m4k0;)Ljavax/net/ssl/SSLSocketFactory;

    move-result-object p0

    return-object p0
.end method
