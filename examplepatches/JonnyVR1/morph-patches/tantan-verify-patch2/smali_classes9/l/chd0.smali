.class public final synthetic Ll/chd0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/uhd0;


# direct methods
.method public synthetic constructor <init>(Ll/uhd0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/chd0;->a:Ll/uhd0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/chd0;->a:Ll/uhd0;

    check-cast p1, Lrx/Notification;

    invoke-static {p0, p1}, Ll/uhd0;->O3(Ll/uhd0;Lrx/Notification;)V

    return-void
.end method
