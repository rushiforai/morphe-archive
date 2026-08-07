.class public final synthetic Ll/fgh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/ogh;


# direct methods
.method public synthetic constructor <init>(Ll/ogh;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fgh;->a:Ll/ogh;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fgh;->a:Ll/ogh;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {p0, p1}, Ll/ogh;->e(Ll/ogh;Ljava/lang/Throwable;)V

    return-void
.end method
