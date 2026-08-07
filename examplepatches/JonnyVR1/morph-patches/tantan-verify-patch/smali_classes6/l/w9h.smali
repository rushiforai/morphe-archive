.class public final synthetic Ll/w9h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/y9h;


# direct methods
.method public synthetic constructor <init>(Ll/y9h;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/w9h;->a:Ll/y9h;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w9h;->a:Ll/y9h;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {p0, p1}, Ll/y9h;->d(Ll/y9h;Ljava/lang/Throwable;)V

    return-void
.end method
