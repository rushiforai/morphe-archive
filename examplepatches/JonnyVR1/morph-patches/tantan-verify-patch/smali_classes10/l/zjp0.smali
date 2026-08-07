.class public final synthetic Ll/zjp0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/akp0;


# direct methods
.method public synthetic constructor <init>(Ll/akp0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zjp0;->a:Ll/akp0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zjp0;->a:Ll/akp0;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {p0, p1}, Ll/akp0;->M3(Ll/akp0;Ljava/lang/Throwable;)V

    return-void
.end method
