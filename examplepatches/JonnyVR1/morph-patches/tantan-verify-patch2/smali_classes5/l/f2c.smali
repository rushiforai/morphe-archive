.class public final synthetic Ll/f2c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/h2c;


# direct methods
.method public synthetic constructor <init>(Ll/h2c;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/f2c;->a:Ll/h2c;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/f2c;->a:Ll/h2c;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {p0, p1}, Ll/h2c;->m0(Ll/h2c;Ljava/lang/Throwable;)V

    return-void
.end method
