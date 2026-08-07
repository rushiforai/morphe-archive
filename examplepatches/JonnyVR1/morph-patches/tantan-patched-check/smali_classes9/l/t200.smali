.class public final synthetic Ll/t200;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/u200;


# direct methods
.method public synthetic constructor <init>(Ll/u200;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/t200;->a:Ll/u200;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/t200;->a:Ll/u200;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {p0, p1}, Ll/u200;->g0(Ll/u200;Ljava/lang/Throwable;)V

    return-void
.end method
