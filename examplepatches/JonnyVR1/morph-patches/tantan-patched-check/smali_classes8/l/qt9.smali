.class public final synthetic Ll/qt9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/ut9;


# direct methods
.method public synthetic constructor <init>(Ll/ut9;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qt9;->a:Ll/ut9;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qt9;->a:Ll/ut9;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {p0, p1}, Ll/ut9;->k0(Ll/ut9;Ljava/lang/Throwable;)V

    return-void
.end method
