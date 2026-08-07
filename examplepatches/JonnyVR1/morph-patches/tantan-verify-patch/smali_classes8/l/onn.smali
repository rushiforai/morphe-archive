.class public final synthetic Ll/onn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/b30;


# instance fields
.field public final synthetic a:Ll/xnn;


# direct methods
.method public synthetic constructor <init>(Ll/xnn;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/onn;->a:Ll/xnn;

    return-void
.end method


# virtual methods
.method public final b(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/onn;->a:Ll/xnn;

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    check-cast p3, Ljava/lang/Boolean;

    check-cast p4, Ljava/lang/Integer;

    invoke-static {p0, p1, p2, p3, p4}, Ll/xnn;->d(Ll/xnn;ZILjava/lang/Boolean;Ljava/lang/Integer;)V

    return-void
.end method
