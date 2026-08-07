.class public final synthetic Ll/kb40;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/lb40;


# direct methods
.method public synthetic constructor <init>(Ll/lb40;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kb40;->a:Ll/lb40;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kb40;->a:Ll/lb40;

    check-cast p1, Lrx/Notification;

    invoke-static {p0, p1}, Ll/lb40;->e0(Ll/lb40;Lrx/Notification;)V

    return-void
.end method
