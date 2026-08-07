.class public final synthetic Ll/t4l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/u4l;


# direct methods
.method public synthetic constructor <init>(Ll/u4l;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/t4l;->a:Ll/u4l;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/t4l;->a:Ll/u4l;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {p0, p1}, Ll/u4l;->N(Ll/u4l;Ljava/lang/Throwable;)V

    return-void
.end method
