.class public final synthetic Ll/lrp0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/prp0;


# direct methods
.method public synthetic constructor <init>(Ll/prp0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lrp0;->a:Ll/prp0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lrp0;->a:Ll/prp0;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {p0, p1}, Ll/prp0;->d(Ll/prp0;Ljava/lang/Throwable;)V

    return-void
.end method
