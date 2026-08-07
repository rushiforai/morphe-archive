.class public final synthetic Ll/yq60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/br60;


# direct methods
.method public synthetic constructor <init>(Ll/br60;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yq60;->a:Ll/br60;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yq60;->a:Ll/br60;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {p0, p1}, Ll/br60;->c(Ll/br60;Ljava/lang/Throwable;)V

    return-void
.end method
