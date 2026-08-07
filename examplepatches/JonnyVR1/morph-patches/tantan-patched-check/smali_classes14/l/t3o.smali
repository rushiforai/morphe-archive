.class public final synthetic Ll/t3o;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/y3o;


# direct methods
.method public synthetic constructor <init>(Ll/y3o;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/t3o;->a:Ll/y3o;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/t3o;->a:Ll/y3o;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {p0, p1}, Ll/y3o;->V2(Ll/y3o;Ljava/lang/Throwable;)V

    return-void
.end method
