.class public final synthetic Ll/u1a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/v1a;


# direct methods
.method public synthetic constructor <init>(Ll/v1a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/u1a;->a:Ll/v1a;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u1a;->a:Ll/v1a;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {p0, p1}, Ll/v1a;->g0(Ll/v1a;Ljava/lang/Throwable;)V

    return-void
.end method
