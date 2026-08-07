.class public final synthetic Ll/f5r;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/r5r;


# direct methods
.method public synthetic constructor <init>(Ll/r5r;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/f5r;->a:Ll/r5r;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/f5r;->a:Ll/r5r;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {p0, p1}, Ll/r5r;->V0(Ll/r5r;Ljava/lang/Throwable;)V

    return-void
.end method
