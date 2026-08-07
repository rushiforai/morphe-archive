.class public final synthetic Ll/k180;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/m180;


# direct methods
.method public synthetic constructor <init>(Ll/m180;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/k180;->a:Ll/m180;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/k180;->a:Ll/m180;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {p0, p1}, Ll/m180;->y4(Ll/m180;Ljava/lang/Throwable;)V

    return-void
.end method
