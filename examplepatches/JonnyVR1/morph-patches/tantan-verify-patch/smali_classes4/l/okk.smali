.class public final synthetic Ll/okk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/pkk;


# direct methods
.method public synthetic constructor <init>(Ll/pkk;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/okk;->a:Ll/pkk;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/okk;->a:Ll/pkk;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {p0, p1}, Ll/pkk;->F(Ll/pkk;Ljava/lang/Throwable;)V

    return-void
.end method
