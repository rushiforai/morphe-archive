.class public final synthetic Ll/r7i;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/t7i;


# direct methods
.method public synthetic constructor <init>(Ll/t7i;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/r7i;->a:Ll/t7i;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/r7i;->a:Ll/t7i;

    check-cast p1, Ljava/lang/String;

    invoke-static {p0, p1}, Ll/t7i;->E(Ll/t7i;Ljava/lang/String;)V

    return-void
.end method
