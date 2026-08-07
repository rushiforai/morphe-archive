.class public final synthetic Ll/g130;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/g130;->a:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/g130;->a:Ljava/lang/String;

    check-cast p1, Lrx/Notification;

    invoke-static {p0, p1}, Ll/r130;->o(Ljava/lang/String;Lrx/Notification;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
