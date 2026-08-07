.class public final synthetic Ll/cp00;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/b30;


# instance fields
.field public final synthetic a:Ll/pp00;


# direct methods
.method public synthetic constructor <init>(Ll/pp00;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/cp00;->a:Ll/pp00;

    return-void
.end method


# virtual methods
.method public final b(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cp00;->a:Ll/pp00;

    check-cast p1, Ljava/lang/Boolean;

    check-cast p2, Ljava/lang/Integer;

    check-cast p3, Ljava/lang/Boolean;

    check-cast p4, Ljava/lang/Integer;

    invoke-static {p0, p1, p2, p3, p4}, Ll/pp00;->j(Ll/pp00;Ljava/lang/Boolean;Ljava/lang/Integer;Ljava/lang/Boolean;Ljava/lang/Integer;)V

    return-void
.end method
