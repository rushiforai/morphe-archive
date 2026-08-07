.class public final synthetic Ll/ae5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/fe5;


# direct methods
.method public synthetic constructor <init>(Ll/fe5;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ae5;->a:Ll/fe5;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ae5;->a:Ll/fe5;

    check-cast p1, Ljava/lang/Long;

    invoke-static {p0, p1}, Ll/fe5;->e(Ll/fe5;Ljava/lang/Long;)V

    return-void
.end method
