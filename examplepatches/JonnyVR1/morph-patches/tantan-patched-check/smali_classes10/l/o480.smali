.class public final synthetic Ll/o480;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/t480;


# direct methods
.method public synthetic constructor <init>(Ll/t480;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/o480;->a:Ll/t480;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/o480;->a:Ll/t480;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {p0, p1}, Ll/t480;->X3(Ll/t480;Ljava/lang/Throwable;)V

    return-void
.end method
