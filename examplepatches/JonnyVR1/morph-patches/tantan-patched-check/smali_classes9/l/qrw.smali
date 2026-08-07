.class public final synthetic Ll/qrw;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ljava/io/File;


# direct methods
.method public synthetic constructor <init>(Ljava/io/File;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qrw;->a:Ljava/io/File;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qrw;->a:Ljava/io/File;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {p0, p1}, Ll/zrw;->g(Ljava/io/File;Ljava/lang/Throwable;)V

    return-void
.end method
