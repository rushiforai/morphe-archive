.class public final synthetic Ll/m4l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tantanapp/media/ttmediautils/download/Action1;


# instance fields
.field public final synthetic a:Ll/o4l;


# direct methods
.method public synthetic constructor <init>(Ll/o4l;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/m4l;->a:Ll/o4l;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/m4l;->a:Ll/o4l;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {p0, p1}, Ll/o4l;->d(Ll/o4l;Ljava/lang/Throwable;)V

    return-void
.end method
