.class public final synthetic Ll/z1s;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/b2s;


# direct methods
.method public synthetic constructor <init>(Ll/b2s;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/z1s;->a:Ll/b2s;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/z1s;->a:Ll/b2s;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {p0, p1}, Ll/b2s;->S3(Ll/b2s;Ljava/lang/Throwable;)V

    return-void
.end method
