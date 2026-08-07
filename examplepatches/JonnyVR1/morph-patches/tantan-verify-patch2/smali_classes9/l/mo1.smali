.class public final synthetic Ll/mo1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/no1;


# direct methods
.method public synthetic constructor <init>(Ll/no1;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mo1;->a:Ll/no1;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mo1;->a:Ll/no1;

    check-cast p1, Lrx/Notification;

    invoke-static {p0, p1}, Ll/no1;->p4(Ll/no1;Lrx/Notification;)V

    return-void
.end method
