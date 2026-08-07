.class public final synthetic Ll/exu;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/jxu;


# direct methods
.method public synthetic constructor <init>(Ll/jxu;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/exu;->a:Ll/jxu;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/exu;->a:Ll/jxu;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {p0, p1}, Ll/jxu;->R2(Ll/jxu;Ljava/lang/Throwable;)V

    return-void
.end method
