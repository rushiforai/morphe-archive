.class public final synthetic Ll/bh50;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/hh50;


# direct methods
.method public synthetic constructor <init>(Ll/hh50;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bh50;->a:Ll/hh50;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bh50;->a:Ll/hh50;

    check-cast p1, Lrx/Notification;

    invoke-static {p0, p1}, Ll/hh50;->i0(Ll/hh50;Lrx/Notification;)Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method
