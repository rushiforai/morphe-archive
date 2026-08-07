.class public final synthetic Ll/ir20;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/jr20$a;


# direct methods
.method public synthetic constructor <init>(Ll/jr20$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ir20;->a:Ll/jr20$a;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ir20;->a:Ll/jr20$a;

    check-cast p1, Lrx/Notification;

    invoke-static {p0, p1}, Ll/jr20$a;->d(Ll/jr20$a;Lrx/Notification;)V

    return-void
.end method
